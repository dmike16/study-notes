## Backpressuring in Stream

`Backpressure` is a problem that can arise during data handling; when the recieving
end of the transfer has complex operations, or is slower, then the data from the
incoming resource is accomulated.  This can :

* slowing down all current process
* overwork garbage collector
* exhaust memory

To solve this problem the system must ensure a smooth flow of data from one source to another.
In nodejs the mechanism to transfer data is called `Stream` that internally implements
`backpressure`. The backpressure optimization start when the `Writables`'s `write`
function return ‘false’, this can happen when the data buffer has exceeded the
`highWaterMark` or the write queque is busy.
When `false` is returned the backpressure mechanism kicks in, and the `Readable`
stream pause from sending data and wait untill the consumer is ready. One the buffer
data is emptied, a `drain` event will be emitted and resume the data flow.

Example of `pipe` method that implements backpressure

```
                                                     +===================+
                         x-->  Piping functions   +-->   src.pipe(dest)  |
                         x     are set up during     |===================|
                         x     the .pipe method.     |  Event callbacks  |
+===============+        x                           |-------------------|
|   Your Data   |        x     They exist outside    | .on('close', cb)  |
+=======+=======+        x     the data flow, but    | .on('data', cb)   |
        |                x     importantly attach    | .on('drain', cb)  |
        |                x     events, and their     | .on('unpipe', cb) |
+--------v----------+    x     respective callbacks. | .on('error', cb)  |
|  Readable Stream  +----+                           | .on('finish', cb) |
+-^-------^-------^-+    |                           | .on('end', cb)    |
^       |       ^      |                             +-------------------+
|       |       |      |
|       ^       |      |
^       ^       ^      |    +-------------------+         +=================+
^       |       ^      +---->  Writable Stream  +--------->  .write(chunk)  |
|       |       |           +-------------------+         +=======+=========+
|       |       |                                                 |
|       ^       |                              +------------------v---------+
^       |       +-> if (!chunk)                |    Is this chunk too big?  |
^       |       |     emit .end();             |    Is the queue busy?      |
|       |       +-> else                       +-------+----------------+---+
|       ^       |     emit .write();                   |                |
|       ^       ^                                   +--v---+        +---v---+
|       |       ^-----------------------------------<  No  |        |  Yes  |
^       |                                           +------+        +---v---+
^       |                                                               |
|       ^               emit .pause();          +=================+     |
|       ^---------------^-----------------------+  return false;  <-----+---+
|                                               +=================+         |
|                                                                           |
^            when queue is empty     +============+                         |
^------------^-----------------------<  Buffering |                         |
             |                       |============|                         |
             +> emit .drain();       |  ^Buffer^  |                         |
             +> emit .resume();      +------------+                         |
                                     |  ^Buffer^  |                         |
                                     +------------+   add chunk to queue    |
                                     |            <---^---------------------<
                                     +============+

```

When creating custom `Stream` we shuold respect backpressure and

. Never call `push` if is not asked
. Stop reading from stream source if `push` return `false`
. Never call `write` after it return false, but wait for drain.
