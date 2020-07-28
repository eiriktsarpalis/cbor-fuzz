
# Instructions

1. Clone and build [AFL](https://github.com/google/AFL/).
2. Build QEMU support by running the build script in [qemu_mode](https://github.com/google/AFL/tree/master/qemu_mode).
3. Add afl-fuzz to your PATH (e.g. by running `sudo make install`).
4. In this repo, build the project by running `make build` (.NET 5 preview sdk required).
5. Start the fuzzer by running `make fuzz-qemu`.
