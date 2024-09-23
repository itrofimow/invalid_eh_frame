FROM ubuntu:22.04 AS build_deps
RUN apt-get update && apt-get install -y gcc-11 lsb-release wget software-properties-common gnupg
RUN wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && ./llvm.sh 18

FROM build_deps AS build_and_run
WORKDIR /repro
COPY third_party ./third_party
COPY build_libcxxrt/compile.sh ./build_libcxxrt/compile.sh
COPY build_libunwind/compile.sh ./build_libunwind/compile.sh
COPY throw_test.cpp ./
COPY sample_profile.txt ./
COPY compile.sh ./
COPY link.sh ./
COPY compile_everything_and_link.sh ./

RUN ./compile_everything_and_link.sh

CMD ./throw_test
