#!/bin/bash

insert() {
    ebtables -t broute -I BROUTING --log --log-prefix 'ebtable/broute-BROUTING' --log-level debug
    ebtables -t nat -I PREROUTING --log --log-prefix 'ebtable/nat-PREROUTE' --log-level debug
    ebtables -t nat -I POSTROUTING --log --log-prefix 'ebtable/nat-POSTROUTE' --log-level debug
    ebtables -t nat -I OUTPUT --log --log-prefix 'ebtable/nat-OUTPUT' --log-level debug
    ebtables -t filter -I INPUT --log --log-prefix 'ebtable/filter-INPUT' --log-level debug
    ebtables -t filter -I OUTPUT --log --log-prefix 'ebtable/filter-OUTPUT' --log-level debug
    ebtables -t filter -I FORWARD --log --log-prefix 'ebtable/filter-FORWARD' --log-level debug
}

delete() {
    ebtables -t broute -D BROUTING --log --log-prefix 'ebtable/broute-BROUTING' --log-level debug
    ebtables -t nat -D PREROUTING --log --log-prefix 'ebtable/nat-PREROUTE' --log-level debug
    ebtables -t nat -D POSTROUTING --log --log-prefix 'ebtable/nat-POSTROUTE' --log-level debug
    ebtables -t nat -D OUTPUT --log --log-prefix 'ebtable/nat-OUTPUT' --log-level debug
    ebtables -t filter -D INPUT --log --log-prefix 'ebtable/filter-INPUT' --log-level debug
    ebtables -t filter -D OUTPUT --log --log-prefix 'ebtable/filter-OUTPUT' --log-level debug
    ebtables -t filter -D FORWARD --log --log-prefix 'ebtable/filter-FORWARD' --log-level debug
}

check() {
    count=`ebtables-save | grep ebtable | wc -l`
    if [ "$count" == "0" ]; then
        echo "Delete Success"
    else
        echo "Delete Fail, Use the ebtables-save to check what rules still exist"
    fi
}

if [ "$1" == "d" ]; then
delete
check
else
insert
fi
