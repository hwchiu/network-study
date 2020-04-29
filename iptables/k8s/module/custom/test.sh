/home/vagrant/network-study/iptables/k8s/module/custom/user/iptables/iptables/xtables-multi iptables -t filter -D FORWARD -m hwchiu --domain google.com -j DROP || true
rmmod xt_hwchiu
insmod kernel/xt_hwchiu.ko
/home/vagrant/network-study/iptables/k8s/module/custom/user/iptables/iptables/xtables-multi iptables -t filter -I FORWARD -m hwchiu --domain google.com -j DROP || true
