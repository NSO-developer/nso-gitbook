---
description: Learn how NSO keeps a record of its managed devices using CDB.
---

# CDB and YANG

Cisco NSO is a network automation platform that supports a variety of uses. This can be as simple as a configuration of a standard-format hostname, which can be implemented in minutes. Or it could be an advanced MPLS VPN with custom traffic-engineered paths in a Service Provider network, which might take weeks to design and code.

Regardless of complexity, any network automation solution must keep track of two things: intent and network state.

The Configuration Database (CDB) built into NSO was designed for this exact purpose:

* Firstly, the CDB will store the intent, which describes what you want from the network. Traditionally we call this intent a network service since this is what the network ultimately provides to its users.
* Secondly, the CDB also stores a copy of the configuration of the managed devices, that is, the network state. Knowledge of the network state is essential to correctly provision new services. It also enables faster diagnosis of problems and is required for advanced functionality, such as self-healing.

This section describes the main features of the CDB and explains how NSO stores data there. To help you better understand the structure of the CDB, you will also learn how to add your data to it.

## Key Features of the CDB <a href="#d5e47" id="d5e47"></a>

The CDB is a dedicated built-in storage for data in NSO. It was built from the ground up to efficiently store and access network configuration data, such as device configurations, service parameters, and even configuration for NSO itself. Unlike traditional SQL databases that store data as rows in a table, the CDB is a hierarchical database, with a structure resembling a tree. You could think of it as somewhat like a big XML document that can store all kinds of data.

There are a number of other features that make the CDB an excellent choice for a configuration store:

* Fast lightweight database access through a well-defined API.
* Subscription (“push”) mechanism for change notification.
* Transaction support for ensuring data consistency.
* Rich and extensible schema based on YANG.
* Built-in support for schema and associated data upgrade.
* Close integration with NSO for low-maintenance operation.

To speed up operations, CDB keeps a configurable amount of configuration data in RAM, in addition to persisting it to disk (see [CDB Persistence](../../administration/advanced-topics/cdb-persistence.md) for details). The CDB also stores transient operational data, such as alarms and traffic statistics. By default, this operational data is only kept in RAM and is reset during restarts, however, the CDB can be instructed to persist it if required.

{% hint style="info" %}
The automatic schema update feature is useful not only when performing an actual upgrade of NSO itself, it also simplifies the development process. It allows individual developers to add and delete items in the configuration independently.

Additionally, the schema for data in the CDB is defined with a standard modeling language called YANG. YANG (RFC 7950, [https://tools.ietf.org/html/rfc7950](https://tools.ietf.org/html/rfc7950)) describes constraints on the data and allows the CDB to store values more efficiently.
{% endhint %}

## Compilation and Loading of YANG Modules <a href="#d5e74" id="d5e74"></a>

All of the data stored in the CDB follows the data model provided by various YANG modules. Each module usually comes as one or more files with a `.yang` extension and declares a part of the overall model.

NSO provides a base set of YANG modules out of the box. They are located in `$NCS_DIR/src/ncs/yang` if you wish to inspect them. These modules are required for proper system operation.

All other YANG modules are provided by packages and extend the base NSO data model. For example, each Network Element Driver (NED) package adds the required nodes to store the configuration for that particular type of device. In the same way, you can store your custom data in the CDB by providing a package with your own YANG module.

However, the CDB can't use the YANG files directly. The bundled compiler, `ncsc`, must first transform a YANG module into a final schema (`.fxs`) file. The reason is that internally and in the programming APIs NSO refers to YANG nodes with integer values instead of names. This conserves space and allows for more efficient operations, such as switch statements in the application code. The `.fxs` file contains this mapping and needs to be recreated if any part of the YANG model changes. The compilation process is usually started from the package Makefile by the `make` command.

## Showcase: Extending the CDB with Packages <a href="#d5e87" id="d5e87"></a>

{% hint style="info" %}
See [examples.ncs/getting-started/cdb-yang](https://github.com/NSO-developer/nso-examples/blob/6.4/getting-started/cdb-yang) for an example implementation.
{% endhint %}

### Prerequisites

Ensure that:

* No previous NSO or netsim processes are running. Use the `ncs --stop` and `ncs-netsim stop` commands to stop them if necessary.
* NSO Local Install with a fresh runtime directory has been created by the `ncs-setup --dest ~/nso-lab-rundir` or similar command.
* The environment variable `NSO_RUNDIR` points to this runtime directory, such as set by the `export NSO_RUNDIR=~/nso-lab-rundir` command. It enables the below commands to work as-is, without additional substitution needed.

### Step 1 - Create a Package <a href="#d5e102" id="d5e102"></a>

The easiest way to add your data fields to the CDB is by creating a service package. The package includes a YANG file for the service-specific data, which you can customize. You can create the initial package by simply invoking the `ncs-make-package` command. This command also sets up a `Makefile` with the code for compiling the YANG model.

Use the following command to create a new package:

```bash
$ ncs-make-package --service-skeleton python --build \
    --dest $NSO_RUNDIR/packages/my-data-entries my-data-entries
mkdir -p ../load-dir
mkdir -p java/src//
/nso/bin/ncsc  `ls my-data-entries-ann.yang  > /dev/null 2>&1 && echo "-a my-data-entries-ann.yang"` \
              -c -o ../load-dir/my-data-entries.fxs yang/my-data-entries.yang
$
```

The command line switches instruct the command to compile the YANG file and place the package in the right location.

### Step 2 - Add Package to NSO <a href="#d5e111" id="d5e111"></a>

Now start the NSO process if it is not running already and connect to the CLI:

```bash
$ cd $NSO_RUNDIR ; ncs ; ncs_cli -Cu admin

admin connected from 127.0.0.1 using console on nso
admin@ncs#
```

Next, instruct NSO to load the newly created package:

```cli
admin@ncs# packages reload

>>> System upgrade is starting.
>>> Sessions in configure mode must exit to operational mode.
>>> No configuration changes can be performed until upgrade has completed.
>>> System upgrade has completed successfully.
reload-result {
    package my-data-entries
    result true
}
```

Once the package loading process is completed, you can verify the data model from your package was incorporated into NSO. Use the `show` command, which now supports an additional parameter:

```cli
admin@ncs# show my-data-entries
% No entries found.
admin@ncs#
```

This command tells you that NSO knows about the extended data model but there is no actual data configured for it yet.

### Step 3 - Set Data <a href="#d5e124" id="d5e124"></a>

More interestingly, you are now able to add custom entries to the configuration. First, enter the CLI configuration mode:

```cli
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)#
```

Then add an arbitrary entry under my-data-entries:

```cli
admin@ncs(config)# my-data-entries "entry number 1"
admin@ncs(config-my-data-entries-entry number 1)#
```

What is more, you can also set a dummy IP address:

```cli
admin@ncs(config-my-data-entries-entry number 1)# dummy 0.0.0.0
admin@ncs(config-my-data-entries-entry number 1)#
```

However, if you try to use something different from a dummy, you will get an error. Likewise, if you try to assign a dummy a value that is not an IP address. How did NSO learn about this dummy value?

If you assumed from the YANG file, you are correct. YANG files provide the schema for the CDB and that dummy value comes from the YANG model in your package. Let's take a closer look.

### Step 4 - Inspect the YANG Module <a href="#d5e137" id="d5e137"></a>

Exit the configuration mode and discard the changes by typing `abort`:

```cli
admin@ncs(config-my-data-entries-entry number 1)# abort
admin@ncs#
```

Open the YANG file in an editor or list its contents from the CLI with the following command:

```cli
admin@ncs# file show packages/my-data-entries/src/yang/my-data-entries.yang
module my-data-entries {
< ... output omitted ... >
  list my-data-entries {
    < ... output omitted ... >
    leaf dummy {
      type inet:ipv4-address;
    }
  }
}
```

At the start of the output, you can see the module `my-data-entries`, which contains your data model. By default, the `ncs-make-package` gives it the same name as the package. You can check that this module is indeed loaded:

```cli
admin@ncs# show ncs-state loaded-data-models data-model my-data-entries

                                                                              EXPORTED  EXPORTED
NAME             REVISION  NAMESPACE                         PREFIX           TO ALL    TO
--------------------------------------------------------------------------------------------------
my-data-entries  -         http://com/example/mydataentries  my-data-entries  X         -

admin@ncs#
```

The `list my-data-entries` statement, located a bit further down in the YANG file, allowed you to add custom entries before. And near the end of the output, you can find the `leaf dummy` definition, with IPv4 as the type. This is the source of information that enables NSO to enforce a valid IP address as the value.

## Data Modeling Basics <a href="#d5e154" id="d5e154"></a>

NSO uses YANG to structure and enforce constraints on data that it stores in the CDB. YANG was designed to be extensible and handle all kinds of data modeling, which resulted in a number of language features that helped achieve this goal. However, there are only four fundamental elements (node types) for describing data:

* leaf nodes
* leaf-list nodes
* container nodes
* list nodes

You can then combine these elements into a complex, tree-like structure, which is why we refer to individual elements as nodes (of the data tree). In general, YANG separates nodes into those that hold data (`leaf`, `leaf-list`) and those that hold other nodes (container, list).

A `leaf` contains simple data such as an integer or a string. It has one value of a particular type and no child nodes. For example:

```yang
leaf host-name {
    type string;
    description "Hostname for this system";
}
```

This code describes the structure that can hold a value of a hostname (of some device). A `leaf` node is used because the hostname only has a single value, that is, the device has one (canonical) hostname. In the NSO CLI, you set a value of a `leaf` simply as:

```cli
admin@ncs(config)# host-name "server-NY-01"
```

A `leaf-list` is a sequence of leaf nodes of the same type. It can hold multiple values, very much like an array. For example:

```
leaf-list domains {
    type string;
    description "My favourite internet domains";
}
```

This code describes a data structure that can hold many values, such as a number of domain names. In the CLI, you can assign multiple values to a `leaf-list` with the help of square bracket syntax:

```cli
admin@ncs(config)# domains [ cisco.com tail-f.com ]
```

`leaf` and `leaf-list` describe nodes that hold simple values. As a model keeps expanding, having all data nodes on the same (top) level can quickly become unwieldy. A container node is used to group related nodes into a subtree. It has only child nodes and no value. A container may contain any number of child nodes of any type (including leafs, lists, containers, and leaf-lists). For example:

```yang
container server-admin {
    description "Administrator contact for this system";
    leaf name {
        type string;
    }
}
```

This code defines the concept of a server administrator. In the CLI, you first select the container before you access the child nodes:

```cli
admin@ncs(config)# server-admin name "Ingrid"
```

Similarly, a `list` defines a collection of container-like list entries that share the same structure. Each entry is like a record or a row in a table. It is uniquely identified by the value of its key leaf (or leaves). A list definition may contain any number of child nodes of any type (leafs, containers, other lists, and so on). For example:

```yang
list user-info {
    description "Information about team members";
    key "name";
    leaf name {
        type string;
    }
    leaf expertise {
        type string;
    }
}
```

This code defines a list of users (of which there can be many), where each user is uniquely identified by their name. In the CLI, lists take an additional parameter, the key value, to select a single entry:

```cli
admin@ncs(config)# user-info "Ingrid"
```

To set a value of a particular list entry, first specify the entry, then the child node, like so:

```cli
admin@ncs(config)# user-info "Ingrid" expertise "Linux"
```

Combining just these four fundamental YANG node types, you can build a very complex model that describes your data. As an example, the model for the configuration of a Cisco IOS-based network device, with its myriad features, is created with YANG. However, it makes sense to start with some simple models, to learn what kind of data they can represent and how to alter that data with the CLI.

## Showcase: Building and Testing a Model <a href="#d5e195" id="d5e195"></a>

{% hint style="info" %}
See [examples.ncs/getting-started/cdb-yang](https://github.com/NSO-developer/nso-examples/blob/6.4/getting-started/cdb-yang) for an example implementation.
{% endhint %}

### Prerequisites

Ensure that:

* No previous NSO or netsim processes are running. Use the `ncs --stop` and `ncs-netsim stop` commands to stop them if necessary.
* NSO Local Install with a fresh runtime directory has been created by the `ncs-setup --dest ~/nso-lab-rundir` or similar command.
* The environment variable `NSO_RUNDIR` points to this runtime directory, such as set by the `export NSO_RUNDIR=~/nso-lab-rundir` command. It enables the below commands to work as-is, without additional substitution needed.

### Step 1 - Create a Model Skeleton <a href="#d5e210" id="d5e210"></a>

You can add custom data models to NSO by using packages. So, you will build a package to hold the YANG module that represents your model. Use the following command to create a package (if you are building on top of the previous showcase, the package may already exist and will be updated):

```bash
$ ncs-make-package --service-skeleton python \
    --dest $NSO_RUNDIR/packages/my-data-entries my-data-entries
$
```

Change the working directory to the directory of your package:

```bash
$ cd $NSO_RUNDIR/packages/my-data-entries
```

You will place the YANG model into the `src/yang/my-test-model.yang` file. In a text editor, create a new file and add the following text at the start:

```yang
module my-test-model {
    namespace "http://example.tail-f.com/my-test-model";
    prefix "t";
```

The first line defines a new module and gives it a name. In addition, there are two more statements required: the `namespace` and `prefix`. Their purpose is to help avoid name collisions.

### Step 2 - Fill Out the Model <a href="#d5e224" id="d5e224"></a>

Add a statement for each of the four fundamental YANG node types (leaf, leaf-list, container, list) to the `my-test-model.yang` model.

```yang
    leaf host-name {
        type string;
        description "Hostname for this system";
    }
    leaf-list domains {
        type string;
        description "My favourite internet domains";
    }
    container server-admin {
        description "Administrator contact for this system";
        leaf name {
            type string;
        }
    }
    list user-info {
        description "Information about team members";
        key "name";
        leaf name {
            type string;
        }
        leaf expertise {
            type string;
        }
    }
```

Also, add the closing bracket for the module at the end:

```
}
```

Remember to finally save the file as `my-test-model.yang` in the `src/yang/` directory of your package. It is a best practice for the name of the file to match the name of the module.

### Step 3 - Compile and Load the Model <a href="#d5e234" id="d5e234"></a>

Having completed the model, you must compile it into an appropriate (`.fxs`) format. From the text editor first, return to the shell and then run the `make` command in the `src/` subdirectory of your package:

```bash
$ make -C src/
make: Entering directory 'nso-run/packages/my-data-entries/src'
/nso/bin/ncsc  `ls my-test-model-ann.yang  > /dev/null 2>&1 && echo "-a my-test-model-ann.yang"` \
              -c -o ../load-dir/my-test-model.fxs yang/my-test-model.yang
make: Leaving directory 'nso-run/packages/my-data-entries/src'
$
```

The compiler will report if there are errors in your YANG file, and you must fix them before continuing.

Next, start the NSO process and connect to the CLI:

```bash
$ cd $NSO_RUNDIR && ncs && ncs_cli -C -u admin

admin connected from 127.0.0.1 using console on nso
admin@ncs#
```

Finally, instruct NSO to reload the packages:

```cli
admin@ncs# packages reload

>>> System upgrade is starting.
>>> Sessions in configure mode must exit to operational mode.
>>> No configuration changes can be performed until upgrade has completed.
>>> System upgrade has completed successfully.
reload-result {
    package my-data-entries
    result true
}
admin@ncs#
```

### Step 4 - Test the Model <a href="#d5e248" id="d5e248"></a>

Enter the configuration mode by using the `config` command and test out how to set values for the data nodes you have defined in the YANG model:

* `host-name` leaf
* `domains` leaf-list
* `server-admin` container
* `user-info` list

Use the `?` and `TAB` keys to see the possible completions.

Now feel free to go back and experiment with the YANG file to see how your changes affect the data model. Just remember to rebuild and reload the package after you make any changes.

## Initialization Files <a href="#d5e268" id="d5e268"></a>

Adding a new YANG module to the CDB enables it to store additional data, however, there is nothing in the CDB for this module yet. While you can add configuration with the CLI, for example, there are situations where it makes sense to start with some initial data in the CDB already. This is especially true when a new instance starts for the first time and the CDB is empty.

In such cases, you can bootstrap the CDB data with XML files. There are various uses for this feature. For example, you can implement some default “factory settings” for your module or you might want to pre-load data when creating a new instance for testing.

In particular, some of the provided examples use the CDB init files mechanism to save you from typing out all of the initial configuration commands by hand. They do so by creating a file with the configuration encoded in the XML format.

When starting empty, the CDB will try to initialize the database from all XML files found in the directories specified by the `init-path` and `db-dir` settings in `ncs.conf` (please see [ncs.conf(5)](../../man/section5.md#ncs.conf) in Manual Pages for exact details). The loading process scans the files with the `.xml` suffix and adds all the data in a single transaction. In other words, there is no specified order in which the files are processed. This happens early during start-up, during the so-called start phase 1, described in [Starting NSO](../../administration/management/system-management/#ug.sys_mgmt.starting_ncs).

The content of the init file does not need to be a complete instance document but can specify just a part of the overall data, very much like the contents of the NETCONF `edit-config` operation. However, the end result of applying all the files must still be valid according to the model.

It is a good practice to wrap the data inside a `config` element, as it gives you the option to have multiple top-level data elements in a single file while it remains a valid XML document. Otherwise, you would have to use separate files for each of them. The following example uses the `config` element to fit all the elements into a single file.

{% code title="A Sample CDB init File my-test-data.xml" %}
```xml
<config xmlns="http://tail-f.com/ns/config/1.0">
  <host-name xmlns="http://example.tail-f.com/my-test-model">server-NY-01</host-name>

  <server-admin xmlns="http://example.tail-f.com/my-test-model">
    <name>Ingrid</name>
  </server-admin>
</config>
```
{% endcode %}

There are many ways to generate the XML data. A common approach is to dump existing data with the `ncs_load` utility or the `display xml` filter in the CLI. All of the data in the CDB can be represented (or exported, if you will) in XML. This is no coincidence. XML was the main format for encoding data with NETCONF when YANG was created and you can trace the origin of some YANG features back to XML.

{% code title="Creating init XML File with the ncs_load Command " %}
```bash
$ ncs_load -F p -p /domains > cdb-init.xml
$ cat cdb-init.xml
<config xmlns="http://tail-f.com/ns/config/1.0">
  <domains xmlns="http://example.tail-f.com/my-test-model">cisco.com</domains>
  <domains xmlns="http://example.tail-f.com/my-test-model">tail-f.com</domains>
</config>
$
```
{% endcode %}
