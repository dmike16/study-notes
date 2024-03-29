## Composing Object

### Thread Safe Class

The design process of a thread safe class should include these three basic elements:

* identify the variable that form the object's state
* identify the invariants that constraint the state variables
* Estabilish a policy for managing concurrent access to object's state, that policy
defines how the object can access it's state without vioating its invariant or post-conditions.

Make a class thread safe means ensuring that its invariant remain valid under concurrent
access; this require reasoning about object and variable state space. Smaller this
space is and simpler is to reason about.

Many classes have invariant and operations can have post-conditions, those create
additional  synchronization  or encapsulation requirements. If certain states are
invalid, then the underlying variable must be encapsulated. If an operation has
invalid state transition it must be made atomic. A class could have a multivariable
invariant too tha create atomicity requeriment.

### Instance Confinement

If an object is not thread-safe there are many techniques to let it used in a
multihreaded program. To simplify the process of make an object thread-safe we
can use encapsulation. When an object is encapsulated is easier to analyze the
it.

::: tip
Encapsulating data within an object confies access to the data to the object's
method, making easier to ensure that data is accessed with the right lock.
:::

Example of an object not thread-safe that is confined in another and guarded
by its intrinsic lock.

``` java
@ThreadSafe
public class PersonSet{
  @GuradedBy("this") private Set<Person> mySet = new HashSet<Person>();

   public synchronized void addPerson(Person p) {
        mySet.add(p);
   }
   public synchronized boolean containsPerson(Person p) {
        return mySet.contains(p);
   }
}
```

In the above example there are not assumptions about the thread-safe of the
class _Person_.

### Java Monitor

The principle of instance confinement leads to the Java Monitor pattern. For
example:

``` java
public class PrivateLock {
    private final Object myLock = new Object();

    @GuardedBy("myLock") Widget widget;
    void someMethod() {
        synchronized(myLock) {
    }
}
```
