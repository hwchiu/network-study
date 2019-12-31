obj-m += ipt_MASQUERADE.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) clean

iptables:
	iptables -t nat -D POSTROUTING -s 172.18.0.0/16 ! -o docker0 -j MASQUERADE
	iptables -t nat -A POSTROUTING -s 172.18.0.0/16 ! -o docker0 -j MASQUERADE --random

init-docker:
	docker run -d hwchiu/netutils
