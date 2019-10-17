CC=arm-none-eabi-gcc
AR=arm-none-eabi-ar

# 开启调试 + 优化
CFLAGS = -g -O3
# 硬件FPU
CFLAGS += -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16

# 头文件
CFLAGS += -I ./inc -I ./STM32F4xx_StdPeriph_Driver/inc

# 最终输出库的名字
Output = libstm32f4.a

vpath %.c ./src ./STM32F4xx_StdPeriph_Driver/src

Sources = misc.c stm32f4xx_dma.c stm32f4xx_rcc.c stm32f4xx_adc.c \
	stm32f4xx_exti.c stm32f4xx_rng.c stm32f4xx_can.c stm32f4xx_flash.c \
	stm32f4xx_rtc.c stm32f4xx_crc.c stm32f4xx_fsmc.c stm32f4xx_sdio.c \
	stm32f4xx_cryp_aes.c stm32f4xx_gpio.c stm32f4xx_spi.c \
	stm32f4xx_cryp.c stm32f4xx_hash.c stm32f4xx_syscfg.c \
	stm32f4xx_cryp_des.c stm32f4xx_hash_md5.c stm32f4xx_tim.c \
	stm32f4xx_cryp_tdes.c stm32f4xx_hash_sha1.c  stm32f4xx_usart.c \
	stm32f4xx_dac.c stm32f4xx_i2c.c stm32f4xx_wwdg.c \
	stm32f4xx_dbgmcu.c stm32f4xx_iwdg.c \
	stm32f4xx_dcmi.c stm32f4xx_pwr.c

Objects = $(Sources:.c=.o)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

$(Output): $(Objects)
	$(AR) -r $@ $^

clean:
	rm -f $(Objects)
	rm -f $(Output)

