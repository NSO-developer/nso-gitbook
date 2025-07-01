# Python ncs.application Module

Module for building NCS applications.

## Functions

<details>

<summary>get_device</summary>

```python
get_device(node, name)
```

Get a device node by name.

Returns a maagic node representing a device.

Arguments:

* node -- any maagic node with a Transaction backend or a Transaction object
* name -- the device name (string)

Returns:

* device node (maagic.Node)

</details>

<details>

<summary>get_ned_id</summary>

```python
get_ned_id(device)
```

Get the ned-id of a device.

Returns the ned-id as a string or None if not found.

Arguments:

* device -- a maagic node representing the device (maagic.Node)

Returns:

* ned_id (str)

</details>


## Classes

### _class_ **Application**

Class for easy implementation of an NCS application.

This class is intended to be sub-classed and used as a 'component class'
inside an NCS package. It will be instantiated by NCS when the package
is loaded. The setup() method should to be implemented to register
service- and action callbacks. When NCS stops or an error occurs,
teardown() will be called. A 'log' attribute is available for logging.

Example application:

    from ncs.application import Application, Service, NanoService
    from ncs.dp import Action, ValidationPoint

    class FooService(Service):
        @Service.create
        def cb_create(self, tctx, root, service, proplist):
            # service code here

    class FooNanoService(NanoService):
        @NanoService.create
        def cb_nano_create(self, tctx, root, service, plan, component,
                           state, proplist, compproplist):
            # service code here

    class FooAction(Action):
        @Action.action
        def cb_action(self, uinfo, name, kp, input, output):
            # action code here

    class FooValidation(ValidationPoint):
        @ValidationPoint.validate
        def cb_validate(self, tctx, keypath, value, validationpoint):
            # validation code here

    class MyApp(Application):
        def setup(self):
            self.log.debug('MyApp start')
            self.register_service('myservice-1', FooService)
            self.register_service('myservice-2', FooService, 'init_arg')
            self.register_nano_service('nano-1', 'myserv:router',
                                       'myserv:ntp-initialized',
                                       FooNanoService)
            self.register_action('action-1', FooAction)
            self.register_validation('validation-1', FooValidation)

        def teardown(self):
            self.log.debug('MyApp finish')

Application(*args, **kwds)

Initialize an Application object.

Don't try to initialize this object. I will be done by NCS.

Members:

<details>

<summary>APP_WORKER_STOP_TIMEOUT_S</summary>

int([x]) -> integer
int(x, base=10) -> integer

Convert a number or string to an integer, or return 0 if no arguments
are given.  If x is a number, return x.__int__().  For floating point
numbers, this truncates towards zero.

If x is not a number or if base is given, then x must be a string,
bytes, or bytearray instance representing an integer literal in the
given base.  The literal can be preceded by '+' or '-' and be surrounded
by whitespace.  The base defaults to 10.  Valid bases are 0 and 2-36.
Base 0 means to interpret the base from the string as an integer literal.
>>> int('0b100', base=0)
4

</details>

<details>

<summary>add_running_thread(...)</summary>

Method:

```python
add_running_thread(self, class_name)
```


</details>

<details>

<summary>create_daemon(...)</summary>

Method:

```python
create_daemon(self, name=None)
```

Name the underlying dp.Daemon object (deprecated)

</details>

<details>

<summary>critical(...)</summary>

Method:

```python
critical(self, line)
```


</details>

<details>

<summary>debug(...)</summary>

Method:

```python
debug(self, line)
```


</details>

<details>

<summary>del_running_thread(...)</summary>

Method:

```python
del_running_thread(self, class_name)
```


</details>

<details>

<summary>error(...)</summary>

Method:

```python
error(self, line)
```


</details>

<details>

<summary>exception(...)</summary>

Method:

```python
exception(self, line)
```


</details>

<details>

<summary>info(...)</summary>

Method:

```python
info(self, line)
```


</details>

<details>

<summary>reg_finish(...)</summary>

Method:

```python
reg_finish(self, cbfun)
```


</details>

<details>

<summary>register_action(...)</summary>

Method:

```python
register_action(self, actionpoint, action_cls, init_args=None)
```

Register an action callback class.

Call this method to register 'action_cls' as the action callback
class for action point 'actionpoint'. 'action_cls' should be a
subclass of dp.Action. If the optional argument 'init_args' is
supplied it will be passed in to the init() method of the subclass.

Arguments:

* actionpoint -- actionpoint (str)
* action_cls -- action callback class
* init_args -- initial arguments (optional)

</details>

<details>

<summary>register_fun(...)</summary>

Method:

```python
register_fun(self, start_fun, stop_fun)
```

Register custom start and stop functions.

Call this method to register a start and stop function that
will be called with a dp.Daemon.State during application
setup.

Example start and stop functions:

    def my_start_fun(state):
        state.log.info('my_start_fun START')
        return (state, time.time())

    def my_stop_fun(fun_data):
        (state, start_time) = fun_data
        state.log.info('my_start_fun started {}'.format(start_time))
        state.log.info('my_start_fun STOP')

Arguments:

* start_fun -- start function (fun)
* stop_fun -- stop function (fun)

</details>

<details>

<summary>register_nano_service(...)</summary>

Method:

```python
register_nano_service(self, servicepoint, componenttype, state, nano_service_cls, init_args=None)
```

Register a nano service callback class.

Call this method to register 'nano_service_cls' as the nano service
callback class for service point 'servicepoint'.
'nano service_cls' should be a subclass of NanoService.
If the optional argument 'init_args' is supplied
it will be passed in to the init() method of the subclass.

Arguments:

* servicepoint -- servicepoint (str)
* componenttype -- nano plan component(str)
* state -- nano plan state (str)
* service_cls -- service callback class
* init_args -- initial arguments (optional)

</details>

<details>

<summary>register_service(...)</summary>

Method:

```python
register_service(self, servicepoint, service_cls, init_args=None)
```

Register a service callback class.

Call this method to register 'service_cls' as the service callback
class for service point 'servicepoint'. 'service_cls' should be a
subclass of Service. If the optional argument 'init_args' is supplied
it will be passed in to the init() method of the subclass.

Arguments:

* servicepoint -- servicepoint (str)
* service_cls -- service callback class
* init_args -- initial arguments (optional)

</details>

<details>

<summary>register_trans_cb(...)</summary>

Method:

```python
register_trans_cb(self, trans_cb_cls)
```

Register a transaction callback class.

If a custom transaction callback implementation is needed, call this
method with the transaction callback class as the 'trans_cb_cls'
argument.

Arguments:

* trans_cb_cls -- transaction callback class

</details>

<details>

<summary>register_validation(...)</summary>

Method:

```python
register_validation(self, validationpoint, validation_cls, init_args=None)
```

Register a validation callback class.

Call this method to register 'validation_cls' as the
validation callback class for validation point
'validationpoint'. 'validation_cls' should be a subclass of
ValidationPoint. If the optional argument 'init_args' is
supplied it will be passed in to the init() method of the
subclass.

Arguments:

* validationpoint -- validationpoint (str)
* validation_cls -- validation callback class
* init_args -- initial arguments (optional)

</details>

<details>

<summary>set_log_level(...)</summary>

Method:

```python
set_log_level(self, log_level)
```

Set log level for all workers (only relevant for
_ProcessAppWorker)

Arguments:

* log_level -- logging level, using logging.Logger (int)

</details>

<details>

<summary>set_self_assign_warning(...)</summary>

Method:

```python
set_self_assign_warning(self, warning)
```

Set self assign warning for all workers.

Arguments:

* warning -- warning type (alarm, log, off). (string)

</details>

<details>

<summary>setup(...)</summary>

Method:

```python
setup(self)
```

Application setup method.

Override this method to register actions and services. Any other
initialization could also be done here. If the call to this method
throws an exception the teardown method will be immediately called
and the application shutdown.

</details>

<details>

<summary>teardown(...)</summary>

Method:

```python
teardown(self)
```

Application teardown method.

Override this method to clean up custom resources allocated in
setup().

</details>

<details>

<summary>unreg_finish(...)</summary>

Method:

```python
unreg_finish(self, cbfun)
```


</details>

<details>

<summary>warning(...)</summary>

Method:

```python
warning(self, line)
```


</details>

### _class_ **NanoService**

NanoService callback.

This class makes it easy to create and register nano service callbacks by
subclassing it and implementing some of the nano service callbacks.

NanoService(daemon, servicepoint, componenttype, state, log=None, init_args=None)

Initialize this object.

The 'daemon' argument should be a Daemon instance. 'servicepoint'
is the name of the tailf:servicepoint to manage. Argument 'log' can
be any log object, and if not set the Daemon log will be used.
'init_args' may be any object that will be passed into init() when
this object is constructed. Lastly, the low-level function
dp.register_nano_service_cb() will be called.

When creating a service callback using Application.register_nano_service
there is no need to manually initialize this object as it is then
done automatically.

Members:

<details>

<summary>create(...)</summary>

Static method:

```python
create(fn)
```

Decorator for the cb_nano_create callback.

Using this decorator alters the signature of the cb_create callback
and passes in maagic.Node objects for root and service.
The maagic.Node objects received in 'root' and 'service' are backed
by a MAAPI connection with the FASTMAP handle attached. To update
'proplist' simply return it from this function.

Example of a decorated cb_create:

    @NanoService.create
    def cb_nano_create(self, tctx, root,
                       service, plan, component, state,
                       proplist, compproplist):
        pass

Callback arguments:

* tctx - transaction context (TransCtxRef)
* root -- root node (maagic.Node)
* service -- service node (maagic.Node)
* plan -- current plan node (maagic.Node)
* component -- plan component active for this invokation
* state -- plan component state active for this invokation
* proplist - properties (list(tuple(str, str)))
* compproplist - component properties (list(tuple(str, str)))

</details>

<details>

<summary>delete(...)</summary>

Static method:

```python
delete(fn)
```

Decorator for the cb_nano_delete callback.

Using this decorator alters the signature of the cb_delete callback
and passes in maagic.Node objects for root and service.
The maagic.Node objects received in 'root' and 'service' are backed
by a MAAPI connection with the FASTMAP handle attached. To update
'proplist' simply return it from this function.

Example of a decorated cb_create:

    @NanoService.delete
    def cb_nano_delete(self, tctx, root,
                       service, plan, component, state,
                       proplist, compproplist):
        pass

Callback arguments:

* tctx - transaction context (TransCtxRef)
* root -- root node (maagic.Node)
* service -- service node (maagic.Node)
* plan -- current plan node (maagic.Node)
* component -- plan component active for this invokation
* state -- plan component state active for this invokation
* proplist - properties (list(tuple(str, str)))
* compproplist - component properties (list(tuple(str, str)))

</details>

<details>

<summary>init(...)</summary>

Method:

```python
init(self, init_args)
```

Custom initialization.

When registering a service using Application this method will be
called with the 'init_args' passed into the register_service()
function.

</details>

<details>

<summary>maapi</summary>


</details>

<details>

<summary>start(...)</summary>

Method:

```python
start(self)
```

Start NanoService

</details>

<details>

<summary>stop(...)</summary>

Method:

```python
stop(self)
```

Stop NanoService

</details>

### _class_ **PlanComponent**

Service plan component.

The usage of this class is in conjunction with a service that
uses a reactive FASTMAP pattern.
With a plan the service states can be tracked and controlled.

A service plan can consist of many PlanComponent's.
This is operational data that is stored together with the service
configuration.

PlanComponent(planpath, name, component_type)

Initialize a PlanComponent.

Members:

<details>

<summary>append_state(...)</summary>

Method:

```python
append_state(self, state_name)
```

Append a new state to this plan component.

The state status will be initialized to 'ncs:not-reached'.

</details>

<details>

<summary>set_failed(...)</summary>

Method:

```python
set_failed(self, state_name)
```

Set state status to 'ncs:failed'.

</details>

<details>

<summary>set_reached(...)</summary>

Method:

```python
set_reached(self, state_name)
```

Set state status to 'ncs:reached'.

</details>

<details>

<summary>set_status(...)</summary>

Method:

```python
set_status(self, state_name, status)
```

Set state status.

</details>

### _class_ **Service**

Service callback.

This class makes it easy to create and register service callbacks by
subclassing it and implementing some of the service callbacks.

Service(daemon, servicepoint, log=None, init_args=None)

Initialize this object.

The 'daemon' argument should be a Daemon instance. 'servicepoint'
is the name of the tailf:servicepoint to manage. Argument 'log' can
be any log object, and if not set the Daemon log will be used.
'init_args' may be any object that will be passed into init() when
this object is constructed. Lastly, the low-level function
dp.register_service_cb() will be called.

When creating a service callback using Application.register_service
there is no need to manually initialize this object as it is then
done automatically.

Members:

<details>

<summary>create(...)</summary>

Static method:

```python
create(fn)
```

Decorator for the cb_create callback.

Using this decorator alters the signature of the cb_create callback
and passes in maagic.Node objects for root and service.
The maagic.Node objects received in 'root' and 'service' are backed
by a MAAPI connection with the FASTMAP handle attached. To update
'proplist' simply return it from this function.

Example of a decorated cb_create:

    @Service.create
    def cb_create(self, tctx, root, service, proplist):
        pass

Callback arguments:

* tctx - transaction context (TransCtxRef)
* root -- root node (maagic.Node)
* service -- service node (maagic.Node)
* proplist - properties (list(tuple(str, str)))

</details>

<details>

<summary>init(...)</summary>

Method:

```python
init(self, init_args)
```

Custom initialization.

When registering a service using Application this method will be
called with the 'init_args' passed into the register_service()
function.

</details>

<details>

<summary>maapi</summary>


</details>

<details>

<summary>post_modification(...)</summary>

Static method:

```python
post_modification(fn)
```

Decorator for the cb_post_modification callback.

For details see Service.pre_modification decorator.

</details>

<details>

<summary>pre_modification(...)</summary>

Static method:

```python
pre_modification(fn)
```

Decorator for the cb_pre_modification callback.

Using this decorator alters the signature of the cb_pre_modification.
callback and passes in a maagic.Node object for root.
This method is invoked outside FASTMAP. To update 'proplist' simply
return it from this function.

Example of a decorated cb_pre_modification:

    @Service.pre_modification
    def cb_pre_modification(self, tctx, op, kp, root, proplist):
        pass

Callback arguments:

* tctx - transaction context (TransCtxRef)
* op -- operation (int)
* kp -- keypath (HKeypathRef)
* root -- root node (maagic.Node)
* proplist - properties (list(tuple(str, str)))

</details>

<details>

<summary>start(...)</summary>

Method:

```python
start(self)
```

Start Service

</details>

<details>

<summary>stop(...)</summary>

Method:

```python
stop(self)
```

Stop Service

</details>

