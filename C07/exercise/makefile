LOWEROBJS = main.o lower.o

SDK := `xcrun -sdk macosx --show-sdk-path`

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
LSTFLGS =

LDFLAGS = -lSystem -syslibroot "$(SDK)" -e _start -arch arm64

all: lower

%.o : %.S
	clang $(DEBUGFLGS) $(LSTFLGS) -c $< -o $@

%.o : %.s
	as $(DEBUGFLGS) $(LSTFLGS) $< -o $@

lower: $(LOWEROBJS)
	ld -o lower $(LDFLAGS) $(LOWEROBJS)

clean:
	rm -f $(LOWEROBJS) lower lower.txt
