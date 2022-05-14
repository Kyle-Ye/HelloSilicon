SDK := `xcrun -sdk macosx --show-sdk-path`
HelloWorld: HelloWorld.o
	ld -o HelloWorld HelloWorld.o -lSystem -syslibroot "$(SDK)" -e _start -arch arm64 
# -lSystem tells the linker to link our executable with libSystem.dylib. We do that to add the LC_MAIN load command to the executable. Generally, Darwin does not support statically linked executables. It is possible, if not especially elegant to create executables without using libSystem.dylib. I will go deeper into that topic when time permits. For people who read Mac OS X Internals I will just add that this replaced LC_UNIXTHREAD as of MacOS X 10.7.
# -sysroot: In order to find libSystem.dylib, it is mandatory to tell our linker where to find it. It seems this was not necessary on macOS 10.15 because "New in macOS Big Sur 11 beta, the system ships with a built-in dynamic linker cache of all system-provided libraries. As part of this change, copies of dynamic libraries are no longer present on the filesystem.". We use xcrun -sdk macosx --show-sdk-path to dynamically use the currently active version of Xcode.
# -e _start: Darwin expects an entrypoint _main. In order to keep the sample both as close as possible to the book, and to allow it's use within the C-Sample from Chapter 3, I opted to keep _start and tell the linker that this is the entry point we want to use
# -arch arm64 for good measure, let's throw in the option to cross-compile this from an Intel Mac. You can leave this off when running on Apple Silicon.

HelloWorld.o: HelloWorld.s
	as -arch arm64 -o HelloWorld.o HelloWorld.s

Test: Test.o
	ld -o Test Test.o -lSystem -sysslibroot "$(SDK)" -e _start -arch arm64 

Test.o: Test.s
	as -arch arm64 -o Test.o Test.s