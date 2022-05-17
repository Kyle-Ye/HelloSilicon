CSOBJS = codesnippets.o
UPPEROBJS = upper/main.o upper/upper.o
STACKFRAMEOBJS = stackframe/main.o stackframe/stackframe.o
UPPERMACOBJS = uppermacro/mainmacro.o uppermacro/uppermacro.o

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

all: codesnippets upper/upper stackframe/stackframe uppermacro/uppermacro

codesnippets: $(CSOBJS)
	ld -o codesnippets $(LDFLAGS) $(CSOBJS)

upper/upper: $(UPPEROBJS)
	ld -o upper/upper $(LDFLAGS) $(UPPEROBJS)

stackframe/stackframe: $(STACKFRAMEOBJS)
	ld -o stackframe/stackframe $(LDFLAGS) $(STACKFRAMEOBJS)

uppermacro/uppermacro: $(UPPERMACOBJS)
	ld -o uppermacro/uppermacro $(LDFLAGS) $(UPPERMACOBJS)

clean:
	rm -f $(CSOBJS) $(UPPEROBJS) $(STACKFRAMEOBJS) $(UPPERMACOBJS) codesnippets upper/upper stackframe/stackframe uppermacro/uppermacro
