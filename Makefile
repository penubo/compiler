# ©2016 YUICHIRO NAKADA

CC = gcc
CFLAGS = -Wall -Os
CFLAGS = -g
LEX = flex
YACC = bison -d

PROGRAM = compiler
OBJS = parse.tab.c syntax.o print.o semantic.o print_sem.o lex.yy.c main.o

.SUFFIXES: .c .o

$(PROGRAM): $(OBJS)
	$(CC) -o $(PROGRAM) $^

.c.o:
	$(CC) $(CFLAGS) -c $<

lex.yy.c: scan.l type.h parse.tab.h parse.y
	$(LEX) scan.l
	
parse.tab.c: parse.y syntax.h
	$(YACC) parse.y
	
#y.tab.o: cparser.y
main.o : type.h

print.o : type.h

print_sem.o : type.h

sem_print.o : sem_print.c

semantic.o : type.h

syntax.o : syntax.h parse.tab.h

.PHONY: clean
clean:
	$(RM) $(PROGRAM) $(OBJS)
