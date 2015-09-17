SRCDIR = src
IDIR = include

CC=gcc
CFLAGS=-g -fPIC -I"/usr/lib/jvm/java-7-openjdk-amd64/include"

ODIR=obj
LIBDIR=lib

all: native java
	@echo "\n*** Build complete! ***"
	@echo "\nTo run:"
	@echo "\ncd class"
	@echo "java -Djava.library.path=../lib Client\n"

$(ODIR)/%.o: $(SRCDIR)/native/%.c
	@mkdir -p obj
	$(CC) $(CFLAGS) -c -o $@ $< 

java: $(SRCDIR)/java/Client.java
	@mkdir -p class
	javac $(SRCDIR)/java/Client.java
	mv $(SRCDIR)/java/Client.class class

native: $(ODIR)/native_crypt.o
	@mkdir -p lib
	$(CC) $(CFLAGS) -o $(LIBDIR)/libnativecrypt.so -shared -Wl,-soname,nativecrypt.so $(ODIR)/native_crypt.o -lc

.PHONY: clean

clean:
	rm -f *~ core $(INCDIR)/*~
	rm -rf ./$(LIBDIR)
	rm -rf ./$(ODIR)
	rm -rf ./class



