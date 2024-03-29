## Observable

Observable are lazy *Push* collections of multiple values. They emit some value, but are lazy to see those
values we need to subscribe to them. It's the only way to call an Observable.

### Push vs Pull

In a pull system the consumer determined when it receives the data from the producer. 
In a push system the producer deciedes whene delivers dato to the consumer.

| | Producer | Consumer|
|-| -------  | ------- |
| Pull | Passive | Active |
| Push | Active  | Passive |

### Observable as generalizazions of function

Observable ara not like Promise and may act as EventEmitter but

::: tip
Observables are like functions but with zero argumnets, but generalize to 
allow multiple values.
:::

Observables like function are lazy, if you don't call a function the body is not excuded. 

::: tip
Subscribe to observables is like calling a function. observables can deliver values *aync* 
or *sync*
:::

The difference with functions is that observables can return multiple values over the time.

### Anatomy of an Observable

Principal concepts of observables are:

* *creating* observables
* *subscrubing* to observables
* *executing* observables
* *disposing* observables

#### Creating Observables
