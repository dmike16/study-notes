## Event Loop

Event loop allow Node.js to perform non-blocking I/O operations,by offloading operations
to the system kernel. When these background complete, the kernel tells to Node.js
so the appropriate callback may be addede to the ''poll'' queque.

```
    +----------------------------+
+-> |          Timers            |
|   +-------------+--------------+
|                 |
|                 v
|   +----------------------------+
|   |       I/O callbacks        |
|   +-------------+--------------+
|                 |
|                 v
|   +----------------------------+
|   |       Idle, prepare        |
|   +-------------+--------------+
|                 |
|                 v                    +----------------------------+
|   +----------------------------+     |      Incoming:             |
|   |           Poll             | <---+       o connections,       |
|   +-------------+--------------+     |       o data, etc.         |
|                 |                    |                            |
|                 v                    |                            |
|   +----------------------------+     +----------------------------+
|   |           Check            |
|   +-------------+--------------+
|                 |
|                 v
|   +----------------------------+
|-- +        Close callbacks     |
    +----------------------------+
```
