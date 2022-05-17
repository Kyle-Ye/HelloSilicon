UPPEROBJS = main.o upper.o

SDK := `xcrun -sdk macosx --show-sdk-path`

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
LSTFLGS =

LDFLAGS = -lSystem -syslibroot "$(SDK)" -e _start -arch arm64

all: upper

%.o : %.S
	clang $(DEBUGFLGS) $(LSTFLGS) -c $< -o $@

%.o : %.s
	as $(DEBUGFLGS) $(LSTFLGS) $< -o $@

upper: $(UPPEROBJS)
	ld -o upper $(LDFLAGS) $(UPPEROBJS)

clean:
	rm -f $(UPPEROBJS) upper upper.txt
