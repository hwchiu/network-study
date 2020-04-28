#include <linux/init.h>
#include <linux/spinlock.h>
#include <linux/skbuff.h>
#include <linux/net.h>
#include <linux/slab.h>
#include <linux/proc_fs.h>
#include <linux/ip.h>
#include <linux/udp.h>
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
    bool ret = true;
    struct iphdr *iph;          /* IPv4 header */

    iph = ip_hdr(skb);          /* get IP header */
    //We only check UDP
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
