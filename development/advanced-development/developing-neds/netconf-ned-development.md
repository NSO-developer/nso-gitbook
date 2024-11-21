---
description: Create NETCONF NEDs.
---

# NETCONF NED Development

Creating and installing a NETCONF NED consists of the following steps:

* Make the device YANG data models available to NSO
* Build the NED package from the YANG data models using NSO tools
* Install the NED with NSO
* Configure the device connection and notification events in NSO

Creating a NETCONF NED that uses the built-in NSO NETCONF client can be a pleasant experience with devices and nodes that strictly follow the specification for the NETCONF protocol and YANG mappings to NETCONF. If the device does not, the smooth sailing will quickly come to a halt, and you are recommended to visit the [NED Administration](../../../administration/management/ned-administration.md) in Administration and get help from the Cisco NSO NED team who can diagnose, develop and maintain NEDs that bypass misbehaving devices special quirks.

## Tools for NETCONF NED Development <a href="#d5e9069" id="d5e9069"></a>

Before NSO can manage a NETCONF-capable device, a corresponding NETCONF NED needs to be loaded. While no code needs to be written for such NED, it must contain YANG data models for this kind of device. While in some cases, the YANG models may be provided by the device's vendor, devices that implement RFC 6022 YANG Module for NETCONF Monitoring can provide their YANG models using the functionality described in this RFC.

The NSO example under `$NCS_DIR/examples.ncs/development-guide/ned-development/netconf-ned` implements two shell scripts that use different tools to build a NETCONF NED from a simulated hardware chassis system controller device.

### **The `netconf-console` and `ncs-make-package` Tools**

The `netconf-console` NETCONF client tool is a Python script that can be used for testing, debugging, and simple client duties. For example, making the device YANG models available to NSO using the NETCONF IETF RFC 6022 `get-schema` operation to download YANG modules and the RFC 6241`get` operation, where the device implements the RFC 7895 YANG module library to provide information about all the YANG modules used by the NETCONF server. Type `netconf-console -h` for documentation.

Once the required YANG models are downloaded or copied from the device, the `ncs-make-package` bash script tool can be used to create and build, for example, the NETCONF NED package. See [ncs-make-package(1)](https://developer.cisco.com/docs/nso-guides-6.3/ncs-man-pages-volume-1/#man.1.ncs-make-package) in Manual Pages and `ncs-make-package -h` for documentation.

The `demo.sh` script in the `netconf-ned` example uses the `netconf-console` and `ncs-make-package` combination to create, build, and install the NETCONF NED. When you know beforehand which models you need from the device, you often begin with this approach when encountering a new NETCONF device.

### **The NETCONF NED Builder Tool**

The NETCONF NED builder uses the functionality of the two previous tools to assist the NSO developer onboard NETCONF devices by fetching the YANG models from a device and building a NETCONF NED using CLI commands as a frontend.

The `demo_nb.sh` script in the `netconf-ned` example uses the NSO CLI NETCONF NED builder commands to create, build, and install the NETCONF NED. This tool can be beneficial for a device where the YANG models are required to cover the dependencies of the must-have models. Also, devices known to have behaved well with previous versions can benefit from using this tool and its selection profile and production packaging features.

## Using the **`netconf-console`** and **`ncs-make-package`** Combination <a href="#d5e9098" id="d5e9098"></a>

For a demo of the steps below, see README in the `$NCS_DIR/examples.ncs/development-guide/ned-development/netconf-ned` example and run the demo.sh script.

### **Make the Device YANG Data Models Available to NSO**

List the YANG version 1.0 models the device supports using NETCONF `hello` message.

```bash
$ netconf-console --port $DEVICE_NETCONF_PORT --hello | grep "module="
<capability>http://tail-f.com/ns/aaa/1.1?module=tailf-aaa&amp;revision=2023-04-13</capability>
<capability>http://tail-f.com/ns/common/query?module=tailf-common-query&amp;revision=2017-12-15</capability>
<capability>http://tail-f.com/ns/confd-progress?module=tailf-confd-progress&amp;revision=2020-06-29</capability>
...
<capability>urn:ietf:params:xml:ns:yang:ietf-yang-metadata?module=ietf-yang-metadata&amp;revision=2016-08-05</capability>
<capability>urn:ietf:params:xml:ns:yang:ietf-yang-types?module=ietf-yang-types&amp;revision=2013-07-15</capability>
```

List the YANG version 1.1 models supported by the device from the device yang-library.

```bash
$ netconf-console --port=$DEVICE_NETCONF_PORT --get -x /yang-library/module-set/module/name
<?xml version="1.0" encoding="UTF-8"?>
<rpc-reply xmlns="urn:ietf:params:xml:ns:netconf:base:1.0" message-id="1">
  <data>
    <yang-library xmlns="urn:ietf:params:xml:ns:yang:ietf-yang-library">
      <module-set>
        <name>common</name>
        <module>
          <name>iana-crypt-hash</name>
        </module>
        <module>
          <name>ietf-hardware</name>
        </module>
        <module>
          <name>ietf-netconf</name>
        </module>
        <module>
          <name>ietf-netconf-acm</name>
        </module>
        <module>
        ...
        <module>
          <name>tailf-yang-patch</name>
        </module>
        <module>
          <name>timestamp-hardware</name>
        </module>
      </module-set>
    </yang-library>
  </data>
</rpc-reply>
```

The `ietf-hardware.yang` model is of interest to manage the device hardware. Use the `netconf-console` NETCONF `get-schema` operation to get the `ietf-hardware.yang` model.

```bash
$ netconf-console --port=$DEVICE_NETCONF_PORT \
  --get-schema=ietf-hardware > dev-yang/ietf-hardware.yang
```

The `ietf-hardware.yang` import a few YANG models.

```bash
$ cat dev-yang/ietf-hardware.yang | grep import
<import ietf-inet-types {
import ietf-yang-types {
import iana-hardware {
```

Two of the imported YANG models are shipped with NSO.

```bash
$ find ${NCS_DIR} \
  \( -name "ietf-inet-types.yang" -o -name "ietf-yang-types.yang" -o -name "iana-hardware.yang" \)
/path/to/nso/src/ncs/builtin_yang/ietf-inet-types.yang
/path/to/nso/src/ncs/builtin_yang/ietf-yang-types.yang
```

Use the `netconf-console` NETCONF `get-schema` operation to get the `iana-hardware.yang` module.

```bash
$ netconf-console --port=$DEVICE_NETCONF_PORT --get-schema=iana-hardware > \
  dev-yang/iana-hardware.yang
```

The `timestamp-hardware.yang` module augments a node onto the `ietf-hardware.yang` model. This is not visible in the YANG library. Therefore, information on the augment dependency must be available, or all YANG models must be downloaded and checked for imports and augments of the `ietf-hardware.yang model` to make use of the augmented node(s).

```bash
$ netconf-console --port=$DEVICE_NETCONF_PORT --get-schema=timestamp-hardware > \
  dev-yang/timestamp-hardware.yang
```

### **Build the NED from the YANG Data Models**

Create and build the NETCONF NED package from the device YANG models using the `ncs-make-package` script.

```bash
$ ncs-make-package --netconf-ned dev-yang --dest nso-rundir/packages/devsim --build \
  --verbose --no-test --no-java --no-netsim --no-python --no-template --vendor "Tail-f" \
  --package-version "1.0" devsim
```

If you make any changes to, for example, the YANG models after creating the package above, you can rebuild the package using `make -C nso-rundir/packages/devsim all`.

### **Configure the Device Connection**

Start NSO. NSO will load the new package. If the package was loaded previously, use the `--with-package-reload` option. See [ncs(1)](https://developer.cisco.com/docs/nso-guides-6.3/ncs-man-pages-volume-1/#man.1.ncs) in Manual Pages for details. If NSO is already running, use the `packages reload` CLI command.

```bash
$ ncs --cd ./nso-rundir
```

As communication with the devices being managed by NSO requires authentication, a custom authentication group will likely need to be created with mapping between the NSO user and the remote device username and password, SSH public-key authentication, or external authentication. The example used here has a 1-1 mapping between the NSO admin user and the ConfD-enabled simulated device admin user for both username and password.

In the example below, the device name is set to `hw0`, and as the device here runs on the same host as NSO, the NETCONF interface IP address is 127.0.0.1 while the port is set to 12022 to not collide with the NSO northbound NETCONF port. The standard NETCONF port, 830, is used for production.

The `default` authentication group, as shown above, is used.

```bash
$ ncs_cli -u admin -C
# config
Entering configuration mode terminal
(config)# devices device hw0 address 127.0.0.1 port 12022 authgroup default
(config-device-hw0)# devices device hw0 trace pretty
(config-device-hw0)# state admin-state unlocked
(config-device-hw0)# device-type netconf ned-id devsim-nc-1.0
(config-device-hw0)# commit
Commit complete.
```

Fetch the public SSH host key from the device and sync the configuration covered by the `ietf-hardware.yang` from the device.

```bash
$ ncs_cli -u admin -C
# devices fetch-ssh-host-keys
fetch-result {
    device hw0
    result updated
    fingerprint {
        algorithm ssh-ed25519
        value 00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd:ee:ff
    }
}
# device device hw0 sync-from
result true
```

NSO can now configure the device, state data can be read, actions can be executed, and notifications can be received. See the `$NCS_DIR/examples.ncs/development-guide/ned-development/netconf-ned/demo.sh` example script for a demo.

## Using the NETCONF NED Builder Tool <a href="#d5e9185" id="d5e9185"></a>

For a demo of the steps below, see README in the `$NCS_DIR/examples.ncs/development-guide/ned-development/netconf-ned` example and run the demo\_nb.sh script.

### **Configure the Device Connection**

As communication with the devices being managed by NSO requires authentication, a custom authentication group will likely need to be created with mapping between the NSO user and the remote device username and password, SSH public-key authentication, or external authentication.

The example used here has a 1-1 mapping between the NSO admin user and the ConfD-enabled simulated device admin user for both username and password.

```cli
admin@ncs# show running-config devices authgroups group
devices authgroups group default
 umap admin
  remote-name     admin
  remote-password $9$xrr1xtyI/8l9xm9GxPqwzcEbQ6oaK7k5RHm96Hkgysg=
 !
 umap oper
  remote-name     oper
  remote-password $9$Pr2BRIHRSWOW2v85PvRGvU7DNehWL1hcP3t1+cIgaoE=
 !
!
```

In the example below, the device name is set to `hw0`, and as the device here runs on the same host as NSO, the NETCONF interface IP address is 127.0.0.1 while the port is set to 12022 to not collide with the NSO northbound NETCONF port. The standard NETCONF port, 830, is used for production.

The `default` authentication group, as shown above, is used.

```bash
# config
Entering configuration mode terminal
(config)# devices device hw0 address 127.0.0.1 port 12022 authgroup default
(config-device-hw0)# devices device hw0 trace pretty
(config-device-hw0)# state admin-state unlocked
(config-device-hw0)# device-type netconf ned-id netconf
(config-device-hw0)# commit
```

{% hint style="info" %}
A temporary NED identity is configured to `netconf` as the NED package has not yet been built. It will be changed to match the NETCONF NED package NED ID once the package is installed. The generic `netconf` ned-id allows NSO to connect to the device for basic NETCONF operations, such as `get` and `get-schema` for listing and downloading YANG models from the device.
{% endhint %}

### **Make the Device YANG Data Models Available to NSO**

Create a NETCONF NED Builder project called `hardware` for the device, here named `hw0`.

```bash
# devtools true
# config
(config)# netconf-ned-builder project hardware 1.0 device hw0 local-user admin vendor Tail-f
(config)# commit
(config)# end
# show netconf-ned-builder project hardware
netconf-ned-builder project hardware 1.0
 download-cache-path /path/to/nso/examples.ncs/development-guide/ned-development/netconf-ned/nso-rundir/
                     state/netconf-ned-builder/cache/hardware-nc-1.0
 ned-directory-path  /path/to/nso/examples.ncs/development-guide/ned-development/netconf-ned/nso-rundir/
                     state/netconf-ned-builder/hardware-nc-1.0
```

The NETCONF NED Builder is a developer tool that must be enabled first through the `devtools true` command. The NETCONF NED Builder feature is not expected to be used by the end users of NSO.

The cache directory above is where additional YANG and YANG annotation files can be added in addition to the ones downloaded from the device. Files added need to be configured with the NED builder to be included with the project, as described below.

The project argument for the `netconf-ned-builder` command requires both the project name and a version number for the NED being built. A version number often picked is the version number of the device software version to match the NED to the device software it is tested with. NSO uses the project name and version number to create the NED name, here `hardware-nc-1.0`. The device's name is linked to the device name configured for the device connection.

Copying Manually to the Cache Directory:

{% hint style="info" %}
This step is not required if the device supports the NETCONF `get-schema` operation and all YANG modules can be retrieved from the device.. Otherwise, you copy the YANG models to the `state/netconf-ned-builder/cache/hardware-nc-1.0` directory for use with the device.
{% endhint %}

After downloading the YANG data models and before building the NED with the NED builder, you need to register the YANG module with the NSO NED builder. For example, if you want to include a `dummy.yang` module with the NED, you first copy it to the cache directory and then, for example, create an XML file for use with the `ncs_load` command to update the NSO CDB operational datastore:

```bash
$ cp dummy.yang $NCS_DIR/examples.ncs/development-guide/ned-development/netconf-ned/\
  nso-rundir/state/netconf-ned-builder/cache/hardware-nc-1.0/
$ cat dummy.xml
<config xmlns="http://tail-f.com/ns/config/1.0">
  <netconf-ned-builder xmlns="http://tail-f.com/ns/ncs/netconf-ned-builder">
    <project>
      <family-name>hardware</family-name>
      <major-version>1.0</major-version>
      <module>
        <name>dummy</name>
        <revision>2023-11-10</revision>
        <location>NETCONF</location>
        <status>selected downloaded</status>
      </module>
    </project>
  </netconf-ned-builder>
</config>
$ ncs_load -O -m -l dummy.xml
$ ncs_cli -u admin -C
# devtools true
# show netconf-ned-builder project hardware 1.0 module dummy 2023-11-10
SELECT  BUILD    BUILD
NAME   REVISION    NAMESPACE  FEATURE  LOCATION     STATUS
-----------------------------------------------------------------------
dummy  2023-11-10  -          -        [ NETCONF ]  selected,downloaded
```

#### Adding YANG Annotation Files

In some situations, you want to annotate the YANG data models that were downloaded from the device. For example, when an encrypted string is stored on the device, the encrypted value that is stored on the device will differ from the value stored in NSO if the two initialization vectors differ.

Say you have a YANG data model:

```yang
module dummy {
  namespace "urn:dummy";
  prefix dummy;

  revision 2023-11-10 {
    description
      "Initial revision.";
  }

  grouping my-grouping {
    container my-container {
      leaf my-encrypted-password {
        type tailf:aes-cfb-128-encrypted-string;
      }
    }
  }
}
```

And create a YANG annotation module:

```yang
module dummy-ann {
  namespace "urn:dummy-ann";
  prefix dummy-ann;

  import tailf-common {
    prefix tailf;
  }
  tailf:annotate-module "dummy" {
    tailf:annotate-statement "grouping[name='my-grouping']" {
      tailf:annotate-statement "container[name='my-container']" {
        tailf:annotate-statement "leaf[name=' my-encrypted-password']" {
          tailf:ned-ignore-compare-config;
        }
      }
    }
  }
}
```

After downloading the YANG data models and before building the NED with the NED builder, you need to register the `dummy-ann.yang` annotation module, as was done above with the XML file for the `dummy.yang` module.

#### Using NETCONF `get-schema` with the NED Builder

If the device supports `get-schema` requests, the device can be contacted directly to download the YANG data models. The hardware system example returns the below YANG source files when the NETCONF `get-schema` operation is issued to the device from NSO. Only a subset of the list is shown.

```bash
$ ncs_cli -u admin -C
# devtools true
# devices fetch-ssh-host-keys
fetch-result {
    device hw0
    result updated
    fingerprint {
        algorithm ssh-ed25519
        value 00:11:22:33:44:55:66:77:88:99:aa:bb:cc:dd:ee:ff
    }
}
# netconf-ned-builder project hardware 1.0 fetch-module-list
# show netconf-ned-builder project hardware 1.0 module
module iana-crypt-hash 2014-08-06
    namespace urn:ietf:params:xml:ns:yang:iana-crypt-hash
    feature   [ crypt-hash-md5 crypt-hash-sha-256 crypt-hash-sha-512 ]
    location  [ NETCONF ]
module iana-hardware 2018-03-13
    namespace urn:ietf:params:xml:ns:yang:iana-hardware
    location  [ NETCONF ]
module ietf-datastores 2018-02-14
    namespace urn:ietf:params:xml:ns:yang:ietf-datastores
    location  [ NETCONF ]
module ietf-hardware 2018-03-13
    namespace urn:ietf:params:xml:ns:yang:ietf-hardware
    location  [ NETCONF ]
module ietf-inet-types 2013-07-15
    namespace urn:ietf:params:xml:ns:yang:ietf-inet-types
    location  [ NETCONF ]
module ietf-interfaces 2018-02-20
    namespace urn:ietf:params:xml:ns:yang:ietf-interfaces
    feature   [ arbitrary-names if-mib pre-provisioning ]
    location  [ NETCONF ]
module ietf-ip 2018-02-22
    namespace urn:ietf:params:xml:ns:yang:ietf-ip
    feature   [ ipv4-non-contiguous-netmasks ipv6-privacy-autoconf ]
    location  [ NETCONF ]
module ietf-netconf 2011-06-01
    namespace urn:ietf:params:xml:ns:netconf:base:1.0
    feature   [ candidate confirmed-commit rollback-on-error validate xpath ]
    location  [ NETCONF ]
module ietf-netconf-acm 2018-02-14
    namespace urn:ietf:params:xml:ns:yang:ietf-netconf-acm
    location  [ NETCONF ]
module ietf-netconf-monitoring 2010-10-04
    namespace urn:ietf:params:xml:ns:yang:ietf-netconf-monitoring
    location  [ NETCONF ]
...
module ietf-yang-types 2013-07-15
    namespace urn:ietf:params:xml:ns:yang:ietf-yang-types
    location  [ NETCONF ]
module tailf-aaa 2023-04-13
    namespace http://tail-f.com/ns/aaa/1.1
    location  [ NETCONF ]
module tailf-acm 2013-03-07
    namespace http://tail-f.com/yang/acm
    location  [ NETCONF ]
module tailf-common 2023-10-16
    namespace http://tail-f.com/yang/common
    location  [ NETCONF ]
...
module timestamp-hardware 2023-11-10
    namespace urn:example:timestamp-hardware
    location  [ NETCONF ]
```

The `fetch-ssh-host-key` command fetches the public SSH host key from the device to set up NETCONF over SSH. The `fetch-module-list` command will look for existing YANG modules in the download-cache-path folder, YANG version 1.0 models in the device NETCONF `hello` message, and issue a `get` operation to look for YANG version 1.1 models in the device `yang-library`. The `get-schema` operation fetches the YANG modules over NETCONF and puts them in the download-cache-path folder.

After the list of YANG modules is fetched, the retrieved list of modules can be shown. Select the ones you want to download and include in the NETCONF NED.

When you select a module with dependencies on other modules, the modules dependent on are automatically selected, such as those listed below for the `ietf-hardware` module including `iana-hardware` `ietf-inet-types` and `ietf-yang-types`. To select all available modules, use the wild card for both fields. Use the `deselect` command to exclude modules previously included from the build.

```bash
$ ncs_cli -u admin -C
# devtools true
# netconf-ned-builder project hardware 1.0 module ietf-hardware 2018-03-13 select
# netconf-ned-builder project hardware 1.0 module timestamp-hardware 2023-11-10 select
# show netconf-ned-builder project hardware 1.0 module status
NAME                REVISION    STATUS
-----------------------------------------------------
iana-hardware       2018-03-13  selected,downloaded
ietf-hardware       2018-03-13  selected,downloaded
ietf-inet-types     2013-07-15  selected,pending
ietf-yang-types     2013-07-15  selected,pending
timestamp-hardware  2023-11-10  selected,pending

Waiting for NSO to download the selected YANG models (see demo-nb.sh for details)

NAME                REVISION    STATUS
-----------------------------------------------------
iana-hardware       2018-03-13  selected,downloaded
ietf-hardware       2018-03-13  selected,downloaded
ietf-inet-types     2013-07-15  selected,downloaded
ietf-yang-types     2013-07-15  selected,downloaded
timestamp-hardware  2023-11-10  selected,downloaded
```

#### Principles of Selecting the YANG Modules

Before diving into more details, the principles of selecting the modules for inclusion in the NED are crucial steps in building the NED and deserve to be highlighted.

The best practice recommendation is to select only the modules necessary to perform the tasks for the given NSO deployment to reduce memory consumption, for example, for the `sync-from` command, and improve upgrade wall-clock performance.

For example, suppose the aim of the NSO installation is exclusively to manage BGP on the device, and the necessary configuration is defined in a separate module. In that case, only this module and its dependencies need to be selected. If several services are running within the NSO deployment, it will be necessary to include more data models in the single NED that may serve one or many devices. However, if the NSO installation is used to, for example, take a full backup of the device's configuration, all device modules need to be included with the NED.

Selecting a module will also require selecting the module's dependencies, namely, modules imported by the selected modules, modules that augment the selected modules with the required functionality, and modules known to deviate from the selected module in the device's implementation.

Avoid selecting YANG modules that overlap where, for example, configuring one leaf will update another. Including both will cause NSO to get out of sync with the device after a NETCONF `edit-config` operation, forcing time-consuming sync operations.

### **Build the NED from the YANG Data Models**

An NSO NED is a package containing the device YANG data models. The NED package must first be built, then installed with NSO, and finally, the package must be loaded for NSO to communicate with the device via NETCONF using the device YANG data models as the schema for what to configure, state to read, etc.

After the files have been downloaded from the device, they must be built before being used. The following example shows how to build a NED for the `hw0` device.

<pre><code># devtools true
# netconf-ned-builder project hardware 1.0 build-ned
<strong># show netconf-ned-builder project hardware 1.0 build-status
</strong>build-status success
# show netconf-ned-builder project hardware 1.0 module build-warning
% No entries found.
# show netconf-ned-builder project hardware 1.0 module build-error
% No entries found.
# unhide debug
# show netconf-ned-builder project hardware 1.0 compiler-output
% No entries found.
</code></pre>

{% hint style="info" %}
Build errors can be found in the `build-error` leaf under the module list entry. If there are errors in the build, resolve the issues in the YANG models, update them and their revision on the device, and download them from the device or place the YANG models in the cache as described earlier.
{% endhint %}

Warnings after building the NED can be found in the `build-warning` leaf under the module list entry. It is good practice to clean up build warnings in your YANG models.

A build error example:

```bash
# netconf-ned-builder project cisco-iosxr 6.6 build-ned
Error: Failed to compile NED bundle
# show netconf-ned-builder project cisco-iosxr 6.6 build-status
build-status error
# show netconf-ned-builder project cisco-iosxr 6.6 module build-error
module openconfig-telemetry 2016-02-04
 build-error at line 700: <error message>
```

The full compiler output for debugging purposes can be found in the `compiler-output` leaf under the project list entry. The `compiler-output` leaf is hidden by `hide-group debug` and may be accessed in the CLI using the `unhide debug` command if the `hide-group` is configured in `ncs.conf`. Example `ncs.conf` config:

```xml
<hide-group>
    <name>debug</name>
</hide-group>
```

For the `ncs.conf` configuration change to take effect, it must be either reloaded or NSO restarted. A reload using the `ncs_cmd` tool:

```bash
$ ncs_cmd -c reload
```

As the compilation will halt if an error is found in a YANG data model, it can be helpful to first check all YANG data models at once using a shell script plus the NSO yanger tool.

```bash
$ ls -1
check.sh
yang    # directory with my YANG modules
$ cat check.sh
#!/bin/sh
for f in yang/*.yang
do
    $NCS_DIR/bin/yanger -p yang $f
done
```

As an alternative to debugging the NED building issues inside an NSO CLI session, the `make-development-ned` action creates a development version of NED, which can be used to debug and fix the issue in the YANG module.

```bash
$ ncs_cli -u admin -C
# devtools true
(config)# netconf-ned-builder project hardware 1.0 make-development-ned in-directory /tmp
ned-path /tmp/hardware-nc-1.0
(config)# end
# exit
$ cd /tmp/hardware-nc-1.0/src
$ make clean all
```

YANG data models that do not compile due to YANG RFC compliance issues can either be updated in the cache folder directly or in the device and re-uploaded again through `get-schema` operation by removing them from the cache folder and repeating the previous process to rebuild the NED. The YANG modules can be deselected from the build if they are not needed for your use case.

{% hint style="info" %}
Having device vendors update their YANG models to comply with the NETCONF and YANG standards can be time-consuming. Visit the [NED Administration](../../../administration/management/ned-administration.md) and get help from the Cisco NSO NED team, who can diagnose, develop and maintain NEDs that bypass misbehaving device's special quirks.
{% endhint %}

### **Export the NED package and Load**

A successfully built NED may be exported as a `tar` file using the `export-ned action`. The `tar` file name is constructed according to the naming convention below.

```bash
ncs-<ncs-version>-<ned-family>-nc-<ned-version>.tar.gz
```

The user chooses the directory the file needs to be created in. The user must have write access to the directory. I.e., configure the NSO user with the same uid (id -u) as the non-root user:

```bash
$ id -u
501
$ ncs_cli -u admin -C
# devtools true
# config
(config)# aaa authentication users user admin uid 501
(config-user-admin)# commit
Commit complete.
(config-user-admin)# end
# netconf-ned-builder project hardware 1.0 export-ned to-directory \
  /path/to/nso/examples.ncs/development-guide/ned-development/netconf-ned/nso-rundir/packages
tar-file /path/to/nso/examples.ncs/development-guide/ned-development/netconf-ned/
         nso-rundir/packages/ncs-6.2-hardware-nc-1.0.tar.gz
```

When the NED package has been copied to the NSO run-time packages directory, the NED package can be loaded by NSO.

```bash
# packages reload
>>>> System upgrade is starting.
>>>> Sessions in configure mode must exit to operational mode.
>>>> No configuration changes can be performed until upgrade has completed.
>>>> System upgrade has completed successfully.
reload-result {
    package hardware-nc-1.0
    result true
}
# show packages | nomore
packages package hardware-nc-1.0
 package-version 1.0
 description     "Generated by NETCONF NED builder"
 ncs-min-version [ 6.2 ]
 directory       ./state/packages-in-use/1/hardware-nc-1.0
 component hardware
  ned netconf ned-id hardware-nc-1.0
  ned device vendor Tail-f
 oper-status up
```

### **Update the `ned-id` for the `hw0` Device**

When the NETCONF NED has been built for the `hw0` device, the `ned-id` for `hw0` needs to be updated before the NED can be used to manage the device.

```bash
$ ncs_cli -u admin -C
# show packages package hardware-nc-1.0 component hardware ned netconf ned-id
ned netconf ned-id hardware-nc-1.0
# config
(config)# devices device hw0 device-type netconf ned-id hardware-nc-1.0
(config-device-hw0)# commit
Commit complete.
(config-device-hw0)# end
# devices device hw0 sync-from
result true
# show running-config devices device hw0 config | nomore
devices device hw0
 config
  hardware component carbon
   class          module
   parent         slot-1-4-1
   parent-rel-pos 1040100
   alias          dummy
   asset-id       dummy
   uri            [ urn:dummy ]
  !
  hardware component carbon-port-4
   class          port
   parent         carbon
   parent-rel-pos 1040104
   alias          dummy-port
   asset-id       dummy
   uri            [ urn:dummy ]
  !
...
```

NSO can now configure the device, state data can be read, actions can be executed, and notifications can be received. See the `$NCS_DIR/examples.ncs/development-guide/ned-development/netconf-ned/demo-nb.sh` example script for a demo.

### **Remove a NED from NSO**

Installed NED packages can be removed from NSO by deleting them from the NSO project's packages folder and then deleting the device and the NETCONF NED project through the NSO CLI. To uninstall a NED built for the device `hw0`:

```bash
$ ncs_cli -C -u admin
# devtools true
# config
(config)# no netconf-ned-builder project hardware 1.0
(config)# commit
Commit complete.
(config)# end
# packages reload
Error: The following modules will be deleted by upgrade:
hardware-nc-1.0: iana-hardware
hardware-nc-1.0: ietf-hardware
hardware-nc-1.0: hardware-nc
hardware-nc-1.0: hardware-nc-1.0
If this is intended, proceed with 'force' parameter.
# packages reload force

>>>> System upgrade is starting.
>>>> Sessions in configure mode must exit to operational mode.
>>>> No configuration changes can be performed until upgrade has completed.
>>>> System upgrade has completed successfully.
```
