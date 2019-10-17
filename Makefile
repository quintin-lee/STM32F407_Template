CC = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy

CFLAGS = -g -O3 -Wall
# use FPU
CFLAGS += -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16

CFLAGS += -T ./stm32_flash.ld

# include dirs
CFLAGS += -I ./inc -I ./lib/inc -I ./lib/STM32F4xx_StdPeriph_Driver/inc
CFLAGS += -I ./src

vpath %.c ./src
vpath %.h ./inc ./lib/inc ./lib/STM32F4xx_StdPeriph_Driver/inc
vpath %.s ./lib

# output
Output = project

Objects = system_stm32f4xx.o stm32f4xx_it.o main.o startup.o 
###########################################################################

.PHONY: lib proj
all: lib proj

lib:
	$(MAKE) -C ./lib

proj: $(Objects)
	$(CC) $(CFLAGS) $(Objects) -o $(Output).elf -L ./lib -l stm32f4
	$(OBJCOPY) -O ihex $(Output).elf $(Output).hex
	$(OBJCOPY) -O binary $(Output).elf $(Output).bin

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

startup.o: ./lib/startup_stm32f4xx.s
	$(CC) $(CFLAGS) -c -o $@ $<
	

###############################################################################
clean:
	$(MAKE) -C ./lib clean
	rm -f *.o
	rm -f $(Output).elf
	rm -f $(Output).hex
	rm -f $(Output).bin
	
burn:
	st-flash write $(Output).bin 0x8000000

