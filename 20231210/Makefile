RUSTC=rustc
RUSTC_TARGET=thumbv7m-none-eabi
RUSTC_EDITION=2021
RUSTC_CRATE_TYPE=bin
RUSTC_CRATE_NAME=nopanic
RUSTC_FLAGS=--target=$(RUSTC_TARGET)         \
			--edition=$(RUSTC_EDITION)       \
			-Zcrate-attr=no_std				 \
			-Zcrate-attr=no_main			 \
			-Clink-arg="-T stm32f103rbt6.ld"

OBJCOPY=arm-none-eabi-objcopy
LD=arm-none-eabi-ld

test.hex: test.elf
	$(OBJCOPY) -O ihex $^ $@

test.elf: main.o
	$(LD) -T stm32f103rbt6.ld $^ -o $@

main.o: main.rs
	$(RUSTC) $(RUSTC_FLAGS) 	\
			 $<					\
			 --emit=obj=$@ 		\
			 --extern nopanic	\
			 -Lnopanic/

clean:
	rm *.hex *.o