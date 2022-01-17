## Architecture Overview

Rxjs is library to manage asynchronous and event-based programs using sequence of _Observable_.
There is one core type _Observable_ plus operators to allow asynchronous event of collections.

The essensial concepts are:

* _Observable_: invokable collections of futrure values or events.
* _Observer_: collections of callback that liston to value delivered by Observable.
* _Subscription_:  execution of an Observable.
* _Operators_: pure functions to enable functional programming style to handle collections of Observables.
* _Subject_: like an EventEmitter and the only way to multicast a value to multiple Observers.
* _Schedulers_: dispatcher to controll concurrency
