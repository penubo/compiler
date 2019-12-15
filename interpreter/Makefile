# ©2019 YONGJOON KIM

CC = gcc
CFLAGS = -Wall -Os
CFLAGS = -g
LDFLAGS = -m32
LEX = lex
YACC = yacc -d

PROGRAM = interpreter
OBJS = y.tab.c lex.yy.c interp.c lib.c

.SUFFIXES: .c .o

$(PROGRAM): $(OBJS)
	$(CC) $(LDFLAGS) -o $(PROGRAM) $^

.c.o:
	$(CC) $(CFLAGS) -c $<

lex.yy.c: interp.l type.h interp.y
	$(LEX) interp.l
	
y.tab.c: interp.y
	$(YACC) interp.y
	

.PHONY: clean
clean:
	$(RM) $(PROGRAM) $(OBJS)
