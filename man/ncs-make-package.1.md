# ncs-make-package Man Page

`ncs-make-package` - Command to create an NCS package

## Synopsis

`ncs-make-package [OPTIONS] package-name`

## Description

Creates an NCS package of a certain type. For NEDs, it creates a netsim
directory by default, which means that the package can be used to run
simulated devices using ncs-netsim, i.e that ncs-netsim can be used to
run simulation network that simulates devices of this type.

The generated package should be seen as an initial package structure.
Once generated, it should be manually modified when it needs to be
updated. Specifically, the package-meta-data.xml file must be modified
with correct meta data.

## Options

`-h, --help`  
> Print a short help text and exit.

`--dest` Directory  
> By default the generated package will be written to a directory in
> current directory with the same name as the provided package name.
> This optional flag writes the package to the --dest provided location.

`--build`  
> Once the package is created, build it too.

`--no-test`  
> Do not generate the test directory.

`--netconf-ned` DIR  
> Create a NETCONF NED package, using the device YANG files in DIR.

`--generic-ned-skeleton`  
> Generate a skeleton package for a generic NED. This is a good starting
> point whenever we wish to develop a new generic NED.

`--snmp-ned` DIR  
> Create a SNMP NED package, using the device MIB files in DIR.

`--lsa-netconf-ned`DIR  
> Create a NETCONF NED package for LSA, when the device is another NCS
> (the lower ncs), using the device YANG files in DIR. The NED is
> compiled with the ned-id *tailf-ncs-ned:lsa-netconf*.
>
> If the lower NCS is running a different version of NCS than the upper
> NCS or if the YANG files in DIR contains references to configuration
> data in the ncs namespace, use the option `--lsa-lower-nso`.

`--service-skeleton` java \| java-and-template \| python \| python-and-template \| template  
> Generate a skeleton package for a simple RFS service, either
> implemented by Java code, Python code, based on a template, or a
> combination of them.

`--data-provider-skeleton`  
> Generate a skeleton package for a simple data provider.

`--erlang-skeleton`  
> Generate a skeleton for an Erlang package.

`--no-fail-on-warnings`  
> By default ncs-make-package will create packages which will fail when
> encountering warnings in YANG or MIB files. This is desired and
> warnings should be corrected. This option is for legacy reasons,
> before the generated packages where not that strict.

`--nano-service-skeleton` java \| java-and-template \| python \| python-and-template \| template  
> Generate a nano skeleton package for a simple service with nano plan,
> either implemented by Java code with template or Python code with
> template, or on a template. The options java and java-and-template,
> python and python-and-template result in the same skeleton creation.

## Service Specific Options

`--augment`PATH  
> Augment the generated service model under PATH, e.g. */ncs:services*.

`--root-container`NAME  
> Put the generated service model in a container named NAME.

## Java Specific Options

`--java-package`NAME  
> NAME is the Java package name for the Java classes generated from all
> device YANG modules. These classes can be used by Java code
> implementing for example services.

## Ned Specific Options

`--no-netsim`  
> Do not generate a netsim directory. This means the package cannot be
> used by ncs-netsim.

`--no-java`  
> Do not generate any Java classes from the device YANG modules.

`--no-python`  
> Do not generate any Python classes from the device YANG modules.

`--no-template`  
> Do not generate any device templates from the device YANG modules.

`--vendor` VENDOR  
> The vendor element in the package file.

`--package-version` VERSION  
> The package-version element in the package file.

## Netconf Ned Specific Options

`--pyang-sanitize`  
> Sanitize the device's YANG files. This will invoke pyang --sanitize on
> the device YANG files.

`--confd-netsim-db-mode` candidate \| startup \| running-only  
> Control which datastore netsim should use when simulating the device.
> The candidate option here is default and it includes the setting
> writable-through-candidate

`--ncs-depend-package`DIR  
> If the yang code in a package depends on the yang code in another NCS
> package we need to use this flag. An example would be if a device
> model augments YANG code which is contained in another NCS package.
> The arg, the package we depend on, shall be relative the src directory
> to where the package is built.

## Lsa Netconf Ned Specific Options

`--lsa-lower-nso`cisco-nso-nc-X.Y \| DIR  
> Specifies the package name for the lower NCS, the package is in
> `$NCS_DIR/packages/lsa`, or a path to the package directory containing
> the cisco-nso-nc package for the lower node.
>
> The NED will be compiled with the ned-id of the package,
> *cisco-nso-nc-X.Y:cisco-nso-nc-X.Y*.

## Python Specific Options

`--component-class`module.Class  
> This optional parameter specifies the *python-class-name* of the
> generated `package-meta-data.xml` file. It must be in format
> *module.Class*. Default value is *main.Main*.

`--action-example`  
> This optional parameter will produce an example of an Action.

`--subscriber-example`  
> This optional parameter will produce an example of a CDB subscriber.

## Erlang Specific Options

`--erlang-application-name`NAME  
> Add a skeleton for an Erlang application. Invoke the script multiple
> times to add multiple applications.

## Examples

Generate a NETCONF NED package given a set of YANG files from a fictious
acme router device.

<div class="informalexample">

      $ ncs-make-package   --netconf-ned /path/to/yangfiles acme
      $ cd acme/src; make all
          

</div>

This package can now be used by ncs-netsim to create simulation networks
with simulated acme routers.
