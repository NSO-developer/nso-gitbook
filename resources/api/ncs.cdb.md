# Python ncs.cdb Module

CDB high level module.

This module implements a couple of classes for subscribing
to CDB events.

## Classes

### _class_ **OperSubscriber**

CDB Subscriber for oper data.

Use this class when subscribing on operational data. In all other means
the behavior is the same as for Subscriber().

OperSubscriber(app=None, log=None, host='127.0.0.1', port=4569, path=None)

Initialize an OperSubscriber.

Members:

<details>

<summary>daemon</summary>

A boolean value indicating whether this thread is a daemon thread.

This must be set before start() is called, otherwise RuntimeError is
raised. Its initial value is inherited from the creating thread; the
main thread is not a daemon thread and therefore all threads created in
the main thread default to daemon = False.

The entire Python program exits when only daemon threads are left.

</details>

<details>

<summary>getName(...)</summary>

Method:

```python
getName(self)
```

Return a string used for identification purposes only.

This method is deprecated, use the name attribute instead.

</details>

<details>

<summary>ident</summary>

_Readonly property_

Thread identifier of this thread or None if it has not been started.

This is a nonzero integer. See the get_ident() function. Thread
identifiers may be recycled when a thread exits and another thread is
created. The identifier is available even after the thread has exited.

</details>

<details>

<summary>init(...)</summary>

Method:

```python
init(self)
```

Custom initialization.

Override this method to do custom initialization without needing
to override __init__.

</details>

<details>

<summary>isDaemon(...)</summary>

Method:

```python
isDaemon(self)
```

Return whether this thread is a daemon.

This method is deprecated, use the daemon attribute instead.

</details>

<details>

<summary>is_alive(...)</summary>

Method:

```python
is_alive(self)
```

Return whether the thread is alive.

This method returns True just before the run() method starts until just
after the run() method terminates. See also the module function
enumerate().

</details>

<details>

<summary>join(...)</summary>

Method:

```python
join(self, timeout=None)
```

Wait until the thread terminates.

This blocks the calling thread until the thread whose join() method is
called terminates -- either normally or through an unhandled exception
or until the optional timeout occurs.

When the timeout argument is present and not None, it should be a
floating point number specifying a timeout for the operation in seconds
(or fractions thereof). As join() always returns None, you must call
is_alive() after join() to decide whether a timeout happened -- if the
thread is still alive, the join() call timed out.

When the timeout argument is not present or None, the operation will
block until the thread terminates.

A thread can be join()ed many times.

join() raises a RuntimeError if an attempt is made to join the current
thread as that would cause a deadlock. It is also an error to join() a
thread before it has been started and attempts to do so raises the same
exception.

</details>

<details>

<summary>name</summary>

A string used for identification purposes only.

It has no semantics. Multiple threads may be given the same name. The
initial name is set by the constructor.

</details>

<details>

<summary>native_id</summary>

_Readonly property_

Native integral thread ID of this thread, or None if it has not been started.

This is a non-negative integer. See the get_native_id() function.
This represents the Thread ID as reported by the kernel.

</details>

<details>

<summary>register(...)</summary>

Method:

```python
register(self, path, iter_obj=None, iter_flags=1, priority=0, flags=0, subtype=None)
```

Register an iterator object at a specific path.

Setting 'iter_obj' to None will internally use 'self' as the iterator
object which means that Subscriber needs to be sub-classed.

Operational and configuration subscriptions can be done on the
same Subscriber, but in that case the notifications may be
arbitrarily interleaved, including operational notifications
arriving between different configuration notifications for the
same transaction. If this is a problem, use separate
Subscriber instances for operational and configuration
subscriptions.

Arguments:

* path -- path to node (str)
* iter_object -- iterator object (obj, optional)
* iter_flags -- iterator flags (int, optional)
* priority -- priority order for subscribers (int)
* flags -- additional subscriber flags (int)
* subtype -- subscriber type SUB_RUNNING, SUB_RUNNING_TWOPHASE,
            SUB_OPERATIONAL (cdb)

Returns:

* subscription point (int)

Flags (cdb):

* SUB_WANT_ABORT_ON_ABORT

Iterator Flags (ncs):

* ITER_WANT_PREV
* ITER_WANT_ANCESTOR_DELETE
* ITER_WANT_ATTR
* ITER_WANT_CLI_STR
* ITER_WANT_SCHEMA_ORDER
* ITER_WANT_LEAF_FIRST_ORDER
* ITER_WANT_LEAF_LAST_ORDER
* ITER_WANT_REVERSE
* ITER_WANT_P_CONTAINER
* ITER_WANT_CLI_ORDER

</details>

<details>

<summary>run(...)</summary>

Method:

```python
run(self)
```

Main processing loop.

</details>

<details>

<summary>setDaemon(...)</summary>

Method:

```python
setDaemon(self, daemonic)
```

Set whether this thread is a daemon.

This method is deprecated, use the .daemon property instead.

</details>

<details>

<summary>setName(...)</summary>

Method:

```python
setName(self, name)
```

Set the name string for this thread.

This method is deprecated, use the name attribute instead.

</details>

<details>

<summary>start(...)</summary>

Method:

```python
start(self)
```

Start the subscriber.

</details>

<details>

<summary>stop(...)</summary>

Method:

```python
stop(self)
```

Stop the subscriber.

</details>

### _class_ **Subscriber**

CDB Subscriber for config data.

Supports the pattern of collecting changes and then handle the changes in
a separate thread. For each subscription point a handler object must be
registered. The following methods will be called on the handler:

* pre_iterate() (optional)

    Called just before iteration starts, may return a state object
    which will be passed on to the iterate method. If not implemented,
    the state object will be None.

* iterate(kp, op, oldv, newv, state) (mandatory)

    Called for each change in the change set.

* post_iterate(state) (optional)

    Runs in a separate thread once iteration has finished and the
    subscription socket has been synced. Will receive the final state
    object from iterate() as an argument.

* should_iterate() (optional)

    Called to check if the subscriber wants to iterate. If this method
    returns False, neither pre_iterate() nor iterate() will be called.
    Can e.g. be used by HA secondary nodes to skip iteration. If not
    implemented, pre_iterate() and iterate() will always be called.

* should_post_iterate(state) (optional)

    Called to determine whether post_iterate() should be called
    or not. It is recommended to implement this method to prevent
    the subscriber from calling post_iterate() when not needed.
    Should return True if post_iterate() should run, otherwise False.
    If not implemented, post_iterate() will always be called.

Example iterator object:

    class MyIter(object):
        def pre_iterate(self):
            return []

        def iterate(self, kp, op, oldv, newv, state):
            if op is ncs.MOP_VALUE_SET:
                state.append(newv)
            return ncs.ITER_RECURSE

        def post_iterate(self, state):
            for item in state:
                print(item)

        def should_post_iterate(self, state):
            return state != []

The same handler may be registered for multiple subscription points.
In that case, pre_iterate() will only be called once, followed by iterate
calls for all subscription points, and finally a single call to
post_iterate().

Subscriber(app=None, log=None, host='127.0.0.1', port=4569, subtype=1, name='', path=None)

Initialize a Subscriber.

Members:

<details>

<summary>daemon</summary>

A boolean value indicating whether this thread is a daemon thread.

This must be set before start() is called, otherwise RuntimeError is
raised. Its initial value is inherited from the creating thread; the
main thread is not a daemon thread and therefore all threads created in
the main thread default to daemon = False.

The entire Python program exits when only daemon threads are left.

</details>

<details>

<summary>getName(...)</summary>

Method:

```python
getName(self)
```

Return a string used for identification purposes only.

This method is deprecated, use the name attribute instead.

</details>

<details>

<summary>ident</summary>

_Readonly property_

Thread identifier of this thread or None if it has not been started.

This is a nonzero integer. See the get_ident() function. Thread
identifiers may be recycled when a thread exits and another thread is
created. The identifier is available even after the thread has exited.

</details>

<details>

<summary>init(...)</summary>

Method:

```python
init(self)
```

Custom initialization.

Override this method to do custom initialization without needing
to override __init__.

</details>

<details>

<summary>isDaemon(...)</summary>

Method:

```python
isDaemon(self)
```

Return whether this thread is a daemon.

This method is deprecated, use the daemon attribute instead.

</details>

<details>

<summary>is_alive(...)</summary>

Method:

```python
is_alive(self)
```

Return whether the thread is alive.

This method returns True just before the run() method starts until just
after the run() method terminates. See also the module function
enumerate().

</details>

<details>

<summary>join(...)</summary>

Method:

```python
join(self, timeout=None)
```

Wait until the thread terminates.

This blocks the calling thread until the thread whose join() method is
called terminates -- either normally or through an unhandled exception
or until the optional timeout occurs.

When the timeout argument is present and not None, it should be a
floating point number specifying a timeout for the operation in seconds
(or fractions thereof). As join() always returns None, you must call
is_alive() after join() to decide whether a timeout happened -- if the
thread is still alive, the join() call timed out.

When the timeout argument is not present or None, the operation will
block until the thread terminates.

A thread can be join()ed many times.

join() raises a RuntimeError if an attempt is made to join the current
thread as that would cause a deadlock. It is also an error to join() a
thread before it has been started and attempts to do so raises the same
exception.

</details>

<details>

<summary>name</summary>

A string used for identification purposes only.

It has no semantics. Multiple threads may be given the same name. The
initial name is set by the constructor.

</details>

<details>

<summary>native_id</summary>

_Readonly property_

Native integral thread ID of this thread, or None if it has not been started.

This is a non-negative integer. See the get_native_id() function.
This represents the Thread ID as reported by the kernel.

</details>

<details>

<summary>register(...)</summary>

Method:

```python
register(self, path, iter_obj=None, iter_flags=1, priority=0, flags=0, subtype=None)
```

Register an iterator object at a specific path.

Setting 'iter_obj' to None will internally use 'self' as the iterator
object which means that Subscriber needs to be sub-classed.

Operational and configuration subscriptions can be done on the
same Subscriber, but in that case the notifications may be
arbitrarily interleaved, including operational notifications
arriving between different configuration notifications for the
same transaction. If this is a problem, use separate
Subscriber instances for operational and configuration
subscriptions.

Arguments:

* path -- path to node (str)
* iter_object -- iterator object (obj, optional)
* iter_flags -- iterator flags (int, optional)
* priority -- priority order for subscribers (int)
* flags -- additional subscriber flags (int)
* subtype -- subscriber type SUB_RUNNING, SUB_RUNNING_TWOPHASE,
            SUB_OPERATIONAL (cdb)

Returns:

* subscription point (int)

Flags (cdb):

* SUB_WANT_ABORT_ON_ABORT

Iterator Flags (ncs):

* ITER_WANT_PREV
* ITER_WANT_ANCESTOR_DELETE
* ITER_WANT_ATTR
* ITER_WANT_CLI_STR
* ITER_WANT_SCHEMA_ORDER
* ITER_WANT_LEAF_FIRST_ORDER
* ITER_WANT_LEAF_LAST_ORDER
* ITER_WANT_REVERSE
* ITER_WANT_P_CONTAINER
* ITER_WANT_CLI_ORDER

</details>

<details>

<summary>run(...)</summary>

Method:

```python
run(self)
```

Main processing loop.

</details>

<details>

<summary>setDaemon(...)</summary>

Method:

```python
setDaemon(self, daemonic)
```

Set whether this thread is a daemon.

This method is deprecated, use the .daemon property instead.

</details>

<details>

<summary>setName(...)</summary>

Method:

```python
setName(self, name)
```

Set the name string for this thread.

This method is deprecated, use the name attribute instead.

</details>

<details>

<summary>start(...)</summary>

Method:

```python
start(self)
```

Start the subscriber.

</details>

<details>

<summary>stop(...)</summary>

Method:

```python
stop(self)
```

Stop the subscriber.

</details>

### _class_ **TwoPhaseSubscriber**

CDB Subscriber for config data with support for aborting transactions.

Subscriber that is capable of aborting transactions during the
prepare phase of a transaction.

The following methods will be called on the handler in addition to
the methods described in Subscriber:

* prepare(kp, op, oldv, newv, state) (mandatory)

    Called in the transaction prepare phase. If an exception occurs
    during the invocation of prepare the transaction is aborted.

* cleanup(state) (optional)

    Called after a prepare failure if available. Use to cleanup
    resources allocated by prepare.

* abort(kp, op, oldv, newv, state) (mandatory)

    Called if another subscriber aborts the transaction and this
    transaction has been prepared.

Methods are called in the following order:

1. should_iterate -> pre_iterate ( -> cleanup, on exception)
2. should_iterate -> iterate -> post_iterate
3. should_iterate -> abort, if transaction is aborted by other subscriber

TwoPhaseSubscriber(name, app=None, log=None, host='127.0.0.1', port=4569, path=None)

Members:

<details>

<summary>daemon</summary>

A boolean value indicating whether this thread is a daemon thread.

This must be set before start() is called, otherwise RuntimeError is
raised. Its initial value is inherited from the creating thread; the
main thread is not a daemon thread and therefore all threads created in
the main thread default to daemon = False.

The entire Python program exits when only daemon threads are left.

</details>

<details>

<summary>getName(...)</summary>

Method:

```python
getName(self)
```

Return a string used for identification purposes only.

This method is deprecated, use the name attribute instead.

</details>

<details>

<summary>ident</summary>

_Readonly property_

Thread identifier of this thread or None if it has not been started.

This is a nonzero integer. See the get_ident() function. Thread
identifiers may be recycled when a thread exits and another thread is
created. The identifier is available even after the thread has exited.

</details>

<details>

<summary>init(...)</summary>

Method:

```python
init(self)
```

Custom initialization.

Override this method to do custom initialization without needing
to override __init__.

</details>

<details>

<summary>isDaemon(...)</summary>

Method:

```python
isDaemon(self)
```

Return whether this thread is a daemon.

This method is deprecated, use the daemon attribute instead.

</details>

<details>

<summary>is_alive(...)</summary>

Method:

```python
is_alive(self)
```

Return whether the thread is alive.

This method returns True just before the run() method starts until just
after the run() method terminates. See also the module function
enumerate().

</details>

<details>

<summary>join(...)</summary>

Method:

```python
join(self, timeout=None)
```

Wait until the thread terminates.

This blocks the calling thread until the thread whose join() method is
called terminates -- either normally or through an unhandled exception
or until the optional timeout occurs.

When the timeout argument is present and not None, it should be a
floating point number specifying a timeout for the operation in seconds
(or fractions thereof). As join() always returns None, you must call
is_alive() after join() to decide whether a timeout happened -- if the
thread is still alive, the join() call timed out.

When the timeout argument is not present or None, the operation will
block until the thread terminates.

A thread can be join()ed many times.

join() raises a RuntimeError if an attempt is made to join the current
thread as that would cause a deadlock. It is also an error to join() a
thread before it has been started and attempts to do so raises the same
exception.

</details>

<details>

<summary>name</summary>

A string used for identification purposes only.

It has no semantics. Multiple threads may be given the same name. The
initial name is set by the constructor.

</details>

<details>

<summary>native_id</summary>

_Readonly property_

Native integral thread ID of this thread, or None if it has not been started.

This is a non-negative integer. See the get_native_id() function.
This represents the Thread ID as reported by the kernel.

</details>

<details>

<summary>register(...)</summary>

Method:

```python
register(self, path, iter_obj=None, iter_flags=1, priority=0, flags=0, subtype=None)
```

Register an iterator object at a specific path.

Setting 'iter_obj' to None will internally use 'self' as the iterator
object which means that TwoPhaseSubscriber needs to be sub-classed.

Operational and configuration subscriptions can be done on the
same TwoPhaseSubscriber, but in that case the notifications may be
arbitrarily interleaved, including operational notifications
arriving between different configuration notifications for the
same transaction. If this is a problem, use separate
TwoPhaseSubscriber instances for operational and configuration
subscriptions.

For arguments and flags, see Subscriber.register()

</details>

<details>

<summary>run(...)</summary>

Method:

```python
run(self)
```

Main processing loop.

</details>

<details>

<summary>setDaemon(...)</summary>

Method:

```python
setDaemon(self, daemonic)
```

Set whether this thread is a daemon.

This method is deprecated, use the .daemon property instead.

</details>

<details>

<summary>setName(...)</summary>

Method:

```python
setName(self, name)
```

Set the name string for this thread.

This method is deprecated, use the name attribute instead.

</details>

<details>

<summary>start(...)</summary>

Method:

```python
start(self)
```

Start the subscriber.

</details>

<details>

<summary>stop(...)</summary>

Method:

```python
stop(self)
```

Stop the subscriber.

</details>

## Predefined Values

```python

A_CDB = 1
DATA_SOCKET = 2
DONE_OPERATIONAL = 4
DONE_PRIORITY = 1
DONE_SOCKET = 2
DONE_TRANSACTION = 3
FLAG_INIT = 1
FLAG_UPGRADE = 2
GET_MODS_CLI_NO_BACKQUOTES = 8
GET_MODS_INCLUDE_LISTS = 1
GET_MODS_INCLUDE_MOVES = 16
GET_MODS_REVERSE = 2
GET_MODS_SUPPRESS_DEFAULTS = 4
GET_MODS_WANT_ANCESTOR_DELETE = 32
LOCK_PARTIAL = 8
LOCK_REQUEST = 4
LOCK_SESSION = 2
LOCK_WAIT = 1
OPERATIONAL = 3
O_CDB = 2
PRE_COMMIT_RUNNING = 4
READ_COMMITTED = 16
READ_SOCKET = 0
RUNNING = 1
STARTUP = 2
SUBSCRIPTION_SOCKET = 1
SUB_ABORT = 3
SUB_COMMIT = 2
SUB_FLAG_HA_IS_SECONDARY = 16
SUB_FLAG_HA_IS_SLAVE = 16
SUB_FLAG_HA_SYNC = 8
SUB_FLAG_IS_LAST = 1
SUB_FLAG_REVERT = 4
SUB_FLAG_TRIGGER = 2
SUB_OPER = 4
SUB_OPERATIONAL = 3
SUB_PREPARE = 1
SUB_RUNNING = 1
SUB_RUNNING_TWOPHASE = 2
SUB_WANT_ABORT_ON_ABORT = 1
S_CDB = 3
```
