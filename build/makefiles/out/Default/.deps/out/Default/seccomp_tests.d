cmd_out/Default/seccomp_tests := flock out/Default/linker.lock g++   -o out/Default/seccomp_tests -Wl,--start-group out/Default/obj.target/seccomp_tests/reference_trusted_thread.o out/Default/obj.target/seccomp_tests/tests/clone_test_helper.o out/Default/obj.target/seccomp_tests/tests/syscall_via_int0.o out/Default/obj.target/seccomp_tests/tests/test_runner.o out/Default/obj.target/seccomp_tests/tests/test_patching.o out/Default/obj.target/seccomp_tests/tests/test_patching_input.o out/Default/obj.target/seccomp_tests/tests/test_syscalls.o out/Default/obj.target/libseccomp_sandbox.a -Wl,--end-group -lpthread -lutil
