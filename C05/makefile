CSOBJS = codesnippets.o
UPPEROBJS = upper.o

SDK := `xcrun -sdk macosx --show-sdk-path`

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif
LSTFLGS =

LDFLAGS = -lSystem -syslibroot "$(SDK)" -e _start -arch arm64

all: codesnippets upper

%.o : %.s
	as $(DEBUGFLGS) $(LSTFLGS) $< -o $@
codesnippets: $(CSOBJS)
	ld -o codesnippets $(LDFLAGS) $(CSOBJS)

upper: $(UPPEROBJS)
	ld -o upper $(LDFLAGS) $(UPPEROBJS)

clean:
	rm -f *.o upper codesnippets
