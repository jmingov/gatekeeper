CFLAGS += -O2 \
	-fstack-protector-all -Wformat -Wformat=2 -Wformat-security -fPIE -D_FORTIFY_SOURCE=2 \
	-pedantic-errors \
	-Wall -Wextra \
	-Wcast-align -Wpointer-arith -Wmissing-noreturn -Wmissing-format-attribute -Wredundant-decls \
	-Wunreachable-code -Winline -Wfloat-equal

all:
	gcc $(CFLAGS) -o gatekeeper gatekeeper.c