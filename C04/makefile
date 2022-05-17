OBJS = printdword.o
OBJS32 = printword.o
CSOBJS = codesnippets.o
CASEOBJS = case.o

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif

SDK := `xcrun -sdk macosx --show-sdk-path`
LDFLAGS = -lSystem -syslibroot "$(SDK)" -e _start -arch arm64  

%.o : %.s
	as $(DEBUGFLGS) $< -o $@

all: printdword printword codesnippets case

printdword: $(OBJS)
	ld -o printdword $(LDFLAGS) $(OBJS)

printword: $(OBJS32)
	ld -o printword $(LDFLAGS) $(OBJS32)

codesnippets: $(CSOBJS)
	ld -o codesnippets $(LDFLAGS) $(CSOBJS)

case: $(CASEOBJS)
	ld -o case $(LDFLAGS) $(CASEOBJS)

clean:
	rm *.o codesnippets printdword printword case
