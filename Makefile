OBJS = quectel-CM.o
CC = $(CROSS-COMPILE)gcc
OUT_BIN = quectel-CM
dep_file = .$@.d

all: $(OBJS)
		$(CC) $(LDFLAGS) -g -o $(OUT_BIN) $^
		
%.o: %.c
		$(CC) $(CFLAGS) -Wp,-MD,$(dep_file) -c -o $@ $<

clean:
	rm -rf *.o
	rm -rf $(OUT_BIN)
	rm -f $(shell find -name "*.d")

