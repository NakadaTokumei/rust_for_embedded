RUSTC=rustc
RUSTC_TARGET=thumbv7m-none-eabi
RUSTC_EDITION=2021
RUSTC_CRATE_TYPE=bin
RUSTC_CRATE_NAME=nopanic
RUSTC_FLAGS=--target=$(RUSTC_TARGET)         \
			--edition=$(RUSTC_EDITION)       \
			-Zcrate-attr=no_std				 \
			-Zcrate-attr=no_main			 \
			-Coverflow-checks=n				 \
			-Clinker=arm-none-eabi-gcc		 \
			-Clink-arg="-T stm32f103rbt6.ld"

AS=arm-none-eabi-as
AS_FLAGS= -mcpu=cortex-m3 \
		  -mthumb		  \
		  -mfloat-abi=soft

OBJCOPY=arm-none-eabi-objcopy
LD=arm-none-eabi-ld

ASM_OBJS= startup.o \
		  memory.o

test.hex: test.elf
	$(OBJCOPY) -O ihex $^ $@

test.elf: main.o $(ASM_OBJS)
	$(LD) -T stm32f103rbt6.ld $^ manna.o -o $@

main.o: main.rs
	$(RUSTC) $(RUSTC_FLAGS) 	\
			 $<					\
			 --emit=obj=$@ 		\
			 --extern nopanic	\
			 --extern manna		\
			 -Lnopanic/			\
			 -Lmanna/

%.o : %.s
	$(AS) $(AS_FLAGS) -o $@ $<

clean:
	rm *.hex *.o