obj-m += ipt_MASQUERADE.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) clean

iptables:
	iptables -t nat -D POSTROUTING -s 172.18.0.0/16 ! -o docker0 -j MASQUERADE || true
	iptables -t nat -D POSTROUTING -s 172.18.0.0/16 ! -o docker0 -j MASQUERADE --random || true
	rmmod ipt_MASQUERADE.ko
	insmod ipt_MASQUERADE.ko
	iptables -t nat -A POSTROUTING -s 172.18.0.0/16 ! -o docker0 -j MASQUERADE --random || true

client:
	docker run --rm --entrypoint "/usr/bin/wget" hwchiu/netutils google.com
