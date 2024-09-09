CC = avr-gcc
CFLAGS = -mmcu=atmega2560 -Os
PORT = /dev/ttyACM0
FILENAME = buttoned

default:
	$(CC) $(CFLAGS) -Os -DF_CPU=16000000UL -o $(FILENAME).elf $(FILENAME).c
	avr-objcopy -O ihex -R .eeprom $(FILENAME).elf $(FILENAME).hex
	avrdude -v -p atmega2560 -c wiring -P $(PORT) -b 115200 -D -U flash:w:$(FILENAME).hex:i
