#include <linux/init.h>
#include <linux/module.h>
#include <linux/moduleparam.h>

static char *whom = "World";
static int howmany = 1;

static int __init general_init(void){
  int i;
  for (i = 0; i < howmany; i++) {
     printk(KERN_INFO "(%d) Hello, %s\n", i, whom);
  }
   return 0;
}

static void __exit general_exit(void) {
  printk(KERN_INFO "Bye bye cruel world\n");
}

module_param(howmany, int, S_IRUGO);
module_param(whom, charp, S_IRUGO);
module_init(general_init);
module_exit(general_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("dmike");
MODULE_DESCRIPTION("Example of linux kernel general driver");
MODULE_VERSION("0:1.0.0");

