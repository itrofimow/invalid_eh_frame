Somehow with insane inlining (-mllvm -inline-threshold=1000) and a specific sample-profile (-fprofile-sample-use),
lld (I assume it's lld, but could be clang, not sure) generates invalid eh_frame entry (eh_frame->lsda->call_site_table
doesn't cover a call that raises an exception) during LTO, and the code in throw_test.cpp aborts.

Please forgive the "build-system" being a mess.

third_party/libcxxrt is patched with 3 commits, one to simplify compilation of typeinfo.cc,
one NFC commit which applies a bunch of empty lines to exception.cc for sample_profile.txt's offsets
to match (the profile is an excerpt from real-world profile), and the third one which applies
`noexcept` to `std::terminate`.

third_party/llvm-project/libunwind is patched with FNC commit with empty lines.

One will needs gcc-11, clang-18 and lld-18 for the code to build via ./compile_everything_and_link.sh,
or the `docker build` could be used instead.

`./throw_test` aborts due to eh_frame being invalid, but patching libcxxrt to apply `[[noreturn]]` to 
`std::terminate` fixes the problem, and the `./throw_tests` return `42`, as it should.
