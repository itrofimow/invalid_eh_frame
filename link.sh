ld.lld-18 -z relro --hash-style=gnu --build-id --eh-frame-hdr -m elf_x86_64 -pie -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o throw_test /lib/x86_64-linux-gnu/Scrt1.o /lib/x86_64-linux-gnu/crti.o /usr/bin/../lib/gcc/x86_64-linux-gnu/12/crtbeginS.o -L/usr/bin/../lib/gcc/x86_64-linux-gnu/12 -L/usr/bin/../lib/gcc/x86_64-linux-gnu/12/../../../../lib64 -L/lib/x86_64-linux-gnu -L/lib/../lib64 -L/usr/lib/x86_64-linux-gnu -L/usr/lib/../lib64 -L/lib -L/usr/lib -plugin-opt=mcpu=x86-64 -plugin-opt=thinlto --start-group build_libcxxrt/auxhelper.o build_libcxxrt/dynamic_cast.o build_libcxxrt/exception.o build_libcxxrt/guard.o build_libcxxrt/memory.o build_libcxxrt/stdexcept.o build_libcxxrt/typeinfo.o build_libunwind/libunwind.o build_libunwind/UnwindLevel1-gcc-ext.o build_libunwind/UnwindLevel1.o build_libunwind/UnwindRegistersSave.o build_libunwind/UnwindRegistersRestore.o throw_test.o --end-group -lm -lc -ldl -lrt -lpthread /usr/bin/../lib/gcc/x86_64-linux-gnu/12/crtendS.o /lib/x86_64-linux-gnu/crtn.o --gc-sections --no-as-needed --no-rosegment -no-pie -export-dynamic
