---
description: Run your Python code using Python Virtual Machine (VM).
---

# NSO Python VM

NSO is capable of starting one or several Python VMs where Python code in user-provided packages can run.

An NSO package containing a `python` directory will be considered to be a Python Package. By default, a Python VM will be started for each Python package that has a `python-class-name` defined in its `package-meta-data.xml` file. In this Python VM, the `PYTHONPATH` environment variable will be pointing to the `python` directory in the package.

If any required package that is listed in the `package-meta-data.xml` contains a `python` directory, the path to that directory will be added to the `PYTHONPATH` of the started Python VM and thus its accompanying Python code will be accessible.

Several Python packages can be started in the same Python VM if their corresponding `package-meta-data.xml` files contain the same _`python-package/vm-name`_.

A Python package skeleton can be created by making use of the `ncs-make-package` command:

```
ncs-make-package --service-skeleton python <package-name>
```

## YANG Model <a href="#d5e1542" id="d5e1542"></a>

The `tailf-ncs-python-vm.yang` defines the `python-vm` container which, along with `ncs.conf`, is the entry point for controlling the NSO Python VM functionality. Study the content of the YANG model in the example below (The Python VM YANG Model). For a full explanation of all the configuration data, look at the YANG file and man `ncs.conf`. Here will follow a description of the most important configuration parameters.

Note that some of the nodes beneath `python-vm` are by default invisible due to a hidden attribute. To make everything under `python-vm` visible in the CLI, two steps are required:

1.  First, the following XML snippet must be added to `ncs.conf`:\


    ```
    <hide-group>
       <name>debug</name>
    </hide-group>
    ```
2.  Next, the `unhide` command may be used in the CLI session:

    ```
    admin@ncs(config)# unhide debug
    admin@ncs(config)#
    ```

The `sanity-checks`/`self-assign-warning` controls the self-assignment warnings for Python services with off, log, and alarm (default) modes. An example of a self-assignment:

```
class ServiceCallbacks(Service):
    @Service.create
    def cb_create(self, tctx, root, service, proplist):
        self.counter = 42
```

As several service invocations may run in parallel, self-assignment will likely cause difficult-to-debug issues. An alarm or a log entry will contain a warning and a keypath to the service instance that caused the warning. Example log entry:

```
<WARNING> ... Assigning to self is not thread safe: /mysrvc:mysrvc{2}
```

With the `logging`/`level`, the amount of logged information can be controlled. This is a global setting applied to all started Python VMs unless explicitly set for a particular VM, see [Debugging of Python packages](nso-python-vm.md#debugging-of-python-packages). The levels correspond to the pre-defined Python levels in the Python `logging` module, ranging from `level-critical` to `level-debug`.

{% hint style="info" %}
Refer to the official Python documentation for the `logging` module for more information about the log levels.
{% endhint %}

The `logging`/`log-file-prefix` define the prefix part of the log file path used for the Python VMs. This prefix will be appended with a Python VM-specific suffix which is based on the Python package name or the _`python-package/vm-name`_ from the `package-meta-data.xml` file. The default prefix is `logs/ncs-python-vm` so e.g., if a Python package named `l3vpn` is started, a logfile with the name `logs/ncs-python-vm-l3vpn.log` will be created.

The `status`_/_`start` and `status`_/_`current` contains operational data. The `status`_/_`start` command will show information about what Python classes, as declared in the `package-meta-data.xml` file, were started and whether the outcome was successful or not. The `status`_/_`current` command will show which Python classes that are currently running in a separate thread. The latter assumes that the user-provided code cooperates by informing NSO about any thread(s) started by the user code, see [Structure of the User-provided Code](nso-python-vm.md#structure-of-the-user-provided-code).

The `start` and `stop` actions make it possible to start and stop a particular Python VM.

{% code title="Example: The Python VM YANG Model" %}
```
> yanger -f tree tailf-ncs-python-vm.yang
          
submodule: tailf-ncs-python-vm (belongs-to tailf-ncs)
  +--rw python-vm
     +--rw sanity-checks
     |  +--rw self-assign-warning?   enumeration
     +--rw logging
     |  +--rw log-file-prefix?   string
     |  +--rw level?             py-log-level-type
     |  +--rw vm-levels* [node-id]
     |     +--rw node-id    string
     |     +--rw level      py-log-level-type
     +--rw status
     |  +--ro start* [node-id]
     |  |  +--ro node-id     string
     |  |  +--ro packages* [package-name]
     |  |     +--ro package-name    string
     |  |     +--ro components* [component-name]
     |  |        +--ro component-name    string
     |  |        +--ro class-name?       string
     |  |        +--ro status?           enumeration
     |  |        +--ro error-info?       string
     |  +--ro current* [node-id]
     |     +--ro node-id     string
     |     +--ro packages* [package-name]
     |        +--ro package-name    string
     |        +--ro components* [component-name]
     |           +--ro component-name    string
     |           +--ro class-names* [class-name]
     |              +--ro class-name    string
     |              +--ro status?       enumeration
     +---x stop
     |  +---w input
     |  |  +---w name    string
     |  +--ro output
     |     +--ro result?   string
     +---x start
        +---w input
        |  +---w name    string
        +--ro output
           +--ro result?   string
```
{% endcode %}

## Structure of the User-provided Code

The `package-meta-data.xml` file must contain a `component` of type `application` with a `python-class-name` specified as shown in the example below.

{% code title="Example: package-meta-data.xml Excerpt" %}
```
<component>
  <name>L3VPN Service</name>
  <application>
    <python-class-name>l3vpn.service.Service</python-class-name>
  </application>
</component>
<component>
  <name>L3VPN Service model upgrade</name>
  <upgrade>
    <python-class-name>l3vpn.upgrade.Upgrade</python-class-name>
  </upgrade>
</component>
```
{% endcode %}

The component name (`L3VPN Service` in the example) is a human-readable name of this application component. It will be shown when doing `show python-vm` in the CLI. The `python-class-name` should specify the Python class that implements the application entry point. Note that it needs to be specified using Python's dot notation and should be fully qualified (given the fact that `PYTHONPATH` is pointing to the package `python` directory).

Study the excerpt of the directory listing from a package named `l3vpn` below.

{% code title="Example: Python Package Directory Structure" %}
```
packages/
+-- l3vpn/
    +-- package-meta-data.xml
    +-- python/
    |   +-- l3vpn/
    |       +-- __init__.py
    |       +-- service.py
    |       +-- upgrade.py
    |       +-- _namespaces/
    |           +-- __init__.py
    |           +-- l3vpn_ns.py
    +-- src
        +-- Makefile
        +-- yang/
            +-- l3vpn.yang
```
{% endcode %}

Look closely at the `python` directory above. Note that directly under this directory is another directory named the package (`l3vpn`) that contains the user code. This is an important structural choice that eliminates the chance of code clashes between dependent packages (only if all dependent packages use this pattern of course).

As you can see, the `service.py` is located according to the description above. There is also a `__init__.py` (which is empty) there to make the `l3vpn` directory considered a module from Python's perspective.

Note the `_namespaces/l3vpn_ns.py` file. It is generated from the `l3vpn.yang` model using the `ncsc --emit-python` command and contains constants representing the namespace and the various components of the YANG model, which the User code can import and make use of.

The `service.py` file should include a class definition named `Service` which acts as the component's entry point. See [The Application Component](nso-python-vm.md#ncs.development.pythonvm.cthread) for details.

Notice that there is also a file named `upgrade.py` present which holds the implementation of the `upgrade` component specified in the `package-meta-data.xml` excerpt above. See [The Upgrade Component](nso-python-vm.md#ncs.development.pythonvm.upgrade) for details regarding `upgrade` components.

### The `application` Component <a href="#ncs.development.pythonvm.cthread" id="ncs.development.pythonvm.cthread"></a>

The Python class specified in the `package-meta-data.xml` file will be started in a Python thread which we call a `component` thread. This Python class should inherit `ncs.application.Application` and should implement the methods `setup()` and `teardown()`.

NSO supports two different modes for executing the implementations of the registered callpoints, `threading` and `multiprocessing`.

The default `threading` mode will use a single thread pool for executing the callbacks for all callpoints.

The `multiprocessing` mode will start a subprocess for each callpoint. Depending on the user code, this can greatly improve the performance on systems with a lot of parallel requests, as a separate worker process will be created for each Service, Nano Service, and Action.

The behavior is controlled by three factors:

* `callpoint-model` setting in the `package-meta-data.xml` file.
* Number of registered callpoints in the `Application`.
* Operating System support for killing child processes when the parent exits.

If the `callpoint-model` is set to `multiprocessing`, more than one callpoint is registered in the `Application` and the Operating System supports killing child processes when the parent exits, NSO will enable multiprocessing mode.

{% code title="Example: Component Class Skeleton" %}
```
import ncs

class Service(ncs.application.Application):
    def setup(self):
        # The application class sets up logging for us. It is accessible
        # through 'self.log' and is a ncs.log.Log instance.
        self.log.info('Service RUNNING')

        # Service callbacks require a registration for a 'service point',
        # as specified in the corresponding data model.
        #
        self.register_service('l3vpn-servicepoint', ServiceCallbacks)

        # If we registered any callback(s) above, the Application class
        # took care of creating a daemon (related to the service/action point).

        # When this setup method is finished, all registrations are
        # considered done and the application is 'started'.

    def teardown(self):
        # When the application is finished (which would happen if NCS went
        # down, packages were reloaded or some error occurred) this teardown
        # method will be called.

        self.log.info('Service FINISHED')
```
{% endcode %}

The `Service` class will be instantiated by NSO when started or whenever packages are reloaded. Custom initialization, such as registering service and action callbacks should be done in the `setup()` method. If any cleanup is needed when NSO finishes or when packages are reloaded it should be placed in the `teardown()` method.

The existing log functions are named after the standard Python log levels, thus in the example above the `self.log` object contains the functions `debug`_,_`info`_,_`warning`_,_`error`_,_`critical`. Where to log and with what level can be controlled from NSO?

### The `upgrade` Component <a href="#ncs.development.pythonvm.upgrade" id="ncs.development.pythonvm.upgrade"></a>

The Python class specified in the `upgrade` section of `package-meta-data.xml` will be run by NSO in a separately started Python VM. The class must be instantiable using the empty constructor and it must have a method called `upgrade` as in the example below. It should inherit `ncs.upgrade.Upgrade`.

{% code title="Example: Upgrade Class Example" %}
```
import ncs
import _ncs


class Upgrade(ncs.upgrade.Upgrade):
    """An upgrade 'class' that will be instantiated by NSO.

    This class can be named anything as long as NSO can find it using the
    information specified in <python-class-name> for the <upgrade>
    component in package-meta-data.xml.

    Is should inherit ncs.upgrade.Upgrade.

    NSO will instantiate this class using the empty contructor.
    The class MUST have a method named 'upgrade' (as in the example below)
    which will be called by NSO.
    """

    def upgrade(self, cdbsock, trans):
        """The upgrade 'method' that will be called by NSO.

        Arguments:
        cdbsock -- a connected CDB data socket for reading current (old) data.
        trans -- a ncs.maapi.Transaction instance connected to the init
                 transaction for writing (new) data.

        There is no need to connect a CDB data socket to NSO - that part is
        already taken care of and the socket is passed in the first argument
        'cdbsock'. A session against the DB needs to be started though. The
        session doesn't need to be ended and the socket doesn't need to be
        closed - NSO will do that automatically.

        The second argument 'trans' is already attached to the init transaction
        and ready to be used for writing the changes. It can be used to create a
        maagic object if that is preferred. There's no need to detach or finish
        the transaction, and, remember to NOT apply() the transaction when work
        is finished.

        The method should return True (or None, which means that a return
        statement is not needed) if everything was OK.
        If something went wrong the method should return False or throw an
        error. The northbound client initiating the upgrade will be alerted
        with an error message.

        Anything written to stdout/stderr will end up in the general log file
        for spurious output from Python VMs. If not configured the file will
        be named ncs-python-vm.log.
        """

        # start a session against running
        _ncs.cdb.start_session2(cdbsock, ncs.cdb.RUNNING,
                                ncs.cdb.LOCK_SESSION | ncs.cdb.LOCK_WAIT)

        # loop over a list and do some work
        num = _ncs.cdb.num_instances(cdbsock, '/path/to/list')
        for i in range(0, num):
            # read the key (which in this example is 'name') as a ncs.Value
            value = _ncs.cdb.get(cdbsock, '/path/to/list[{0}]/name'.format(i))
            # create a mandatory leaf 'level' (enum - low, normal, high)
            key = str(value)
            trans.set_elem('normal', '/path/to/list{{{0}}}/level'.format(key))

        # not really needed
        return True

        # Error return example:
        #
        # This indicates a failure and the string written to stdout below will
        # written to the general log file for spurious output from Python VMs.
        #
        # print('Error: not implemented yet')
        # return False
```
{% endcode %}

## Debugging of Python Packages

Python code packages are not running with an attached console and the standard out from the Python VMs are collected and put into the common log file `ncs-python-vm.log`. Possible Python compilation errors will also end up in this file.

Normally the logging objects provided by the Python APIs are used. They are based on the standard Python `logging` module. This gives the possibility to control the logging if needed, e.g., getting a module local logger to increase logging granularity.

The default logging level is set to `info`. For debugging purposes, it is very useful to increase the logging level:

```
    $ ncs_cli -u admin
    admin@ncs> config
    admin@ncs% set python-vm logging level level-debug
    admin@ncs% commit
```

This sets the global logging level and will affect all started Python VMs. It is also possible to set the logging level for a single package (or multiple packages running in the same VM), which will take precedence over the global setting:

```
    $ ncs_cli -u admin
    admin@ncs> config
    admin@ncs% set python-vm logging vm-levels pkg_name level level-debug
    admin@ncs% commit
```

The debugging output is printed to separate files for each package and the log file naming is `ncs-python-vm-`_`pkg_name`_`.log`

Log file output example for package `l3vpn`:

```
    $ tail -f logs/ncs-python-vm-l3vpn.log
    2016-04-13 11:24:07 - l3vpn - DEBUG - Waiting for Json msgs
    2016-04-13 11:26:09 - l3vpn - INFO - action name: double
    2016-04-13 11:26:09 - l3vpn - INFO - action input.number: 21
```

## Using Non-standard Python <a href="#ncs.development.pythonvm.nonstdpython" id="ncs.development.pythonvm.nonstdpython"></a>

There are occasions where the standard Python installation is incompatible or maybe not preferred to be used together with NSO. In such cases, there are several options to tell NSO to use another Python installation for starting a Python VM.

By default NSO will use the file `$NCS_DIR/bin/ncs-start-python-vm` when starting a new Python VM. The last few lines in that file read:

```
        if [ -x "$(which python3)" ]; then
            echo "Starting python3 -u $main $*"
            exec python3 -u "$main" "$@"
        fi
        echo "Starting python -u $main $*"
        exec python -u "$main" "$@"
```

As seen above NSO first looks for `python3` and if found it will be used to start the VM. If `python3` is not found NSO will try to use the command `python` instead. Here we describe a couple of options for deciding which Python NSO should start.

### Configure NSO to Use a Custom Start Command (recommended) <a href="#d5e1719" id="d5e1719"></a>

NSO can be configured to use a custom start command for starting a Python VM. This can be done by first copying the file `$NCS_DIR/bin/ncs-start-python-vm` to a new file and then changing the last lines of that file to start the desired version of Python. After that, edit `ncs.conf` and configure the new file as the start command for a new Python VM. When the file `ncs.conf` has been changed reload its content by executing the command `ncs --reload`.

Example:

```
$ cd $NCS_DIR/bin
$ pwd
/usr/local/nso/bin
$ cp ncs-start-python-vm my-start-python-vm
$ # Use your favourite editor to update the last lines of the new
$ # file to start the desired Python executable.
```

Add the following snippet to `ncs.conf`:

```
<python-vm>
    <start-command>/usr/local/nso/bin/my-start-python-vm</start-command>
</python-vm>
```

The new `start-command` will take effect upon the next restart or configuration reload.

### Changing the Path to `python3` or `python` <a href="#d5e1732" id="d5e1732"></a>

Another way of telling NSO to start a specific Python executable is to configure the environment so that executing `python3` or `python` starts the desired Python. This may be done system-wide or can be made specific for the user running NSO.

### Updating the Default Start Command (not recommended) <a href="#d5e1739" id="d5e1739"></a>

Changing the last line of `$NCS_DIR/bin/ncs-start-python-vm` is of course an option but altering any of the installation files of NSO is discouraged.

## Caveats <a href="#caveats" id="caveats"></a>

### Using Multiprocessing <a href="#ncs.development.pythonvm.caveats.multiprocessing" id="ncs.development.pythonvm.caveats.multiprocessing"></a>

Using the multiprocessing library from Python components, where the `callpoint-model` is set to `threading`, can cause unexpected disconnects from NSO if errors occur in the code executed by the multiprocessing library.

As a workaround to this, either use `multiprocessing` as the `callpoint-model` or force the start method to be `spawn` by executing:

{% code title="Example: Set Start Method to spawn" %}
```
if multiprocessing.get_start_method() != 'spawn':
    multiprocessing.set_start_method('spawn', force=True)
```
{% endcode %}
