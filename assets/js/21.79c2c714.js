(window.webpackJsonp=window.webpackJsonp||[]).push([[21],{426:function(e,t,a){"use strict";a.r(t);var i=a(56),n=Object(i.a)({},(function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("ContentSlotsDistributor",{attrs:{"slot-key":e.$parent.slotKey}},[a("h2",{attrs:{id:"sharing-file"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#sharing-file"}},[e._v("#")]),e._v(" Sharing File")]),e._v(" "),a("p",[e._v("In concurrent programs is necassary to correctly mange access to shared object.\nThe concept that we have to deal with are:")]),e._v(" "),a("p",[e._v(". Visibility\n. Publication And Escape\n. Thread Confinement\n. Immutability\n. Safe Publication")]),e._v(" "),a("h3",{attrs:{id:"visibility"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#visibility"}},[e._v("#")]),e._v(" Visibility")]),e._v(" "),a("p",[e._v("The visibility in  a concurrent program is not so obvious. So to ensure it must use synchronization.")]),e._v(" "),a("p",[e._v('IMPORTANT: In the absence of synchronization the order in which operation apear\nto execute it\'s random. Any attempts to reason about the order in which memory\nacitions "must" happen will almost be incorrect.')]),e._v(" "),a("p",[e._v("When shared variable are not synchronized  a thread can see it in a "),a("em",[e._v("stale")]),e._v(" values ,\nthat in some situation can cause serious safty or liveness failures. When a thread\nreads a variable without synchr it may see a "),a("em",[e._v("stale")]),e._v(" value, but at least see\nsomthing place there by some other thread; this is guarantee by the "),a("em",[e._v("out-of-thin-air")]),e._v(" safty.\nOut-of-thin-air applies to all variables, with one exception: 64-bit variable("),a("em",[e._v("double")]),e._v(","),a("em",[e._v("long")]),e._v("),\nbecause the JVM treats 64-bit variable as two separate 32-bit operation. So it's not safe to share\n"),a("em",[e._v("long")]),e._v(" or "),a("em",[e._v("double")]),e._v(" unless declared "),a("em",[e._v("volatile")]),e._v(" or guraded by a lock.")]),e._v(" "),a("p",[e._v("Lock can be used to guarantee that one thread sees the effect of another in a predicatable\nmanner: where thread A executes a "),a("em",[e._v("synchr")]),e._v(" block and after a thread B enters a\n"),a("em",[e._v("synchr")]),e._v(" block guarder by the same lock, the values visible to A prior to releasing\nthe lock are visible to B upon acquiring the same lock.")]),e._v(" "),a("div",{staticClass:"custom-block tip"},[a("p",{staticClass:"custom-block-title"},[e._v("TIP")]),e._v(" "),a("p",[e._v("Lock is not just about mutual exclusion, it also about memory visibility.")])]),e._v(" "),a("p",[e._v("Java provides a weaker form of synchronization, "),a("em",[e._v("volatile variable")]),e._v(". When a field\nit's defined "),a("em",[e._v("volatile")]),e._v(" the compiler and runtime are put on notice that this var\nis shared and that operations on it should not be reordered with other memory operation.\nSo a read of volatile varible always return the most recent value write by another thread.\nWhen a thread A writes to a volatile variable and after a thread B reads that same variable,\nthe values of all variables that were visible to A prior to writing to the volatile\nvariable become visible to B after reading the volatile variable.")]),e._v(" "),a("div",{staticClass:"custom-block tip"},[a("p",{staticClass:"custom-block-title"},[e._v("TIP")]),e._v(" "),a("p",[e._v("Use "),a("em",[e._v("volatile")]),e._v(" variable only when they simplify implementing and verifying the synchr policy.")])]),e._v(" "),a("p",[e._v("Use them when:")]),e._v(" "),a("ul",[a("li",[e._v("write to the variable  do not depend on its current value, or you are sure that\nonly a single thread update the value;")]),e._v(" "),a("li",[e._v("the variable does not participate in invariants with other state variables;")]),e._v(" "),a("li",[e._v("locking is not required")])]),e._v(" "),a("div",{staticClass:"custom-block warning"},[a("p",{staticClass:"custom-block-title"},[e._v("WARNING")]),e._v(" "),a("p",[e._v("Locking can guarantee both visibility and atomicity; volatile can only guarantee visibility.")])]),e._v(" "),a("h3",{attrs:{id:"publication-and-escape"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#publication-and-escape"}},[e._v("#")]),e._v(" Publication And Escape")]),e._v(" "),a("p",[e._v("Publishing an object means making it available to code outside of its current scope.\nAn object that is published when it should not have been is said to be "),a("em",[e._v("escaped")]),e._v(".\nPublishing can happen in many ways:")]),e._v(" "),a("ul",[a("li",[e._v("store a reference to it in a public static field")]),e._v(" "),a("li",[e._v("returning a reference from a non-private method, in that way any caller can modify\nits contents in most case is dangerous")]),e._v(" "),a("li",[e._v("passing a reference to an alien method")]),e._v(" "),a("li",[e._v("publisinh an inner class instance")])]),e._v(" "),a("div",{staticClass:"custom-block warning"},[a("p",{staticClass:"custom-block-title"},[e._v("WARNING")]),e._v(" "),a("p",[e._v("Publisinh an object may indirectly publish other")])]),e._v(" "),a("div",{staticClass:"custom-block tip"},[a("p",{staticClass:"custom-block-title"},[e._v("TIP")]),e._v(" "),a("p",[e._v("Do not allow the "),a("em",[e._v("this")]),e._v(" reference to escape during construction")])]),e._v(" "),a("h3",{attrs:{id:"thread-confinement"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#thread-confinement"}},[e._v("#")]),e._v(" Thread Confinement")]),e._v(" "),a("p",[e._v("One way to avoid synchronization, when accessing shared data, is to confine data\nto a single thread.")]),e._v(" "),a("p",[e._v("Ad-hoc Confinement:: The responsabiity for mantain thread confinement is of implementation,\nso this strategy is fragile. A special case of this strategy is volatile variable.\nIs's safe to perform read-modify-write operations on shared volatile variable as long as\nyou ensure that the variable is only written by one thread.\nStack Confinement:: It's a special case of thread confinemt in which an object\ncan be access onlu through local variable.\nThreadLocal:: Java class that allow to associate a per-thread value wiht a value-holding\nobject. To maintaint a separete copy of the value TheadLocal provides "),a("code",[e._v("get")]),e._v(" and "),a("code",[e._v("set")]),e._v("\nmethod, so a "),a("code",[e._v("get")]),e._v(" return the most recent value for the current thread.")]),e._v(" "),a("h3",{attrs:{id:"immutability"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#immutability"}},[e._v("#")]),e._v(" Immutability")]),e._v(" "),a("p",[e._v("An immutable object is one which state cannot be changed after construction.")]),e._v(" "),a("div",{staticClass:"custom-block tip"},[a("p",{staticClass:"custom-block-title"},[e._v("TIP")]),e._v(" "),a("p",[e._v("An immutable object is always thread-safe.")])]),e._v(" "),a("p",[e._v("An object is immutable if:")]),e._v(" "),a("ul",[a("li",[e._v("its state cannot be modified after construction;")]),e._v(" "),a("li",[e._v("all fields are final")]),e._v(" "),a("li",[e._v("it's properly constructed (the "),a("em",[e._v("this")]),e._v(" reference does not escape during construction)")])]),e._v(" "),a("div",{staticClass:"custom-block tip"},[a("p",{staticClass:"custom-block-title"},[e._v("TIP")]),e._v(" "),a("p",[e._v("Just as is a good practice to make al the fileds private unless they need\ngreater visibility, it is a good practice to make all field final unless they need to be mutable.")])]),e._v(" "),a("h3",{attrs:{id:"safe-publication"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#safe-publication"}},[e._v("#")]),e._v(" Safe Publication")]),e._v(" "),a("p",[e._v("We need safe publication when we want share an object between thread in a safely\nway. Simply storing an object into a public filed it's not a safe publishing mechanism,\nbecouse another thread can see the object in a inconsistent state or not fully constructed.\nWhen a reference to an object become visible to another thread does not mean that\nthe state of the object is visible to the consuming thread; so synchnization is needed.")]),e._v(" "),a("p",[e._v("But if the object is "),a("em",[e._v("immutable")]),e._v("  we don't need synchronization to publish the object.")]),e._v(" "),a("div",{staticClass:"custom-block tip"},[a("p",{staticClass:"custom-block-title"},[e._v("TIP")]),e._v(" "),a("p",[e._v("Immutable object can be safely published without synchronitation.")])]),e._v(" "),a("p",[e._v("For mutable object safe publication requires synchronization, for both consuming and producer thread.")]),e._v(" "),a("p",[e._v("To publish an object safely, both the reference to the object and the object's state\nmust be visible to other thread at same time.\nA properly constructed object can be safely published by:")]),e._v(" "),a("ul",[a("li",[e._v("initializing an object from a static initializer")]),e._v(" "),a("li",[e._v("storing a reference to it into a volatile or atomic reference")]),e._v(" "),a("li",[e._v("storing a reference to it into a final field of properly constructed object")]),e._v(" "),a("li",[e._v("storing a reference to it into a field guarded by a lock")])]),e._v(" "),a("div",{staticClass:"custom-block tip"},[a("p",{staticClass:"custom-block-title"},[e._v("TIP")]),e._v(" "),a("p",[e._v("If an object is mutable, safe publication ensure only visibility of the published\nstate so synchronization must be used every time a thread accesses the obejct.")])])])}),[],!1,null,null,null);t.default=n.exports}}]);