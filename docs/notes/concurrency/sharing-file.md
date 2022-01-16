## Sharing File

In concurrent programs is necassary to correctly mange access to shared object.
The concept that we have to deal with are:

. Visibility
. Publication And Escape
. Thread Confinement
. Immutability
. Safe Publication

### Visibility

The visibility in  a concurrent program is not so obvious. So to ensure it must use synchronization.

IMPORTANT: In the absence of synchronization the order in which operation apear
to execute it's random. Any attempts to reason about the order in which memory
acitions "must" happen will almost be incorrect.

When shared variable are not synchronized  a thread can see it in a _stale_ values ,
that in some situation can cause serious safty or liveness failures. When a thread
reads a variable without synchr it may see a _stale_ value, but at least see
somthing place there by some other thread; this is guarantee by the _out-of-thin-air_ safty.
Out-of-thin-air applies to all variables, with one exception: 64-bit variable(_double_,_long_),
because the JVM treats 64-bit variable as two separate 32-bit operation. So it's not safe to share
_long_ or _double_ unless declared _volatile_ or guraded by a lock.

Lock can be used to guarantee that one thread sees the effect of another in a predicatable
manner: where thread A executes a _synchr_ block and after a thread B enters a
_synchr_ block guarder by the same lock, the values visible to A prior to releasing
the lock are visible to B upon acquiring the same lock.

::: tip
Lock is not just about mutual exclusion, it also about memory visibility.
:::

Java provides a weaker form of synchronization, _volatile variable_. When a field
it's defined _volatile_ the compiler and runtime are put on notice that this var
is shared and that operations on it should not be reordered with other memory operation.
So a read of volatile varible always return the most recent value write by another thread.
When a thread A writes to a volatile variable and after a thread B reads that same variable,
the values of all variables that were visible to A prior to writing to the volatile
variable become visible to B after reading the volatile variable.

::: tip
Use _volatile_ variable only when they simplify implementing and verifying the synchr policy.
:::

Use them when:

*  write to the variable  do not depend on its current value, or you are sure that
only a single thread update the value;
* the variable does not participate in invariants with other state variables;
* locking is not required

::: warning
Locking can guarantee both visibility and atomicity; volatile can only guarantee visibility.
:::

### Publication And Escape

Publishing an object means making it available to code outside of its current scope.
An object that is published when it should not have been is said to be _escaped_.
Publishing can happen in many ways:

* store a reference to it in a public static field
* returning a reference from a non-private method, in that way any caller can modify
its contents in most case is dangerous
* passing a reference to an alien method
* publisinh an inner class instance

::: warning
Publisinh an object may indirectly publish other
:::

::: tip
Do not allow the _this_ reference to escape during construction
:::

### Thread Confinement

One way to avoid synchronization, when accessing shared data, is to confine data
to a single thread.

Ad-hoc Confinement:: The responsabiity for mantain thread confinement is of implementation,
so this strategy is fragile. A special case of this strategy is volatile variable.
Is's safe to perform read-modify-write operations on shared volatile variable as long as
you ensure that the variable is only written by one thread.
Stack Confinement:: It's a special case of thread confinemt in which an object
can be access onlu through local variable.
ThreadLocal:: Java class that allow to associate a per-thread value wiht a value-holding
object. To maintaint a separete copy of the value TheadLocal provides `get` and `set`
method, so a `get` return the most recent value for the current thread.

### Immutability

An immutable object is one which state cannot be changed after construction.

::: tip
An immutable object is always thread-safe.
:::

An object is immutable if:

* its state cannot be modified after construction;
* all fields are final
* it's properly constructed (the _this_ reference does not escape during construction)

::: tip
Just as is a good practice to make al the fileds private unless they need
greater visibility, it is a good practice to make all field final unless they need to be mutable.
:::

### Safe Publication

We need safe publication when we want share an object between thread in a safely
way. Simply storing an object into a public filed it's not a safe publishing mechanism,
becouse another thread can see the object in a inconsistent state or not fully constructed.
When a reference to an object become visible to another thread does not mean that
the state of the object is visible to the consuming thread; so synchnization is needed.

But if the object is *immutable*  we don't need synchronization to publish the object.

::: tip
Immutable object can be safely published without synchronitation.
:::

For mutable object safe publication requires synchronization, for both consuming and producer thread.

To publish an object safely, both the reference to the object and the object's state
must be visible to other thread at same time.
A properly constructed object can be safely published by:

* initializing an object from a static initializer
* storing a reference to it into a volatile or atomic reference
* storing a reference to it into a final field of properly constructed object
* storing a reference to it into a field guarded by a lock

::: tip
If an object is mutable, safe publication ensure only visibility of the published
state so synchronization must be used every time a thread accesses the obejct.
:::
