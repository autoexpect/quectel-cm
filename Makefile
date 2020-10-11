OBJS = main.o dhcpclient.o GobiNetCM.o MPQMUX.o QMIThread.o QmiWwanCM.o udhcpc.o util.o 
CC = $(CROSS_COMPILE)gcc
OUT_BIN = quectel-CM
dep_file = .$@.d

all: $(OBJS)
		$(CC) -pthread $(LDFLAGS) -g -o $(OUT_BIN) $^
		
%.o: %.c
		$(CC) $(CFLAGS) -Wp,-MD,$(dep_file) -c -o $@ $<

clean:
	rm -rf *.o
	rm -rf $(OUT_BIN)
	rm -f $(shell find -name "*.d")
