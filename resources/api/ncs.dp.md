# Python ncs.dp Module

Callback module for connecting data providers to ConfD/NCS.

## Functions

### return_worker_socket

```python
return_worker_socket(state, key)
```

Return worker socket associated with a worker thread from Daemon/state.

Return worker socket to pool.

### take_worker_socket

```python
take_worker_socket(state, name, key=None)
```

Take worker socket associated with a worker thread from Daemon/state.

Take worker socket from pool, must be returned with
dp.return_worker_socket after use.


## Classes

### _class_ **Action**

Action callback.

This class makes it easy to create and register action callbacks by
sub-classing it and implementing cb_action in the derived class.

Action(daemon, actionpoint, log=None, init_args=None)

Initialize this object.

The 'daemon' argument should be a Daemon instance. 'actionpoint'
is the name of the tailf:actionpoint to manage. 'log' can be any
log object, and if not set the Daemon logger will be used.
'init_args' may be any object that will be passed into init()
when this object is constructed. Lastly, the low-level function
dp.register_action_cbs() will be called.

When using this class together with ncs.application.Application
there is no need to manually initialize this object as it is
done by the Application.register_action() method.

Arguments:

* daemon -- Daemon instance (dp.Daemon)
* actionpoint -- actionpoint name (str)
* log -- logging object (optional)
* init_args -- additional arguments (optional)

Members:

<details>

<summary>action(...)</summary>

Static method:

```python
action(fn)
```

Decorator for the cb_action callback.

Only use this decorator for actions of tailf:action type.

Using this decorator alters the signature of the cb_action callback
and passes in maagic.Node objects for input and output action data.

Example of a decorated cb_action:

    @Action.action
    def cb_action(self, uinfo, name, kp, input, output, trans):
        pass

Callback arguments:

* uinfo -- a UserInfo object
* name -- the tailf:action name (string)
* kp -- the keypath of the action (HKeypathRef)
* input -- input node (maagic.Node)
* output -- output node (maagic.Node)
* trans -- read only transaction, same as action transaction if
           executed with an action context (maapi.Transaction)

</details>

<details>

<summary>cb_init(...)</summary>

Method:

```python
cb_init(self, uinfo)
```

The cb_init callback must always be implemented.

This default implementation will associate a new worker socket
with this callback.

</details>

<details>

<summary>init(...)</summary>

Method:

```python
init(self, init_args)
```

Custom initialization.

When registering an action using ncs.application.Application this
method will be called with the 'init_args' passed into the
register_action() function.

</details>

<details>

<summary>rpc(...)</summary>

Static method:

```python
rpc(fn)
```

Decorator for the cb_action callback.

Only use this decorator for rpc:s.

Using this decorator alters the signature of the cb_action callback
and passes in maagic.Node objects for input and output action data.

Example of a decorated cb_action:

    @Action.rpc
    def cb_action(self, uinfo, name, input, output):
        pass

Callback arguments:

* uinfo -- a UserInfo object
* name -- the rpc name (string)
* input -- input node (maagic.Node)
* output -- output node (maagic.Node)

</details>

<details>

<summary>start(...)</summary>

Method:

```python
start(self)
```

Custom actionpoint start triggered when Python VM starts up.

</details>

<details>

<summary>stop(...)</summary>

Method:

```python
stop(self)
```

Custom actionpoint stop triggered when Python VM shuts down.

</details>

### _class_ **Daemon**

Manage a data provider connection towards ConfD/NCS.

Daemon(name, log=None, ip='127.0.0.1', port=4569, path=None, state_mgr=None)

Initialize a Daemon object.

The 'name' argument should be unique. It will show up in the
CLI and in error messages. All other arguments are optional.
Argument 'log' can be any log object, and if not set the standard
logging mechanism will be used. Set 'ip' and 'port' to
where your Confd/NCS server is. 'path' is a filename to a unix
domain socket to be used in place of 'ip' and 'port'. If 'path'
is provided, 'ip' and 'port' arguments are ignored.

Daemon supports automatic restarting in case of error if a
state manager is provided using the state_mgr parameter.

Members:

<details>

<summary>INIT_RETRY_INTERVAL_S</summary>

```python
INIT_RETRY_INTERVAL_S = 1
```


</details>

<details>

<summary>ctx(...)</summary>

Method:

```python
ctx(self)
```

Return the daemon context.

</details>

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

<summary>finish(...)</summary>

Method:

```python
finish(self)
```

Stop the daemon thread.

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

<summary>ip(...)</summary>

Method:

```python
ip(self)
```

Return the ip address.

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

<summary>load_schemas(...)</summary>

Method:

```python
load_schemas(self)
```

Load schema information into the process memory.

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

<summary>path(...)</summary>

Method:

```python
path(self)
```

Return the unix domain socket path.

</details>

<details>

<summary>port(...)</summary>

Method:

```python
port(self)
```

Return the port.

</details>

<details>

<summary>register_trans_cb(...)</summary>

Method:

```python
register_trans_cb(self, trans_cb_cls=<class 'ncs.dp.TransactionCallback'>)
```

Register a transaction callback class.

It's not necessary to call this method. Only do that if a custom
transaction callback will be used.

</details>

<details>

<summary>register_trans_validate_cb(...)</summary>

Method:

```python
register_trans_validate_cb(self, trans_validate_cb_cls=<class 'ncs.dp.TransValidateCallback'>)
```

Register a transaction validation callback class.

It's not necessary to call this method. Only do that if a custom
transaction callback will be used.

</details>

<details>

<summary>run(...)</summary>

Method:

```python
run(self)
```

Daemon thread processing loop.

Don't call this method explicitly. It handles reading of control
and worker sockets and notifying ConfD/NCS that it should continue
processing by calling the low-level function dp.fd_ready().
If the connection towards ConfD/NCS is broken or if finish() is
explicitly called, this function (and the thread) will end.

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

Start daemon work thread.

After registering any callbacks (action, services and such), call
this function to start processing. The low-level function
dp.register_done() will be called before the thread is started.

</details>

<details>

<summary>wsock</summary>

_Readonly property_


</details>

### _class_ **StateManager**

Base class for state managers used with Daemon

StateManager(log)

Members:

<details>

<summary>setup(...)</summary>

Method:

```python
setup(self, state, previous_state)
```

Not Implemented.

</details>

<details>

<summary>teardown(...)</summary>

Method:

```python
teardown(self, state, finished)
```

Not Implemented.

</details>

### _class_ **TransValidateCallback**

Default transaction validation callback implementation class.

When registering validation points in ConfD/NCS a transaction
validation callback handler must be provided. This class is a
generic implementation of such a handler. It implements the
required callbacks 'cb_init' and 'cb_stop'.

TransValidateCallback(state)

Initialize a TransValidateCallback object.

The argument 'state' is the dict representation of a daemon.

Members:

<details>

<summary>cb_init(...)</summary>

Method:

```python
cb_init(self, tctx)
```

The cb_init callback must always be implemented.

It is required to prepare for future validation
callbacks. This default implementation allocates a worker
thread and socket pair and associates it with the transaction.

</details>

<details>

<summary>cb_stop(...)</summary>

Method:

```python
cb_stop(self, tctx)
```

The cb_stop callback must always be implemented.

Clean up resources previously allocated in the cb_init
callback. This default implementation returnes the worker
thread and socket pair to the pool of workers.

</details>

### _class_ **TransactionCallback**

Default transaction callback implementation class.

When connecting data providers to ConfD/NCS a transaction callback
handler must be provided. This class is a generic implementation of
such a handler. It implements the only required callback 'cb_init'.

TransactionCallback(state)

Initialize a TransactionCallback object.

The argument 'wsock' is the connected worker socket and 'log'
is a log object.

Members:

<details>

<summary>cb_finish(...)</summary>

Method:

```python
cb_finish(self, tctx)
```

The cb_finish callback of TransactionCallback.

This implementation returns worker socket associated with a
worker thread from Daemon/state.

</details>

<details>

<summary>cb_init(...)</summary>

Method:

```python
cb_init(self, tctx)
```

The cb_init callback must always be implemented.

It is required to prepare for future read/write operations towards
the data source. This default implementation associates a worker
socket with a transaction.

</details>

### _class_ **ValidationError**

Exception raised to indicate a failed validation
    

ValidationError(message)

Members:

<details>

<summary>add_note(...)</summary>

Method:

Exception.add_note(note) --
add a note to the exception

</details>

<details>

<summary>args</summary>


</details>

<details>

<summary>with_traceback(...)</summary>

Method:

Exception.with_traceback(tb) --
set self.__traceback__ to tb and return self.

</details>

### _class_ **ValidationPoint**

Validation Point callback.

This class makes it easy to create and register validation point
callbacks by subclassing it and implementing cb_validate with the
@validate or @validate_with_trans decorator.

ValidationPoint(daemon, validationpoint, log=None, init_args=None)

Members:

<details>

<summary>init(...)</summary>

Method:

```python
init(self, init_args)
```

Custom initialization.

When registering a validation point using
ncs.application.Application this method will be called with
the 'init_args' passed into the register_validation()
function.

</details>

<details>

<summary>start(...)</summary>

Method:

```python
start(self)
```

Start ValidationPoint

</details>

<details>

<summary>stop(...)</summary>

Method:

```python
stop(self)
```

Stop ValidationPoint

</details>

<details>

<summary>validate(...)</summary>

Static method:

```python
validate(fn)
```

Decorator for the cb_validate callback.

Using this decorator alters the signature of the cb_validate
callback and passes in the validationpoint as the last
argument.

In addition it logs unhandled exceptions, handles
ValidationError exception setting the transaction error and
returns _tm.CONFD_ERR.

Example of a decorated cb_validate:

    @ValidationPoint.validate
    def cb_validate(self, tctx, keypath, value, validationpoint):
        pass

Callback arguments:

* tctx - transaction context (TransCtxRef)
* kp -- path to the node being validated (HKeypathRef)
* value -- new value of keypath (Value)
* validationpoint - name of the validation point (str)

</details>

<details>

<summary>validate_with_trans(...)</summary>

Static method:

```python
validate_with_trans(fn)
```

Decorator for the cb_validate callback.

Using this decorator alters the signature of the cb_validate
callback and passes in root node attached to the transaction
being validated and the validationpoint as the last argument.

In addition it logs unhandled exceptions, handles
ValidationError exception setting the transaction error and
returns _tm.CONFD_ERR.

Example of a decorated cb_validate:

    @ValidationPoint.validate_with_trans
    def cb_validate(self, tctx, root, kp, value, validationpoint):
        pass

Callback arguments:

* tctx - transaction context (TransCtxRef)
* root -- root node (maagic.Root)
* kp -- path to the node being validated (HKeypathRef)
* value -- new value of keypath (Value)
* validationpoint - name of the validation point (str)

</details>

