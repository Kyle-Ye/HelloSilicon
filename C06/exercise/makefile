OBJS = e2.o

SDK := `xcrun -sdk macosx --show-sdk-path`

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
LSTFLGS =

LDFLAGS = -lSystem -syslibroot "$(SDK)" -e _start -arch arm64

%.o : %.s
	as $(DEBUGFLGS) $(LSTFLGS) $< -o $@

e2: $(OBJS)
	ld -o e2 $(LDFLAGS) $(OBJS)

clean:
	rm -f $(OBJS) e2
