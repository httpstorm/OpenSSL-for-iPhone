NAME_APP        := openssl
NAME_PACKAGE    := openssl

default: build
.PHONY : clean dirclean install rebuild

lib/libssl.a:
ifeq (Darwin,$(shell uname -s))
	./build-libssl.sh
endif

build: lib/libssl.a clean

clean:
	@rm -rf bin

dirclean:
	rm -rf bin
	rm -rf lib
	rm -rf src
	rm -rf include/openssl
	rm *.gz

rebuild:
	clear ; printf '\033[3J'
	@$(MAKE) dirclean
	@echo make
	@$(MAKE)

install: ;
remove: ;
