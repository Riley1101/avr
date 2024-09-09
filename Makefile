CC = avr-gcc
CFLAGS = -mmcu=atmega2560 -Os
PORT = /dev/ttyACM0

default:
	$(CC) $(CFLAGS) -Os -DF_CPU=16000000UL -o main.elf main.c
	avr-objcopy -O ihex -R .eeprom main.elf main.hex
	avrdude -v -p atmega2560 -c wiring -P $(PORT) -b 115200 -D -U flash:w:main.hex:i


