cmd_out/Default/timestats := flock out/Default/linker.lock g++   -o out/Default/timestats -Wl,--start-group out/Default/obj.target/timestats/timestats.o -Wl,--end-group 
