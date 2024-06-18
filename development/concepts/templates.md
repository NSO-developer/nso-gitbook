---
description: Simplify change management in your network using templates.
---

# Templates

NSO comes with a flexible and powerful built-in templating engine, which is based on XML. The templating system simplifies how you apply configuration changes across devices of different types and provides additional validation against the target data model. Templates are a convenient, declarative way of updating structured configuration data and allow you to avoid lots of boilerplate code.

You will most often find this type of configuration templates used in services, which is why they are sometimes also called service templates. However, we mostly refer to them simply as XML templates, since they are defined in XML files.

NSO loads templates as part of a package, looking for XML files in the `templates` subdirectory. You then apply an XML template through API or by connecting it with a service through a service point, allowing NSO to use it whenever a service instance needs updating.

{% hint style="info" %}
XML templates are distinct from so-called “device templates”, which are dynamically created and applied as needed by the operator, for example in the CLI. There are also other types of templates in NSO, unrelated to XML templates described here.
{% endhint %}

## Structure of a Template <a href="#ch_templates.structure" id="ch_templates.structure"></a>

Template is an XML file with the `config-template` root element, residing in the `http://tail-f.com/ns/config/1.0` namespace. The root contains configuration elements according to NSO YANG schema and XML processing instructions.

Configuration element structure is very much like the one you would find in a NETCONF message since it uses the same encoding rules defined by YANG. Additionally, each element can specify a `tags` attribute that refines how the configuration is applied.

A typical template for configuring an NSO-managed device is:

```
<config-template xmlns="http://tail-f.com/ns/config/1.0">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device tags="nocreate">
      <name>{/name}</name>
      <config tags="merge">
        <!-- ... -->
      </config>
    </device>
  </devices>
</config-template>
```

The first line defines the root node. It contains elements that follow the same structure as that used by the CDB, in particular, the ` devices device`` `` `_`name`_` `` ``config ` path in the CLI. In the printout, two elements, `device` and `config`, also have a `tags` attribute.

You can write this structure by studying the YANG schema if you wish. However, a more typical approach is to start with manipulating NSO configuration by hand, such as through the NSO CLI or web UI. Then generate the XML structure with the help of NSO output filters. You can use `commit dry-run outformat xml or show ... | display xml` commands, or even the `ncs_load` utility. For a worked, step-by-step example, refer to the section [A Template is All You Need](implementing-services.md#ch\_services.just\_template).

```
admin@ncs(config)# devices device rtr01 config ...
admin@ncs(config-device-rtr01)# commit dry-run outformat xml
result-xml {
    local-node {
        data <devices xmlns="http://tail-f.com/ns/ncs">
               <device>
                 <name>rtr01</name>
                 <config>
                   <!-- ... -->
                 </config>
               </device>
             </devices>
    }
}
admin@ncs(config-device-rtr01)# commit
admin@ncs# show running-config devices device rtr01 config ... | display xml
<config xmlns="http://tail-f.com/ns/config/1.0">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>rtr01</name>
      <config>
        <!-- ... -->
      </config>
    </device>
  </devices>
</config>
```

Having the basic structure in place, you can then fine-tune the template by adding different processing instructions and tags, as well as replacing static values with variable references using the XPath syntax.

Note that a single template can configure multiple devices of different type, services, or any other configurable data in NSO; basically the same as you can do in a CLI commit. But a single, gigantic template can become a burden to maintain. That is why many developers prefer to split up bigger configurations into multiple feature templates, either by functionality or by device type.

Finally, the name of the file, without the `.xml` extension is the name of the template. The name allows you to reference the template from the code later on. Since all the template names reside in the same namespace, it is a good practice to use a common naming scheme, preferably _`<package name>`_`-`_`<feature>`_`.xml` to ensure template names are unique.

## Other Ways to Generate the XML Template Structure <a href="#ch_templates.templatize" id="ch_templates.templatize"></a>

The NSO CLI features a **templatize** command that allows you to analyze a given configuration and find common configuration patterns. You can use these to, for example, create a configuration template for a service.

Suppose you have an existing interface configuration on a device:

```
admin@ncs# show running-config devices device c0 config interface GigabitEthernet
devices device c0
 config
  interface GigabitEthernet0/0/0/0
   ip address 10.1.2.3 255.255.255.0
  exit
  interface GigabitEthernet0/0/0/1
   ip address 10.1.4.3 255.255.255.0
  exit
  interface GigabitEthernet0/0/0/2
   ip address 10.1.9.3 255.255.255.0
  exit
 !
!
```

Using the `templatize` command, you can search for patterns in this part of the configuration, which produces the following:

```
admin@ncs# templatize devices device c0 config interface GigabitEthernet
Found potential templates at:
  devices device c0 \ config \ interface GigabitEthernet {$GigabitEthernet-name}

Template path:
  devices device c0 \ config \ interface GigabitEthernet {$GigabitEthernet-name}
Variables in template:
  {$GigabitEthernet-name}  {$address}

<config xmlns="http://tail-f.com/ns/config/1.0">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>c0</name>
      <config>
        <interface xmlns="urn:ios">
          <GigabitEthernet>
            <name>{$GigabitEthernet-name}</name>
            <ip>
              <address>
                <primary>
                  <address>{$address}</address>
                  <mask>255.255.255.0</mask>
                </primary>
              </address>
            </ip>
          </GigabitEthernet>
        </interface>
      </config>
    </device>
  </devices>
</config>
```

In this case, NSO finds a single pattern (the only one) and creates the corresponding template. In general, NSO might produce a number of templates. As an example, try running the command within the `examples.ncs/implement-a-service/dns-v3` environment.

```
$ cd $NCS_DIR/examples.ncs/implement-a-service/dns-v3
$ make demo
admin@ncs#  templatize devices device c*
```

The algorithm works by searching the data at the specified path. For any list it encounters, it compares every item in the list with its siblings. If the two items have the same structure but not necessarily the same actual values (for leafs), that part of the configuration can be made into a template. If the two list items use the same value for a leaf, the value is used directly in the generated template. Otherwise, a unique variable name is created and used in its place, as shown in the example.

However, `templatize` requires you to reference existing configurations in NSO. If such configuration is not readily available to you and you want to avoid manually creating sample configuration in NSO first, you can use the sample-xml-skeleton functionality of the **yanger** utility to generate sample XML data directly:

```
$ cd $NCS_DIR/packages/neds/cisco-ios-cli-3.8/
$ yanger -f sample-xml-skeleton \
    --sample-xml-skeleton-doctype=config \
    --sample-xml-skeleton-path='/ip/name-server' \
    --sample-xml-skeleton-defaults \
    src/yang/tailf-ned-cisco-ios.yang
<?xml version='1.0' encoding='UTF-8'?>
<config xmlns="urn:ietf:params:xml:ns:netconf:base:1.0">
  <ip xmlns="urn:ios">
    <name-server>
      <name-server-list>
        <address/>
      </name-server-list>
      <vrf>
        <name/>
        <name-server-list>
          <address/>
        </name-server-list>
      </vrf>
    </name-server>
  </ip>
</config>
```

You can replace the value of _`--sample-xml-skeleton-path`_ with the path to the part of the configuration you want to generate.

In case the target data model contains submodules, or references other non-built-in modules, you must also tell `yanger` where to find additional modules with the _`-p`_ parameter, such as adding `-p src/yang/` to the invocation.

## Values in a Template <a href="#ch_templates.values" id="ch_templates.values"></a>

Some XML elements, notably those that represent leafs or leaf-lists, specify element text content as values that you wish to configure, such as:

```
      <name>rtr01</name>
```

NSO converts the string value to the actual value type of the YANG model automatically when the template is applied.

Along with hard-coded, static content (`rtr01`), the value may also contain curly brackets (`{...}`), which the templating engine treats as XPath 1.0 expressions.

The simplest form of an XPath expression is a plain XPath variable:

```
      <name>{$CE}</name>
```

A value can contain any number of `{...}` expressions and strings. The end result is the concatenation of all the strings and XPath expressions. For example, `<description>Link to PE: {$PE} - {$PE_INT_NAME}</description>` might evaluate to `<description>Link to PE: pe0 - GigabitEthernet0/0/0/3</description>`.

if you set `PE` to `pe0` and `PE_INT_NAME` to `GigabitEthernet0/0/0/3` when applying the template.

You set the values for variables in the code where you apply the template. NSO also sets some predefined variables, which you can reference:

* `$DEVICE`: The name of the current device. Cannot be overridden.
* `$TEMPLATE_NAME`: The name of the current template. Cannot be overridden.
* `$SCHEMA_OPAQUE`: Defined if the template is registered for a servicepoint (the top node in the template has `servicepoint` attribute) and the corresponding `ncs:servicepoint` statement in the YANG model has `tailf:opaque` substatement. Set to the value of the `tailf:opaque` statement.
* `$OPERATION`: Defined if the template is registered for a servicepoint with the `cbtype` attribute set to `pre-/post-modification` (see [Service Callpoints and Templates](templates.md#ch\_templates.servicepoint)). Contains the requested service operation; create, update, or delete.

The `{...}` expression can also be any other valid XPath 1.0 expression. To address a reachable node, you might for example use:

```
/endpoint/ce/device
```

Or to select a leaf node, `device`:

```
../ce/device
```

NSO then uses the value of this leaf, say `ce5`, when constructing the value of the expression.

However, there are some special cases. If the result of the expression is a node-set (e.g. multiple leafs), and the target is a leaf list or a list's key leaf, the template configures multiple destination nodes. This handling allows you to set multiple values for a leaf list or set multiple list items.

Similarly, if the result is an empty node set, nothing is set (the set operation is ignored).

Finally, what nodes are reachable in the XPath expression, and how, depends on the root node and context used in the template. See [XPath Context in Templates](templates.md#ch\_templates.contexts).

## Conditional Statements <a href="#ch_templates.conditionals" id="ch_templates.conditionals"></a>

The `if`, and the accompanying `elif`, `else`, processing instructions make it possible to apply parts of the template, based on a condition. For example:

```
<policy-map xmlns="urn:ios" tags="merge">
  <name>{$POLICY_NAME}</name>
  <class>
    <name>{$CLASS_NAME}</name>
    <?if {qos-class/priority = 'realtime'}?>
      <priority-realtime>
        <percent>{$CLASS_BW}</percent>
      </priority-realtime>
    <?elif {qos-class/priority = 'critical'}?>
      <priority-critical>
        <percent>{$CLASS_BW}</percent>
      </priority-critical>
    <?else?>
      <bandwidth>
        <percent>{$CLASS_BW}</percent>
      </bandwidth>
    <?end?>
    <set>
      <ip>
        <dscp>{$CLASS_DSCP}</dscp>
      </ip>
    </set>
  </class>
</policy-map>
```

The preceding template shows how to produce different configuration, for network bandwidth management in this case, when different `qos-class/priority` values are specified.

In particular, the sub-tree containing the `priority-realtime` tag will only be evaluated if `qos-class/priority` in the `if` processing instruction evaluates to the string `'realtime'`.

The subtree under the `elif` processing instruction will be executed if the preceding `if` expression evaluated to `false`, i.e. `qos-class/priority` is not equal to the string `'realtime'`, but '`critical'` instead.

The subtree under the `else` processing instruction will be executed when both the preceding `if` and `elif` expressions evaluated to `false`, i.e. `qos-class/priority` is not `'realtime'` nor `'critical'`.

In your own code you can of course use just a subset of these instructions, such as a simple `if` - `end` conditional evaluation. But note that every conditional evaluation must end with the `end` processing instruction, to allow nesting multiple conditionals.

The evaluation of the XPath statements used in the `if` and `elif` processing instructions follow the XPath standard for computing boolean values. In summary, the conditional expression will evaluate to false when:

* The argument evaluates to an empty node-set.
* The value of the argument is either an empty string or numeric zero.
* The argument is of boolean type and evaluates to false, such as using the `not(true())` function.

## Loop Statements <a href="#ch_templates.loops" id="ch_templates.loops"></a>

The `foreach` and `for` processing instructions allow you to avoid needless repetition: they iterate over a set of values and apply statements in a sub-tree several times. For example:

```
<ip xmlns="urn:ios">
  <route>
  <?foreach {/tunnel}?>
    <ip-route-forwarding-list>
      <prefix>{network}</prefix>
      <mask>{netmask}</mask>
      <forwarding-address>{tunnel-endpoint}</forwarding-address>
    </ip-route-forwarding-list>
  <?end?>
  </route>
</ip>
```

The printout shows the use of `foreach` to configure a set of IP routes (the list `ip-route-forwarding-list`) for a Cisco network router. If there is a `tunnel` list in the service model, the `{/tunnel}` expression selects all the items from the list. If this is a non-empty set, then the sub-tree containing `ip-route-forwarding-list` is evaluated once for every item in that node set.

For each iteration, the initial context is set to one node, that is, the node being processed in that iteration. The XPath function `current()` retrieves this initial context if needed. Using the context, you can access the node data with relative XPath paths, e.g. the `{network}` code in the example refers to `/tunnel[...]/network` for the current item.

`foreach` only supports a single XPath expression as its argument and the result needs to be a node-set, not a simple value. However, you may use XPath union operator to join multiple node sets in a single expression when required: `{some-list-1 | some-leaf-list-2}`.

Similarly, `for` is a processing instruction that uses a variable to control the iteration, in line with traditional programming languages. For example, the following template disables the first four (0-3) interfaces on a Cisco router:

```
<interface xmlns="urn:ios">
  <?for i=0; {$i < 4}; i={$i + 1}?>
    <FastEthernet>
      <name>0/{$i}</name>
      <shutdown/>
    </FastEthernet>
  <?end?>
</interface>
```

In this example, three semicolon-separated clauses follow the `for` keyword:

* The first clause is the initial step executed before the loop is entered the first time. The format of the clause is that of a variable name followed by an equals sign and an expression. The latter may combine literal strings and XPath expressions surrounded by `{}`. The expression is evaluated in the same way as the XML tag contents in templates. This clause is optional.
* The second clause is the progress condition. The loop will execute as long as this condition evaluates to true, using the same rules as the `if` processing instruction. The format of this clause is an XPath expression surrounded by `{}`. This clause is mandatory.
* The third clause is executed after each iteration. It has the same format as the first clause (variable assignment) and is optional.

The `foreach` and `for` expressions make the loop explicit, which is why they are the first choice for most programmers. Alternatively, under certain circumstances, the template invokes an implicit loop, as described in [XPath Context in Templates](templates.md#ch\_templates.contexts).

## Template Operations <a href="#ch_templates.operations" id="ch_templates.operations"></a>

The most common use-case for templates is to produce new configuration but other behavior is possible too. This is accomplished by setting the `tags` attribute on XML elements.

NSO supports the following `tags` values, colloquially referred to as “tags”:

*   `merge`: Merge with a node if it exists, otherwise create the node. This is the default operation if no operation is explicitly set.

    ```
    <config tags="merge">
      <interface xmlns="urn:ios">
      ...
    ```
*   `replace`: Replace a node if it exists, otherwise create the node.

    ```
        <GigabitEthernet tags="replace">
          <name>{link/interface-number}</name>
          <description tags="merge">Link to PE</description>
          ...
    ```
*   `create`: Creates a node. The node must not already exist. An error is raised if the node exists.

    ```
        <GigabitEthernet tags="create">
          <name>{link/interface-number}</name>
          <description tags="merge">Link to PE</description>
          ...
    ```
*   `nocreate`: Merge with a node if it exists. If it does not exist, it will _not_ be created.

    ```
        <GigabitEthernet tags="nocreate">
          <name>{link/interface-number}</name>
          <description tags="merge">Link to PE</description>
          ...
    ```
*   `delete`: Delete the node.

    ```
        <GigabitEthernet tags="delete">
          <name>{link/interface-number}</name>
          <description tags="merge">Link to PE</description>
          ...
    ```

Tags `merge` and `nocreate` are inherited to their sub-nodes until a new tag is introduced.

Tags `create` and `replace` are not inherited and only apply to the node they are specified on. Children of the nodes with `create` or `replace` tags have `merge` behavior.

Tag `delete` applies only to the current node; any children (except keys specifying the list/leaf-list entry to delete) are ignored.

## Operations on Ordered Lists and Leaf-lists <a href="#ch_templates.order_ops" id="ch_templates.order_ops"></a>

For ordered-by-user lists and leaf lists, where item order is significant, you can use the `insert` attribute to specify where in the list, or leaf-list, the node should be inserted. You specify whether the node should be inserted first or last in the node-set, or before or after a specific instance.

For example, if you have a list of rules, such as ACLs, you may need to ensure a particular order:

```
<rule insert="first">
  <name>{$FIRSTRULE}</name>
</rule>
<rule insert="last">
  <name>{$LASTRULE}</name>
</rule>
<rule insert="after" value={$FIRSTRULE}>
  <name>{$SECONDRULE}</name>
</rule>
<rule insert="before" value={$LASTRULE}>
  <name>{$SECONDTOLASTRULE}</name>
</rule>
```

However, it is not uncommon that there are multiple services managing the same ordered-by user list or leaf-list. The relative order of elements inserted by these services might not matter, but there are some constraints on element positions that need to be fulfilled.

Following the ACL rules example, suppose that initially the list contains only the "deny-all" rule:

```
<rule>
  <name>deny-all</name>
  <ip>0.0.0.0</ip>
  <mask>0.0.0.0</mask>
  <action>deny</action>
</rule>
```

There are services that prepend permit rules to the beginning of the list using the `insert="first"` operation. If there are two services creating one entry each, say 10.0.0.0/8 and 192.168.0.0/24 respectively, then the resulting configuration looks like this:

```
<rule>
  <name>service-2</name>
  <ip>192.168.0.0</ip>
  <mask>255.255.255.0</mask>
  <action>permit</action>
</rule>
<rule>
  <name>service-1</name>
  <ip>10.0.0.0</ip>
  <mask>255.0.0.0</mask>
  <action>permit</action>
</rule>
<rule>
  <ip>0.0.0.0</ip>
  <mask>0.0.0.0</mask>
  <action>deny</action>
</rule>
```

Note that the rule for the second service comes first because it was configured last and inserted as the first item in the list.

If you now try to check-sync the first service (10.0.0.0/8), it will report as out-of-sync, and re-deploying it would move the 10.0.0.0/8 rule first. But what you really want is to ensure the deny-all rule comes last. This is when the `guard` attribute comes in handy.

If both the `insert` and `guard` attributes are specified on a list entry in a template, then the template engine first checks whether the list entry already exists in the resulting configuration between the target position (as indicated by the `insert` attribute) and the position of an element indicated by the `guard` attribute:

* If the element exists and fulfills this constraint, then its position is preserved. If a template list entry results in multiple configuration list entries, then all of them need to exist in the configuration in the same order as calculated by the template, and all of them need to fulfill the guard constraint in order for their position to be preserved.
* If the list entry/entries do not exist, are not in the same order, or do not fulfill the constraint, then the list is reordered as instructed by the insert statement.

So, in the ACL example, the template can specify the guard as follows:

```
<rule insert="first" guard="deny-all">
  <name>{$NAME}</name>
  <ip>{$IP}</ip>
  <mask>{$MASK}</mask>
  <action>permit</action>
</rule>
```

A guard can be specified literally (e.g. `guard="deny-all"` if "name" is the key of the list) or using an XPath expression (e.g. `guard="{$LASTRULE}"`). If the guard evaluates to a node-set consisting of multiple elements, then only the first element in this node-set is considered as the guard. The constraint defined by the `guard` is evaluated as follows:

* If the guard evaluates to an empty node-set (i.e. the node indicated by the guard does not exist in the target configuration), then the constraint is not fulfilled.
* If `insert="first"`, then the constraint is fulfilled if the element exists in the configuration _before_ the element indicated by the guard.
* If `insert="last"`, then the constraint is fulfilled if the element exists in the configuration after the element indicated by the guard.
* If `insert="after"`, then the constraint is fulfilled if the element exists in the configuration before the element indicated by the `guard`, but after the element indicated by the `value` attribute.
* If `insert="before"`, then the constraint is fulfilled if the element exists in the configuration after the element indicated by the `guard`, but before the element indicated by the or `value` attribute.

## Macros in Templates <a href="#ch_templates.macros" id="ch_templates.macros"></a>

Templates support macros - named XML snippets that facilitate reuse and simplify complex templates. When you call a previously defined macro, the templating engine inserts the macro data, expanded with the values of the supplied arguments. The following example demonstrates the use of a macro.

{% code title="Example: Template with Macros" %}
```
  1 <config-template xmlns="http://tail-f.com/ns/config/1.0">
      <?macro GbEth name='{/name}' ip mask='255.255.255.0'?>
        <GigabitEthernet>
          <name>$name</name>
  5       <ip>
            <address>
              <primary>
                <address>$ip</address>
                <mask>$mask</mask>
 10           </primary>
            </address>
          </ip>
        </GigabitEthernet>
      <?endmacro?>
 15 
      <?macro GbEthDesc name='{/name}' ip mask='255.255.255.0' desc?>
        <?expand GbEth name='$name' ip='$ip' mask='$mask'?>
        <GigabitEthernet>
          <name>$name</name>
 20       <description>$desc</description>
        </GigabitEthernet>
      <?endmacro?>
    
      <devices xmlns="http://tail-f.com/ns/ncs">
 25     <device tags="nocreate">
          <name>{/device}</name>
          <config tags="merge">
            <interface xmlns="urn:ios">
              <?expand GbEthDesc name='0/0/0/0' ip='10.250.1.1'
 30                              desc='Link to core'?>
            </interface>
          </config>
        </device>
      </devices>
 35 </config-template>}
```
{% endcode %}

When using macros, be mindful of the following:

* A macro must be a valid chunk of XML, or a simple string without any XML markup. So, a macro cannot contain only start-tags or only end-tags, for example.
* Each macro is defined between the `<?macro?>` and `<?endmacro?>` processing instructions, immediately following the `<config-template>` tag in the template.
*   A macro definition takes a name and an optional list of parameters. Each parameter may define a default value.

    \
    In the preceding example, a macro is defined as:\\

    ```
      <?macro GbEth name='{/name}' ip mask='255.255.255.0'?>
    ```

    \
    Here, `GbEth` is the name of the macro. This macro takes three parameters, `name`, `ip`, and `mask`. The parameters `name` and `mask` have default values, and `ip` does not.

    \
    The default value for `mask` is a fixed string, while the one for `name` by default gets its value through an XPath expression.
*   A macro can be expanded in another location in the template using the `<?expand?>` processing instruction. As shown in the example (line 29), the `<?expand?>` instruction takes the name of the macro to expand, and an optional list of parameters and their values.

    \
    The parameters in the macro definition are replaced with the values given during expansion. If a parameter is not given any value during expansion, the default value is used. If there is no default value in the definition, not supplying a value causes an error.
*   Macro definitions cannot be nested - that is, a macro definition cannot contain another macro definition. But a macro definition can have `<?expand?>` instructions to expand another macro within this macro (line 17 in the example).

    \
    The macro expansion and the parameter replacement work on just strings - there is no schema validation or XPath evaluation at this stage. A macro expansion just inserts the macro definition at the expansion site.
* Macros can be defined in multiple files, and macros defined in the same package are visible to all templates in that package. This means that a template file could have just the definitions of macros, and another file in the same package could use those macros.

When reporting errors in a template using macros, the line numbers for the macro invocations are also included, so that the actual location of the error can be traced. For example, an error message might resemble `service.xml:19:8 Invalid parameters for processing instruction set.` - meaning that there was a macro expansion on line 19 in `service.xml` and an error occurred at line 8 in the file defining that macro.

## XPath Context in Templates <a href="#ch_templates.contexts" id="ch_templates.contexts"></a>

When the evaluation of a template starts, the XPath context node and root node are both set to either the service instance data node (with a template-only service) or the node specified with the API call to apply the template (usually the service instance data node as well).

The root node is used as the starting point for evaluating absolute paths starting with `/` and puts a limit on where you can navigate with `../`.

You can access data outside the current root node subtree by dereferencing a leafref type leaf or by changing the root node from within the template.

To change the root node within the template, use the `set-root-node` XML processing instruction. The instruction takes an XPath expression as a parameter and this expression is evaluated in a special context, where the root node is the root of the datastore. This makes it possible to change to a node outside the current evaluation context.

For example: `<?set-root-node {/}?>` changes the accessible tree to the whole data store. Note that, as all processing instructions, the effect of `set-root-node` only applies until the closing parent tag.

The context node refers to the node that is used as the starting point for navigation with relative paths, such as `../device` or `device`.

You can change the current context node using the `set-context-node` or other context-related processing instructions. For example: `<?set-context-node {..}?>` changes the context node to the parent of the current context node.

There is a special case where NSO automatically changes the evaluation context as it progresses through and applies the template, which makes it easier to work with lists. There are two conditions required to trigger this special case:

1. The value being set in the template is the key of a list.
2. The XPath expression used for this key evaluates to a node set, not a value.

To illustrate, consider the following example.

Suppose you are using the template to configure interfaces on a device. Target device YANG model defines the list of interfaces as:

```
  list interface {
    key "name";
    leaf name {
      type string;
    }
    leaf address {
      type inet:ip-address;
    }
  }
```

You also use a service model that allows configuring multiple links:

```
  // ...
  container links {
    list link {
      key "intf-name";
      leaf intf-name {
        type string;
      }
      leaf intf-addr {
        type inet:ip-address;
      }
    }
  }
```

The context-changing mechanism allows you to configure the device interface with the specified address using the template:

```
  <interface>
    <name>{/links/link[0]/intf-name}</name>
    <address>{intf-addr}</address>
  </interface>
```

The `/links/link[0]/intf-name` evaluates to a node and the evaluation context node is changed to the parent of this node, `/links/link[0]`, because `name` is a key leaf. Now you can refer to `/links/link[0]/intf-addr` with a simple relative path `{intf-addr}`.

The true power and usefulness of context changing becomes evident when used together with XPath expressions that produce node sets with multiple nodes. You can create a template that configures multiple interfaces with their corresponding addresses (note the use of `link` instead of `link[0]`):

```
  <interface>
    <name>{/links/link/intf-name}</name>
    <address>{intf-addr}</address>
  </interface>
```

The first expression returns a node set possibly including multiple leafs. NSO then configures multiple list items (interfaces), based on their name. The context change mechanism triggers as well, making `{intf-addr}` refer to the corresponding leaf in the same link definition. Alternatively, you can achieve the same outcome with a loop (see [Loop Statements](templates.md#ch\_templates.loops)).

However, in some situations, you may not desire to change the context. You can avoid it by making the XPath expression return a value instead of a node/node-set. The simplest way is to use the XPath `string()` function, for example:

```
  <interface>
    <name>{string(/links-list/intf-name)}</name>
  </interface>
```

## Namespaces and Multi-NED Support <a href="#ch_templates.multined" id="ch_templates.multined"></a>

When a device makes itself known to NSO, it presents a list of capabilities (see [Capabilities, Modules, and Revision Management](../../operation-and-usage/ops/nso-device-manager.md#user\_guide.devicemanager.capas)), which includes what YANG modules that particular device supports. Since each YANG module defines a unique XML namespace, this information can be used in a template.

Hence, a template may include configuration for many diverse devices. The templating system streamlines this by applying only those pieces of the template that have a namespace matching the one advertised by the device (see [Supporting Different Device Types](implementing-services.md#ch\_services.devs\_types)).

Additionally, the system performs validation of the template against the specified namespace when loading the template as part of the package load sequence, allowing you to detect a lot of the errors at load time instead of at run time.

In case the namespace matching is insufficient, such as when you want to check for a particular version of a NED, you can use special processing instructions `if-ned-id` or `if-ned-id-match`. See [Processing Instructions Reference](templates.md#ch\_templates.xml\_instructions) for details and [Supporting Different Device Types](implementing-services.md#ch\_services.devs\_types) for an example.

However, strict validation against the currently loaded schema may become a problem for developing generic, reusable templates that should run in different environments with different sets of NEDs and NED versions loaded. For example, an NSO instance having fewer NED versions than the template is designed for may result in some elements not being recognized, while having more NED versions may introduce ambiguities.

In order to allow templates to be reusable while at the same time keeping as many errors as possible detectable at load time, NSO has a concept of `supported-ned-ids`. This is a set of NED IDs the package developer declares in the `package-meta-data.xml` file, indicating all NEDs the XML templates contained in this package are designed to support. This gives NSO a hint on how to interpret the template.

{% code title="Example: Package Declaring supported-ned-id" %}
```
<ncs-package xmlns="http://tail-f.com/ns/ncs-packages">
  <name>mypackage</name>
  <!-- ... -->

  <!-- Exact NED id match, requires namespace -->
  <supported-ned-id xmlns:id="http://tail-f.com/ns/ned-id/cisco-ios-cli-3.0">
    id:cisco-ios-cli-3.0
  </supported-ned-id>

  <!-- Regex-based NED id match -->
  <supported-ned-id-match>router-nc-1</supported-ned-id-match>
</ncs-package>
```
{% endcode %}

Namely, if a package declares a list of supported-ned-ids, then the templates in this package are interpreted as if no other ned-ids are loaded in the system. If such a template is attempted to be applied to a device with ned-id outside the supported list, then a run-time error is generated because this ned-id was not considered when the template was loaded. This allows us to ignore ambiguities in the data model introduced by additional NEDs that were not considered during template development.

If a package declares a list of supported-ned-ids and the runtime system does not have one or more declared NEDs loaded, then the template engine uses the so-called relaxed loading mode, which means it ignores any unknown namespaces and `<?if-ned-id?>` clauses containing exclusively unknown ned-ids, assuming that these parts of the template are not applicable in the current running system.

Because relaxed loading mode performs less strict validation and potentially prevents some errors from being detected, the package developer should always make sure to test in the system with all the supported ned-ids loaded, i.e. when the loading mode is `strict`. The loading mode can be verified by looking at the value of `template-loading-mode` leaf for the corresponding package under `/packages/package` list.

If the package does not declare any `supported-ned-ids`, then the templates are loaded in `strict` mode, using the full set of currently loaded NED IDs. This may make the package less reusable between different systems, but is usually fine in environments where the package is intended to be used in runtime systems fully under the control of the package developer.

## Passing Deep Structures from API <a href="#d5e2638" id="d5e2638"></a>

When applying the template via API, you typically pass parameters to a template through variables, as described in [Templates and Code](implementing-services.md#templates-and-code) and [Values in a Template](templates.md#ch\_templates.values). One limitation of this mechanism is that a variable can only hold one string value. Yet, sometimes there is a need to pass not just a single value, but a list, map, or even more complex data structures from API to the template.

One way to achieve this is to use smaller templates, such as invoking the template repeatedly, one by one for each list item (or perhaps pair-by-pair in the case of a map). However, there are certain disadvantages to this approach. One of them is the performance: every invocation of the template from the API requires a context switch between the user application process and the NSO core process, which can be costly. Another disadvantage is that the logic is split between Java or Python code and the template, which makes it harder to understand and implement.

An alternative approach described in this section involves modeling the required auxiliary data as operational data and populating it in the code, before applying the template. For a service, the service callback code in Java or Python first populates the auxiliary data and then passes control to the template, which handles the main service configuration logic. The auxiliary data is accessible in the template, by means of XPath, just like any other service input data.

There are different approaches to modeling the auxiliary data. It can reside in the service tree as it is private to the service instance; either integrated in the existing data tree or as a separate subtree under the service instance. It can also be located outside of the service instance, however, it is important to keep in mind that operational data cannot be shared by multiple services because there are no refcounters or backpointers stored on operational data.

After the service is deployed, the auxiliary leafs remain in the database which facilitates debugging because they can be seen via all northbound interfaces. If this is not the intention, they can be hidden with the help of `tailf:hidden` statement. Because operational data is also a part of FASTMAP diff, these values will be deleted when the service is deleted and need to be recomputed when the service is re-deployed. This also means that in most cases there should be no need to write any additional code to clean up this data.

One example of a task that is hard to solve in the template by native XPath functions is converting a network prefix into a network mask or vice versa. Below is a snippet of a data model that is part of a service input data and contains a list of interfaces along with IP addresses to be configured on those interfaces. If the input IP address contains a prefix, but the target device accepts an IP address with a network mask instead, then you can use an auxiliary operational leaf to pass the mask (calculated from the prefix) to the template.

```
list interface {
  key name;
  leaf name {
    type string;
  }
  leaf address {
    type tailf:ipv4-address-and-prefix-length;
    description
      "IP address with prefix in the following format, e.g.: 10.2.3.4/24";
  }
  leaf mask {
    config false;
    type inet:ipv4-address;
    description
      "Auxiliary data populated by service code, represents network mask
       corresponding to the prefix in the address field, e.g.: 255.255.255.0";
  }
}
```

The code that calls the template needs to populate the mask. For example, using the Python Maagic API in a service:

```
    def cb_create(self, tctx, root, service, proplist):
        interface_list = service.interface
        for intf in interface_list:
            prefix = intf.address.split('/')[1]
            intf.mask = ipaddress.IPv4Network(0, int(prefix)).netmask

        # Template variables don't need to contain mask
        # as it is passed via (operational) database
        template = ncs.template.Template(service)
        template.apply('iface-template')
```

The corresponding `iface-template` might then be as simple as:

```
      <interface>
        <name>{/interface/name}</name>
        <ip-address>{substring-before(address, '/')}</ip-address>
        <ip-mask>{mask}</ip-mask>
      </interface>
```

### Service Callpoints and Templates <a href="#ch_templates.servicepoint" id="ch_templates.servicepoint"></a>

The archetypical use case for XML templates is service provisioning and NSO allows you to directly invoke a template for a service, without writing boilerplate code in Python or Java. You can take advantage of this feature by configuring the `servicepoint` attribute on the root `config-template` element. For example:

```
<config-template xmlns="http://tail-f.com/ns/config/1.0"
                 servicepoint="some-service">
  <!-- ... -->
</config-template>
```

Adding the attribute registers this template for the given servicepoint, defined in the YANG service model. Without any additional attributes, the registration corresponds to the standard _create_ service callback.

{% hint style="info" %}
While the template (file) name is not referred to in this case, it must still be unique in an NSO node.
{% endhint %}

In a similar manner, you can register templates for each state of a nano service, using `componenttype` and `state` attributes. The section [Nano Service Callbacks](nano-services-staged-provisioning.md#ug.nano\_services.callbacks) contains examples.

Services also have pre- and post-modification callbacks, further described in [Service Callbacks](../development/developing-services/services-deep-dive.md#ch\_svcref.cbs), which you can also implement with templates. Simply put, pre- and post-modification templates are applied before and after applying the main service template.

These pre- and post-modification templates can only be used in classic (non-nano) services when the create callback is implemented as a template. That is, they cannot be used together with create callbacks implemented in Java or Python. If you want to mix the two approaches for the same service, consider using nano services.

To define a template as pre- or post-modification, appropriately configure the `cbtype` attribute, along with `servicepoint`. The `cbtype` attribute supports these three values:

* `pre-modification`
* `create`
* `post-modification`

{% hint style="info" %}
NSO supports only a single registration for each servicepoint and callback type. Therefore, you cannot register multiple templates for the same `servicepoint/cbtype` combination.
{% endhint %}

The `$OPERATION` variable is set internally by NSO in pre- and post-modification templates to contain the service operation, i.e., create, update, or delete, that triggered the callback. The `$OPERATION` variable can be used together with template conditional statements (see [Conditional Statements](templates.md#ch\_templates.conditionals)) to apply different parts of the template depending on the triggering operation. Note that the service data is not available in the pre- or post-modification callbacks when `$OPERATION = 'delete'` since the service has been deleted already in the transaction context where the template is applied.

{% code title="Example: Post-modification Template" %}
```
<config-template xmlns="http://tail-f.com/ns/config/1.0"
                 servicepoint="some-service"
                 cbtype="post-modification">
  <?if {$OPERATION = 'create'}?>
    <devices xmlns="http://tail-f.com/ns/ncs">
      <device>
        <name>{/device}</name>
        <config>
          <!-- ... -->
        </config>
      </device>
    </devices>
  <?elif {$OPERATION = 'update'}?>
    <!-- ... -->
  <?else?>
    <!-- $OPERATION = 'delete' -->
    <!-- ... -->
  <?end?>
</config-template>
```
{% endcode %}

## Debugging Templates

You can request additional information when applying templates in order to understand what is going on. When applying or committing a template in the CLI, the `debug` pipe command enables debug information:

```
admin@ncs(config)# commit dry-run | debug template
```

```
admin@ncs(config)# commit dry-run | debug xpath
```

The `debug xpath` option outputs _all_ XPath evaluations for the transaction, and is not limited to the XPath expressions inside templates.

The `debug template` option outputs XPath expression results from the template, under which context expressions are evaluated, what operation is used, and how it affects the configuration, for all templates that are invoked. You can narrow it down to only show debugging information for a template of interest:

```
admin@ncs(config)# commit dry-run | debug template l3vpn
```

Additionally, the template and xpath debugging can be combined:

<pre><code><strong>admin@ncs(config)# commit dry-run | debug template | debug xpath
</strong></code></pre>

For XPath evaluation, you can also inspect the XPath trace log if it is enabled (e.g. with `tail -f logs/xpath.trace`). XPath trace is enabled in the `ncs.conf` configuration file and is enabled by default for the examples.

Another option to help you get the XPath selections right is to use the NSO CLI `show` command with the `xpath` display flag to find out the correct path to an instance node. This shows the name of the key elements and also the namespace changes.

```
admin@ncs# show running-config devices device c0 config ios:interface | display xpath
/devices/device[name='c0']/config/ios:interface/FastEthernet[name='1/0']
/devices/device[name='c0']/config/ios:interface/FastEthernet[name='1/1']
/devices/device[name='c0']/config/ios:interface/FastEthernet[name='1/2']
/devices/device[name='c0']/config/ios:interface/FastEthernet[name='2/1']
/devices/device[name='c0']/config/ios:interface/FastEthernet[name='2/2']
```

When using more complex expressions, the **ncs\_cmd** utility can be used to experiment with and debug expressions. **ncs\_cmd** is used in a command shell. The command does not print the result as XPath selections but is still of great use when debugging XPath expressions. The following example selects FastEthernet interface names on the device `c0`:

```
$ ncs_cmd -c "x /devices/device[name='c0']/config/ios:interface/FastEthernet/name"
/devices/device{c0}/config/interface/FastEthernet{1/0}/name [1/0]
/devices/device{c0}/config/interface/FastEthernet{1/1}/name [1/1]
/devices/device{c0}/config/interface/FastEthernet{1/2}/name [1/2]
/devices/device{c0}/config/interface/FastEthernet{2/1}/name [2/1]
/devices/device{c0}/config/interface/FastEthernet{2/2}/name [2/2]
```

### Example Debug Template Output <a href="#d5e2727" id="d5e2727"></a>

The following text walks through the output of the `debug template` command for a dns-v3 example service, found in `examples.ncs/implement-a-service/dns-v3`. To try it out for yourself, start the example with `make demo` and configure a service instance:

```
admin@ncs# config
admin@ncs(config)# load merge example.cfg
admin@ncs(config)# commit dry-run | debug template
```

The XML template used in the service is simple but non-trivial:

```
  1 <config-template xmlns="http://tail-f.com/ns/config/1.0"
                     servicepoint="dns">
      <devices xmlns="http://tail-f.com/ns/ncs">
        <?foreach {/target-device}?>
  5     <device>
          <name>{.}</name>
          <config>
            <ip xmlns="urn:ios">
              <?if {/dns-server-ip}?>
 10             <!-- If dns-server-ip is set, use that. -->
                <name-server>{/dns-server-ip}</name-server>
              <?else?>
                <!-- Otherwise, use the default one. -->
                <name-server>192.0.2.1</name-server>
 15           <?end?>
            </ip>
          </config>
        </device>
        <?end?>
 20   </devices>
    </config-template>
```

Applying the template produces a substantial amount of output. Let's interpret it piece by piece. The output starts with:

```
Processing instruction 'foreach': evaluating the node-set \
    (from file "dns-template.xml", line 4)
Evaluating "/target-device" (from file "dns-template.xml", line 4)
Context node: /dns[name='instance1']
Result:
For /dns[name='instance1']/target-device[.='c1'], it evaluates to []
For /dns[name='instance1']/target-device[.='c2'], it evaluates to []
```

The templating engine found the `foreach` in the `dns-template.xml` file at line 4. In this case, it is the only `foreach` block in the file but in general, there might be more. The `{/target-device}` expression is evaluated using the `/dns[name='instance1']` context, resulting in the complete `/dns[name='instance1']/target-device` path. Note that the latter is based on the root node (not shown in the output), not the context node (which happens to be the same as the root node at the start of template evaluation).

NSO found two nodes in the leaf-list for this expression, which you can verify in the CLI:

```
admin@ncs(config)# show full-configuration dns instance1 target-device | display xpath
/dns[name='instance1']/target-device [ c1 c2 ]
```

Next comes:

```
Processing instruction 'foreach': next iteration: \
    context /dns[name='instance1']/target-device[.='c1'] \
    (from file "dns-template.xml", line 4)
Evaluating "." (from file "dns-template.xml", line 6)
Context node: /dns[name='instance1']/target-device[.='c1']
Result:
For /dns[name='instance1']/target-device[.='c1'], it evaluates to "c1"
```

The template starts with the first iteration of the loop with the `c1` value. Since the node was an item in a leaf-list, the context refers to the actual value. If instead, it was a list, the context would refer to a single item in the list.

```
Operation 'merge' on existing node: /devices/device[name='c1'] \
    (from file "dns-template.xml", line 6)
```

This line signifies the system “applied” line 6 in the template, selecting the `c1` device for further configuration. The line also informs you the device (the item in the /devices/device list with this name) exists.

```
Processing instruction 'if': evaluating the condition \
    (from file "dns-template.xml", line 9)
Evaluating conditional expression "boolean(/dns-server-ip)" \
    (from file "dns-template.xml", line 9)
Context node: /dns[name='instance1']/target-device[.='c1']
Result: true - continuing
```

The template then evaluates the `if` condition, resulting in processing of the lines 10 and 11 in the template:

```
Processing instruction 'if': recursing (from file "dns-template.xml", line 9)
Evaluating "/dns-server-ip" (from file "dns-template.xml", line 11)
Context node: /dns[name='instance1']/target-device[.='c1']
Result:
For /dns[name='instance1'], it evaluates to "192.0.2.110"
Operation 'merge' on non-existing node: \
    /devices/device[name='c1']/config/ios:ip/name-server[.='192.0.2.110'] \
    (from file "dns-template.xml", line 11)
```

The last line shows how a new value is added to the target leaf-list, that was not there (non-existing) before.

```
Processing instruction 'else': skipping (from file "dns-template.xml", line 12)
Processing instruction 'foreach': next iteration: \
    context /dns[name='instance1']/target-device[.='c2'] \
    (from file "dns-template.xml", line 4)
```

As the `if` statement matched, the `else` part does not apply and a new iteration of the loop starts, this time with the `c2` value.

Now the same steps take place for the other, `c2`, device:

```
Evaluating "." (from file "dns-template.xml", line 6)
Context node: /dns[name='instance1']/target-device[.='c2']
Result:
For /dns[name='instance1']/target-device[.='c2'], it evaluates to "c2"
Operation 'merge' on existing node: /devices/device[name='c2'] \
    (from file "dns-template.xml", line 6)
Processing instruction 'if': evaluating the condition \
    (from file "dns-template.xml", line 9)
Evaluating conditional expression "boolean(/dns-server-ip)" \
    (from file "dns-template.xml", line 9)
Context node: /dns[name='instance1']/target-device[.='c2']
Result: true - continuing
Processing instruction 'if': recursing (from file "dns-template.xml", line 9)
Evaluating "/dns-server-ip" (from file "dns-template.xml", line 11)
Context node: /dns[name='instance1']/target-device[.='c2']
Result:
For /dns[name='instance1'], it evaluates to "192.0.2.110"
Operation 'merge' on non-existing node: \
    /devices/device[name='c2']/config/ios:ip/name-server[.='192.0.2.110'] \
    (from file "dns-template.xml", line 11)
Processing instruction 'else': skipping (from file "dns-template.xml", line 12)
```

Finally, the template processing completes as there are no more nodes in the loop, and NSO outputs the new dry-run configuration:

```
cli {
    local-node {
        data  devices {
                  device c1 {
                      config {
                          ip {
             -                name-server 192.0.2.1;
             +                name-server 192.0.2.1 192.0.2.110;
                          }
                      }
                  }
                  device c2 {
                      config {
                          ip {
             +                name-server 192.0.2.110;
                          }
                      }
                  }
              }
             +dns instance1 {
             +    target-device [ c1 c2 ];
             +    dns-server-ip 192.0.2.110;
             +}
    }
}
```

## Processing Instructions Reference <a href="#ch_templates.xml_instructions" id="ch_templates.xml_instructions"></a>

NSO template engine supports a number of XML processing instructions to allow more dynamic templates:

<table data-full-width="true"><thead><tr><th width="418">Syntax</th><th>Description</th></tr></thead><tbody><tr><td><pre><code>    &#x3C;?set v = value?>
</code></pre></td><td>Allows you to assign a new variable or manipulate the existing value of a variable v. If used to create a new variable, the scope of visibility of this variable is limited to the parent tag of the processing instruction or the current processing instruction block. Specifically, if a new variable is defined inside a loop, then it is discarded at the end of each iteration.</td></tr><tr><td><pre><code>    &#x3C;?if {expression}?>
        ...
    &#x3C;?elif {expression}?>
        ...
    &#x3C;?else?>
        ...
    &#x3C;?end?>
</code></pre></td><td>Processing instruction block that allows conditional execution based on the boolean result of the expression. For a detailed description, see <a href="templates.md#ch_templates.conditionals">Conditional Statements</a>.</td></tr><tr><td><pre><code>    &#x3C;?foreach {expression}?>
        ...
    &#x3C;?end?>
</code></pre></td><td>The expression must evaluate to a (possibly empty) XPath node-set. The template engine will then iterate over each node in the node set by changing the XPath current context node to this node and evaluating all children tags within this context. For the detailed description see <a href="templates.md#ch_templates.loops">Loop Statements</a>.</td></tr><tr><td><pre data-overflow="wrap"><code>    &#x3C;?for v = start_value; {progress condition}; v = next_value?>
        ...
    &#x3C;?end?>
</code></pre></td><td><p>This processing instruction allows you to iterate over the same set of template tags by changing a variable value. The variable visibility scope obeys the same rules as the <code>set</code> processing instruction, except the variable value, is carried over to the next iteration instead of being discarded at the end of each iteration.</p><p>Only the condition expression is mandatory, either or both of initial and next value assignment can be omitted, e.g.:</p><pre><code>    &#x3C;?for ; {condition}; ?>
</code></pre><p>For a detailed description see <a href="templates.md#ch_templates.loops">Loop Statements</a>.</p></td></tr><tr><td><pre><code>   &#x3C;?copy-tree {source}?>
</code></pre></td><td>This instruction is analogous to <code>copy_tree()</code> function available in the MAAPI API. The parameter is an XPath expression that must evaluate to exactly one node in the data tree and indicate the source path to copy from. The target path is defined by the position of the <code>copy-tree</code> instruction in the template within the current context.</td></tr><tr><td><pre><code>    &#x3C;?set-root-node {expression}?>
</code></pre></td><td>Allows to manipulate the root node of the XPath accessible tree. This expression is evaluated in an XPath context where the accessible tree is the entire datastore, which means that it is possible to select a root node outside the currently accessible tree. The current context node remains unchanged. The expression must evaluate to exactly one node in the data tree.</td></tr><tr><td><pre><code>    &#x3C;?set-context-node {expression}?>
</code></pre></td><td>Allows you to manipulate the current context node used to evaluate XPath expressions in the template. The expression is evaluated within the current XPath context and must evaluate to exactly one node in the data tree.</td></tr><tr><td><pre><code>    &#x3C;?save-context name?>
</code></pre></td><td>Store both the current context node and the root node of the XPath accessible tree with <em><code>name</code></em> being the key to access it later. It is possible to switch to this context later using <code>switch-context</code> with the name. Multiple contexts can be stored simultaneously under different names. Using save-context with the same name multiple times will result in the stored context being overwritten.</td></tr><tr><td><pre><code>    &#x3C;?switch-context name?>
</code></pre></td><td>Used to switch to a context stored using <code>save-context</code> with the specified name. This means that both the current context node and the root node of the XPath accessible tree will be changed to the stored values. <code>switch-context</code> does not remove the context from the storage and can be used as many times as needed, however using it with a name that does not exist in the storage causes an error.</td></tr><tr><td><pre><code>    &#x3C;?if-ned-id ned-ids?>
        ...
    &#x3C;?elif-ned-id ned-ids?>
        ...
    &#x3C;?else?>
        ...
    &#x3C;?end?>
</code></pre></td><td><p>If there are multiple versions of the same NED expected to be loaded in the system, which define different versions of the same namespace, this processing instruction helps to resolve ambiguities in the schema between different versions of the NED. The part of the template following this processing instruction, up to matching <code>elif-ned-id</code>, <code>else</code> or <code>end</code> processing instruction is only applied to devices with the ned-id matching one of the ned-ids specified as a parameter to this processing instruction. If there are no ambiguities to resolve, then this processing instruction is not required. The <em><code>ned-ids</code></em> must contain one or more qualified NED ID identities separated by spaces.</p><p><br>The <code>elif-ned-id</code> is optional and used to define a part of the template that applies to devices with another set of ned-ids than previously specified. Multiple <code>elif-ned-id</code> instructions are allowed in a single block of <code>if-ned-id</code> instructions. The set of ned-ids specified as a parameter to <code>elif-ned-id</code> instruction must be non-intersecting with the previously specified ned-ids in this block.</p><p>The <code>else</code> processing instruction should be used with care in this context, as the set of the ned-ids it handles depends on the set of ned-ids loaded in the system, which can be hard to predict at the time of developing the template. To mitigate this problem it is recommended that the package containing this template defines a set of <code>supported-ned-ids</code> as described in <a href="templates.md#ch_templates.multined">Namespaces and Multi-NED Support</a>.</p></td></tr><tr><td><pre><code>    &#x3C;?if-ned-id-match regex?>
        ...
    &#x3C;?elif-ned-id-match regex?>
        ...
    &#x3C;?else?>
        ...
    &#x3C;?end?>
</code></pre></td><td>The <code>if-ned-id-match</code> and <code>elif-ned-id-match</code> processing instructions work similarly to <code>if-ned-id</code> and <code>elif-ned-id</code> but they accept a regular expression as an argument instead of a list of ned-ids. The regular expression is matched against all of the ned-ids supported by the package. If the <code>if-ned-id-match</code> processing instruction is nested inside of another <code>if-ned-id-match</code> or <code>if-ned-id</code> processing instruction, then the regular expression will only be matched against the subset of ned-ids matched by the encompassing processing instruction. The <code>if-ned-id-match</code> and <code>elif-ned-id-match</code> processing instructions are only allowed inside a device's mounted configuration subtree rooted at /devices/device/config.</td></tr><tr><td><pre><code>    &#x3C;?macro name params...?>
        ...
    &#x3C;?endmacro?>
</code></pre></td><td>Define a new macro with the specified name and optional parameters. Macro definitions must come at the top of the template, right after the <code>config-template</code> tag. For a detailed description see <a href="templates.md#ch_templates.macros">Macros in Templates</a>.</td></tr><tr><td><pre><code>    &#x3C;?expand name params...?>
</code></pre></td><td>Insert and expand the named macro, using the specified values for parameters. For a detailed description, see <a href="templates.md#ch_templates.macros">Macros in Templates</a>.</td></tr></tbody></table>

The variable value in both `set` and `for` processing instructions are evaluated in the same way as the values within XML tags in a template (see [Values in a Template](templates.md#ch\_templates.values)). So, it can be a mix of literal values and XPath expressions surrounded by `{...}`.

The variable value is always stored as a string, so any XPath expression will be converted to literal using the XPath `string()` function. Namely, if the expression results in an integer or a boolean, then the resulting value would be a string representation of the integer or boolean. If the expression results in a node set, then the value of the variable is a concatenated string of values of nodes in this node set.

It is important to keep in mind that while in some cases XPath converts the literal to another type implicitly (for example, in an expression `{$x < 3}` a value x='1' is converted to integer 1 implicitly), in other cases an explicit conversion is needed. For example, using the expression `{$x > $y}`, if x='9' and y='11', the result of the expression is true due to alphabetic order as both variables are strings. In order to compare the values as numbers, an explicit conversion of at least one argument is required: `{number($x) > $y}`.

## XPath Functions <a href="#d5e2911" id="d5e2911"></a>

This section lists a few useful functions, available in XPath expressions. The list is not exhaustive; please refer to the [XPath standard](https://www.w3.org/TR/1999/REC-xpath-19991116/#corelib), [YANG standard](https://datatracker.ietf.org/doc/html/rfc7950#section-10), and NSO-specific extensions in [XPATH FUNCTIONS](https://developer.cisco.com/docs/nso-guides-6.2/ncs-man-pages-volume-5/#man.5.tailf\_yang\_extensions.xpath\_functions) in Manual Pages for a full list.

<details>

<summary>Type Conversion</summary>

* [bit-is-set()](https://datatracker.ietf.org/doc/html/rfc7950#section-10.6.1)
* [boolean()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-boolean)
* [enum-value()](https://datatracker.ietf.org/doc/html/rfc7950#section-10.5.1)
* [number()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-number)
* [string()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-string)

</details>

<details>

<summary>String Handling</summary>

* [concat()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-concat)
* [contains()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-contains)
* [normalize-space()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-normalize-space)
* [re-match()](https://datatracker.ietf.org/doc/html/rfc7950#section-10.2.1)
* [starts-with()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-starts-with)
* [substring()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-substring)
* [substring-after()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-substring-after)
* [substring-before()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-substring-before)
* [translate()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-translate)

</details>

<details>

<summary>Model Navigation</summary>

* [current()](https://datatracker.ietf.org/doc/html/rfc7950#section-10.1.1)
* [deref()](https://datatracker.ietf.org/doc/html/rfc7950#section-10.3.1)
* [last()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-last)
* [sort-by()](https://developer.cisco.com/docs/nso-guides-6.2/ncs-man-pages-volume-5/#man.5.tailf\_yang\_extensions.xpath\_functions) in Manual Pages

</details>

<details>

<summary>Other</summary>

* [compare()](https://developer.cisco.com/docs/nso-guides-6.2/ncs-man-pages-volume-5/#man.5.tailf\_yang\_extensions.xpath\_functions) in Manual Pages
* [count()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-count)
* [max()](https://developer.cisco.com/docs/nso-guides-6.2/ncs-man-pages-volume-5/#man.5.tailf\_yang\_extensions.xpath\_functions) in Manual Pages
* [min()](https://developer.cisco.com/docs/nso-guides-6.2/ncs-man-pages-volume-5/#man.5.tailf\_yang\_extensions.xpath\_functions) in Manual Pages
* [not()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-not)
* [sum()](https://www.w3.org/TR/1999/REC-xpath-19991116/#function-sum)

</details>
