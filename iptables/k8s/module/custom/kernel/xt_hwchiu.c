#include <linux/init.h>
#include <linux/spinlock.h>
#include <linux/skbuff.h>
#include <linux/net.h>
#include <linux/slab.h>
#include <linux/proc_fs.h>
#include <linux/ip.h>
#include <linux/udp.h>
#include <linux/tcp.h>
#include <linux/inet.h>
#include <linux/netfilter/x_tables.h>
#include <linux/module.h>

#define LENGTH 16

struct xt_hwchiu_info {
	char	prefix[LENGTH];
};

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Xtables: hwchius-based matching (\"Nth\", random)");
MODULE_ALIAS("ipt_hwchiu");
MODULE_ALIAS("ip6t_hwchiu");

static bool
hwchiu_mt(const struct sk_buff *skb, struct xt_action_param *par)
{
    const struct xt_hwchiu_info *info = par->matchinfo;
    unsigned char *user_data;   /* UDP data begin pointer */
    bool ret = true;
    struct iphdr *iph;          /* IPv4 header */
    struct tcphdr *tcph;
    struct udphdr *udph;
    u16 *_id;
    u8 *_qr;
    u8 *_length;
    int count;
    int i;

    iph = ip_hdr(skb);          /* get IP header */
    if (IPPROTO_UDP == iph->protocol) {
	udph = udp_hdr(skb);
    	user_data = (unsigned char *)((unsigned char *)udph + sizeof(struct udphdr));
	printk("[%s]UDP packet: %pI4:%d -> %pI4:%d \n", info->prefix, &iph->saddr, ntohs(udph->source), &iph->daddr,ntohs(udph->dest));
	if (53 == ntohs(udph->dest)) {
	    printk("DNS data\n");
	    _id = (u16*)(&user_data[0]);
            _qr = (u8*)(&user_data[2]);
	    printk("ID: %d\n", ntohs(*_id));
	    printk("QR: %d, OpCode: %d, AA:%d, TC:%d, RD:%d\n", ((*_qr))&0x80,((*_qr))&0x78,((*_qr))&0x04,((*_qr))&0x02,((*_qr))&0x01);
	    printk("RA: %d, Z: %d, AD:%d, CD:%d, RCODE:%d\n", ((*_qr))&0x80,((*_qr))&0x40,((*_qr))&0x20,((*_qr))&0x10,((*_qr))&0x0f);
	    count = 12;
	    _length = &user_data[count];
	    printk("question: \n");
	    while (0 != (*_length)) {
		 for( i = 0; i < *_length; i++) {
		   printk("%c", user_data[1+count+i]);
		 }
		 printk("-");
	         count = count + 1 + *_length;    
	         _length = &user_data[count];
	    }
	}
    } else if (IPPROTO_TCP == iph->protocol) {
    	tcph = tcp_hdr(skb);
	printk("[%s]TCP packet: %pI4:%d -> %pI4:%d, %d\n", info->prefix, &iph->saddr, ntohs(tcph->source), &iph->daddr,ntohs(tcph->dest), tcph->seq);
    }
    return ret;
}

static int hwchiu_mt_check(const struct xt_mtchk_param *par)
{
//    struct xt_hwchiu_info *info = par->matchinfo;

    return 0;
}

static void hwchiu_mt_destroy(const struct xt_mtdtor_param *par)
{
//    const struct xt_hwchiu_info *info = par->matchinfo;
    return;
}

static struct xt_match xt_hwchiu_mt_reg __read_mostly = {
    .name       = "hwchiu",
    .revision   = 0,
    .family     = NFPROTO_UNSPEC,
    .match      = hwchiu_mt,
    .checkentry = hwchiu_mt_check,
    .destroy    = hwchiu_mt_destroy,
    .hooks      = (1 << NF_INET_LOCAL_IN) |
	    	  (1 << NF_INET_FORWARD) |
	    	  (1 << NF_INET_LOCAL_OUT),
    .matchsize  = sizeof(struct xt_hwchiu_info),
    .usersize   = sizeof(struct xt_hwchiu_info),
    .me         = THIS_MODULE,
};

static int __init hwchiu_mt_init(void)
{
    return xt_register_match(&xt_hwchiu_mt_reg);
}

static void __exit hwchiu_mt_exit(void)
{
    //Debug Message
    printk(KERN_INFO "exit module \n");
    xt_unregister_match(&xt_hwchiu_mt_reg);
}

module_init(hwchiu_mt_init);
module_exit(hwchiu_mt_exit);
