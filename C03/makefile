HelloWorld: HelloWorld.o
	ld -o HelloWorld HelloWorld.o
HelloWorld.o: HelloWorld.s
	as -o HelloWorld HelloWorld.s
*.o: *.s
	as $< -o $@ 