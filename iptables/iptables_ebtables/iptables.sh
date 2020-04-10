#!/bin/bash

insert() {
	iptables -t raw -I PREROUTING -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/raw-PREROUTE' --log-level debug
    iptables -t raw -I PREROUTING -p tcp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/raw-PREROUTE' --log-level debug
    iptables -t mangle -I PREROUTING -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-PREROUTE' --log-level debug
    iptables -t mangle -I PREROUTING -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-PREROUTE' --log-level debug
    iptables -t nat -I PREROUTING -p tcp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/nat-PREROUTE' --log-level debug
    iptables -t nat -I PREROUTING -p tcp  -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/nat-PREROUTE' --log-level debug

    iptables -t mangle -I FORWARD -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-FORWARD' --log-level debug
    iptables -t mangle -I FORWARD -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-FORWARD' --log-level debug
    iptables -t filter -I FORWARD -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/filter-FORWARD' --log-level debug
    iptables -t filter -I FORWARD -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/filter-FORWARD' --log-level debug

    iptables -t mangle -I INPUT -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-INPUT' --log-level debug
    iptables -t mangle -I INPUT -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-INPUT' --log-level debug
    iptables -t filter -I INPUT -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/filter-INPUT' --log-level debug
    iptables -t filter -I INPUT -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/filter-INPUT' --log-level debug


	iptables -t raw -I OUTPUT -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/raw-PREROUTE' --log-level debug
    iptables -t raw -I OUTPUT -p tcp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/raw-PREROUTE' --log-level debug
    iptables -t mangle -I OUTPUT -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-PREROUTE' --log-level debug
    iptables -t mangle -I OUTPUT -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-PREROUTE' --log-level debug
    iptables -t nat -I OUTPUT -p tcp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/nat-PREROUTE' --log-level debug
    iptables -t nat -I OUTPUT -p tcp  -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/nat-PREROUTE' --log-level debug
    iptables -t filter -I OUTPUT -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/filter-OUTPUT' --log-level debug
    iptables -t filter -I OUTPUT -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/filter-OUTPUT' --log-level debug

    iptables -t mangle -I POSTROUTING -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-POSTROUTE' --log-level debug
    iptables -t mangle -I POSTROUTING -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-POSTROUTE' --log-level debug
    iptables -t nat -I POSTROUTING -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/nat-POSTROUTE' --log-level debug
    iptables -t nat -I POSTROUTING -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/nat-POSTROUTE' --log-level debug
 }

delete() {
	iptables -t raw -D PREROUTING -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/raw-PREROUTE' --log-level debug
    iptables -t raw -D PREROUTING -p tcp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/raw-PREROUTE' --log-level debug
    iptables -t mangle -D PREROUTING -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-PREROUTE' --log-level debug
    iptables -t mangle -D PREROUTING -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-PREROUTE' --log-level debug
    iptables -t nat -D PREROUTING -p tcp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/nat-PREROUTE' --log-level debug
    iptables -t nat -D PREROUTING -p tcp  -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/nat-PREROUTE' --log-level debug

    iptables -t mangle -D FORWARD -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-FORWARD' --log-level debug
    iptables -t mangle -D FORWARD -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-FORWARD' --log-level debug
    iptables -t filter -D FORWARD -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/filter-FORWARD' --log-level debug
    iptables -t filter -D FORWARD -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/filter-FORWARD' --log-level debug

    iptables -t mangle -D INPUT -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-DNPUT' --log-level debug
    iptables -t mangle -D INPUT -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-DNPUT' --log-level debug
    iptables -t filter -D INPUT -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/filter-DNPUT' --log-level debug
    iptables -t filter -D INPUT -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/filter-DNPUT' --log-level debug

	iptables -t raw -D OUTPUT -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/raw-PREROUTE' --log-level debug
    iptables -t raw -D OUTPUT -p tcp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/raw-PREROUTE' --log-level debug
    iptables -t mangle -D OUTPUT -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-PREROUTE' --log-level debug
    iptables -t mangle -D OUTPUT -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-PREROUTE' --log-level debug
    iptables -t nat -D OUTPUT -p tcp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/nat-PREROUTE' --log-level debug
    iptables -t nat -D OUTPUT -p tcp  -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/nat-PREROUTE' --log-level debug
    iptables -t filter -D OUTPUT -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/filter-OUTPUT' --log-level debug
    iptables -t filter -D OUTPUT -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/filter-OUTPUT' --log-level debug

    iptables -t mangle -D POSTROUTING -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-POSTROUTE' --log-level debug
    iptables -t mangle -D POSTROUTING -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-POSTROUTE' --log-level debug
    iptables -t nat -D POSTROUTING -p tcp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/nat-POSTROUTE' --log-level debug
    iptables -t nat -D POSTROUTING -p tcp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/nat-POSTROUTE' --log-level debug

}

check() {
    count=`iptables-save | grep iptable | wc -l`
    if [ "$count" == "0" ]; then
        echo "Delete Success"
    else
        echo "Delete Fail, Use the iptables-save to check what rules still exist"
    fi
}


if [ "$1" == "d" ]; then
delete
check
else
insert
fi
