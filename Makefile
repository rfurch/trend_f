
# Example Makefile for ArcEngine C++ Programming on Linux

#
# The PROGRAM macro defines the name of the program or project.  It
# allows the program name to be changed by editing in only one
# location
#

PROGRAM = trend_f


#
# The INCLUDEDIRS macro contains a list of include directories
# 

INCLUDEDIRS = \
	-I$(ARCENGINEHOME)/include \
	-I/usr/X11R6/include


LIBDIRS = \
	-L$(ARCENGINEHOME)/bin \
	-L/usr/X11R6/lib


LIBS = -lm -lz 

#
# The CXXSOURCES macro contains a list of source files.
#
# The CXXOBJECTS macro converts the CXXSOURCES macro into a list
# of object files.
#

src = $(wildcard *.c)
obj = $(src:.c=.o)

CFLAGS = -DESRI_UNIX -g $(INCLUDEDIRS) -Wall
CC = gcc

LDFLAGS = -g $(LIBDIRS) $(LIBS)

#
# Default target: the first target is the default target.
# Just type "make -f Makefile.Linux" to build it.
#

all: $(PROGRAM)

#
# Link target: automatically builds its object dependencies before
# executing its link command.
#

$(PROGRAM): $(obj)
	$(CC) -o $@ -g $^ $(LDFLAGS)


clean:
	$(RM) -f $(obj) $(PROGRAM)

#
# Run target: "make -f Makefile.Linux run" to execute the application
#             You will need to add $(VARIABLE_NAME) for any command line parameters
#             that you defined earlier in this file.
#

run:
	./$(PROGRAM)

