# ©2019 YONGJOON KIM

CC = gcc
CFLAGS = -Wall -Os
CFLAGS = -g
LDFLAGS = -m32
LEX = flex
YACC = bison -d

PROGRAM = compiler
OBJS = parse.tab.c lex.yy.c syntax.c print.c semantic.o print_sem.c main.c generator.c

.SUFFIXES: .c .o

$(PROGRAM): $(OBJS)
	$(CC) $(LDFLAGS) -o $(PROGRAM) $^

.c.o:
	$(CC) $(CFLAGS) -c $<

lex.yy.c: scan.l type.h parse.tab.h parse.y
	$(LEX) scan.l
	
parse.tab.c: parse.y syntax.h
	$(YACC) parse.y
	
main.o : type.h

print.o : type.h

print_sem.o : type.h

semantic.o : type.h

syntax.o : syntax.h parse.tab.h

.PHONY: clean
clean:
	$(RM) $(PROGRAM) $(OBJS)
