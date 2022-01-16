#include <linux/init.h>
#include <linux/module.h>
#include <linux/moduleparam.h>


static int __init scull_init(void){
  return 0;
}

static void __exit scull_exit(void) {
  printk(KERN_INFO "Bye bye cruel world\n");
}

module_init(scull_init);
module_exit(scull_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("dmike");
MODULE_DESCRIPTION("Example of linux kernel  driver for charater device");
MODULE_VERSION("0:1.0.0");

