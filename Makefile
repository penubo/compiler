
TARGETS := compiler 

COMPILER_OBJS := compiler.o


OBJS := $(COMPILER_OBJS) 

CC := gcc

CFLAGS += -D_REENTRANT -D_LIBC_REENTRANT -D_THREAD_SAFE
CFLAGS += -Wall
CFLAGS += -Wunused
CFLAGS += -Wshadow
CFLAGS += -Wdeclaration-after-statement
CFLAGS += -Wdisabled-optimization
CFLAGS += -Wpointer-arith
CFLAGS += -Wredundant-decls
CFLAGS += -g -O2

LDFLAGS += -m32

%.o: %.c
	$(CC) -o $*.o $< -c $(CFLAGS)

.PHONY: all clean test

all: $(TARGETS)

compiler: $(COMPILER_OBJS)
	$(CC) -o $@ y.tab.c lex.yy.c main.c syntax.c print.c $^ $(LDFLAGS)

task: $(TASK_OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)
