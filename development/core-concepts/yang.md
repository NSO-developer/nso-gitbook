---
description: Learn the working aspects of YANG data modeling language in NSO.
---

# YANG

YANG is a data modeling language used to model configuration and state data manipulated by a NETCONF agent. The YANG modeling language is defined in RFC 6020 (version 1) and RFC 7950 (version 1.1). YANG as a language will not be described in its entirety here - rather, we refer to the IETF RFC text at [RFC6020](https://www.ietf.org/rfc/rfc6020.txt) and [RFC7950](https://www.ietf.org/rfc/rfc7950.txt).

## YANG in NSO <a href="#d5e1847" id="d5e1847"></a>

In NSO, YANG is not only used for NETCONF data. On the contrary, YANG is used to describe the data model as a whole and used by all northbound interfaces.

NSO uses YANG for Service Models as well as for specifying device interfaces. Where do these models come from? When it comes to services, the YANG service model is specified as part of the service design activity. NSO ships several examples of service models that can be used as a starting point. For devices, it depends on the underlying device interface how the YANG model is derived. For native NETCONF/YANG devices the YANG model is of course given by the device. For SNMP devices, the NSO tool-chain generates the corresponding YANG modules, (SNMP NED). For CLI devices, the package for the device contains the YANG data model. This is shipped in text and can be modified to cater for upgrades. Customers can also write their own YANG data models to render the CLI integration (CLI NED). The situation for other interfaces is similar to CLI, a YANG model that corresponds to the device interface data model is written and bundled in the NED package.

NSO also relies on the revision statement in YANG modules for revision management of different versions of the same type of managed device, but running different software versions.

A YANG module can be directly transformed into a final schema (.fxs) file that can be loaded into NSO. Currently, all features of the YANG 1.0 language except the `anyxml` statement are supported. Most features of the YANG 1.1 language are supported. For a list of exceptions, please refer to the `YANG 1.1` section of the `ncsc` man page.

The data models including the .fxs file along with any code are bundled into packages that can be loaded to NSO. This is true for service applications as well as for NEDs and other packages. The corresponding YANG can be found in the `src/yang` directory in the package.

## YANG Introduction <a href="#d5e1856" id="d5e1856"></a>

This section is a brief introduction to YANG. The exact details of all language constructs are fully described in RFC 6020 and RFC 7950.

The NSO programmer must know YANG well since all APIs use various paths that are derived from the YANG data model.

### Modules and Submodules <a href="#d5e1860" id="d5e1860"></a>

A module contains three types of statements: module-header statements, revision statements, and definition statements. The module header statements describe the module and give information about the module itself, the revision statements give information about the history of the module, and the definition statements are the body of the module where the data model is defined.

A module may be divided into submodules, based on the needs of the module owner. The external view remains that of a single module, regardless of the presence or size of its submodules.

The `include` statement allows a module or submodule to reference material in submodules, and the `import` statement allows references to material defined in other modules.

### Data Modeling Basics <a href="#d5e1867" id="d5e1867"></a>

YANG defines four types of nodes for data modeling. In each of the following subsections, the example shows the YANG syntax as well as a corresponding NETCONF XML representation.

### Leaf Nodes <a href="#d5e1870" id="d5e1870"></a>

A leaf node contains simple data like an integer or a string. It has exactly one value of a particular type and no child nodes.

```yang
leaf host-name {
    type string;
    description "Hostname for this system";
}
```

With XML value representation for example:

```xml
<host-name>my.example.com</host-name>
```

An interesting variant of leaf nodes is typeless leafs.

```yang
leaf enabled {
    type empty;
    description "Enable the interface";
}
```

With XML value representation for example:

```xml
<enabled/>
```

### Leaf-list Nodes <a href="#d5e1884" id="d5e1884"></a>

A `leaf-list` is a sequence of leaf nodes with exactly one value of a particular type per leaf.

```
leaf-list domain-search {
         type string;
         description "List of domain names to search";
     }
```

With XML value representation for example:

```xml
<domain-search>high.example.com</domain-search>
<domain-search>low.example.com</domain-search>
<domain-search>everywhere.example.com</domain-search>
```

### Container Nodes <a href="#d5e1893" id="d5e1893"></a>

A `container` node is used to group related nodes in a subtree. It has only child nodes and no value and may contain any number of child nodes of any type (including leafs, lists, containers, and leaf-lists).

```yang
container system {
    container login {
        leaf message {
            type string;
            description
                "Message given at start of login session";
        }
    }
}
```

With XML value representation for example:

```xml
<system>
  <login>
    <message>Good morning, Dave</message>
  </login>
</system>
```

### List Nodes <a href="#d5e1902" id="d5e1902"></a>

A `list` defines a sequence of list entries. Each entry is like a structure or a record instance and is uniquely identified by the values of its key leafs. A list can define multiple keys and may contain any number of child nodes of any type (including leafs, lists, containers, etc.).

```yang
list user {
    key "name";
    leaf name {
        type string;
    }
    leaf full-name {
        type string;
    }
    leaf class {
        type string;
    }
}
```

With XML value representation for example:

```xml
<user>
  <name>glocks</name>
  <full-name>Goldie Locks</full-name>
  <class>intruder</class>
</user>
<user>
  <name>snowey</name>
  <full-name>Snow White</full-name>
  <class>free-loader</class>
</user>
<user>
  <name>rzull</name>
  <full-name>Repun Zell</full-name>
  <class>tower</class>
</user>
```

### Example Module <a href="#d5e1911" id="d5e1911"></a>

These statements are combined to define the module:

```
// Contents of "acme-system.yang"
module acme-system {
    namespace "http://acme.example.com/system";
    prefix "acme";

    organization "ACME Inc.";
    contact "joe@acme.example.com";
    description
        "The module for entities implementing the ACME system.";

    revision 2007-06-09 {
        description "Initial revision.";
    }

    container system {
        leaf host-name {
            type string;
            description "Hostname for this system";
        }

        leaf-list domain-search {
            type string;
            description "List of domain names to search";
        }

        container login {
            leaf message {
                type string;
                description
                    "Message given at start of login session";
            }

            list user {
                key "name";
                leaf name {
                    type string;
                }
                leaf full-name {
                    type string;
                }
                leaf class {
                    type string;
                }
            }
        }
    }
}
```

### State Data <a href="#d5e1916" id="d5e1916"></a>

YANG can model state data, as well as configuration data, based on the `config` statement. When a node is tagged with `config false`, its sub-hierarchy is flagged as state data, to be reported using NETCONF's `get` operation, not the `get-config` operation. Parent containers, lists, and key leafs are reported also, giving the context for the state data.

In this example, two leafs are defined for each interface, a configured speed, and an observed speed. The observed speed is not a configuration, so it can be returned with NETCONF `get` operations, but not with `get-config` operations. The observed speed is not configuration data, and cannot be manipulated using `edit-config`.

```yang
list interface {
    key "name";
    config true;

    leaf name {
        type string;
    }
    leaf speed {
        type enumeration {
            enum 10m;
            enum 100m;
            enum auto;
        }
    }
    leaf observed-speed {
        type uint32;
        config false;
    }
}
```

### Built-in Types <a href="#d5e1929" id="d5e1929"></a>

YANG has a set of built-in types, similar to those of many programming languages, but with some differences due to special requirements from the management domain. The following table summarizes the built-in types.

The table below lists YANG built-in types:

| Name                | Type        | Description                                       |
| ------------------- | ----------- | ------------------------------------------------- |
| binary              | Text        | Any binary data                                   |
| bits                | Text/Number | A set of bits or flags                            |
| boolean             | Text        | `true` or `false`                                 |
| decimal64           | Number      | 64-bit fixed point real number                    |
| empty               | Empty       | A leaf that does not have any value               |
| enumeration         | Text/Number | Enumerated strings with associated numeric values |
| identityref         | Text        | A reference to an abstract identity               |
| instance-identifier | Text        | References a data tree node                       |
| int8                | Number      | 8-bit signed integer                              |
| int16               | Number      | 16-bit signed integer                             |
| int32               | Number      | 32-bit signed integer                             |
| int64               | Number      | 64-bit signed integer                             |
| leafref             | Text/Number | A reference to a leaf instance                    |
| string              | Text        | Human readable string                             |
| uint8               | Number      | 8-bit unsigned integer                            |
| uint16              | Number      | 16-bit unsigned integer                           |
| uint32              | Number      | 32-bit unsigned integer                           |
| uint64              | Number      | 64-bit unsigned integer                           |
| union               | Text/Number | Choice of member types                            |

### Derived Types (`typedef`)

YANG can define derived types from base types using the `typedef` statement. A base type can be either a built-in type or a derived type, allowing a hierarchy of derived types. A derived type can be used as the argument for the `type` statement.

```
typedef percent {
    type uint16 {
        range "0 .. 100";
    }
    description "Percentage";
}

leaf completed {
    type percent;
}
```

With XML value representation for example:

```xml
<completed>20</completed>
```

User-defined typedefs are useful when we want to name and reuse a type several times. It is also possible to restrict leafs inline in the data model as in:

```yang
leaf completed {
    type uint16 {
        range "0 .. 100";
    }
    description "Percentage";
}
```

### Reusable Node Groups (`grouping`) <a href="#d5e2029" id="d5e2029"></a>

Groups of nodes can be assembled into the equivalent of complex types using the `grouping` statement. `grouping` defines a set of nodes that are instantiated with the `uses` statement:

```
grouping target {
    leaf address {
        type inet:ip-address;
        description "Target IP address";
    }
    leaf port {
        type inet:port-number;
        description "Target port number";
    }
}

container peer {
    container destination {
        uses target;
    }
}
```

With XML value representation for example:

```xml
<peer>
  <destination>
    <address>192.0.2.1</address>
    <port>830</port>
  </destination>
</peer>
```

The grouping can be refined as it is used, allowing certain statements to be overridden. In this example, the description is refined:

```yang
container connection {
    container source {
        uses target {
            refine "address" {
                description "Source IP address";
            }
            refine "port" {
                description "Source port number";
            }
        }
    }
    container destination {
        uses target {
            refine "address" {
                description "Destination IP address";
            }
            refine "port" {
                description "Destination port number";
            }
        }
    }
}
```

### Choices (`choice`) <a href="#d5e2043" id="d5e2043"></a>

YANG allows the data model to segregate incompatible nodes into distinct choices using the `choice` and `case` statements. The `choice` statement contains a set of `case` statements that define sets of schema nodes that cannot appear together. Each `case` may contain multiple nodes, but each node may appear in only one `case` under a `choice`.

When the nodes from one case are created, all nodes from all other cases are implicitly deleted. The device handles the enforcement of the constraint, preventing incompatibilities from existing in the configuration.

The choice and case nodes appear only in the schema tree, not in the data tree or XML encoding. The additional levels of hierarchy are not needed beyond the conceptual schema.

```yang
container food {
   choice snack {
       mandatory true;
       case sports-arena {
           leaf pretzel {
               type empty;
           }
           leaf beer {
               type empty;
           }
       }
       case late-night {
           leaf chocolate {
               type enumeration {
                   enum dark;
                   enum milk;
                   enum first-available;
               }
           }
       }
   }
}
```

With XML value representation for example:

```xml
<food>
  <chocolate>first-available</chocolate>
</food>
```

### Extending Data Models (`augment`) <a href="#d5e2060" id="d5e2060"></a>

YANG allows a module to insert additional nodes into data models, including both the current module (and its submodules) or an external module. This is useful e.g. for vendors to add vendor-specific parameters to standard data models in an interoperable way.

The `augment` statement defines the location in the data model hierarchy where new nodes are inserted, and the `when` statement defines the conditions when the new nodes are valid.

```yang
augment /system/login/user {
    when "class != 'wheel'";
    leaf uid {
        type uint16 {
            range "1000 .. 30000";
        }
    }
}
```

This example defines a `uid` node that only is valid when the user's `class` is not `wheel`.

If a module augments another model, the XML representation of the data will reflect the prefix of the augmenting model. For example, if the above augmentation were in a module with the prefix `other`, the XML would look like:

```xml
<user>
  <name>alicew</name>
  <full-name>Alice N. Wonderland</full-name>
  <class>drop-out</class>
  <other:uid>1024</other:uid>
</user>
```

### RPC Definitions <a href="#d5e2076" id="d5e2076"></a>

YANG allows the definition of NETCONF RPCs. The method names, input parameters, and output parameters are modeled using YANG data definition statements.

```
rpc activate-software-image {
    input {
        leaf image-name {
            type string;
        }
    }
    output {
        leaf status {
            type string;
        }
    }
}
```

```xml
<rpc message-id="101"
     xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
  <activate-software-image xmlns="http://acme.example.com/system">
    <name>acmefw-2.3</name>
 </activate-software-image>
</rpc>

<rpc-reply message-id="101"
           xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
  <status xmlns="http://acme.example.com/system">
    The image acmefw-2.3 is being installed.
  </status>
</rpc-reply>
```

### Notification Definitions <a href="#d5e2083" id="d5e2083"></a>

YANG allows the definition of notifications suitable for NETCONF. YANG data definition statements are used to model the content of the notification.

```
notification link-failure {
    description "A link failure has been detected";
    leaf if-name {
        type leafref {
            path "/interfaces/interface/name";
        }
    }
    leaf if-admin-status {
        type ifAdminStatus;
    }
}
```

```xml
<notification xmlns="urn:ietf:params:netconf:capability:notification:1.0">
  <eventTime>2007-09-01T10:00:00Z</eventTime>
  <link-failure xmlns="http://acme.example.com/system">
    <if-name>so-1/2/3.0</if-name>
    <if-admin-status>up</if-admin-status>
  </link-failure>
</notification>
```

## Working With YANG Modules <a href="#d5e2090" id="d5e2090"></a>

Assume we have a small trivial YANG file `test.yang`:

```yang
module test {
  namespace "http://tail-f.com/test";
  prefix "t";

  container top {
      leaf a {
          type int32;
      }
      leaf b {
          type string;
      }
  }
}
```

{% hint style="success" %}
There is an Emacs mode suitable for YANG file editing in the system distribution. It is called `yang-mode.el`.
{% endhint %}

We can use `ncsc` compiler to compile the YANG module.

```bash
$ ncsc -c test.yang
```

The above command creates an output file `test.fxs` that is a compiled schema that can be loaded into the system. The `ncsc` compiler with all its flags is fully described in [ncsc(1)](../../man/section1.md#ncsc) in Manual Pages.

There exist several standards-based auxiliary YANG modules defining various useful data types. These modules, as well as their accompanying `.fxs` files can be found in the `${NCS_DIR}/src/confd/yang` directory in the distribution.

The modules are:

* `ietf-yang-types`: Defining some basic data types such as counters, dates, and times.
* `ietf-inet-types`: Defining several useful types related to IP addresses.

Whenever we wish to use any of those predefined modules we need to not only import the module into our YANG module, but we must also load the corresponding .fxs file for the imported module into the system.

So, if we extend our test module so that it looks like:

```yang
module test {
    namespace "http://tail-f.com/test";
    prefix "t";

    import ietf-inet-types {
        prefix inet;
    }

    container top {
        leaf a {
            type int32;
        }
        leaf b {
            type string;
        }
        leaf ip {
            type inet:ipv4-address;
        }
    }
}
```

Normally when importing other YANG modules we must indicate through the `--yangpath` flag to `ncsc` where to search for the imported module. In the special case of the standard modules, this is not required.

We compile the above as:

```bash
$ ncsc -c test.yang
$ ncsc --get-info test.fxs
fxs file
Ncsc version:           "3.0_2"
uri:                    http://tail-f.com/test
id:                     http://tail-f.com/test
prefix:                 "t"
flags:                  6
type:                   cs
mountpoint:             undefined
exported agents:        all
dependencies:           ['http://www.w3.org/2001/XMLSchema',
                         'urn:ietf:params:xml:ns:yang:inet-types']
source:                 ["test.yang"]
```

We see that the generated `.fxs` file has a dependency on the standard `urn:ietf:params:xml:ns:yang:inet-types` namespace. Thus if we try to start NSO we must also ensure that the fxs file for that namespace is loaded.

Failing to do so gives:

```bash
$ ncs -c ncs.conf --foreground --verbose
The namespace urn:ietf:params:xml:ns:yang:inet-types (referenced by http://tail-f.com/test) could not be found in the loadPath.
Daemon died status=21
```

The remedy is to modify `ncs.conf` so that it contains the proper load path or to provide the directory containing the `fxs` file, alternatively, we can provide the path on the command line. The directory `${NCS_DIR}/etc/ncs` contains pre-compiled versions of the standard YANG modules.

```bash
$ ncs -c ncs.conf --addloadpath ${NCS_DIR}/etc/ncs --foreground --verbose
```

`ncs.conf` is the configuration file for NSO itself. It is described in the [ncs.conf(5)](../../man/section5.md#ncs.conf) in Manual Pages.

## Integrity Constraints <a href="#d5e2141" id="d5e2141"></a>

The YANG language has built-in declarative constructs for common integrity constraints. These constructs are conveniently specified as `must` statements.

A `must` statement is an XPath expression that must evaluate to true or a non-empty node-set.

An example is:

```yang
 container interface {
    leaf ifType {
        type enumeration {
            enum ethernet;
            enum atm;
        }
    }
    leaf ifMTU {
        type uint32;
    }
    must "ifType != 'ethernet' or "
      +  "(ifType = 'ethernet' and ifMTU = 1500)" {
        error-message "An ethernet MTU must be 1500";
    }
    must "ifType != 'atm' or "
       + "(ifType = 'atm' and ifMTU <= 17966 and ifMTU >= 64)" {
        error-message "An atm MTU must be  64 .. 17966";
    }
}
```

XPath is a very powerful tool here. It is often possible to express the most realistic validation constraints using XPath expressions. Note that for performance reasons, it is recommended to use the `tailf:dependency` statement in the `must` statement. The compiler gives a warning if a `must` statement lacks a `tailf:dependency` statement, and it cannot derive the dependency from the expression. The options `--fail-on-warnings` or `-E TAILF_MUST_NEED_DEPENDENCY` can be given to force this warning to be treated as an error. See `tailf:dependency` in [tailf\_yang\_extensions(5)](../../man/section5.md#tailf_yang_extensions) in Manual Pages for details.

Another useful built-in constraint checker is the `unique` statement.

With the YANG code:

```yang
list server {
      key "name";
      unique "ip port";
      leaf name {
          type string;
      }
      leaf ip {
          type inet:ip-address;
      }
      leaf port {
          type inet:port-number;
      }
  }
```

We specify that the combination of IP and port must be unique. Thus the configuration is not valid:

```xml
<server>
  <name>smtp</name>
  <ip>192.0.2.1</ip>
  <port>25</port>
</server>

<server>
  <name>http</name>
  <ip>192.0.2.1</ip>
  <port>25</port>
</server>
```

The usage of leafrefs (See the YANG specification) ensures that we do not end up with configurations with dangling pointers. Leafrefs are also especially good, since the CLI and Web UI can render a better interface.

If other constraints are necessary, validation callback functions can be programmed in Java, Python, or Erlang. See `tailf:validate` in [tailf\_yang\_extensions(5)](../../man/section5.md#tailf_yang_extensions) in Manual Pages for details.

## The `when` statement <a href="#d5e2173" id="d5e2173"></a>

The `when` statement is used to make its parent statement conditional. If the XPath expression specified as the argument to this statement evaluates to false, the parent node cannot be given configured. Furthermore, if the parent node exists, and some other node is changed so that the XPath expression becomes false, the parent node is automatically deleted. For example:

```yang
leaf a {
    type boolean;
}
leaf b {
    type string;
    when "../a = 'true'";
}
```

This data model snippet says that `b` can only exist if `a` is true. If `a` is true, and `b` has a value, and `a` is set to false, `b` will automatically be deleted.

Since the XPath expression in theory can refer to any node in the data tree, it has to be re-evaluated when any node in the tree is modified. But this would have a disastrous performance impact, so to avoid this, NSO keeps track of dependencies for each when expression. In many cases, the **confdc** can figure out these dependencies by itself. In the example above, NSO will detect that `b` is dependent on `a`, and evaluate `b`'s XPath expression only if `a` is modified. If `confdc` cannot detect the dependencies by itself, it requires a `tailf:dependency` statement in the `when` statement. See `tailf:dependency` in [tailf\_yang\_extensions(5)](../../man/section5.md#tailf_yang_extensions) in Manual Pages for details.

## Using the Tail-f Extensions with YANG <a href="#d5e2188" id="d5e2188"></a>

Tail-f has an extensive set of extensions to the YANG language that integrates YANG models in NSO. For example, when we have `config false;` data, we may wish to invoke user C code to deliver the statistics data in runtime. To do this we annotate the YANG model with a Tail-f extension called `tailf:callpoint`.

Alternatively, we may wish to invoke user code to validate the configuration, this is also controlled through an extension called `tailf:validate`.

All these extensions are handled as normal YANG extensions. (YANG is designed to be extended) We have defined the Tail-f proprietary extensions in a file `${NCS_DIR}/src/ncs/yang/tailf-common.yang`

Continuing with our previous example, by adding a callpoint and a validation point, we get:

```yang
module test {
   namespace "http://tail-f.com/test";
   prefix "t";

   import ietf-inet-types {
      prefix inet;
   }
   import tailf-common {
      prefix tailf;
   }

   container top {
      leaf a {
          type int32;
          config false;
          tailf:callpoint mycp;
      }
      leaf b {
         tailf:validate myvalcp {
            tailf:dependency "../a";
         }
         type string;
      }
      leaf ip {
         type inet:ipv4-address;
      }
   }
}
```

The above module contains a callpoint and a validation point. The exact syntax for all Tail-f extensions is defined in the `tailf-common.yang` file.

Note the import statement where we import `tailf-common`.

When we are using YANG specifications to generate Java classes for ConfM, these extensions are ignored. They only make sense on the device side. It is worth mentioning them though since EMS developers will certainly get the YANG specifications from the device developers, thus the YANG specifications may contain extensions

The man page [tailf\_yang\_extensions(5)](../../man/section5.md#tailf_yang_extensions) in Manual Pages describes all the Tail-f YANG extensions.

### Using a YANG Annotation File <a href="#d5e2207" id="d5e2207"></a>

Sometimes it is convenient to specify all Tail-f extension statements in-line in the original YANG module. But in some cases, e.g. when implementing a standard YANG module, it is better to keep the Tail-f extension statements in a separate annotation file. When the YANG module is compiled to an `fxs` file, the compiler is given the original YANG module and any number of annotation files.

A YANG annotation file is a normal YANG module that imports the module to annotate. Then the `tailf:annotate` statement is used to annotate nodes in the original module. For example, the module test above can be annotated like this:

```yang
module test {
   namespace "http://tail-f.com/test";
   prefix "t";

   import ietf-inet-types {
      prefix inet;
   }

   container top {
      leaf a {
          type int32;
          config false;
      }
      leaf b {
         type string;
      }
      leaf ip {
         type inet:ipv4-address;
      }
   }
}
```

```yang
module test-ann {
   namespace "http://tail-f.com/test-ann";
   prefix "ta";

   import test {
      prefix t;
   }
   import tailf-common {
      prefix tailf;
   }

   tailf:annotate "/t:top/t:a" {
       tailf:callpoint mycp;
   }

   tailf:annotate "/t:top" {
       tailf:annotate "t:b" {  // recursive annotation
           tailf:validate myvalcp {
               tailf:dependency "../t:a";
           }
       }
   }
}
```

To compile the module with annotations, use the `-a` parameter to `confdc`:

```
confdc -c -a test-ann.yang test.yang
```

## Custom Help Texts and Error Messages <a href="#d5e2219" id="d5e2219"></a>

Certain parts of a YANG model are used by northbound agents, e.g. CLI and Web UI, to provide the end-user with custom help texts and error messages.

### Custom Help Texts

A YANG statement can be annotated with a `description` statement which is used to describe the definition for a reader of the module. This text is often too long and too detailed to be useful as help text in a CLI. For this reason, NSO by default does not use the text in the `description` for this purpose. Instead, a tail-f-specific statement, `tailf:info` is used. It is recommended that the standard `description` statement contains a detailed description suitable for a module reader (e.g. NETCONF client or server implementor), and `tailf:info` contains a CLI help text.

As an alternative, NSO can be instructed to use the text in the `description` statement also for CLI help text. See the option **--use-description** in [ncsc(1)](../../man/section1.md#ncsc) in Manual Pages.

For example, CLI uses the help text to prompt for a value of this particular type. The CLI shows this information during tab/command completion or if the end-user explicitly asks for help using the `?-`character. The behavior depends on the mode the CLI is running in.

The Web UI uses this information likewise to help the end-user.

The `mtu` definition below has been annotated to enrich the end-user experience:

```yang
leaf mtu {
    type uint16 {
        range "1 .. 1500";
    }
    description
       "MTU is the largest frame size that can be transmitted
        over the network. For example, an Ethernet MTU is 1,500
        bytes. Messages longer than the MTU must be divided
        into smaller frames.";
    tailf:info
       "largest frame size";
}
```

### Custom Help Text in a `typedef` <a href="#d5e2240" id="d5e2240"></a>

Alternatively, we could have provided the help text in a `typedef` statement as in:

```
 typedef mtuType {
    type uint16 {
        range "1 .. 1500";
    }
    description
        "MTU is the largest frame size that can be transmitted over the
         network. For example, an Ethernet MTU is 1,500
         bytes. Messages longer than the MTU must be
         divided into smaller frames.";
    tailf:info
       "largest frame size";
}

leaf mtu {
    type mtuType;
}
```

If there is an explicit help text attached to a leaf, it overrides the help text attached to the type.

### Custom Error Messages <a href="#d5e2247" id="d5e2247"></a>

A statement can have an optional error message statement. The northbound agents, for example, the CLI uses this to inform the end-user about a provided value that is not of the correct type. If no custom error message statement is available NSO generates a built-in error message, e.g. `1505 is too large`.

All northbound agents use the extra information provided by an `error-message` statement.

The `typedef` statement below has been annotated to enrich the end-user experience when it comes to error information:

```
typedef mtuType {
   type uint32 {
       range "1..1500" {
           error-message
              "The MTU must be a positive number not "
            + "larger than 1500";
       }
   }
}
```

## Example: Modeling a List of Interfaces <a href="#d5e2256" id="d5e2256"></a>

Say, for example, that we want to model the interface list on a Linux-based device. Running the `ip link list` command reveals the type of information we have to model

```bash
$ /sbin/ip link list
1: eth0: <BROADCAST,MULTICAST,UP>; mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 00:12:3f:7d:b0:32 brd ff:ff:ff:ff:ff:ff
2: lo: <LOOPBACK,UP>; mtu 16436 qdisc noqueue
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
3: dummy0: <BROADCAST,NOARP> mtu 1500 qdisc noop
    link/ether a6:17:b9:86:2c:04 brd ff:ff:ff:ff:ff:ff
```

And, this is how we want to represent the above in XML:

```xml
<?xml version="1.0"?>
<config xmlns="http://example.com/ns/link">
  <links>
    <link>
      <name>eth0</name>
      <flags>
        <UP/>
        <BROADCAST/>
        <MULTICAST/>
      </flags>
      <addr>00:12:3f:7d:b0:32</addr>
      <brd>ff:ff:ff:ff:ff:ff</brd>
      <mtu>1500</mtu>
    </link>

    <link>
      <name>lo</name>
      <flags>
        <UP/>
        <LOOPBACK/>
      </flags>
      <addr>00:00:00:00:00:00</addr>
      <brd>00:00:00:00:00:00</brd>
      <mtu>16436</mtu>
    </link>
  </links>
</config>
```

An interface or a `link` has data associated with it. It also has a name, an obvious choice to use as the key - the data item that uniquely identifies an individual interface.

The structure of a YANG model is always a header, followed by type definitions, followed by the actual structure of the data. A YANG model for the interface list starts with a header:

```yang
module links {
    namespace "http://example.com/ns/links";
    prefix link;

    revision 2007-06-09 {
      description "Initial revision.";
    }
    ...
```

A number of datatype definitions may follow the YANG module header. Looking at the output from `/sbin/ip` we see that each interface has a number of boolean flags associated with it, e.g. `UP`, and `NOARP`.

One way to model a sequence of boolean flags is as a sequence of statements:

```yang
leaf UP {
    type boolean;
    default false;
}
leaf NOARP {
    type boolean;
    default false;
}
```

A better way is to model this as:

```yang
leaf UP {
    type empty;
}
leaf NOARP {
    type empty;
}
```

We could choose to group these leafs together into a grouping. This makes sense if we wish to use the same set of boolean flags in more than one place. We could thus create a named grouping such as:

```
grouping LinkFlags {
    leaf UP {
        type empty;
    }
    leaf NOARP {
        type empty;
    }
    leaf BROADCAST {
        type empty;
    }
    leaf MULTICAST {
        type empty;
    }
    leaf LOOPBACK {
        type empty;
    }
    leaf NOTRAILERS {
        type empty;
    }
}
```

The output from `/sbin/ip` also contains Ethernet MAC addresses. These are best represented by the `mac-address` type defined in the `ietf-yang-types.yang` file. The `mac-address` type is defined as:

```
typedef mac-address {
    type string {
        pattern '[0-9a-fA-F]{2}(:[0-9a-fA-F]{2}){5}';
    }
    description
       "The mac-address type represents an IEEE 802 MAC address.

       This type is in the value set and its semantics equivalent to
       the MacAddress textual convention of the SMIv2.";
    reference
      "IEEE 802: IEEE Standard for Local and Metropolitan Area
                 Networks: Overview and Architecture
       RFC 2579: Textual Conventions for SMIv2";
}
```

This defines a restriction on the string type, restricting values of the defined type `mac-address` to be strings adhering to the regular expression `[0-9a-fA-F]{2}(:[0-9a-fA-F]{2}){5}` Thus strings such as `a6:17:b9:86:2c:04` will be accepted.

Queue disciplines are associated with each device. They are typically used for bandwidth management. Another string restriction we could do is to define an enumeration of the different queue disciplines that can be attached to an interface.

We could write this as:

```
typedef QueueDisciplineType {
   type enumeration {
      enum pfifo_fast;
      enum noqueue;
      enum noop;
      enum htp;
   }
}
```

There are a large number of queue disciplines and we only list a few here. The example serves to show that by using enumerations we can restrict the values of the data set in a way that ensures that the data entered always is valid from a syntactical point of view.

Now that we have a number of usable datatypes, we continue with the actual data structure describing a list of interface entries:

```yang
container links {
    list link {
        key name;
        unique addr;
        max-elements 1024;
        leaf name {
            type string;
        }
        container flags {
            uses LinkFlags;
        }
        leaf addr {
            type yang:mac-address;
            mandatory true;
        }
        leaf brd {
            type yang:mac-address;
            mandatory true;
        }
        leaf qdisc {
            type QueueDisciplineType;
            mandatory true;
        }
        leaf qlen {
            type uint32;
            mandatory true;
        }
        leaf mtu {
            type uint32;
            mandatory true;
        }
    }
}
```

The `key` attribute on the leaf named "name" is important. It indicates that the leaf is the instance key for the list entry named `link`. All the `link` leafs are guaranteed to have unique values for their `name` leafs due to the key declaration.

If one leaf alone does not uniquely identify an object, we can define multiple keys. At least one leaf must be an instance key - we cannot have lists without a key.

List entries are ordered and indexed according to the value of the key(s).

### Modeling Relationships <a href="#ug.yang.relationships" id="ug.yang.relationships"></a>

A very common situation when modeling a device configuration is that we wish to model a relationship between two objects. This is achieved by means of the `leafref` statements. A `leafref` points to a child of a list entry which either is defined using a `key` or `unique` attribute.

The `leafref` statement can be used to express three flavors of relationships: extensions, specializations, and associations. Below we exemplify this by extending the `link` example from above.

Firstly, assume we want to put/store the queue disciplines from the previous section in a separate container - not embedded inside the `links` container.

We then specify a separate container, containing all the queue disciplines which each refers to a specific `link` entry. This is written as:

```yang
container queueDisciplines {
    list queueDiscipline {
        key linkName;
        max-elements 1024;
        leaf linkName {
            type leafref {
                path "/config/links/link/name";
            }
        }

        leaf type {
            type QueueDisciplineType;
            mandatory true;
        }
        leaf length {
            type uint32;
        }
    }
}
```

The `linkName` statement is both an instance key of the `queueDiscipline` list, and at the same time refers to a specific `link` entry. This way we can extend the amount of configuration data associated with a specific `link` entry.

Secondly, assume we want to express a restriction or specialization on Ethernet `link` entries, e.g. it should be possible to restrict interface characteristics such as 10Mbps and half duplex.

We then specify a separate container, containing all the specializations which each refers to a specific `link`:

```yang
container linkLimitations {
    list LinkLimitation {
        key linkName;
        max-elements 1024;
        leaf linkName {
            type leafref {
                path "/config/links/link/name";
            }
        }
        container limitations {
            leaf only10Mbs { type boolean;}
            leaf onlyHalfDuplex { type boolean;}
        }
    }
}
```

The `linkName` leaf is both an instance key to the `linkLimitation` list, and at the same time refers to a specific `link` leaf. This way we can restrict or specialize a specific `link`.

Thirdly, assume we want to express that one of the `link` entries should be the default link. In that case, we enforce an association between a non-dynamic `defaultLink` and a certain `link` entry:

```yang
leaf defaultLink {
    type leafref {
        path "/config/links/link/name";
    }
}
```

### Ensuring Uniqueness <a href="#d5e2348" id="d5e2348"></a>

Key leafs are always unique. Sometimes we may wish to impose further restrictions on objects. For example, we can ensure that all `link` entries have a unique MAC address. This is achieved through the use of the `unique` statement:

```yang
container servers {
    list server {
        key name;
        unique "ip port";
        unique "index";
        max-elements 64;
        leaf name {
            type string;
        }
        leaf index {
            type uint32;
            mandatory true;
        }
        leaf ip {
            type inet:ip-address;
            mandatory true;
        }
        leaf port {
            type inet:port-number;
            mandatory true;
        }
    }
}
```

In this example, we have two `unique` statements. These two groups ensure that each server has a unique index number as well as a unique IP and port pair.

### Default Values <a href="#d5e2357" id="d5e2357"></a>

A leaf can have a static or dynamic default value. Static default values are defined with the `default` statement in the data model. For example:

```yang
leaf mtu {
    type int32;
    default 1500;
}
```

and:

```yang
leaf UP {
    type boolean;
    default true;
}
```

A dynamic default value means that the default value for the leaf is the value of some other leaf in the data model. This can be used to make the default values configurable by the user. Dynamic default values are defined using the `tailf:default-ref` statement. For example, suppose we want to make the MTU default value configurable:

```yang
container links {
    leaf mtu {
        type uint32;
    }
    list link {
        key name;
        leaf name {
            type string;
        }
        leaf mtu {
            type uint32;
            tailf:default-ref '../../mtu';
        }
    }
}
```

Now suppose we have the following data:

```xml
<links>
  <mtu>1000</mtu>
  <link>
    <name>eth0</name>
    <mtu>1500</mtu>
  </link>
  <link>
    <name>eth1</name>
  </link>
</links>
```

In the example above, link `eth0` has the mtu 1500, and the link `eth1` has the `mtu` 1000. Since `eth1` does not have a `mtu` value set, it defaults to the value of `../../mtu`, which is 1000 in this case.

{% hint style="info" %}
Whenever a leaf has a default value, it implies that the leaf can be left out from the XML document, i.e. mandatory = false.
{% endhint %}

With the default value mechanism an old configuration can be used even after having added new settings.

Another example where default values are used is when a new instance is created. If all leafs within the instance have default values, these need not be specified in, for example, a NETCONF `create` operation.

### The Final Interface YANG Model <a href="#d5e2383" id="d5e2383"></a>

Here is the final interface YANG model with all constructs described above:

```yang
module links {
    namespace "http://example.com/ns/link";
    prefix link;

    import ietf-yang-types {
        prefix yang;
    }


    grouping LinkFlagsType {
        leaf UP {
            type empty;
        }
        leaf NOARP {
            type empty;
        }
        leaf BROADCAST {
            type empty;
        }
        leaf MULTICAST {
            type empty;
        }
        leaf LOOPBACK {
            type empty;
      }
        leaf NOTRAILERS {
            type empty;
        }
    }

    typedef QueueDisciplineType {
        type enumeration {
            enum pfifo_fast;
            enum noqueue;
            enum noop;
            enum htb;
        }
    }
    container config {
        container links {
            list link {
                key name;
                unique addr;
                max-elements 1024;
                leaf name {
                    type string;
                }
                container flags {
                    uses LinkFlagsType;
                }
                leaf addr {
                    type yang:mac-address;
                    mandatory true;
                }
                leaf brd {
                    type yang:mac-address;
                    mandatory true;
                }
                leaf mtu {
                    type uint32;
                    default 1500;
                }
            }
        }
        container queueDisciplines {
            list queueDiscipline {
                key linkName;
                max-elements 1024;
                leaf linkName {
                    type leafref {
                        path "/config/links/link/name";
                    }
                }
                leaf type {
                    type QueueDisciplineType;
                    mandatory true;
                }
                leaf length {
                    type uint32;
                }
            }
        }
        container linkLimitations {
            list linkLimitation {
                key linkName;
                leaf linkName {
                    type leafref {
                        path "/config/links/link/name";
                    }
                }
                container limitations {
                    leaf only10Mbps {
                        type boolean;
                        default false;
                    }
                    leaf onlyHalfDuplex {
                        type boolean;
                        default false;
                    }
                }
            }
        }
        container defaultLink {
            leaf linkName {
                type leafref {
                    path "/config/links/link/name";
                }
            }
        }
    }
}
```

If the above YANG file is saved on disk, as `links.yang`, we can compile and link it using the `confdc` compiler:

```bash
$ confdc -c links.yang
```

We now have a ready-to-use schema file named `links.fxs` on disk. To run this example, we need to copy the compiled `links.fxs` to a directory where NSO can find it.

## More on leafrefs <a href="#ug.yang.leafrefs" id="ug.yang.leafrefs"></a>

A `leafref` is used to model relationships in the data model, as described in [Modeling Relationships](yang.md#ug.yang.relationships). In the simplest case, the `leafref` is a single leaf that references a single key in a list:

```yang
list host {
    key "name";
    leaf name {
        type string;
    }
    ...
}

leaf host-ref {
    type leafref {
        path "../host/name";
    }
}
```

But sometimes a list has more than one key, or we need to refer to a list entry within another list. Consider this example:

```yang
list host {
    key "name";
    leaf name {
        type string;
    }

    list server {
        key "ip port";
        leaf ip {
            type inet:ip-address;
        }
        leaf port {
            type inet:port-number;
        }
        ...
    }
}
```

If we want to refer to a specific server on a host, we must provide three values; the host name, the server IP, and the server port. Using leafrefs, we can accomplish this by using three connected leafs:

```yang
leaf server-host {
    type leafref {
        path "/host/name";
    }
}
leaf server-ip {
    type leafref {
        path "/host[name=current()/../server-host]/server/ip";
    }
}
leaf server-port {
    type leafref {
        path "/host[name=current()/../server-host]"
           + "/server[ip=current()/../server-ip]/../port";
    }
}
```

The path specification for `server-ip` means the IP address of the server under the host with the same name as specified in `server-host`.

The path specification for `server-port` means the port number of the server with the same IP as specified in `server-ip`, under the host with the same name as specified in `server-host`.

This syntax quickly gets awkward and error-prone. NSO supports a shorthand syntax, by introducing an XPath function `deref()` (see [XPATH FUNCTIONS](../../man/section5.md#xpath-functions) in Manual Pages). Technically, this function follows a `leafref` value and returns all nodes that the `leafref` refers to (typically just one). The example above can be written like this:

```yang
leaf server-host {
    type leafref {
        path "/host/name";
    }
}
leaf server-ip {
    type leafref {
        path "deref(../server-host)/../server/ip";
    }
}
leaf server-port {
    type leafref {
        path "deref(../server-ip)/../port";
    }
}
```

Note that using the `deref` function is syntactic sugar for the basic syntax. The translation between the two formats is trivial. Also note that `deref()` is an extension to YANG, and third-party tools might not understand this syntax. To make sure that only plain YANG constructs are used in a module, the parameter `--strict-yang` can be given to `confdc -c`.

## Using Multiple Namespaces <a href="#d5e2425" id="d5e2425"></a>

There are several reasons for supporting multiple configuration namespaces. Multiple namespaces can be used to group common datatypes and hierarchies to be used by other YANG models. Separate namespaces can be used to describe the configuration of unrelated sub-systems, i.e. to achieve strict configuration data model boundaries between these sub-systems.

As an example, `datatypes.yang` is a YANG module that defines a reusable data type.

```yang
module datatypes {
  namespace "http://example.com/ns/dt";
  prefix dt;

  grouping countersType {
     leaf recvBytes {
        type uint64;
        mandatory true;
     }
     leaf sentBytes {
        type uint64;
        mandatory true;
     }
  }
}
```

We compile and link `datatypes.yang` into a final schema file representing the `http://example.com/ns/dt` namespace:

```bash
$ confdc -c datatypes.yang
```

To reuse our user defined `countersType`, we must import the `datatypes` module.

```yang
module test {
    namespace "http://tail-f.com/test";
    prefix "t";

    import datatypes {
        prefix dt;
    }

    container stats {
        uses dt:countersType;
    }
}
```

When compiling this new module that refers to another module, we must indicate to `confdc` where to search for the imported module:

```bash
$ confdc -c test.yang --yangpath /path/to/dt
```

`confdc` also searches for referred modules in the colon (:) separated path defined by the environment variable `YANG_MODPATH` and . (dot) is implicitly included.

## Module Names, Namespaces, and Revisions <a href="#ug.yang.names_namespaces_and_revisions" id="ug.yang.names_namespaces_and_revisions"></a>

We have three different entities that define our configuration data.

*   The module name. A system typically consists of several modules. In the future, we also expect to see standard modules in a manner similar to how we have standard SNMP modules.

    It is highly recommended to have the vendor name embedded in the module name, similar to how vendors have their names in proprietary MIBs today.
*   The XML namespace. A module defines a namespace. This is an important part of the module header. For example, we have:

    ```yang
     module acme-system {
         namespace "http://acme.example.com/system";
         .....
    ```

    \
    The namespace string must uniquely define the namespace. It is very important that once we have settled on a namespace we never change it. The namespace string should remain the same between revisions of a product. Do not embed revision information in the namespace string since that breaks manager-side NETCONF scripts.
*   The `revision` statement as in:

    ```yang
     module acme-system {
         namespace "http://acme.example.com/system";
         prefix "acme";

         revision 2007-06-09;
         .....
    ```

    \
    The revision is exposed to a NETCONF manager in the capabilities sent from the agent to the NETCONF manager in the initial hello message. The fine details of revision management are being worked on in the IETF NETMOD working group and are not finalized at the time of this writing.

    What is clear though, is that a manager should base its version decisions on the information in the revision string.

    \
    A capabilities reply from a NETCONF agent to the manager may look as:

    ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <hello xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
    <capabilities>
      <capability>urn:ietf:params:netconf:base:1.0</capability>
      <capability>urn:ietf:params:netconf:capability:writable-running:1.0</capability>
      <capability>urn:ietf:params:netconf:capability:candidate:1.0</capability>
      <capability>urn:ietf:params:netconf:capability:confirmed-commit:1.0</capability>
      <capability>urn:ietf:params:netconf:capability:xpath:1.0</capability>
      <capability>urn:ietf:params:netconf:capability:validate:1.0</capability>
      <capability>urn:ietf:params:netconf:capability:rollback-on-error:1.0</capability>
      <capability>http://example.com/ns/link?revision=2007-06-09</capability>
      ....
    ```

    where the revision information for the `http://example.com/ns/link` namespace is encoded as `?revision=2007-06-09` using standard URI notation.

    \
    When we change the data model for a namespace, it is recommended to change the revision statement and never make any changes to the data model that are backward incompatible. This means that all leafs that are added must be either optional or have a default value. That way it is ensured that the old NETCONF client code will continue to function on the new data model. Section 10 of RFC 6020 and section 11 of RFC 7950 define exactly what changes can be made to a data model to not break old NETCONF clients.

## Hash Values and the `id-value` Statement <a href="#ug.yang.id_value" id="ug.yang.id_value"></a>

Internally and in the programming APIs, NSO uses integer values to represent YANG node names and the namespace URI. This conserves space and allows for more efficient comparisons (including `switch` statements) in the user application code. By default, `confdc` automatically computes a hash value for the namespace URI and for each string that is used as a node name.

Conflicts can occur in the mapping between strings and integer values - i.e. the initial assignment of integers to strings is unable to provide a unique, bi-directional mapping. Such conflicts are extremely rare (but possible) when the default hashing mechanism is used.

The conflicts are detected either by `confdc` or by the NSO daemon when it loads the `.fxs` files.

If there are any conflicts reported they will pertain to XML tags (or the namespace URI),

There are two different cases:

* Two different strings mapped to the same integer. This is the classical hash conflict - extremely rare due to the high quality of the hash function used. The resolution is to manually assign a unique value to one of the conflicting strings. The value should be greater than 2^31+2 but less than 2^32-1. This way it will be out of the range of the automatic hash values, which are between 0 and 2^31-1. The best way to choose a value is by using a random number generator, as in `2147483649 + rand:uniform(2147483645)`. The `tailf:id-value` should be placed as a substatement to the statement where the conflict occurs, or in the `module` statement in case of namespace URI conflict.
* One string mapped to two different integers. This is even more rare than the previous case - it can only happen if a hash conflict was detected and avoided through the use of `tailf:id-value` on one of the strings, and that string also occurs somewhere else. The resolution is to add the same `tailf:id-value` to the second occurrence of the string.

## NSO Caveats <a href="#ug.yang.caveats" id="ug.yang.caveats"></a>

### The `union` Type and Value Conversion <a href="#d5e2497" id="d5e2497"></a>

When converting a string to an enumeration value, the order of types in the union is important when the types overlap. The first matching type will be used, so we recommend having the narrower (or more specific) types first.

Consider the example below:

```yang
leaf example {
  type union {
    type string; // NOTE: widest type first
    type int32;
    type enumeration {
      enum "unbounded";
    }
  }
}
```

Converting the string `42` to a typed value using the YANG model above, will always result in a string value even though it is the string representation of an `int32`. Trying to convert the string `unbounded` will also result in a string value instead of the enumeration because the enumeration is placed after the string.

Instead, consider the example below where the string (being a wider type) is placed last:

```yang
leaf example {
  type union {
    type enumeration {
      enum "unbounded";
    }
    type int32;
    type string; // NOTE: widest type last
  }
}
```

Converting the string `42` to the corresponding union value will result in a `int32`. Trying to convert the string `unbounded` will also result in the enumeration value as expected. The relative order of the `int32` and enumeration does not matter as they do not overlap.

Using the C and Python APIs to convert a string to a given value is further limited by the lack of restriction matching on the types. Consider the following example:

```yang
leaf example {
  type union {
    type string {
      pattern "[a-z]+[0-9]+";
    }
    type int32;
  }
}
```

Converting the string `42` will result in a string value, even though the pattern requires the string to begin with a character in the "a" to "z" range. This value will be considered invalid by NSO if used in any calls handled by NSO.

To avoid issues when working with unions place wider types at the end. As an example put `string` last, `int8` before `int16` etc.

### User-defined Types <a href="#d5e2524" id="d5e2524"></a>

When using user-defined types together with NSO the compiled schema does not contain the original type as specified in the YANG file. This imposes some limitations on the running system.

High-level APIs are unable to infer the correct type of a value as this information is left out when the schema is compiled. It is possible to work around this issue by specifying the type explicitly whenever setting values of a user-defined type.

### XML Representation: Union of `type` `empty` and `type` `string`

The normal representation of a type `empty` leaf in XML is `<leaf-name/>`. However, there is an exception when a leaf is a union of type `empty` and for example type `string`. Consider the example below:

```yang
leaf example {
  type union {
    type empty;
    type string;
  }
}
```

In this case, both `<example>example</example>` and `</example>` will represent `empty` being set.
