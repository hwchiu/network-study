obj-m += ipt_MASQUERADE.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) clean

interface:
	sudo ip addr add 1.2.3.56/24 dev eth0

iptables:
	iptables -t nat -D POSTROUTING -s 172.18.0.0/16 ! -o docker0 -j MASQUERADE || true
	iptables -t nat -D POSTROUTING -s 172.18.0.0/16 -p tcp ! -o docker0 -j MASQUERADE --to-ports 55666-55680|| true
	rmmod ipt_MASQUERADE.ko
	insmod ipt_MASQUERADE.ko
	iptables -t nat -A POSTROUTING -s 172.18.0.0/16 -p tcp ! -o docker0 -j MASQUERADE --to-ports 55666-55680|| true
	iptables -t nat -A POSTROUTING -s 172.18.0.0/16 ! -o docker0 -j MASQUERADE || true

port-client:
	docker run --rm --entrypoint "/usr/bin/wget" hwchiu/netutils google.com


ip-client:
	docker run --rm --entrypoint "/usr/bin/wget" hwchiu/netutils 1.2.3.4
