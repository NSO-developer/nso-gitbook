---
description: Explore service development in detail.
---

# Implementing Services

## A Template is All You Need <a href="#ch_services.just_template" id="ch_services.just_template"></a>

To demonstrate the simplicity a pure model-to-model service mapping affords, let us consider the most basic approach to providing the mapping: the service XML template. The XML template is an XML-encoded file that tells NSO what configuration to generate when someone requests a new service instance.

The first thing you need is the relevant device configuration (or configurations if multiple devices are involved). Suppose you must configure `192.0.2.1` as a DNS server on the target device. Using the NSO CLI, you first enter the device configuration, then add the DNS server. For a Cisco IOS-based device:

```cli
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# devices device c1 config
admin@ncs(config-config)# ip name-server 192.0.2.1
admin@ncs(config-config)# top
admin@ncs(config)#
```

Note here that the configuration is not yet committed and you can use the `commit dry-run outformat xml` command to produce the configuration in the XML format. This format is an excellent starting point for creating an XML template.

```cli
admin@ncs(config)# commit dry-run outformat xml

result-xml {
    local-node {
        data <devices xmlns="http://tail-f.com/ns/ncs">
               <device>
                 <name>c1</name>
                 <config>
                   <ip xmlns="urn:ios">
                     <name-server>192.0.2.1</name-server>
                   </ip>
                 </config>
               </device>
             </devices>
    }
}
```

The interesting portion is the part between `<devices>` and `</devices>` tags.

Another way to get the XML output is to list the existing device configuration in NSO by piping it through the `display xml` filter:

```cli
admin@ncs# show running-config devices device c1 config ip name-server | display xml

<config xmlns="http://tail-f.com/ns/config/1.0">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>c1</name>
      <config>
        <ip xmlns="urn:ios">
          <name-server>192.0.2.1</name-server>
        </ip>
      </config>
    </device>
  </devices>
</config>
```

If there is a lot of data, it is easy to save the output to a file using the `save` pipe in the CLI, instead of copying and pasting it by hand:

```cli
admin@ncs# show running-config devices device c1 config ip name-server | display xml\
 | save dns-template.xml
```

The last command saves the configuration for a device in the `dns-template.xml` file using XML format. To use it in a service, you need a service package.

You create an empty, skeleton service with the `ncs-make-package` command, such as:

```bash
ncs-make-package --build --no-test --service-skeleton template dns
```

The command generates the minimal files necessary for a service package, here named `dns`. One of the files is `dns/templates/dns-template.xml`, which is where the configuration in the XML format goes.

```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0"
                 servicepoint="dns">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <!-- ... more statements here ... -->
  </devices>
</config-template>
```

If you look closely, there is one significant difference from the `show running-config` output: the template uses the `config-template` XML root tag, instead of `config`. This tag also has the `servicepoint` attribute. Other than that, you can use the XML formatted configuration from the CLI as-is.

Bringing the two XML documents together gives the final `dns/templates/dns-template.xml` XML template:

#### **Static DNS Configuration Template Example:**

{% code title="Example: Static DNS Configuration Template" %}
```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0"
                 servicepoint="dns">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>c1</name>
      <config>
        <ip xmlns="urn:ios">
          <name-server>192.0.2.1</name-server>
        </ip>
      </config>
    </device>
  </devices>
</config-template>
```
{% endcode %}

The service is now ready to use in NSO. Start the `examples.ncs/implement-a-service/dns-v1` example to set up a live NSO system with such a service and inspect how it works. Try configuring two different instances of the `dns` service.

```bash
$ cd $NCS_DIR/examples.ncs/implement-a-service/dns-v1
$ make demo
```

The problem with this service is that it always does the same thing because it always generates exactly the same configuration. It would be much better if the service could configure different devices. The updated version, v1.1, uses a slightly modified template:

```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0"
                 servicepoint="dns">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>{/name}</name>
      <config>
        <ip xmlns="urn:ios">
          <name-server>192.0.2.1</name-server>
        </ip>
      </config>
    </device>
  </devices>
</config-template>
```

The changed part is `<name>{/name}</name>`, which now uses the `{/name}` code instead of a hard-coded `c1` value. The curly braces indicate that NSO should evaluate the enclosed expression and use the resulting value in its place. The `/name` expression is an XPath expression, referencing the service YANG model. In the model, `name` is the name you give each service instance. In this case, the instance name doubles for identifying the target device.

```cli
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# dns c2
admin@ncs(config-dns-c2)# commit dry-run

cli {
    local-node {
        data  devices {
                  device c2 {
                      config {
                          ip {
             +                name-server 192.0.2.1;
                          }
                      }
                  }
              }
             +dns c2 {
             +}
    }
}
```

In the output, the instance name used was `c2` and that is why the service performs DNS configuration for the c2 device.

The template actually allows a decent amount of programmability through XPath and special XML processing instructions. For example:

```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0"
                 servicepoint="dns">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>{/name}</name>
      <config>
        <ip xmlns="urn:ios">
          <?if {starts-with(/name, 'c1')}?>
            <name-server>192.0.2.1</name-server>
          <?else?>
            <name-server>192.0.2.2</name-server>
          <?end?>
        </ip>
      </config>
    </device>
  </devices>
</config-template>
```

In the preceding printout, the XPath `starts-with()` function is used to check if the device name starts with a specific prefix. Then one set of configuration items is used, and a different one otherwise. For additional available instructions and the complete set of template features, see [Templates](templates.md).

However, most provisioning tasks require some kind of input to be useful. Fortunately, you can define any number of input parameters in the service model that you can then reference from the template; either to use directly in the configuration or as something to base provisioning decisions on.

## Service Model Captures Inputs <a href="#ch_services.input" id="ch_services.input"></a>

The YANG service model specifies the input parameters a service in NSO takes. For a specific service model think of the parameters that a northbound system sends to NSO or the parameters that a network engineer needs to enter in the NSO CLI.

Even a service as simple as the DNS configuration service usually needs some parameters, such as the target device. The service model gives each parameter a name and defines validation rules, ensuring the client-provided values fit what the service expects.

Suppose you want to add a parameter for the target device to the simple DNS configuration service. You need to construct an appropriate service model, adding a YANG leaf to capture this input.

{% hint style="info" %}
This task requires some basic YANG knowledge. Review the section [Data Modeling Basics](../introduction-to-automation/cdb-and-yang.md#d5e154) for a primer on the main building blocks of the YANG language.
{% endhint %}

The service model is located in the `src/yang/servicename.yang` file in the package. It typically resembles the following structure:

```yang
  list servicename {
    key name;

    uses ncs:service-data;
    ncs:servicepoint "servicename";

    leaf name {
      type string;
    }

    // ... other statements ...
  }
```

The list named after the package (`servicename` in the example) is the interesting part.

The `uses ncs:service-data` and `ncs:servicepoint` statements differentiate this list from any standard YANG list and make it a service. Each list item in NSO represents a service instance of this type.

The `uses ncs:service-data` part allows the system to store internal state and provide common service actions, such as `re-deploy` and `get-modifications` for each service instance.

The `ncs:servicepoint` identifies which part of the system is responsible for the service mapping. For a template-only service, it is the XML template that uses the same service point value in the `config-template` element.

The `name` leaf serves as the key of the list and is primarily used to distinguish service instances from each other.

The remaining statements describe the functionality and input parameters that are specific to this service. This is where you add the new leaf for the target device parameter of the DNS service:

```yang
  list dns {
    key name;

    uses ncs:service-data;
    ncs:servicepoint "dns";

    leaf name {
      type string;
    }

    leaf target-device {
      type string;
    }
  }
```

Use the `examples.ncs/implement-a-service/dns-v2` example to explore how this model works and try to discover what deficiencies it may have.

```bash
$ cd $NCS_DIR/examples.ncs/implement-a-service/dns-v2
$ make demo
```

In its current form, the model allows you to specify any value for `target-device`, including none at all! Obviously, this is not good as it breaks the provisioning of the service. But even more importantly, not validating the input may allow someone to use the service in the way you have not intended and perhaps bring down the network.

You can guard against invalid input with the help of additional YANG statements. For example:

```yang
    leaf target-device {
      mandatory true;
      type string {
        length "2";
        pattern "c[0-2]";
      }
    }
```

Now this parameter is mandatory for every service instance and must be one of the string literals: `c0`, `c1`, or `c2`. This format is defined by the regular expression in the `pattern` statement. In this particular case, the `length` restriction is redundant but demonstrates how you can combine multiple restrictions. You can even add multiple `pattern` statements to handle more complex cases.

What if you wanted to make the DNS server address configurable too? You can add another leaf to the service model:

```yang
    leaf dns-server-ip {
      type inet:ipv4-address {
        pattern "192\\.0\\.2\\..*";
      }
    }
```

There are three notable things about this leaf:

* There is no mandatory statement, meaning the value for this leaf is optional. The XML template will be designed to provide some default value if none is given.
* The type of the leaf is `inet:ipv4-address`, which restricts the value for this leaf to an IP address.
* The `inet:ipv4-address` type is further restricted using a regular expression to only allow IP addresses from the 192.0.2.0/24 range.

YANG is very powerful and allows you to model all kinds of values and restrictions on the data. In addition to the ones defined in the YANG language ([RFC 7950, section 9](https://datatracker.ietf.org/doc/html/rfc7950#section-9)), predefined types describing common networking concepts, such as those from the `inet` namespace ([RFC 6991](https://datatracker.ietf.org/doc/html/rfc6991#section-2)), are available to you out of the box. It is much easier to validate the inputs when so many options are supported.

The one missing piece for the service is the XML template. You can take the Example [Static DNS Configuration Template](implementing-services.md#static-dns-configuration-template-example) as a base and tweak it to reference the defined inputs.

Using the code `{`_`XYZ`_`}` or `{/`_`XYZ`_`}` in the template, instructs NSO to look for the value in the service instance data, in the node with the name _`XYZ`_. So, you can refer to the target-device input parameter as defined in YANG with the `{/target-device}` code in the XML template.

{% hint style="info" %}
The code inside the curly brackets actually contains an XPath 1.0 expression with the service instance data as its root, so an absolute path (with a slash) and a relative one (without it) refer to the same node in this case, and you can use either.
{% endhint %}

The final, improved version of the DNS service template that takes into account the new model, is:

```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0"
                 servicepoint="dns">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>{/target-device}</name>
      <config>
        <ip xmlns="urn:ios">
          <?if {/dns-server-ip}?>
            <!-- If dns-server-ip is set, use that. -->
            <name-server>{/dns-server-ip}</name-server>
          <?else?>
            <!-- Otherwise, use the default one. -->
            <name-server>192.0.2.1</name-server>
          <?end?>
        </ip>
      </config>
    </device>
  </devices>
</config-template>
```

The following figure captures the relationship between the YANG model and the XML template that ultimately produces the desired device configuration.

The complete service is available in the `examples.ncs/implement-a-service/dns-v2.1` example. Feel free to investigate on your own how it differs from the initial, no-validation service.

```bash
$ cd $NCS_DIR/examples.ncs/implement-a-service/dns-v2.1
$ make demo
```

## Extracting the Service Parameters <a href="#ch_services.model" id="ch_services.model"></a>

When the service is simple, constructing the YANG model and creating the service mapping (the XML template) is straightforward. Since the two components are mostly independent, you can start your service design with either one.

If you write the YANG model first, you can load it as a service package into NSO (without having any mapping defined) and iterate on it. This way, you can try the model, which is the interface to the service, with network engineers or northbound systems before investing the time to create the mapping. This model-first approach is also sometimes called top-down.

The alternative is to create the mapping first. Especially for developers new to NSO, the template-first, or bottom-up, approach is often easier to implement. With this approach, you templatize the configuration and extract the required service parameters from the template.

Experienced NSO developers naturally combine the two approaches, without much thinking. However, if you have trouble modeling your service at first, consider following the template-first approach demonstrated here.

For the following example, suppose you want the service to configure IP addressing on an ethernet interface. You know what configuration is required to do this manually for a particular ethernet interface. For a Cisco IOS-based device you would use the commands, such as:

```cli
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# devices device c1 config
admin@ncs(config-config)# interface GigabitEthernet 0/0
admin@ncs(config-if)# ip address 192.168.5.1 255.255.255.0
```

To transform this configuration into a reusable service, complete the following steps:

* Create an XML template with hard-coded values.
* Replace each value specific to this instance with a parameter reference.
* Add each parameter to the YANG model.
* Add parameter validation.
* Consolidate and clean up the YANG model as necessary.

Start by generating the configuration in the XML format, making use of the `display xml` filter. Note that the XML output will not necessarily be a one-to-one mapping of the CLI commands; the XML reflects the device YANG model which can be more complex but the commands on the CLI can hide some of this complexity.

The transformation to a template also requires you to change the root tag, which produces the resulting XML template:

```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0"
                 servicepoint="iface-servicepoint">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>c1</name>
      <config>
        <interface xmlns="urn:ios">
          <GigabitEthernet>
            <name>0/0</name>
            <ip>
              <address>
                <primary>
                  <address>192.168.5.1</address>
                  <mask>255.255.255.0</mask>
                </primary>
              </address>
            </ip>
          </GigabitEthernet>
        </interface>
      </config>
    </device>
  </devices>
</config-template>
```

However, this template has all the values hard-coded and only configures one specific interface on one specific device.

Now you must replace all the dynamic parts that vary from service instance to service instance with references to the relevant parameters. In this case, it is data specific to each device: which interface and which IP address to use.

Suppose you pick the following names for the variable parameters:

1. `device`: The network device to configure.
2. `interface`: The network interface on the selected device.
3. `ip-address`: The IP address to use on the selected interface.

Generally, you can make up any name for a parameter but it is best to follow the same rules that apply for naming variables in programming languages, such as making the name descriptive but not excessively verbose. It is customary to use a hyphen (minus sign) to concatenate words and use all-lowercase (“kebab-case”), which is the convention used in the YANG language standards.

The corresponding template then becomes:

```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0"
                 servicepoint="iface-servicepoint">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>{/device}</name>
      <config>
        <interface xmlns="urn:ios">
          <GigabitEthernet>
            <name>{/interface}</name>
            <ip>
              <address>
                <primary>
                  <address>{/ip-address}</address>
                  <mask>255.255.255.0</mask>
                </primary>
              </address>
            </ip>
          </GigabitEthernet>
        </interface>
      </config>
    </device>
  </devices>
</config-template>
```

Having completed the template, you can add all the parameters, three in this case, to the service model.

The partially completed model is now:

```yang
  list iface {
    key name;

    uses ncs:service-data;
    ncs:servicepoint "iface-servicepoint";

    leaf name {
      type string;
    }

    leaf device { ... }

    leaf interface { ... }

    leaf ip-address { ... }
  }
```

Missing are the data type and other validation statements. At this point, you could fill out the model with generic `type string` statements, akin to the `name` leaf. This is a useful technique to test out the service in early development. But here you can complete the model directly, as it contains only three parameters.

You can use a `leafref` type leaf to refer to a device by its name in the NSO. This type uses dynamic lookup at the specified path to enumerate the available values. For the `device` leaf, it lists every value for a device name that NSO knows about. If there are two devices managed by NSO, named `rtr-sjc-01` and `rtr-sto-01`, either “`rtr-sjc-01`” or “`rtr-sto-01`” are valid values for such a leaf. This is a common way to refer to devices in NSO services.

```yang
    leaf device {
      mandatory true;
      type leafref {
        path "/ncs:devices/ncs:device/ncs:name";
      }
    }
```

In a similar fashion, restrict the valid values of the other two parameters.

```yang
    leaf interface {
      mandatory true;
      type string {
        pattern "[0-9]/[0-9]+";
      }
    }

    leaf ip-address {
      mandatory true;
      type inet:ipv4-address;
    }
  }
```

You would typically create the service package skeleton with the `ncs-make-package` command and update the model in the `.yang` file. The model in the skeleton might have some additional example leafs that you do not need and should remove to finalize the model. That gives you the final, full-service model:

```yang
  list iface {
    key name;

    uses ncs:service-data;
    ncs:servicepoint "iface-servicepoint";

    leaf name {
      type string;
    }

    leaf device {
      mandatory true;
      type leafref {
        path "/ncs:devices/ncs:device/ncs:name";
      }
    }

    leaf interface {
      mandatory true;
      type string {
        pattern "[0-9]/[0-9]+";
      }
    }

    leaf ip-address {
      mandatory true;
      type inet:ipv4-address;
    }
  }
```

The `examples.ncs/implement-a-service/iface-v1` example contains the complete YANG module with this service model in the `packages/iface-v1/src/yang/iface.yang` file, as well as the corresponding service template in `packages/iface-v1/templates/iface-template.xml`.

## FASTMAP and Service Life Cycle <a href="#ch_services.fastmap" id="ch_services.fastmap"></a>

The YANG model and the mapping (the XML template) are the two main components required to implement a service in NSO. The hidden part of the system that makes such an approach feasible is called FASTMAP.

FASTMAP covers the complete service life cycle: creating, changing, and deleting the service. It requires a minimal amount of code for mapping from a service model to a device model.

FASTMAP is based on generating changes from an initial create operation. When the service instance is created the reverse of the resulting device configuration is stored together with the service instance. If an NSO user later changes the service instance, NSO first applies (in an isolated transaction) the reverse diff of the service, effectively undoing the previous create operation. Then it runs the logic to create the service again and finally performs a diff against the current configuration. Only the result of the diff is then sent to the affected devices.

{% hint style="warning" %}
It is therefore very important that the service create code produces the same device changes for a given set of input parameters every time it is executed. See [Persistent Opaque Data](../advanced-development/developing-services/services-deep-dive.md#ch_svcref.opaque) for techniques to achieve this.
{% endhint %}

If the service instance is deleted, NSO applies the reverse diff of the service, effectively removing all configuration changes the service did on the devices.

Assume we have a service model that defines a service with attributes X, Y, and Z. The mapping logic calculates that attributes A, B, and C must be set on the devices. When the service is instantiated, the previous values of the corresponding device attributes A, B, and C are stored with the service instance in the CDB. This allows NSO to bring the network back to the state before the service was instantiated.

Now let us see what happens if one service attribute is changed. Perhaps the service attribute Z is changed. NSO will execute the mapping as if the service was created from scratch. The resulting device configurations are then compared with the actual configuration and the minimal diff is sent to the devices. Note that this is managed automatically, there is no code to handle the specific "change Z" operation.

When a user deletes a service instance, NSO retrieves the stored device configuration from the moment before the service was created and reverts to it.

## Templates and Code

For a complex service, you may realize that the input parameters for a service are not sufficient to render the device configuration. Perhaps the northbound system only provides a subset of the required parameters. For example, the other system wants NSO to pick an IP address and does not pass it as an input parameter. Then, additional logic or API calls may be necessary but XML templates provide no such functionality on their own.

The solution is to augment XML templates with custom code. Or, more accurately, create custom provisioning code that leverages XML templates. Alternatively, you can also implement the mapping logic completely in the code and not use templates at all. The latter, forgoing the templates altogether, is less common, since templates have a number of beneficial properties.

Templates separate the way parameters are applied, which depends on the type of target device, from calculating the parameter values. For example, you would use the same code to find the IP address to apply on a device, but the actual configuration might differ whether it is a Cisco IOS (XE) device, an IOS XR, or another vendor entirely.

Moreover, if you use templates, NSO can automatically validate the templates being compatible with the used NEDs, which allows you to sidestep whole groups of bugs.

NSO offers multiple programming languages to implement the code. The `--service-skeleton` option of the `ncs-make-package` command influences the selection of the programming language and if the generated code should contain sample calls for applying an XML template.

Suppose you want to extend the template-based ethernet interface addressing service to also allow specifying the netmask. You would like to do this in the more modern, CIDR-based single number format, such as is used in the 192.168.5.1/24 format (the /24 after the address). However, the generated device configuration takes the netmask in the dot-decimal format, such as 255.255.255.0, so the service needs to perform some translation. And that requires a custom service code.

Such a service will ultimately contain three parts: the service YANG model, the translation code, and the XML template. The model and the template serve the same purpose as before, while custom code provides fine-grained control over how templates are applied and the data available to them.

Since the service is based on the previous interface addressing service, you can save yourself a lot of work by starting with the existing YANG model and XML template.

The service YANG model needs an additional `cidr-netmask` leaf to hold the user-provided netmask value:

```yang
  list iface {
    key name;

    uses ncs:service-data;
    ncs:servicepoint "iface-servicepoint";

    leaf name {
      type string;
    }

    leaf device {
      mandatory true;
      type leafref {
        path "/ncs:devices/ncs:device/ncs:name";
      }
    }

    leaf interface {
      mandatory true;
      type string {
        pattern "[0-9]/[0-9]+";
      }
    }

    leaf ip-address {
      mandatory true;
      type inet:ipv4-address;
    }

    leaf cidr-netmask {
      default 24;
      type uint8 {
        range "0..32";
      }
    }
  }
```

This leaf stores a small number (of `uint8` type), with values between 0 and 32. It also specifies a default of 24, which is used when the client does not supply a value for this parameter.

The previous XML template also requires only minor tweaks. A small but important change is the removal of the `servicepoint` attribute on the top element. Since it is gone, NSO does not apply the template directly for each service instance. Instead, your custom code registers itself on this servicepoint and is responsible for applying the template.

The reason for it being this way is that the code will supply the value for the additional variable, here called `NETMASK`. This is the other change that is necessary in the template: referencing the `NETMASK` variable for the netmask value:

```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>{/device}</name>
      <config>
        <interface xmlns="urn:ios">
          <GigabitEthernet>
            <name>{/interface}</name>
            <ip>
              <address>
                <primary>
                  <address>{/ip-address}</address>
                  <mask>{$NETMASK}</mask>
                </primary>
              </address>
            </ip>
          </GigabitEthernet>
        </interface>
      </config>
    </device>
  </devices>
</config-template>
```

Unlike references to other parameters, `NETMASK` does not represent a data path but a variable. It must start with a dollar character (`$`) to distinguish it from a path. As shown here, variables are often written in all-uppercase, making it easier to quickly tell whether something is a variable or a data path.

Variables get their values from different sources but the most common one is the service code. You implement the service code using a programming language, such as Java or Python.

The following two procedures create an equivalent service that acts identically from a user's perspective. They only differ in the language used; they use the same logic and the same concepts. Still, the final code differs quite a bit due to the nature of each programming language. Generally, you should pick one language and stick with it. If you are unsure which one to pick, you may find Python slightly easier to understand because it is less verbose.

### Templates and Python Code <a href="#d5e1723" id="d5e1723"></a>

The usual way to start working on a new service is to first create a service skeleton with the `ncs-make-package` command. To use Python code for service logic and XML templates for applying configuration, select the `python-and-template` option. For example:

```bash
ncs-make-package --no-test --service-skeleton python-and-template iface
```

To use the prepared YANG model and XML template, save them into the `iface/src/yang/iface.yang` and `iface/templates/iface-template.xml` files. This is exactly the same as for the template-only service.

What is different, is the presence of the `python/` directory in the package file structure. It contains one or more Python packages (not to be confused with NSO packages) that provide the service code.

The function of interest is the `cb_create()` function, located in the `main.py` file that the package skeleton created. Its purpose is the same as that of the XML template in the template-only service: generate configuration based on the service instance parameters. This code is also called 'the create code'.

The create code usually performs the following tasks:

* Read service instance parameters.
* Prepare configuration variables.
* Apply one or more XML templates.

Reading instance parameters is straightforward with the help of the `service` function parameter, using the Maagic API. For example:

```python
    def cb_create(self, tctx, root, service, proplist):
        cidr_mask = service.cidr_netmask
```

Note that the hyphen in `cidr-netmask` is replaced with the underscore in `service.cidr_netmask` as documented in [Python API Overview](api-overview/python-api-overview.md).

The way configuration variables are prepared depends on the type of the service. For the interface addressing service with netmask, the netmask must be converted into dot-decimal format:

```
        quad_mask = ipaddress.IPv4Network((0, cidr_mask)).netmask
```

The code makes use of the built-in Python `ipaddress` package for conversion.

Finally, the create code applies a template, with only minimal changes to the skeleton-generated sample; the names and values for the `vars.add()` function, which are specific to this service.

```
        vars = ncs.template.Variables()
        vars.add('NETMASK', quad_mask)
        template = ncs.template.Template(service)
        template.apply('iface-template', vars)
```

If required, your service code can call `vars.add()` multiple times, to add as many variables as the template expects.

The first argument to the `template.apply()` call is the file name of the XML template, without the .xml suffix. It allows you to apply multiple, different templates for a single service instance. Separating the configuration into multiple templates based on functionality, called feature templates, is a great practice with bigger, complex configurations.

The complete create code for the service is:

```python
    def cb_create(self, tctx, root, service, proplist):
        cidr_mask = service.cidr_netmask

        quad_mask = ipaddress.IPv4Network((0, cidr_mask)).netmask

        vars = ncs.template.Variables()
        vars.add('NETMASK', quad_mask)
        template = ncs.template.Template(service)
        template.apply('iface-template', vars)
```

You can test it out in the `examples.ncs/implement-a-service/iface-v2-py` example.

### Templates and Java Code <a href="#d5e1768" id="d5e1768"></a>

The usual way to start working on a new service is to first create a service skeleton with the `ncs-make-package` command. To use Java code for service logic and XML templates for applying the configuration, select the `java-and-template` option. For example:

```bash
ncs-make-package --no-test --service-skeleton java-and-template iface
```

To use the prepared YANG model and XML template, save them into the `iface/src/yang/iface.yang` and `iface/templates/iface-template.xml` files. This is exactly the same as for the template-only service.

What is different, is the presence of the `src/java` directory in the package file structure. It contains a Java package (not to be confused with NSO packages) that provides the service code and build instructions for the `ant` tool to compile the Java code.

The function of interest is the `create()` function, located in the `ifaceRFS.java` file that the package skeleton created. Its purpose is the same as that of the XML template in the template-only service: generate configuration based on the service instance parameters. This code is also called 'the create code'.

The create code usually performs the following tasks:

* Read service instance parameters.
* Prepare configuration variables.
* Apply one or more XML templates.

Reading instance parameters is done with the help of the `service` function parameter, using [NAVU API](api-overview/java-api-overview.md#ug.java_api_overview.navu). For example:

```java
    public Properties create(ServiceContext context,
                             NavuNode service,
                             NavuNode ncsRoot,
                             Properties opaque)
                             throws ConfException {

        String cidr_mask_str = service.leaf("cidr-netmask").valueAsString();
        int cidr_mask = Integer.parseInt(cidr_mask_str);
```

The way configuration variables are prepared depends on the type of the service. For the interface addressing service with netmask, the netmask must be converted into dot-decimal format:

```
        long tmp_mask = 0xffffffffL << (32 - cidr_mask);
        String quad_mask =
            ((tmp_mask >> 24) & 0xff) + "." +
            ((tmp_mask >> 16) & 0xff) + "." +
            ((tmp_mask >> 8) & 0xff) + "." +
            ((tmp_mask >> 0) & 0xff);
```

The create code applies a template, with only minimal changes to the skeleton-generated sample; the names and values for the `myVars.putQuoted()` function are different since they are specific to this service.

```
        Template myTemplate = new Template(context, "iface-template");
        TemplateVariables myVars = new TemplateVariables();
        myVars.putQuoted("NETMASK", quad_mask);
        myTemplate.apply(service, myVars);
```

If required, your service code can call `myVars.putQuoted()` multiple times, to add as many variables as the template expects.

The second argument to the `Template` constructor is the file name of the XML template, without the .xml suffix. It allows you to instantiate and apply multiple, different templates for a single service instance. Separating the configuration into multiple templates based on functionality, called feature templates, is a great practice with bigger, complex configurations.

Finally, you must also return the `opaque` object and handle various exceptions for the function. If exceptions are propagated out of the create code, you should transform them into NSO specific ones first, so the UI can present the user with a meaningful error message.

The complete create code for the service is then:

```java
    public Properties create(ServiceContext context,
                             NavuNode service,
                             NavuNode ncsRoot,
                             Properties opaque)
                             throws ConfException {

        try {
            String cidr_mask_str = service.leaf("cidr-netmask").valueAsString();
            int cidr_mask = Integer.parseInt(cidr_mask_str);

            long tmp_mask = 0xffffffffL << (32 - cidr_mask);
            String quad_mask = ((tmp_mask >> 24) & 0xff) +
                "." + ((tmp_mask >> 16) & 0xff) +
                "." + ((tmp_mask >> 8) & 0xff) +
                "." + ((tmp_mask) & 0xff);

            Template myTemplate = new Template(context, "iface-template");
            TemplateVariables myVars = new TemplateVariables();
            myVars.putQuoted("NETMASK", quad_mask);
            myTemplate.apply(service, myVars);
        } catch (Exception e) {
            throw new DpCallbackException(e.getMessage(), e);
        }
        return opaque;
    }
```

You can test it out in the `examples.ncs/implement-a-service/iface-v2-java` example.

## Configuring Multiple Devices <a href="#ch_services.devs" id="ch_services.devs"></a>

A service instance may require configuration on more than just a single device. In fact, it is quite common for a service to configure multiple devices.

There are a few ways in which you can achieve this for your services:

* **In code**: Using API, such as Python Maagic or Java NAVU, navigate the data model to individual device configurations under each `devices device DEVNAME config` and set the required values.
* **In code with templates**: Apply the template multiple times with different values, such as the device name.
* **With templates only**: use `foreach` or automatic (implicit) loops.

The generally recommended approach is to use either code with templates or templates with `foreach` loops. They are explicit and also work well when you configure devices of different types. Using only code extends less well to the latter case, as it requires additional logic and checks for each device type.

Automatic, implicit loops in templates are harder to understand since the syntax looks like the one for normal leafs. A common example is a device definition as a leaf-list in the service YANG model, such as:

```
    leaf-list device {
      type leafref {
        path "/ncs:devices/ncs:device/ncs:name";
      }
    }
```

Because it is a leaf-list, the following template applies to all the selected devices, using an implicit loop:

```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0"
                 servicepoint="servicename">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>{/device}</name>
      <config>
        <!-- ... -->
     </config>
    </device>
  </devices>
</config-template>
```

It performs the same as the one, which loops through the devices explicitly:

```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0"
                 servicepoint="servicename">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <?foreach {/device}?>
      <device>
        <name>{.}</name>
        <config>
          <!-- ... -->
      </config>
      </device>
    <?end?>
  </devices>
</config-template>
```

Being explicit, the latter is usually much easier to understand and maintain for most developers. The `examples.ncs/implement-a-service/dns-v3` demonstrates this syntax in the XML template.

### Supporting Different Device Types <a href="#ch_services.devs_types" id="ch_services.devs_types"></a>

Applying the same template works fine as long as you have a uniform network with similar devices. What if two different devices can provide the same service but require different configuration? Should you create two different services in NSO? No. Services allow you to abstract and hide the device specifics through a device-independent service model, while still allowing customization of device configuration per device type.

One way to do this is to apply a different XML template from the service code, depending on the device type. However, the same is also possible through XML templates alone.

When NSO applies configuration elements in the template, it checks the XML namespaces that are used. If the target device does not support a particular namespace, NSO simply skips that part of the template. Consequently, you can put configuration for different device types in the same XML template and only the relevant parts will be applied.

Consider the following example:

```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>{/device}</name>
      <config>
        <!-- Part for device with the cisco-ios NED -->
        <interface xmlns="urn:ios">
          <GigabitEthernet>
            <name>{/interface}</name>
            <!-- ... -->
          </GigabitEthernet>
        </interface>

        <!-- Part for device with the router-nc NED -->
        <sys xmlns="http://example.com/router">
          <interfaces>
            <interface>
              <name>{/interface}</name>
              <!-- ... -->
            </interface>
          </interfaces>
        </sys>
     </config>
    </device>
  </devices>
</config-template>
```

Due to the `xmlns="urn:ios"` attribute, the first part of the template (the `interface GigabitEthernet`) will only apply to Cisco IOS-based device. While the second part (the `sys interfaces interface`) will only apply to the netsim-based router-nc-type devices, as defined by the `xmlns` attribute on the `sys` element.

In case you need to further limit what configuration applies where and namespace-based filtering is too broad, you can also use the `if-ned-id` XML processing instruction. Each NED package in NSO defines a unique NED-ID, which distinguishes between different device types (and possibly firmware versions). Based on the configured ned-id of the device, you can apply different parts of the XML template. For example:

```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>{/device}</name>
      <config>
        <?if-ned-id cisco-ios-cli-3.0:cisco-ios-cli-3.0?>
        <interface xmlns="urn:ios">
          <GigabitEthernet>
            <name>{/interface}</name>
            <!-- ... -->
          </GigabitEthernet>
        </interface>
        <?end?>
      </config>
    </device>
  </devices>
</config-template>
```

The preceding template applies configuration for the interface only if the selected device uses the `cisco-ios-cli-3.0` NED-ID. You can find the full code as part of the `examples.ncs/implement-a-service/iface-v3` example.

## Shared Service Settings and Auxiliary Data <a href="#ch_services.data" id="ch_services.data"></a>

In the previous sections, we have looked at service mapping when the input parameters are enough to generate the corresponding device configurations. In many situations, this is not the case. The service mapping logic may need to reach out to other data in order to generate the device configuration. This is common in the following scenarios:

* Policies: Often a set of policies is defined that is shared between service instances. The policies, such as QoS, have data models of their own (not service models) and the mapping code reads data from those.
* Topology information: the service mapping might need to know how devices are connected, such as which network switches lie between two routers.
* Resources such as VLAN IDs or IP addresses, which might not be given as input parameters. They may be modeled separately in NSO or fetched from an external system.

It is important to design the service model considering the above requirements: what is input and what is available from other sources. In the latter case, in terms of implementation, an important distinction is made between accessing the existing data and allocating new resources. You must take special care for resource allocation, such as VLAN or IP address assignment, as discussed later on. For now, let us focus on using pre-existing shared data.

One example of such use is to define QoS policies "on the side." Only a reference to an existing QoS policy is supplied as input. This is a much better approach than giving all QoS parameters to every service instance. But note that, if you modify the QoS definitions the services are referring to, this will not immediately change the existing deployed service instances. In order to have the service implement the changed policies, you need to perform a **re-deploy** of the service.

A simpler example is a modified DNS configuration service that allows selecting from a predefined set of DNS servers, instead of supplying the DNS server directly as a service parameter. The main benefit in this case is that clients have no need to be aware of the actual DNS servers (and their IPs). In addition, this approach simplifies the management for the network operator, as all the servers are kept in a single place.

What is required to implement such as service? There are two parts. The first is the model and data that defines the available DNS server options, which are shared (used) across all the DNS service instances. The second is a modification to the service inputs and mapping logic to use this data.

For the first part, you must create a data model. If the shared data is specific to one service type, such as the DNS configuration, you can define it alongside the service instance model, in the service package. But sometimes this data may be shared between multiple types of service. Then it makes more sense to create a separate package for the shared data models.

In this case, define a new top-level container in the service's YANG file as:

```yang
  container dns-options {
    list dns-option {
      key name;

      leaf name {
        type string;
      }

      leaf-list servers {
        type inet:ipv4-address;
      }
    }
  }
```

Note that the container is defined outside the service list because this data is not specific to individual service instances:

```yang
  container dns-options {
    // ...
  }

  list dns {
    key name;

    uses ncs:service-data;
    ncs:servicepoint "dns";

    // ...
  }
```

The `dns-options` container includes a list of `dns-option` items. Each item defines a set of DNS servers (`leaf-list`) and a name for this set.

Once the shared data model is compiled and loaded into NSO, you can define the available DNS server sets:

```cli
admin@ncs(config)# dns-options dns-option lon servers 192.0.2.3
admin@ncs(config-dns-option-lon)# top
admin@ncs(config)# dns-options dns-option sto servers 192.0.2.3
admin@ncs(config-dns-option-sto)# top
admin@ncs(config)# dns-options dns-option sjc servers [ 192.0.2.5 192.0.2.6 ]
admin@ncs(config-dns-option-sjc)# commit
```

You must also update the service instance model to allow clients to pick one of these DNS servers:

```yang
  list dns {
    key name;

    uses ncs:service-data;
    ncs:servicepoint "dns";

    leaf name {
      type string;
    }

    leaf target-device {
      type string;
    }

    // Replace the old, explicit IP with a reference to shared data
    // leaf dns-server-ip {
    //   type inet:ip-address {
    //     pattern "192\.0.\.2\..*";
    //   }
    // }
    leaf dns-servers {
      mandatory true;
      type leafref {
        path "/dns-options/dns-option/name";
      }
    }
  }
```

Different ways exist to model the service input for `dns-servers`. The first option you might think about might be using a string type and a pattern to limit the inputs to one of `lon`, `sto`, or `sjc`. Another option would be to use a YANG `enum` type. But both of these have the drawback that you need to change the YANG model if you add or remove available `dns-option` items.

Using a `leafref` allows NSO to validate inputs for this leaf by comparing them to the values, returned by the `path` XPath expression. So, whenever you update the `/dns-options/dns-option` items, the change is automatically reflected in the valid `dns-server` values.

At the same time, you must also update the mapping to take advantage of this service input parameter. The service XML template is very similar to the previous one. The main difference is the way in which the DNS addresses are read from the CDB, using the special `deref()` XPath function:

```xml
<config-template xmlns="http://tail-f.com/ns/config/1.0"
                 servicepoint="dns">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>{/target-device}</name>
      <config>
        <ip xmlns="urn:ios">
          <name-server>{deref(/dns-servers)/../servers}</name-server>
        </ip>
      </config>
    </device>
  </devices>
</config-template>
```

The `deref()` function “jumps” to the item selected by the leafref. Here, leafref's path points to `/dns-options/dns-option/name`, so this is where `deref(/dns-servers)` ends: at the name leaf of the selected dns-option item.

The following code, which performs the same thing but in a more verbose way, further illustrates how the DNS server value is obtained:

```xml
        <ip xmlns="urn:ios">
          <?set dns_option = {/dns-servers}?>   <!-- Set $dns_option to e.g. 'lon' -->
          <?set-root-node {/}?>                 <!-- Make '/' point to datastore root,
                                                     instead of service instance   -->
          <name-server>{/dns-options/dns-option[name=$dns_option]/servers}</name-server>
        </ip>
```

The complete service is available in the `examples.ncs/implement-a-service/dns-v3` example.

## Service Actions <a href="#ch_services.actions" id="ch_services.actions"></a>

NSO provides some service actions out of the box, such as **re-deploy** or **check-sync**. You can also add others. A typical use case is to implement some kind of a self-test action that tries to verify the service is operational. The latter could use **ping** or similar network commands, as well as verify device operational data, such as routing table entries.

This action supplements the built-in `check-sync` or `deep-check-sync` action, which checks for the required device configuration.

For example, a DNS configuration service might perform a domain lookup to verify the Domain Name System is working correctly. Likewise, an interface configuration service could ping an IP address or check the interface status.

The action consists of the YANG model for action inputs and outputs, as well as the action code that is executed when a client invokes the action.

Typically, such actions are defined per service instance, so you model them under the service list:

```yang
  list iface {
    key name;

    uses ncs:service-data;
    ncs:servicepoint "iface-servicepoint";

    leaf name { /* ... */ }
    leaf device { /* ... */ }
    leaf interface { /* ... */ }
    // ... other statements omitted ...

    action test-enabled {
      tailf:actionpoint iface-test-enabled;
      output {
        leaf status {
          type enumeration {
            enum up;
            enum down;
            enum unknown;
          }
        }
      }
    }
  }
```

The action needs no special inputs; because it is defined on the service instance, it can find the relevant interface to query. The output has a single leaf, called `status`, which uses an `enumeration` type for explicitly defining all the possible values it can take (`up`, `down`, or `unknown`).

Note that using the `action` statement requires you to also use the `yang-version 1.1` statement in the YANG module header (see [Actions](../introduction-to-automation/applications-in-nso.md#d5e959)).

### Action Code in Python <a href="#d5e1944" id="d5e1944"></a>

NSO Python API contains a special-purpose base class, `ncs.dp.Action`, for implementing actions. In the `main.py` file, add a new class that inherits from it, and implements an action callback:

```python
class IfaceActions(Action):
    @Action.action
    def cb_action(self, uinfo, name, kp, input, output, trans):
        ...
```

The callback receives a number of arguments, one of them being `kp`. It contains a keypath value, identifying the data model path, to the service instance in this case, it was invoked on.

The keypath value uniquely identifies each node in the data model and is similar to an XPath path, but encoded a bit differently. You can use it with the `ncs.maagic.cd()` function to navigate to the target node.

```
        root = ncs.maagic.get_root(trans)
        service = ncs.maagic.cd(root, kp)
```

The newly defined `service` variable allows you to access all of the service data, such as `device` and `interface` parameters. This allows you to navigate to the configured device and verify the status of the interface. The method likely depends on the device type and is not shown in this example.

The action class implementation then resembles the following:

```python
class IfaceActions(Action):
    @Action.action
    def cb_action(self, uinfo, name, kp, input, output, trans):
        root = ncs.maagic.get_root(trans)
        service = ncs.maagic.cd(root, kp)

        device = root.devices.device[service.device]

        status = 'unknown'    # Replace with your own code that checks
                              # e.g. operational status of the interface

        output.status = status
```

Finally, do not forget to register this class on the action point in the `Main` application.

```python
class Main(ncs.application.Application):
    def setup(self):
        ...
        self.register_action('iface-test-enabled', IfaceActions)
```

You can test the action in the `examples.ncs/implement-a-service/iface-v4-py` example.

### Action Code in Java <a href="#d5e1966" id="d5e1966"></a>

Using the Java programming language, all callbacks, including service and action callback code, are defined using annotations on a callback class. The class NSO looks for is specified in the `package-meta-data.xml` file. This class should contain an `@ActionCallback()` annotated method that ties it back to the action point in the YANG model:

```java
    @ActionCallback(callPoint="iface-test-enabled",
                    callType=ActionCBType.ACTION)
    public ConfXMLParam[] test_enabled(DpActionTrans trans, ConfTag name,
                                       ConfObject[] kp, ConfXMLParam[] params)
    throws DpCallbackException {
        // ...
    }
```

The callback receives a number of arguments, one of them being `kp`. It contains a keypath value, identifying the data model path, to the service instance in this case, it was invoked on.

The keypath value uniquely identifies each node in the data model and is similar to an XPath path, but encoded a bit differently. You can use it with the `com.tailf.navu.KeyPath2NavuNode` class to navigate to the target node.

```
            NavuContext context = new NavuContext(maapi);
            NavuContainer service =
                (NavuContainer)KeyPath2NavuNode.getNode(kp, context);
```

The newly defined `service` variable allows you to access all of the service data, such as `device` and `interface` parameters. This allows you to navigate to the configured device and verify the status of the interface. The method likely depends on the device type and is not shown in this example.

The complete implementation requires you to supply your own Maapi read transaction and resembles the following:

```java
    @ActionCallback(callPoint="iface-test-enabled",
                    callType=ActionCBType.ACTION)
    public ConfXMLParam[] test_enabled(DpActionTrans trans, ConfTag name,
                                       ConfObject[] kp, ConfXMLParam[] params)
    throws DpCallbackException {
        int port = NcsMain.getInstance().getNcsPort();

        // Ensure socket gets closed on errors, also ending any ongoing
        // session and transaction
        try (Socket socket = new Socket("localhost", port)) {
            Maapi maapi = new Maapi(socket);
            maapi.startUserSession("admin", InetAddress.getByName("localhost"),
                "system", new String[] {}, MaapiUserSessionFlag.PROTO_TCP);

            NavuContext context = new NavuContext(maapi);
            context.startRunningTrans(Conf.MODE_READ);

            NavuContainer root = new NavuContainer(context);
            NavuContainer service =
                (NavuContainer)KeyPath2NavuNode.getNode(kp, context);

            String status = "unknown";    // Replace with your own code that
                                          // checks e.g. operational status of
                                          // the interface

            String nsPrefix = name.getPrefix();
            return new ConfXMLParam[] {
                new ConfXMLParamValue(nsPrefix, "status", new ConfBuf(status)),
            };
        } catch (Exception e) {
            throw new DpCallbackException(name.toString() + " action failed",
                e);
        }
    }
```

You can test the action in the `examples.ncs/implement-a-service/iface-v4-java` example.

## Operational Data <a href="#ch_services.oper" id="ch_services.oper"></a>

In addition to device configuration, services may also provide operational status or statistics. This is operational data, modeled with `config false` statements in YANG, and cannot be directly set by clients. Instead, clients can only read this data, for example to check service health.

What kind of data a service exposes depends heavily on what the service does. Perhaps the interface configuration service needs to provide information on whether a network interface was enabled and operational at the time of the last check (because such a check could be expensive).

Taking `iface` service as a base, consider how you can extend the instance model with another operational leaf to hold the interface status data as of the last check.

```yang
  list iface {
    key name;

    uses ncs:service-data;
    ncs:servicepoint "iface-servicepoint";

    // ... other statements omitted ...

    action test-enabled {
      tailf:actionpoint iface-test-enabled;
      output {
        leaf status {
          type enumeration {
            enum up;
            enum down;
            enum unknown;
          }
        }
      }
    }

    leaf last-test-result {
      config false;
      type enumeration {
            enum up;
            enum down;
            enum unknown;
      }
    }
  }
```

The new leaf `last-test-result` is designed to store the same data as the `test-enabled` action returns. Importantly, it also contains a `config false` substatement, making it operational data.

When faced with duplication of type definitions, as seen in the preceding code, the best practice is to consolidate the definition in a single place and avoid potential discrepancies in the future. You can use a `typedef` statement to define a custom YANG data type.

{% hint style="info" %}
The `typedef` statements should come before data statements, such as containers and lists in the model.
{% endhint %}

```
  typedef iface-status-type {
    type enumeration {
          enum up;
          enum down;
          enum unknown;
    }
  }
```

Once defined, you can use the new type as you would any other YANG type. For example:

```yang
    leaf last-test-status {
      config false;
      type iface-status-type;
    }

    action test-enabled {
      tailf:actionpoint iface-test-enabled;
      output {
        leaf status {
          type iface-status-type;
      }
    }
```

Users can then view operational data with the help of the `show` command. The data is also available through other NB interfaces, such as NETCONF and RESTCONF.

```cli
admin@ncs# show iface test-instance1 last-test-status
iface test-instance1 last-test-status up
```

But where does the operational data come from? The service application code provides this data. In this example, the `last-test-status` leaf captures the result of the enabled check, which is implemented as a custom action. So, here it is the action code that sets the leaf's value.

This approach works well when operational data is updated based on some event, such as a received notification or a user action, and NSO is used to cache its value.

For cases, where this is insufficient, NSO also allows producing operational data on demand, each time a client requests it, through the Data Provider API. See [DP API](api-overview/java-api-overview.md#ug.java_api_overview.dp) for this alternative approach.

### Writing Operational Data in Python <a href="#d5e2012" id="d5e2012"></a>

Unlike configuration data, which always requires a transaction, you can write operational data to NSO with or without a transaction. Using a transaction allows you to easily compose multiple writes into a single atomic operation but has some small performance penalty due to transaction overhead.

If you avoid transactions and write data directly, you must use the low-level CDB API, which requires manual connection management and does not support Maagic API for data model navigation.

```
with contextlib.closing(socket.socket()) as s:
    _ncs.cdb.connect(s, _ncs.cdb.DATA_SOCKET, ip='127.0.0.1', port=_ncs.PORT)
    _ncs.cdb.start_session(s, _ncs.cdb.OPERATIONAL)
    _ncs.cdb.set_elem(s, 'up', '/iface{test-instance1}/last-test-status')
```

The alternative, transaction-based approach uses high-level MAAPI and Maagic objects:

```python
with ncs.maapi.single_write_trans('admin', 'python', db=ncs.OPERATIONAL) as t:
    root = ncs.maagic.get_root(t)
    root.iface['test-instance1'].last_test_status = 'up'
    t.apply()
```

When used as part of the action, the action code might be as follows:

```python
    def cb_action(self, uinfo, name, kp, input, output, trans):
        with ncs.maapi.single_write_trans('admin', 'python',
                                          db=ncs.OPERATIONAL) as t:
            root = ncs.maagic.get_root(t)
            service = ncs.maagic.cd(root, kp)

            # ...
            service.last_test_status = status
            t.apply()

        output.status = status
```

Note that you have to start a new transaction in the action code, even though `trans` is already supplied, since `trans` is read-only and cannot be used for writes.

Another thing to keep in mind with operational data is that NSO by default does not persist it to storage, only keeps it in RAM. One way for the data to survive NSO restarts is to use the `tailf:persistent` statement, such as:

```yang
    leaf last-test-status {
      config false;
      type iface-status-type;
      tailf:cdb-oper {
        tailf:persistent true;
      }
    }
```

You can also register a function with the service application class to populate the data on package load, if you are not using `tailf:persistent`.

```python
class ServiceApp(Application):
    def setup(self):
        ...
        self.register_fun(init_oper_data, lambda _: None)


def init_oper_data(state):
    state.log.info('Populating operational data')
    with ncs.maapi.single_write_trans('admin', 'python',
                                      db=ncs.OPERATIONAL) as t:
        root = ncs.maagic.get_root(t)
        # ...
        t.apply()

    return state
```

The `examples.ncs/implement-a-service/iface-v5-py` example implements such code.

### Writing Operational Data in Java <a href="#d5e2032" id="d5e2032"></a>

Unlike configuration data, which always requires a transaction, you can write operational data to NSO with or without a transaction. Using a transaction allows you to easily compose multiple writes into a single atomic operation but has some small performance penalty due to transaction overhead.

If you avoid transactions and write data directly, you must use the low-level CDB API, which does not support NAVU for data model navigation.

```
int port = NcsMain.getInstance().getNcsPort();

// Ensure socket gets closed on errors, also ending any ongoing session/lock
try (Socket socket = new Socket("localhost", port)) {
    Cdb cdb = new Cdb("IfaceServiceOperWrite", socket);
    CdbSession session = cdb.startSession(CdbDBType.CDB_OPERATIONAL);

    String status = "up";
    ConfPath path = new ConfPath("/iface{%s}/last-test-status",
        "test-instance1");
    session.setElem(ConfEnumeration.getEnumByLabel(path, status), path);

    session.endSession();
}
```

The alternative, transaction-based approach uses high-level MAAPI and NAVU objects:

```
int port = NcsMain.getInstance().getNcsPort();

// Ensure socket gets closed on errors, also ending any ongoing
// session and transaction
try (Socket socket = new Socket("localhost", port)) {
    Maapi maapi = new Maapi(socket);
    maapi.startUserSession("admin", InetAddress.getByName("localhost"),
        "system", new String[] {}, MaapiUserSessionFlag.PROTO_TCP);

    NavuContext context = new NavuContext(maapi);
    context.startOperationalTrans(Conf.MODE_READ_WRITE);

    NavuContainer root = new NavuContainer(context);
    NavuContainer service =
        (NavuContainer)KeyPath2NavuNode.getNode(kp, context);

    // ...
    service.leaf("last-test-status").set(status);
    context.applyClearTrans();
}
```

Note the use of the `context.startOperationalTrans()` function to start a new transaction against the operational data store. In other respects, the code is the same as for writing configuration data.

Another thing to keep in mind with operational data is that NSO by default does not persist it to storage, only keeps it in RAM. One way for the data to survive NSO restarts is to model the data with the `tailf:persistent` statement, such as:

```yang
    leaf last-check-status {
      config false;
      type iface-status-type;
      tailf:cdb-oper {
        tailf:persistent true;
      }
    }
```

You can also register a custom `com.tailf.ncs.ApplicationComponent` class with the service application to populate the data on package load, if you are not using `tailf:persistent`. Please refer to [The Application Component Type](nso-virtual-machines/nso-java-vm.md#d5e1255) for details.

The `examples.ncs/implement-a-service/iface-v5-java` example implements such code.

## Nano Services for Provisioning with Side Effects <a href="#ncs.development.reactive_fastmap" id="ncs.development.reactive_fastmap"></a>

A FASTMAP service cannot perform explicit function calls with side effects. The only action a service is allowed to take is to modify the configuration of the current transaction. For example, a service may not invoke an action to generate authentication key files or start a virtual machine. All such actions must occur before the service is created and provided as input parameters. This restriction is because the FASTMAP code may be executed as part of a `commit dry-run`, or the commit may fail, in which case the side effects would have to be undone.

Nano services use a technique called reactive FASTMAP (RFM) and provide a framework to safely execute actions with side effects by implementing the service as several smaller (nano) steps or stages. Reactive FASTMAP can also be implemented directly using the CDB subscribers, but nano services offer a more streamlined and robust approach for staged provisioning.

The services discussed previously in this section were modeled to give all required parameters to the service instance. The mapping logic code could immediately do its work. Sometimes this is not possible. Two examples that require staged provisioning where a nano service step executing an action is the best practice solution:

* Allocating a resource from an external system, such as an IP address, or generating an authentication key file using an external command. It is impossible to do this allocation from within the normal FASTMAP `create()` code since there is no way to deallocate the resource on commit, abort, or failure and when deleting the service. Furthermore, the `create()` code runs within the transaction lock. The time spent in services `create()` code should be as short as possible.
* The service requires the start of one or more Virtual Machines, Virtual Network Functions. The VMs do not yet exist, and the `create()` code needs to trigger something that starts the VMs, and then later, when the VMs are operational, configure them.

The basic concepts of nano services are covered in detail by [Nano Services for Staged Provisioning](nano-services.md). The example in `examples.ncs/development-guide/nano-services/netsim-sshkey` implements SSH public key authentication setup using a nano service. The nano service uses the following steps in a plan that produces the `generated`, `distributed`, and `configured` states:

1. Generates the NSO SSH client authentication key files using the OpenSSH `ssh-keygen` utility from a nano service side-effect action implemented in Python.
2. Distributes the public key to the netsim (ConfD) network elements to be stored as an authorized key using a Python service `create()` callback.
3. Configures NSO to use the public key for authentication with the netsim network elements using a Python service `create()` callback and service template.
4. Test the connection using the public key through a nano service side-effect executed by the NSO built-in **connect** action.

Upon deletion of the service instance, NSO restores the configuration. The only delete step in the plan is the `generated` state side-effect action that deletes the key files. The example is described in more detail in [Developing and Deploying a Nano Service](../introduction-to-automation/develop-and-deploy-a-nano-service.md).

The `basic-vrouter`, `netsim-vrouter`, and `mpls-vpn-vrouter` examples in the `examples.ncs/development-guide/nano-services` directory start, configure, and stop virtual devices. In addition, the `mpls-vpn-vrouter` example manages Layer3 VPNs in a service provider MPLS network consisting of physical and virtual devices. Using a Network Function Virtualization (NFV) setup, the L3VPN nano service instructs a VM manager nano service to start a virtual device in a multi-step process consisting of the following:

1. When the L3VPN nano service `pe-create` state step create or delete a `/vm-manager/start` service configuration instance, the VM manager nano service instructs a VNF-M, called ESC, to start or stop the virtual device.
2. Wait for the ESC to start or stop the virtual device by monitoring and handling events. Here NETCONF notifications.
3. Mount the device in the NSO device tree.
4. Fetch the ssh-keys and perform a `sync-from` on the newly created device.

See the `mpls-vpn-vrouter` example for details on how the `l3vpn.yang` YANG model `l3vpn-plan` `pe-created` state and `vm-manager.yang` `vm-plan` for more information. `vm-manager` plan states with a nano-callback have their callbacks implemented by the `escstart.java` `escstart` class. Nano services are documented in [Nano Services for Staged Provisioning](nano-services.md).

## Service Troubleshooting <a href="#ncs.development.services.tshoot" id="ncs.development.services.tshoot"></a>

Service troubleshooting is an inevitable part of any NSO development process and eventually a part of their operational tasks as well. By their nature, NSO services are composed primarily out of user-defined code, models, and templates. This gives you plenty of opportunities to make unintended mistakes in mapping code, use incorrect indentations, create invalid configuration templates, and much more. Not only that, they also rely on southbound communication with devices of many different versions and vendors, which presents you with yet another domain that can cause issues in your NSO services.

This is why it is important to have a systematic approach when debugging and troubleshooting your services:

* **Understand the problem** - First, you need to make sure that you fully understand the issue you are trying to troubleshoot. Why is this issue happening? When did it first occur? Does it happen only on specific deployments or devices? What is the error message like? Is it consistent and can it be replicated? What do the logs say?
* **Identify the root cause** - When you understand the issues, their triggers, conditions, and any additional insights that NSO allows you to inspect, you can start breaking down the problem to identify its root cause.
* **Form and implement the solution** - Once the root cause (or several of them) is found, you can focus on producing a suitable solution. This might be a simple NSO operation, modification of service package codebase, a change in southbound connectivity of managed devices, and any other action or combination required to achieve a working service.

### Common Troubleshooting Steps <a href="#d5e2130" id="d5e2130"></a>

You can use these general steps to give you a high-level idea of how to approach troubleshooting your NSO services:

1. Ensure that your NSO instance is installed and running properly. You can verify the overall status with `ncs --status` shell command. To find out more about installation problems and potential runtime issues, check [Troubleshooting](../../administration/management/system-management/#ug.sys_mgmt.tshoot) in Administration.\
   \
   If you encounter a blank CLI when you connect to NSO you must also make sure that your user is added to the correct NACM group (for example `ncsadmin`) and that the rules for this group allow the user to view and edit your service through CLI. You can find out more about groups and authorization rules in [AAA Infrastructure](../../administration/management/aaa-infrastructure.md) in Administration.
2.  Verify that you are using the latest version of your packages. This means copying the latest packages into load path, recompiling the package YANG models and code with the `make` command, and reloading the packages. In the end, you must expect the NSO packages to be successfully reloaded to proceed with troubleshooting. You can read more about loading packages in [Loading Packages](../advanced-development/developing-packages.md#loading-packages). If nothing else, successfully reloading packages will at least make sure that you can use and try to create service instances through NSO.\
    \
    Compiling packages uses the `ncsc` compiler internally, which means that this part of the process reveals any syntax errors that might exist in YANG models or Java code. You do not need to rely on `ncsc` for compile-level errors though and should use specialized tools such as `pyang` or `yanger` for YANG, and one of the many IDEs and syntax validation tools for Java.

    ```
    yang/demo.yang:32: error: expected keyword 'type' as substatement to 'leaf'
    make: *** [Makefile:41: ../load-dir/demo.fxs] Error 1
    ```

    ```
        [javac] /nso-run/packages/demo/src/java/src/com/example/demo/demoRFS.java:52: error: ';' expected
        [javac]         Template myTemplate = new Template(context, "demo-template")
        [javac]                                                                          ^
        [javac] 1 error
        [javac] 1 warning

    BUILD FAILED
    ```

    \
    Additionally, reloading packages can also supply you with some valuable information. For example, it can tell you that the package requires a higher version of NSO which is specified in the `package-meta-data.xml` file, or about any Python-related syntax errors.

    ```cli
    admin@ncs# packages reload
    Error: Failed to load NCS package: demo; requires NCS version 6.3
    ```

    ```cli
    admin@ncs# packages reload
    reload-result {
        package demo
        result false
        info SyntaxError: invalid syntax
    }
    ```

    \
    Last but not least, package reloading also provides some information on the validity of your XML configuration templates based on the NED namespace you are using for a specific part of the configuration, or just general syntactic errors in your template.

    ```cli
    admin@ncs# packages reload
    reload-result {
        package demo1
        result false
        info demo-template.xml:87 missing tag: name
    }
    reload-result {
        package demo2
        result false
        info demo-template.xml:11 Unknown namespace: 'ios-xr'
    }
    reload-result {
        package demo3
        result false
        info demo-template.xml:12: The XML stream is broken. Run-away < character found.
    }
    ```
3.  Examine what the template and XPath expressions evaluate to. If some service instance parameters are missing or are mapped incorrectly, there might be an error in the service template parameter mapping or in their XPath expressions. Use the CLI pipe command `debug template` to show all the XPath expression results from your service configuration templates or `debug xpath` to output all XPath expression results for the current transaction (e.g., as a part of the YANG model as well).

    \
    In addition, you can use the `xpath eval` command in CLI configuration mode to test and evaluate arbitrary XPath expressions. The same can be done with `ncs_cmd` from the command shell. To see all the XPath expression evaluations in your system, you can also enable and inspect the `xpath.trace` log. You can read more about debugging templates and XPath in [Debugging Templates](templates.md#debugging-templates). If you are using multiple versions of the same NED, make sure that you are using the correct processing instructions as described in [Namespaces and Multi-NED Support](templates.md#ch_templates.multined) when applying different bits of configuration to different versions of devices.

    ```cli
    admin@ncs# devtools true
    admin@ncs# config
    Entering configuration mode terminal
    admin@ncs(config)# xpath eval /devices/device
    admin@ncs(config)# xpath eval /devices/device[name='r0']
    ```
4. Validate that your custom service code is performing as intended. Depending on your programming language of choice, there might be different options to do that. If you are using Java, you can find out more on how to configure logging for the internal Java VM Log4j in [Logging](nso-virtual-machines/nso-java-vm.md#logging). You can use a debugger as well, to see the service code execution line by line. To learn how to use Eclipse IDE to debug Java package code, read [Using Eclipse to Debug the Package Java Code](../advanced-development/developing-packages.md#ug.package_dev.java_debugger). The same is true for Python. NSO uses the standard `logging` module for logging, which can be configured as per instructions in [Debugging of Python Packages](nso-virtual-machines/nso-python-vm.md#debugging-of-python-packages). Python debugger can be set up as well with `debugpy` or `pydevd-pycharm` modules.
5.  Inspect NSO logs for hints. NSO features extensive logging functionality for different components, where you can see everything from user interactions with the system to low-level communications with managed devices. For best results, set the logging level to DEBUG or lower. To learn what types of logs there are and how to enable them, consult [Logging](../../administration/management/system-management/#ug.ncs_sys_mgmt.logging) in Administration.

    \
    Another useful option is to append a custom trace ID to your service commits. The trace ID can be used to follow the request in logs from its creation all the way to the configuration changes that get pushed to the device. In case no trace ID is specified, NSO will generate a random one, but custom trace IDs are useful for focused troubleshooting sessions.

    ```cli
    admin@ncs(config)# commit trace-id myTrace1
    Commit complete.
    ```

    \
    Trace ID can also be provided as a commit parameter in your service code, or as a RESTCONF query parameter. See `examples.ncs/development-guide/commit-parameters` for an example.
6.  Measuring the time it takes for specific commands to complete can also give you some hints about what is going on. You can do this by using the `timecmd`, which requires the dev tools to be enabled.

    ```cli
    admin@ncs# devtools true
    admin@ncs(config)# timecmd commit
    Commit complete.
    Command executed in 5.31 seconds.
    ```

    \
    Another useful tool to examine how long a specific event or command takes is the progress trace. See how it is used in [Progress Trace](../advanced-development/progress-trace.md).
7.  Double-check your service points in the model, templates, and in code. Since configuration templates don't get applied if the servicepoint attribute doesn't match the one defined in the service model or are not applied from the callbacks registered to specific service points, make sure they match and that they are not missing. Otherwise, you might notice errors such as the following ones.

    ```cli
    admin@ncs# packages reload
    reload-result {
        package demo
        result false
        info demo-template.xml:2 Unknown servicepoint: notdemo
    }
    ```

    ```cli
    admin@ncs(config-demo-s1)# commit dry-run
    Aborted: no registration found for callpoint demo/service_create of type=external
    ```
8.  Verify YANG imports and namespaces. If your service depends on NED or other YANG files, make sure their path is added to where the compiler can find them. If you are using the standard service package skeleton, you can add to that path by editing your service package `Makefile` and adding the following line.

    ```
    YANGPATH += ../../my-dependency/src/yang \
    ```

    \
    Likewise, when you use data types from other YANG namespaces in either your service model definition or by referencing them in XPath expressions.

    ```
    // Following XPath might trigger an error if there is collision for the 'interfaces' node with other modules
    path "/ncs:devices/ncs:device['r0']/config/interfaces/interface";
    yang/demo.yang:25: error: the node 'interfaces' from module 'demo' (in node 'config' from 'tailf-ncs') is not found

    // And the following XPath will not, since it uses namespace prefixes
    path "/ncs:devices/ncs:device['r0']/config/iosxr:interfaces/iosxr:interface";
    ```
9.  Trace the southbound communication. If the service instance creation results in a different configuration than would be expected from the NSO point of view, especially with custom NED packages, you can try enabling the southbound tracing (either per device or globally).

    ```cli
    admin@ncs(config)# devices global-settings trace pretty
    admin@ncs(config)# devices global-settings trace-dir ./my-trace
    admin@ncs(config)# commit
    ```

***

**Next Steps**

{% content-ref url="../advanced-development/developing-services/services-deep-dive.md" %}
[services-deep-dive.md](../advanced-development/developing-services/services-deep-dive.md)
{% endcontent-ref %}
