NAME_APP        := openssl
NAME_PACKAGE    := $(NAME_APP)

default: build
.PHONY : clean dirclean install pub rebuild

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
	rm -f *.gz

rebuild:
	clear ; printf '\033[3J'
	@$(MAKE) dirclean
	@echo make
	@$(MAKE)

amend:
	@echo $(NAME_PACKAGE)
	git commit -a --amend --no-edit
	git push --force
	@echo .
