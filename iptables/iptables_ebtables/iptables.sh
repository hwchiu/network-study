#!/bin/bash

insert() {
    iptables -t raw -I PREROUTING -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/raw-PREROUTE' --log-level debug
    iptables -t raw -I PREROUTING -p icmp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/raw-PREROUTE' --log-level debug
    iptables -t mangle -I PREROUTING -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-PREROUTE' --log-level debug
    iptables -t mangle -I PREROUTING -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-PREROUTE' --log-level debug
    iptables -t nat -I PREROUTING -p icmp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/nat-PREROUTE' --log-level debug
    iptables -t nat -I PREROUTING -p icmp  -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/nat-PREROUTE' --log-level debug

    iptables -t mangle -I FORWARD -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-FORWARD' --log-level debug
    iptables -t mangle -I FORWARD -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-FORWARD' --log-level debug
    iptables -t filter -I FORWARD -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/filter-FORWARD' --log-level debug
    iptables -t filter -I FORWARD -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/filter-FORWARD' --log-level debug

    iptables -t mangle -I INPUT -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-INPUT' --log-level debug
    iptables -t mangle -I INPUT -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-INPUT' --log-level debug
    iptables -t filter -I INPUT -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/filter-INPUT' --log-level debug
    iptables -t filter -I INPUT -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/filter-INPUT' --log-level debug


    iptables -t raw -I OUTPUT -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/raw-OUTPUT' --log-level debug
    iptables -t raw -I OUTPUT -p icmp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/raw-OUTPUT' --log-level debug
    iptables -t mangle -I OUTPUT -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-OUTPUT' --log-level debug
    iptables -t mangle -I OUTPUT -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-OUTPUT' --log-level debug
    iptables -t nat -I OUTPUT -p icmp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/nat-OUTPUT' --log-level debug
    iptables -t nat -I OUTPUT -p icmp  -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/nat-OUTPUT' --log-level debug
    iptables -t filter -I OUTPUT -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/filter-OUTPUT' --log-level debug
    iptables -t filter -I OUTPUT -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/filter-OUTPUT' --log-level debug

    iptables -t mangle -I POSTROUTING -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-POSTROUTE' --log-level debug
    iptables -t mangle -I POSTROUTING -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-POSTROUTE' --log-level debug
    iptables -t nat -I POSTROUTING -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/nat-POSTROUTE' --log-level debug
    iptables -t nat -I POSTROUTING -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/nat-POSTROUTE' --log-level debug
 }

delete() {
        iptables -t raw -D PREROUTING -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/raw-PREROUTE' --log-level debug
    iptables -t raw -D PREROUTING -p icmp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/raw-PREROUTE' --log-level debug
    iptables -t mangle -D PREROUTING -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-PREROUTE' --log-level debug
    iptables -t mangle -D PREROUTING -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-PREROUTE' --log-level debug
    iptables -t nat -D PREROUTING -p icmp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/nat-PREROUTE' --log-level debug
    iptables -t nat -D PREROUTING -p icmp  -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/nat-PREROUTE' --log-level debug

    iptables -t mangle -D FORWARD -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-FORWARD' --log-level debug
    iptables -t mangle -D FORWARD -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-FORWARD' --log-level debug
    iptables -t filter -D FORWARD -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/filter-FORWARD' --log-level debug
    iptables -t filter -D FORWARD -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/filter-FORWARD' --log-level debug

    iptables -t mangle -D INPUT -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-INPUT' --log-level debug
    iptables -t mangle -D INPUT -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-INPUT' --log-level debug
    iptables -t filter -D INPUT -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/filter-INPUT' --log-level debug
    iptables -t filter -D INPUT -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/filter-INPUT' --log-level debug

    iptables -t raw -D OUTPUT -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/raw-OUTPUT' --log-level debug
    iptables -t raw -D OUTPUT -p icmp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/raw-OUTPUT' --log-level debug
    iptables -t mangle -D OUTPUT -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-OUTPUT' --log-level debug
    iptables -t mangle -D OUTPUT -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-OUTPUT' --log-level debug
    iptables -t nat -D OUTPUT -p icmp  -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/nat-OUTPUT' --log-level debug
    iptables -t nat -D OUTPUT -p icmp  -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/nat-OUTPUT' --log-level debug
    iptables -t filter -D OUTPUT -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/filter-OUTPUT' --log-level debug
    iptables -t filter -D OUTPUT -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/filter-OUTPUT' --log-level debug

    iptables -t mangle -D POSTROUTING -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/mangle-POSTROUTE' --log-level debug
    iptables -t mangle -D POSTROUTING -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/mangle-POSTROUTE' --log-level debug
    iptables -t nat -D POSTROUTING -p icmp -d 172.18.0.0/16 -j LOG --log-prefix 'iptable/nat-POSTROUTE' --log-level debug
    iptables -t nat -D POSTROUTING -p icmp -d 172.17.0.0/16 -j LOG --log-prefix 'iptable/nat-POSTROUTE' --log-level debug

}

check() {
    count=`iptables-save | grep iptable | grep -v iptables-save | wc -l`
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
