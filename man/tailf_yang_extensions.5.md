# tailf_yang_extensions Man Page

`tailf_yang_extensions` - Tail-f YANG extensions

## Synopsis

`tailf:abstract`

`tailf:action`

`tailf:actionpoint`

`tailf:alt-name`

`tailf:annotate`

`tailf:annotate-module`

`tailf:callpoint`

`tailf:cdb-oper`

`tailf:code-name`

`tailf:confirm-text`

`tailf:default-ref`

`tailf:dependency`

`tailf:display-column-name`

`tailf:display-groups`

`tailf:display-hint`

`tailf:display-status-name`

`tailf:display-when`

`tailf:error-info`

`tailf:exec`

`tailf:export`

`tailf:hidden`

`tailf:id`

`tailf:id-value`

`tailf:ignore-if-no-cdb-oper`

`tailf:indexed-view`

`tailf:info`

`tailf:info-html`

`tailf:internal-dp`

`tailf:java-class-name`

`tailf:junos-val-as-xml-tag`

`tailf:junos-val-with-prev-xml-tag`

`tailf:key-default`

`tailf:link`

`tailf:lower-case`

`tailf:meta-data`

`tailf:mount-id`

`tailf:mount-point`

`tailf:ncs-device-type`

`tailf:ned-data`

`tailf:ned-default-handling`

`tailf:ned-ignore-compare-config`

`tailf:no-dependency`

`tailf:no-leafref-check`

`tailf:non-strict-leafref`

`tailf:operation`

`tailf:override-auto-dependencies`

`tailf:path-filters`

`tailf:secondary-index`

`tailf:snmp-delete-value`

`tailf:snmp-exclude-object`

`tailf:snmp-lax-type-check`

`tailf:snmp-mib-module-name`

`tailf:snmp-name`

`tailf:snmp-ned-accessible-column`

`tailf:snmp-ned-delete-before-create`

`tailf:snmp-ned-modification-dependent`

`tailf:snmp-ned-recreate-when-modified`

`tailf:snmp-ned-set-before-row-modification`

`tailf:snmp-oid`

`tailf:snmp-row-status-column`

`tailf:sort-order`

`tailf:sort-priority`

`tailf:step`

`tailf:structure`

`tailf:suppress-echo`

`tailf:transaction`

`tailf:typepoint`

`tailf:unique-selector`

`tailf:validate`

`tailf:value-length`

`tailf:writable`

`tailf:xpath-root`

## Description

This manpage describes all the Tail-f extensions to YANG. The YANG
extensions consist of YANG statements and XPath functions to be used in
YANG data models.

The YANG source file `$NCS_DIR/src/ncs/yang/tailf-common.yang` gives the
exact YANG syntax for all Tail-f YANG extension statements - using the
YANG language itself.

Most of the concepts implemented by the extensions listed below are
described in the NSO User Guide. For example user defined validation is
described in the Validation chapter. The YANG syntax is described here
though.

## Yang Statements

### tailf:abstract

Declares the identity as abstract, which means that it is intended to be
used for derivation. It is an error if a leaf of type identityref is set
to an identity that is declared as abstract.

The *abstract* statement can be used in: *identity*.

### tailf:action *name*

Defines an action (method) in the data model.

When the action is invoked, the instance on which the action is invoked
is explicitly identified by an hierarchy of configuration or state data.

The action statement can have either a 'tailf:actionpoint' or a
'tailf:exec' substatement. If the action is implemented as a callback in
an application daemon, 'tailf:actionpoint' is used, whereas 'tailf:exec'
is used for an action implemented as a standalone executable (program or
script). Additionally, 'action' can have the same substatements as the
standard YANG 'rpc' statement, e.g., 'description', 'input', and
'output'.

For example:

<div class="informalexample">

        container sys {
          list interface {
            key name;
            leaf name {
              type string;
            }
            tailf:action reset {
              tailf:actionpoint my-ap;
              input {
                leaf after-seconds {
                  mandatory false;
                  type int32;
                }
              }
            }
          }
        }

</div>

We can also add a 'tailf:confirm-text', which defines a string to be
used in the user interfaces to prompt the user for confirmation before
the action is executed. The optional 'tailf:confirm-default' and
'tailf:cli-batch-confirm-default' can be set to control if the default
is to proceed or to abort. The latter will only be used during batch
processing in the CLI (e.g. non-interactive mode).

<div class="informalexample">

        tailf:action reset {
          tailf:actionpoint my-ap;
          input {
            leaf after-seconds {
              mandatory false;
              type int32;
            }
          }
          tailf:confirm-text 'Really want to do this?' {
            tailf:confirm-default true;
          }
        }

</div>

The 'tailf:actionpoint' statement can have a 'tailf:opaque'
substatement, to define an opaque string that is passed to the callback
function.

<div class="informalexample">

        tailf:action reset {
          tailf:actionpoint my-ap {
            tailf:opaque 'reset-interface';
          }
          input {
            leaf after-seconds {
              mandatory false;
              type int32;
            }
          }
        }

</div>

When we use the 'tailf:exec' substatement, the argument to exec
specifies the program or script that should be executed. For example:

<div class="informalexample">

        tailf:action reboot {
          tailf:exec '/opt/sys/reboot.sh' {
            tailf:args '-c $(context) -p $(path)';
          }
          input {
            leaf when {
              type enumeration {
                enum now;
                enum 10secs;
                enum 1min;
              }
            }
          }
        }

</div>

The *action* statement can be used in: *augment*, *list*, *container*,
and *grouping*.

The following substatements can be used:

*tailf:actionpoint*

*tailf:alt-name*

*tailf:cli-mount-point*

*tailf:cli-configure-mode*

*tailf:cli-operational-mode*

*tailf:cli-oper-info*

*tailf:code-name*

*tailf:confirm-text*

*tailf:display-when*

*tailf:exec*

*tailf:hidden*

*tailf:info*

*tailf:info-html*

### tailf:actionpoint *name*

Identifies the callback in a data provider that implements the action.
See confd_lib_dp(3) for details on the API.

The *actionpoint* statement can be used in: *rpc*, *action*,
*tailf:action*, and *refine*.

The following substatements can be used:

*tailf:opaque* Defines an opaque string which is passed to the callback
function in the context. The maximum length of the string is 255
characters.

*tailf:internal* For internal ConfD / NCS use only.

### tailf:alt-name *name*

This property is used to specify an alternative name for the node in the
CLI. It is used instead of the node name in the CLI, both for input and
output.

The *alt-name* statement can be used in: *rpc*, *action*, *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

### tailf:annotate *target*

Annotates an existing statement with a 'tailf' statement or a validation
statement. This is useful in order to add tailf statements to a module
without touching the module source. Annotation statements can be put in
a separate annotation module, and then passed to 'confdc' or 'ncsc' (or
'pyang') when the original module is compiled.

Any 'tailf' statement, except 'action' can be annotated. The statement
'action' modifies the data model, and are thus not allowed.

The validation statements 'must', 'min-elements', 'max-elements',
'mandatory', 'unique', and 'when' can also be annotated.

A 'description' can also be annotated.

'tailf:annotate' can occur on the top-level in a module, or in another
'tailf:annotate' statement. If the import is used for a top-level
'tailf:annotate' together with 'tailf:annotate-module' in the same
annotation module, the circular dependency error is generated. In this
case, the annotation module needs to be split up into one module for
'tailf:annotate' and another for 'tailf:annotate-module'.

The argument is a 'schema-nodeid', i.e. the same as for 'augment', or a
'\*'. It identifies a target node in the schema tree to annotate with
new statements. The special value '\*' can be used within another
'tailf:annotate' statement, to select all children for annotation.

The target node is searched for after 'uses' and 'augment' expansion.
All substatements to 'tailf:annotate' are treated as if they were
written inline in the target node, with the exception of any
'tailf:annotate' substatements. These are treated recursively. For
example, the following snippet adds one callpoint to /x and one to /x/y:

<div class="informalexample">

     tailf:annotate /x {
       tailf:callpoint xcp;
       tailf:annotate y {
         tailf:callpoint ycp;
       }
     }

</div>

The *annotate* statement can be used in: *module* and *submodule*.

The following substatements can be used:

*tailf:annotate*

### tailf:annotate-module *module-name*

Annotates an existing module or submodule statement with a 'tailf'
statement. This is useful in order to add tailf statements to a module
without touching the module source. Annotation statements can be put in
a separate annotation module, and then passed to 'confdc' or 'ncsc' (or
'pyang') when the original module is compiled.

'tailf:annotate-module' can occur on the top-level in a module, and is
used to add 'tailf' statements to the module statement itself.

The argument is a name of the module or submodule to annotate.

The *annotate-module* statement can be used in: *module*.

The following substatements can be used:

*tailf:internal-dp*

*tailf:snmp-oid*

*tailf:snmp-mib-module-name*

*tailf:id*

*tailf:id-value*

*tailf:export*

*tailf:unique-selector*

*tailf:annotate-statement* Annotates an existing statement with a
'tailf' statement, a validation statement, or a type restriction
statement. This is useful in order to add tailf statements to a module
without touching the module source. Annotation statements can be put in
a separate annotation module, and then passed to 'confdc' or 'ncsc' (or
'pyang') when the original module is compiled.

Any 'tailf' statement, except 'action' can be annotated. The statement
'action' modifies the data model, and are thus not allowed.

The validation statements 'must', 'min-elements', 'max-elements',
'mandatory', 'unique', and 'when' can also be annotated.

The type restriction statement 'pattern' can also be annotated.

A 'description' can also be annotated.

The argument is an XPath-like expression that selects a statement to
annotate. The syntax is:

\<statement-name\> ( '\[' \<arg-name\> '=' \<arg-value\> '\]' )

where \<statement-name\> is the name of the statement to annotate, and
if there are more than one such statement in the parent, \<arg-value\>
is the quoted value of the statement's argument.

All substatements to 'tailf:annotate-statement' are treated as if they
were written inline in the target node, with the exception of any
'tailf:annotate-statement' substatements. These are treated recursively.

For example, given the grouping:

grouping foo { leaf bar { type string; } leaf baz { type string; } }

the following snippet adds a callpoint to the leaf 'baz':

tailf:annotate-statement grouping\[name='foo'\] {
tailf:annotate-statement leaf\[name='baz'\] { tailf:callpoint xcp; } }

### tailf:callpoint *id*

Identifies a callback in a data provider. A data provider implements
access to external data, either configuration data in a database or
operational data. By default ConfD/NCS uses the embedded database (CDB)
to store all data. However, some or all of the configuration data may be
stored in an external source. In order for ConfD/NCS to be able to
manipulate external data, a data provider registers itself using the
callpoint id as described in confd_lib_dp(3).

A callpoint is inherited to all child nodes unless another 'callpoint'
or an 'cdb-oper' is defined.

Note that the callpoint in key leaf can not be different from the
callpoint of the parent list node.

The *callpoint* statement can be used in: *leaf*, *leaf-list*, *list*,
*container*, *refine*, and *grouping*.

The following substatements can be used:

*tailf:config* If this statement is present, the callpoint is applied to
nodes with a matching value of their 'config' property.

*tailf:transform* If set to 'true', the callpoint is a transformation
callpoint. How transformation callpoints are used is described in the
'Transformations, Hooks and Hidden Data' chapter in the User's Guide.

*tailf:set-hook* Set hooks are a means to associate user code to the
transaction. Whenever an element gets written, created, or deleted, user
code gets invoked and can optionally write more data into the same
transaction.

The difference between set- and transaction hooks are that set hooks are
invoked immediately when a write operation is requested by a north bound
agent, and transaction hooks are invoked at commit time.

The value 'subtree' means that all nodes in the configuration below
where the hook is defined are affected.

The value 'object' means that the hook only applies to the list where it
is defined, i.e. it applies to all child nodes that are not themselves
lists.

The value 'node' means that the hook only applies to the node where it
is defined and none of its children.

For more details on hooks, see the 'Transformations, Hooks and Hidden
Data' chapter in the User's Guide.

*tailf:transaction-hook* Transaction hooks are a means to associate user
code to the transaction. Whenever an element gets written, created, or
deleted, user code gets invoked and can optionally write more data into
the same transaction.

The difference between set- and transaction hooks are that set hooks are
invoked immediately when an element is modified, but transaction hooks
are invoked at commit time.

The value 'subtree' means that all nodes in the configuration below
where the hook is defined are affected.

The value 'object' means that the hook only applies to the list where it
is defined, i.e. it applies to all child nodes that are not themselves
lists.

The value 'node' means that the hook only applies to the node where it
is defined and none of its children.

For more details on hooks, see the 'Transformations, Hooks and Hidden
Data' chapter in the User's Guide.

*tailf:cache* If set to 'true', the operational data served by the
callpoint will be cached by ConfD. If set to 'true' in a node that
represents configuration data, the statement 'tailf:config' must be
present and set to 'false'. This feature is further described in the
section 'Caching operational data' in the 'Operational data' chapter in
the User's Guide.

*tailf:opaque* Defines an opaque string which is passed to the callback
function in the context. The maximum length of the string is 255
characters.

*tailf:operational* If this statement is present, the callpoint or
cdb-oper is used for 'config true' nodes in the operational datastore.

*tailf:internal* For internal ConfD / NCS use only.

### tailf:cdb-oper

Indicates that operational data nodes below this node are stored in CDB.
This is implicit default for config:false nodes, unless tailf:callpoint
is provided.

The *cdb-oper* statement can be used in: *leaf*, *leaf-list*, *list*,
*container*, and *refine*.

The following substatements can be used:

*tailf:operational* If this statement is present, the callpoint or
cdb-oper is used for 'config true' nodes in the operational datastore.

*tailf:persistent* If it is set to 'true', the operational data is
stored on disk. If set to 'false', the operational data is not
persistent across ConfD/NCS restarts. The default is 'false'. Persistent
nodes are not allowed under non-persistent nodes.

### tailf:code-name *name*

Used to give another name to the enum or node name in generated header
files. This statement is typically used to avoid name conflicts if there
is a data node with the same name as the enumeration, if there are
multiple enumerations in different types with the same name but
different values, or if there are multiple node names that are mapped to
the same name in the header file.

The *code-name* statement can be used in: *enum*, *bit*, *leaf*,
*leaf-list*, *list*, *container*, *rpc*, *action*, *identity*,
*notification*, and *tailf:action*.

### tailf:confirm-text *text*

A string which is used in the user interfaces to prompt the user for
confirmation before the action is executed. The optional
'confirm-default' and 'cli-batch-confirm-default' can be set to control
if the default is to proceed or to abort. The latter will only be used
during batch processing in the CLI (e.g. non-interactive mode).

The *confirm-text* statement can be used in: *rpc*, *action*, and
*tailf:action*.

The following substatements can be used:

*tailf:confirm-default* Specifies if the default is to proceed or abort
the action when a confirm-text is set. If this value is not specified, a
ConfD global default value can be set in clispec(5).

*tailf:cli-batch-confirm-default*

### tailf:default-ref *path*

This statement defines a dynamic default value. It is a reference to
some other leaf in the datamodel. If no value has been set for this
leaf, it defaults to the value of the leaf that the 'default-ref'
argument points to.

The textual format of a 'default-ref' is an XPath location path with no
predicates.

The type of the leaf with a 'default-ref' will be set to the type of the
referred leaf. This means that the type statement in the leaf with the
'default-ref' is ignored, but it SHOULD match the type of the referred
leaf.

Here is an example, where a group without a 'hold-time' will get as
default the value of another leaf up in the hierarchy:

<div class="informalexample">

     leaf hold-time {
         mandatory true;
         type int32;
     }
     list group {
         key 'name';
         leaf name {
             type string;
         }
         leaf hold-time {
             type int32;
             tailf:default-ref '../../hold-time';
         }
     }

</div>

The *default-ref* statement can be used in: *leaf* and *refine*.

### tailf:dependency *path*

This statement is used to specify that the must or when expression or
validation function depends on a set of subtrees in the data store.
Whenever a node in one of those subtrees are modified, the must or when
expression is evaluated, or validation code executed.

The textual format of a 'dependency' is an XPath location path with no
predicates.

If the node that declares the dependency is a leaf, there is an implicit
dependency to the leaf itself.

For example, with the leafs below, the validation code for'vp' will be
called whenever 'a' or 'b' is modified.

<div class="informalexample">

     leaf a {
         type int32;
         tailf:validate vp {
             tailf:dependency '../b';
         }
     }
     leaf b {
         type int32;
     }

</div>

For 'when' and 'must' expressions, the compiler can derive the
dependencies automatically from the XPath expression in most cases. The
exception is if any wildcards are used in the expression.

For 'when' expressions to work, a 'tailf:dependency' statement must be
given, unless the compiler can figure out the dependency by itself.

Note that having 'tailf:validate' statements without dependencies
impacts the overall performance of the system, since all such validation
functions are evaluated at every commit.

The *dependency* statement can be used in: *must*, *when*, and
*tailf:validate*.

The following substatements can be used:

*tailf:xpath-root*

### tailf:display-column-name *name*

This property is used to specify an alternative column name for the leaf
in the CLI. It is used when displaying the leaf in a table in the CLI.

The *display-column-name* statement can be used in: *leaf*, *leaf-list*,
and *refine*.

### tailf:display-groups *value*

This property is used in the CLI when 'enableDisplayGroups' has been set
to true in the confd.conf(5) file. Display groups are used to control
which elements should be displayed by the show command.

The argument is a space-separated string of tags.

In the J-style CLI the 'show status', 'show table' and 'show all'
commands use display groups. In the C- and I-style CLIs the 'show
\<pattern\>' command uses display groups.

If no display groups are specified when running the commands, the node
will be displayed if it does not have the 'display-groups' property, or
if the property value includes the special value 'none'.

If display groups are specified when running the command, then the node
will be displayed only if its 'display-group' property contains one of
the specified display groups.

The *display-groups* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

### tailf:display-hint *hint*

This statement can be used to add a display-hint to a leaf or typedef of
type binary. The display-hint is used in the CLI and WebUI instead of
displaying the binary as a base64-encoded string. It is also used for
input.

The value of a 'display-hint' is defined in RFC 2579.

For example, with the display-hint value '1x:', the value is printed and
inputted as a colon-separated hex list.

The *display-hint* statement can be used in: *leaf* and *typedef*.

### tailf:display-status-name *name*

This property is used to specify an alternative name for the element in
the CLI. It is used when displaying status information in the C- and
I-style CLIs.

The *display-status-name* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

### tailf:display-when *condition*

The argument contains an XPath expression which specifies when the node
should be displayed in the CLI and WebUI. For example, when the CLI
performs completion, and one of the candidates is a node with a
'display-when' expression, the expression is evaluated by the CLI. If
the XPath expression evaluates to true, the node is shown as a possible
completion candidate, otherwise not.

For a list, the display-when expression is evaluated once for the entire
list. In this case, the XPath context node is the list's parent node.

This feature is further described in the 'Transformations, Hooks and
Hidden Data' chapter in the User Guide.

The *display-when* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, *action*, *refine*, *choice*, and *case*.

The following substatements can be used:

*tailf:xpath-root*

### tailf:error-info

Declares a set of data nodes to be used in the NETCONF \<error-info\>
element.

A data provider can use one of the confd\_\*\_seterr_extended_info()
functions (see confd_lib_dp(3)) to set these data nodes on errors.

This statement may be used multiple times.

For example:

<div class="informalexample">

       tailf:error-info {
          leaf severity {
            type enumeration {
              enum info;
              enum error;
              enum critical;
            }
          }
          container detail {
            leaf class {
              type uint8;
            }
            leaf code {
              type uint8;
            }
          }
        }

</div>

The *error-info* statement can be used in: *module* and *submodule*.

### tailf:exec *cmd*

Specifies that the rpc or action is implemented as an OS executable. The
argument 'cmd' is the path to the executable file. If the command is in
the \$PATH of ConfD, the 'cmd' can be just the name of the executable.

The *exec* statement can be used in: *rpc*, *action*, and
*tailf:action*.

The following substatements can be used:

*tailf:args* Specifies arguments to send to the executable when it is
invoked by ConfD. The argument 'value' is a space separated list of
argument strings. It may contain variables on the form \$(variablename).
These variables will be expanded before the command is executed. The
following variables are always available:

\$(user) The name of the user which runs the operation.

\$(groups) A comma separated string of the names of the groups the user
belongs to.

\$(ip) The source ip address of the user session.

\$(uid) The user id of the user.

\$(gid) The group id of the user.

When the parent 'exec' statement is a substatement of 'action', the
following additional variablenames are available:

\$(keypath) The path that identifies the parent container of 'action' in
string keypath form, e.g., '/sys:host{earth}/interface{eth0}'.

\$(path) The path that identifies the parent container of 'action' in
CLI path form, e.g., 'host earth interface eth0'.

\$(context) cli \| webui \| netconf \| any string provided by MAAPI

For example: args '-user \$(user) \$(uid)'; might expand to: -user bob
500

*tailf:uid* Specifies which user id to use when executing the command.

If 'uid' is an integer value, the command is run as the user with this
user id.

If 'uid' is set to either 'user', 'root' or an integer user id, the
ConfD/NCS daemon must have been started as root (or setuid), or the
ConfD/NCS executable program 'cmdwrapper' must have setuid root
permissions.

*tailf:gid* Specifies which group id to use when executing the command.

If 'gid' is an integer value, the command is run as the group with this
group id.

If 'gid' is set to either 'user', 'root' or an integer group id, the
ConfD/NCS daemon must have been started as root (or setuid), or the
ConfD/NCS executable program 'cmdwrapper' must have setuid root
permissions.

*tailf:wd* Specifies which working directory to use when executing the
command. If not given the command is executed from the homedir of the
user logged in to ConfD.

*tailf:global-no-duplicate* Specifies that only one instance with the
same name can be run at any one time in the system. The command can be
started either from the CLI, the WebUI or through NETCONF. If a client
tries to execute this command while another operation with the same
'global-no-duplicate' name is running, a 'resource-denied' error is
generated.

*tailf:raw-xml* Specifies that ConfD/NCS should not convert the RPC XML
parameters to command line arguments. Instead, ConfD/NCS just passes the
raw XML on stdin to the program.

This statement is not allowed in 'tailf:action'.

*tailf:interruptible* Specifies whether the client can abort the
execution of the executable.

*tailf:interrupt* This statement specifies which signal is sent to
executable by ConfD in case the client terminates or aborts the
execution.

If not specified, 'sigkill' is sent.

### tailf:export *agent*

Makes this data model visible in the northbound interface 'agent'.

This statement makes it possible to have a data model visible through
some northbound interface but not others. For example, if a MIB is used
to generate a YANG module, the resulting YANG module can be exposed
through SNMP only.

Use the special agent 'none' to make the data model completely hidden to
all northbound interfaces.

The agent can also be a free-form string. In this case, the data model
will be visible to maapi applications using this string as its
'context'.

The *export* statement can be used in: *module*.

### tailf:hidden *tag*

This statement can be used to hide a node from some, or all, northbound
interfaces. All nodes with the same value are considered a hide group
and are treated the same with regards to being visible or not in a
northbound interface.

A node with an hidden property is not shown in the northbound user
interfaces (CLI and Web UI) unless an 'unhide' operation has been
performed in the user interface.

The hidden value 'full' indicates that the node should be hidden from
all northbound interfaces, including programmatical interfaces such as
NETCONF.

The value '\*' is not valid.

A hide group can be unhidden only if this has been explicitly allowed in
the confd.conf(5) daemon configuration.

Multiple hide groups can be specified by giving this statement multiple
times. The node is shown if any of the specified hide groups has been
given in the 'unhide' operation.

The CLI does not support using this extension on key leafs where it will
be ignored.

Note that if a mandatory node is hidden, a hook callback function (or
similar) might be needed in order to set the element.

The *hidden* statement can be used in: *leaf*, *leaf-list*, *list*,
*container*, *tailf:action*, *refine*, *rpc*, and *action*.

### tailf:id *name*

This statement is used when old confspec models are translated to YANG.
It needs to be present if systems deployed with data based on confspecs
are updated to YANG based data models.

In confspec, the 'id' of a data model was a string that never would
change, even if the namespace URI would change. It is not needed in
YANG, since the namespace URi cannot change as a module is updated.

This statement is typically present in YANG modules generated by
cs2yang. If no live upgrade needs to be done from a confspec based
system to a YANG based system, this statement can be removed from such a
generated module.

The *id* statement can be used in: *module*.

### tailf:id-value *value*

This statement lets you specify a hard wired numerical id value to
associate with the parent node. This id value is normally auto generated
by confdc/ncsc and is used when working with the ConfD/NCS API to refer
to a tag name, to avoid expensive string comparison. Under certain rare
circumstances this auto generated hash value may collide with a hash
value generated for a node in another data model. Whenever such a
collision occurs the ConfD/NCS daemon fails to start and instructs the
developer to use the 'id-value' statement to resolve the collision.

The manually selected value should be greater than 2^31+2 but less than
2^32-1. This way it will be out of the range of the automatic hash
values, which are between 0 and 2^31-1. The best way to choose a value
is by using a random number generator, as in '2147483649 +
rand:uniform(2147483645)'. In the rare case where the parent node occurs
in multiple places, make sure all such places uses the same id value

The *id-value* statement can be used in: *module*, *leaf*, *leaf-list*,
*list*, *container*, *rpc*, *action*, *identity*, *notification*,
*choice*, *case*, and *tailf:action*.

### tailf:ignore-if-no-cdb-oper

Indicates that the fxs file will not be loaded if CDB oper is disabled,
rather than abort the startup, which is the default.

The *ignore-if-no-cdb-oper* statement can be used in: *module*.

### tailf:indexed-view

This element can only be used if the list has a single key of an integer
type.

It is used to signal that lists instances uses an indexed view, i.e.,
making it possible to insert a new list entry at a certain position. If
a list entry is inserted at a certain position, list entries following
this position are automatically renumbered by the system, if needed, to
make room for the new entry.

This statement is mainly provided for backwards compatibility with
confspecs. New data models should consider using YANG's ordered-by user
statement instead.

The *indexed-view* statement can be used in: *list*.

The following substatements can be used:

*tailf:auto-compact* If an indexed-view list is marked with this
statement, it means that the server will automatically renumber entries
after a delete operation so that the list entries are strictly
monotonically increasing, starting from 1, with no holes. New list
entries can either be inserted anywhere in the list, or created at the
end; but it is an error to try to create a list entry with a key that
would result in a hole in the sequence.

For example, if the list has entries 1,2,3 it is an error to create
entry 5, but correct to create 4.

### tailf:info *text*

Contains a textual description of the definition, suitable for being
presented to the CLI and WebUI users.

The first sentence of this textual description is used in the CLI as a
summary, and displayed to the user when a short explanation is
presented.

The 'description' statement is related, but targeted to the module
reader, rather than the CLI or WebUI user.

The info string may contain a ';;' keyword. It is used in type
descriptions for leafs when the builtin type info needs to be
customized. A 'normal' info string describing a type is assumed to
contain a short textual description. When ';;' is present it works as a
delimiter where the text before the keyword is assumed to contain a
short description and the text after the keyword a long(er) description.
In the context of completion in the CLI the text will be nicely
presented in two columns where both descriptions are aligned when
displayed.

The *info* statement can be used in: *typedef*, *leaf*, *leaf-list*,
*list*, *container*, *rpc*, *action*, *identity*, *type*, *enum*, *bit*,
*length*, *pattern*, *range*, *refine*, *action*, *tailf:action*, and
*tailf:cli-exit-command*.

### tailf:info-html *text*

This statement works exactly as 'tailf:info', with the exception that it
can contain HTML markup. The WebUI will display the string with the HTML
markup, but the CLI will remove all HTML markup before displaying the
string to the user. In most cases, using this statement avoids using
special descriptions in webspecs and clispecs.

If this statement is present, 'tailf:info' cannot be given at the same
time.

The *info-html* statement can be used in: *leaf*, *leaf-list*, *list*,
*container*, *rpc*, *action*, *identity*, *tailf:action*, and *refine*.

### tailf:internal-dp

Mark any module as an internal data provider. Indicates that the module
will be skipped when check-callbacks is invoked.

The *internal-dp* statement can be used in: *module* and *submodule*.

### tailf:java-class-name *name*

Used to give another name than the default name to generated Java
classes. This statement is typically used to avoid name conflicts in the
Java classes.

The *java-class-name* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

### tailf:junos-val-as-xml-tag

Internal extension to handle non-YANG JUNOS data models. Use only for
key enumeration leafs.

The *junos-val-as-xml-tag* statement can be used in: *leaf*.

### tailf:junos-val-with-prev-xml-tag

Internal extension to handle non-YANG JUNOS data models. Use only for
keys where previous key is marked with 'tailf:junos-val-as-xml-tag'.

The *junos-val-with-prev-xml-tag* statement can be used in: *leaf*.

### tailf:key-default *value*

Must be used for key leafs only.

Specifies a value that the CLI and WebUI will use when a list entry is
created, and this key leaf is not given a value.

If one key leaf has a key-default value, all key leafs that follow this
key leaf must also have key-default values.

The *key-default* statement can be used in: *leaf*.

### tailf:link *target*

This statement specifies that the data node should be implemented as a
link to another data node, called the target data node. This means that
whenever the node is modified, the system modifies the target data node
instead, and whenever the data node is read, the system returns the
value of target data node.

Note that if the data node is a leaf, the target node MUST also be a
leaf, and if the data node is a leaf-list, the target node MUST also be
a leaf-list.

Note that the type of the data node MUST be the same as the target data
node. Currently the compiler cannot check this.

Note that the link is not supported, and the compiler will generate an
error if the target node is under a tailf:mount-point or an RFC 8528
yangmnt:mount-point.

Using link inside a choice is discouraged due to the limitations of the
construct. Updating the target of the link does not affect the active
case in the source.

Example:

<div class="informalexample">

    container source {
      choice source-choice {
        leaf a {
          type string;
          tailf:link "/target/a";
        }
        leaf b {
          type string;
          tailf:link "/target/b";
        }
      }
    }

</div>

<div class="informalexample">

    container target {
      choice target-choice {
        leaf a {
          type string;
        }
        leaf b {
          type string;
        }
      }
    }

</div>

Setting /target/a will not activate the case of /source/a. Reading the
value of /source/a will not return a value until the case is activated.
Setting /source/a will activate both the case of /source/a and
/target/a.

The argument is an XPath absolute location path. If the target lies
within lists, all keys must be specified. A key either has a value, or
is a reference to a key in the path of the source node, using the
function current() as starting point for an XPath location path. For
example:

/a/b\[k1='paul'\]\[k2=current()/../k\]/c

The *link* statement can be used in: *leaf* and *leaf-list*.

The following substatements can be used:

*tailf:inherit-set-hook* This statement specifies that a
'tailf:set-hook' statement should survive through symlinks. If set to
true a set hook gets called as soon as the value is set via a symlink
but also during commit. The normal behaviour is to only call the set
hook during commit time.

### tailf:lower-case

Use for config false leafs and leaf-lists only.

This extension serves as a hint to the system that the leaf's type has
the implicit pattern '\[^A-Z\]\*', i.e., all strings returned by the
data provider are lower case (in the 7-bit ASCII range).

The CLI uses this hint when it is run in case-insensitive mode to
optimize the lookup calls towards the data provider.

The *lower-case* statement can be used in: *leaf* and *leaf-list*.

### tailf:meta-data *value*

Extra meta information attached to the node. The instance data part of
this information is accessible using MAAPI. It is also printed in
communication with CLI NEDs, but is not visible to normal users of the
CLI.

<div class="informalexample">

    To CLI NEDs, the output will be printed as comments like this:
    ! meta-data :: /ncs:devices/device{xyz}/config/xyz:AA :: A_STRING

</div>

The schema information is available to the ConfD/NCS C-API through the
confd_cs_node struct, and to the JSON-RPC API through get-schema.

Note: Can't be used on key leafs.

The *meta-data* statement can be used in: *container*, *list*, *leaf*,
*leaf-list*, and *refine*.

The following substatements can be used:

*tailf:meta-value* This statement contains a string value for the meta
data key.

The output from the CLI to CLI NEDs will be similar to comments like
this: ! meta-data :: /ncs:devices/device{xyz}/config/xyz:AA :: A_KEY ::
A_VALUE

### tailf:mount-id *name*

Used to implement mounting of a set of modules.

Used by ncsc in the generated device modules.

When this statement is used, the module MUST not have any top-level data
nodes defined.

The *mount-id* statement can be used in: *module*, *submodule*, and
*tailf:mount-point*.

### tailf:mount-point *name*

Indicates that other modules can be mounted here.

The *mount-point* statement can be used in: *container* and *list*.

The following substatements can be used:

*tailf:mount-id*

### tailf:ncs-device-type *type*

Internal extension to tell NCS what type of device the data model is
used for.

The *ncs-device-type* statement can be used in: *container*, *list*,
*leaf*, *leaf-list*, *refine*, and *module*.

### tailf:ned-data *path-expression*

Dynamic meta information to be added by the NCS device manager.

In the cases where NCS can't provide the complete 'to' and 'from'
transactions to the NED to read from (most notably when using the commit
queue) this annotation can be used to tell the NCS device manager to
save part of the 'to' and / or 'from' transaction so that the NED will
be able to read from these parts as needed.

The 'path-expression' will be used as an XPath filter to indicate which
data will be preserved. Use the 'transaction' substatement to choose
which transaction to apply the filter on. The context node of the XPath
filter is always the instance data node corresponding to the schema node
where the 'ned-data' extension is added.

Note that the filter will only be applied if the node that has this
annotation is in the diffset of the transaction. The 'operation'
substatement can be used to further limit when the filter should be
applied.

The *ned-data* statement can be used in: *container*, *list*, *leaf*,
*leaf-list*, and *refine*.

The following substatements can be used:

*tailf:transaction*

*tailf:xpath-root*

*tailf:operation*

### tailf:ned-default-handling *mode*

This statement can only be used in NEDs for devices that have irregular
handling of defaults. It sets a special default handling mode for the
leaf, regardless of the device's native default handling mode.

The *ned-default-handling* statement can be used in: *leaf*.

### tailf:ned-ignore-compare-config

Typically used for ignoring device encrypted leafs in the compare-config
output.

The *ned-ignore-compare-config* statement can be used in: *leaf*.

### tailf:no-dependency

This optional statements can be used to explicitly say that a 'must'
expression or a validation function is evaluated at every commit. Use
this with care, since the overall performance of the system is impacted
if this statement is used.

The *no-dependency* statement can be used in: *must* and
*tailf:validate*.

### tailf:no-leafref-check

This statement can be used to let 'leafref' type statements reference
non-existing leafs. While similar to the 'tailf:non-strict-leafref'
statement, this does not allow reference from config to non-config.

The *no-leafref-check* statement can be used in: *type*.

### tailf:non-strict-leafref

This statement can be used in leafs and leaf-lists similar to 'leafref',
but allows reference to non-existing leafs, and allows reference from
config to non-config.

This statement takes no argument, but expects the core YANG statement
'path' as a substatement. The function 'deref' cannot be used in the
path, since it works on nodes of type leafref only.

The type of the leaf or leaf-list must be exactly the same as the type
of the target.

This statement can be viewed as a substitute for a standard
'require-instance false' on leafrefs, which isn't allowed.

The CLI uses this statement to provide completion with existing values,
and the WebUI uses it to provide a drop-down box with existing values.

The *non-strict-leafref* statement can be used in: *leaf* and
*leaf-list*.

### tailf:operation *op*

Only evaluate the XPath filter when the operation matches.

### tailf:override-auto-dependencies

This optional statement can be used to instruct the compiler to use the
provided tailf:dependency statements instead of the dependencies that
the compiler calculates from the expression.

Use with care, and only if you are sure that the provided dependencies
are correct.

The *override-auto-dependencies* statement can be used in: *must* and
*when*.

### tailf:path-filters *value*

Used for type 'instance-identifier' only.

The argument is a space separated list of absolute or relative XPath
expressions.

This statement declares that the instance-identifier value must match
one of the specified paths, according to the following rules:

1\. each XPath expression is evaluated, and returns a node set.

2\. if there is no 'tailf:no-subtree-match' statement, the
instance-identifier matches if it refers to a node in this node set, or
if it refers to any descendant node of this node set.

3\. if there is a 'tailf:no-subtree-match' statement, the
instance-identifier matches if it refers to a node in this node set.

For example:

The value /a/b\[key='k1'\]/c matches the XPath expression
/a/b\[key='k1'\]/c.

The value /a/b\[key='k1'\]/c matches the XPath expression /a/b/c.

The value /a/b\[key='k1'\]/c matches the XPath expression /a/b, if there
is no 'tailf:no-subtree-match' statement.

The value /a/b\[key='k1'\] matches the XPath expression /a/b, if there
is a 'tailf:no-subtree-match' statement.

The *path-filters* statement can be used in: *type*.

The following substatements can be used:

*tailf:no-subtree-match* See tailf:path-filters.

### tailf:secondary-index *name*

This statement creates a secondary index with a given name in the parent
list. The secondary index can be used to control the displayed sort
order of the instances of the list.

Read more about sort order in 'The ConfD/NCS Command-Line Interface
(CLI)' chapters in the User Guide, confd_lib_dp(3), and
confd_lib_maapi(3).

NOTE: Currently secondary-index is not supported for config false data
stored in CDB.

The *secondary-index* statement can be used in: *list*.

The following substatements can be used:

*tailf:index-leafs* This statement contains a space separated list of
leaf names. Each such leaf must be a direct child to the list. The
secondary index is kept sorted according to the values of these leafs.

*tailf:sort-order*

*tailf:display-default-order* Specifies that the list should be
displayed sorted according to this secondary index in the show command.

If the list has more than one secondary index, 'display-default-order'
must be present in one index only.

Used in J-, I- and C-style CLIs and WebUI.

### tailf:snmp-delete-value *value*

This statement is used to define a value to be used in SNMP to delete an
optional leaf. The argument to this statement is the special value. This
special value must not be part of the value space for the YANG leaf.

If the optional leaf does not exists, reading it over SNMP returns
'noSuchInstance', unless the statement 'tailf:snmp-send-delete-value' is
used, in which case the same value as used to delete the node is
returned.

For example, the YANG leaf:

<div class="informalexample">

         leaf opt-int {
           type int32 {
             range '1..255';
           }
           tailf:snmp-delete-value 0 {
             tailf:snmp-send-delete-value;
           }
         }

</div>

can be mapped to a SMI object with syntax:

SYNTAX Integer32 (0..255)

Setting such an object to '0' over SNMP will delete the node from the
datastore. If the node does not exsist, reading it over SNMP will return
'0'.

The *snmp-delete-value* statement can be used in: *leaf*.

The following substatements can be used:

*tailf:snmp-send-delete-value* See tailf:snmp-delete-value.

### tailf:snmp-exclude-object

Used when an SNMP MIB is generated from a YANG module, using the
--generate-oids option to confdc/ncsc.

If this statement is present, confdc/ncsc will exclude this object from
the resulting MIB.

The *snmp-exclude-object* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

### tailf:snmp-lax-type-check *value*

Normally, the ConfD/NCS MIB compiler checks that the data type of an
SNMP object matches the data type of the corresponding YANG leaf. If
both objects are writable, the data types need to precisely match, but
if the SNMP object is read-only, or if snmp-lax-type-check is set to
'true', the compiler accepts the object if the SNMP type's value space
is a superset of the YANG type's value space.

If snmp-lax-type-check is true and the MIB object is writable, the SNMP
agent will reject values outside the YANG data type range in runtime.

The *snmp-lax-type-check* statement can be used in: *leaf*.

### tailf:snmp-mib-module-name *name*

Used when the YANG module is mapped to an SNMP module.

Specifies the name of the SNMP MIB module where the SNMP objects are
defined.

This property is inherited by all child nodes.

The *snmp-mib-module-name* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, *module*, and *refine*.

### tailf:snmp-name *name*

Used when the YANG module is mapped to an SNMP module.

When the parent node is mapped to an SNMP object, this statement
specifies the name of the SNMP object.

If the parent node is mapped to multiple SNMP objects, this statement
can be given multiple times. The first statement specifies the primary
table.

In a list, the argument is interpreted as:

\[MIB-MODULE-NAME:\]TABLE-NAME

For a leaf representing a table column, it is interpreted as:

\[\[MIB-MODULE-NAME:\]TABLE-NAME:\]NAME

For a leaf representing a scalar variable, it is interpreted as:

\[MIB-MODULE-NAME:\]NAME

If a YANG list is mapped to multiple SNMP tables, each such SNMP table
must be specified with a 'tailf:snmp-name' statement. If the table is
defined in another MIB than the MIB specified in
'tailf:snmp-mib-module-name', the MIB name must be specified in this
argument.

A leaf in a list that is mapped to multiple SNMP tables must specify the
name of the table it is mapped to if it is different from the primary
table.

In the following example, a single YANG list 'interface' is mapped to
the MIB tables ifTable, ifXTable, and ipv4InterfaceTable:

<div class="informalexample">

     list interface {
       key index;
       tailf:snmp-name 'ifTable'; // primary table
       tailf:snmp-name 'ifXTable';
       tailf:snmp-name 'IP-MIB:ipv4InterfaceTable';

</div>

<div class="informalexample">

       leaf index {
         type int32;
       }
       leaf description {
         type string;
         tailf:snmp-name 'ifDescr';  // mapped to primary table
       }
       leaf name {
         type string;
         tailf:snmp-name 'ifXTable:ifName';
       }
       leaf ipv4-enable {
         type boolean;
         tailf:snmp-name
           'IP-MIB:ipv4InterfaceTable:ipv4InterfaceEnableStatus';
       }
       ...
     }

</div>

When emitting a mib from yang, enum labels are used as-is if they follow
the SMI rules for labels (no '.' or '\_' characters and beginning with a
lowercase letter). Any label that doesn't satisfy the SMI rules will be
converted as follows:

An initial uppercase character will be downcased.

If the initial character is not a letter it will be prepended with an
'a'.

Any '.' or '\_' characters elsewhere in the label will be substituted
with '-' characters.

In the resulting label, any multiple '-' character sequence will be
replaced with a single '-' character.

If this automatic conversion is not suitable, snmp-name can be used to
specify the label to use when emitting a MIB.

The *snmp-name* statement can be used in: *leaf*, *leaf-list*, *list*,
*container*, *enum*, and *refine*.

### tailf:snmp-ned-accessible-column *leaf-name*

The name or subid number of an accessible column that is instantiated in
all table entries in a table. The column does not have to be writable.
The SNMP NED will use this column when it uses GET-NEXT to loop through
the list entries, and when doing existence tests.

If this column is not given, the SNMP NED uses the following algorithm:

1\. If there is a RowStatus column, it will be used. 2. If an INDEX leaf
is accessible, it will be used. 3. Otherwise, use the first accessible
column returned by the SNMP agent.

The *snmp-ned-accessible-column* statement can be used in: *list*.

### tailf:snmp-ned-delete-before-create

This statement is used in a list to make the SNMP NED always send
deletes before creates. Normally, creates are sent before deletes.

The *snmp-ned-delete-before-create* statement can be used in: *list*.

### tailf:snmp-ned-modification-dependent

This statement is used on all columns in a table that require the usage
of the column marked with tailf:snmp-ned-set-before-row-modification.

This statement can be used on any column in a table where one leaf is
marked with tailf:snmp-ned-set-before-row-modification, or a table that
AUGMENTS such a table, or a table with a foreign index in such a table.

The *snmp-ned-modification-dependent* statement can be used in: *leaf*.

### tailf:snmp-ned-recreate-when-modified

This statement is used in a list to make the SNMP NED delete and
recreate the row when a column in the row is modified.

The *snmp-ned-recreate-when-modified* statement can be used in: *list*.

### tailf:snmp-ned-set-before-row-modification *value*

If this statement is present on a leaf, it tells the SNMP NED that if a
column in the row is modified, and it is marked with
'tailf:snmp-ned-modification-dependent', then the column marked with
'tailf:snmp-ned-set-before-modification' needs to be set to \<value\>
before the other column is modified. After all such columns have been
modified, the column marked with
'tailf:snmp-ned-set-before-modification' is reset to its initial value.

The *snmp-ned-set-before-row-modification* statement can be used in:
*leaf*.

### tailf:snmp-oid *oid*

Used when the YANG module is mapped to an SNMP module.

If this statement is present as a direct child to 'module', it indicates
the top level OID for the module.

When the parent node is mapped to an SNMP object, this statement
specifies the OID of the SNMP object. It may be either a full OID or
just a suffix (a period, followed by an integer). In the latter case, a
full OID must be given for some ancestor element.

NOTE: when this statement is set in a list, it refers to the OID of the
corresponding table, not the table entry.

The *snmp-oid* statement can be used in: *leaf*, *leaf-list*, *list*,
*container*, *module*, and *refine*.

### tailf:snmp-row-status-column *value*

Used when an SNMP module is generated from the YANG module.

When the parent list node is mapped to an SNMP table, this statement
specifies the column number of the generated RowStatus column. If it is
not specified, the generated RowStatus column will be the last in the
table.

The *snmp-row-status-column* statement can be used in: *list* and
*refine*.

### tailf:sort-order *how*

This statement can be used for 'ordered-by system' lists and leaf-lists
only. It indicates in which way the list entries are sorted.

The *sort-order* statement can be used in: *list*, *leaf-list*, and
*tailf:secondary-index*.

### tailf:sort-priority *value*

This extension takes an integer parameter specifying the order and can
be placed on leafs, containers, lists and leaf-lists. When showing, or
getting configuration, leaf values will be returned in order of
increasing sort-priority.

The default sort-priority is 0.

The *sort-priority* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

### tailf:step *value*

Used to further restrict the range of integer and decimal types. The
argument is a positive integer or decimal value greater than zero. The
allowed values for the type is further restricted to only those values
that matches the expression:

'low' + n \* 'step'

where 'low' is the lowest allowed value in the range, n is a
non-negative integer.

For example, the following type:

<div class="informalexample">

      type int32 {
        range '-2 .. 9' {
          tailf:step 3;
        }
      }

</div>

<div class="informalexample">

    has the value space { -2, 1, 4, 7 }

</div>

The *step* statement can be used in: *range*.

### tailf:structure *name*

Internal extension to define a data structure without any semantics
attached.

The *structure* statement can be used in: *module* and *submodule*.

### tailf:suppress-echo *value*

If this statement is set to 'true', leafs of this type will not have
their values echoed when input in the webui or when the CLI prompts for
the value. The value will also not be included in the audit log in clear
text but will appear as \*\*\*.

The *suppress-echo* statement can be used in: *typedef*, *leaf*, and
*leaf-list*.

### tailf:transaction *direction*

Which transaction that the result of the XPath filter will be applied
to, when set to 'both' it will apply to both the 'to' and the 'from'
transaction.

### tailf:typepoint *id*

If a typedef, leaf, or leaf-list has a 'typepoint' statement, a
user-defined type is specified, as opposed to a derivation or
specification of an existing type. The implementation of a user-defined
type must be provided in the form of a shared object with C callback
functions that is loaded into the ConfD/NCS daemon at startup time. Read
more about user-defined types in the confd_types(3) manual page.

The argument defines the ID associated with a typepoint. This ID is
provided by the shared object, and used by the ConfD daemon to locate
the implementation of a specific user-defined type.

The *typepoint* statement can be used in: *typedef*, *leaf*, and
*leaf-list*.

### tailf:unique-selector *context-path*

The standard YANG statement 'unique' can be used to check for uniqueness
within a single list only. Specifically, it cannot be used to check for
uniqueness of leafs within a sublist.

For example:

<div class="informalexample">

      container a {
        list b {
          ...
          unique 'server/ip server/port';
          list server {
            ...
            leaf ip { ... };
            leaf port { ... };
          }
        }
      }

</div>

The unique expression above is not legal. The intention is that there
must not be any two 'server' entries in any 'b' with the same
combination of ip and port. This would be illegal:

\<a\> \<b\> \<name\>b1\</name\> \<server\> \<ip\>10.0.0.1\</ip\>
\<port\>80\</port\> \</server\> \</b\> \<b\> \<name\>b2\</name\>
\<server\> \<ip\>10.0.0.1\</ip\> \<port\>80\</port\> \</server\> \</b\>
\</a\>

With 'tailf:unique-selector' and 'tailf:unique-leaf', this kind of
constraint can be defined.

The argument to 'tailf:unique-selector' is an XPath descendant location
path (matches the rule 'descendant-schema-nodeid' in RFC 6020). The
first node in the path MUST be a list node, and it MUST be defined in
the same module as the tailf:unique-selector. For example, the following
is illegal:

<div class="informalexample">

      module y {
        ...
        import x {
          prefix x;
        }
        tailf:unique-selector '/x:server' { // illegal
          ...
        }
      }

</div>

For each instance of the node where the selector is defined, it is
evaluated, and for each node selected by the selector, a tuple is
constructed by evaluating the 'tailf:unique-leaf' expression. All such
tuples must be unique. If a 'tailf:unique-leaf' expression refers to a
non-existing leaf, the corresponding tuple is ignored.

In the example above, the unique expression can be replaced by:

<div class="informalexample">

      container a {
        tailf:unique-selector 'b/server' {
          tailf:unique-leaf 'ip';
          tailf:unique-leaf 'port';
        }
        list b {
          ...
        }
      }

</div>

For each container 'a', the XPath expression 'b/server' is evaluated.
For each such server, a 2-tuple is constructed with the 'ip' and 'port'
leafs. Each such 2-tuple is guaranteed to be unique.

The *unique-selector* statement can be used in: *module*, *submodule*,
*grouping*, *augment*, *container*, and *list*.

The following substatements can be used:

*tailf:unique-leaf* See 'tailf:unique-selector' for a description of how
this statement is used.

The argument is an XPath descendant location path (matches the rule
'descendant-schema-nodeid' in RFC 6020), and it MUST refer to a leaf.

### tailf:validate *id*

Identifies a validation callback which is invoked when a configuration
value is to be validated. The callback validates a value and typically
checks it towards other values in the data store. Validation callbacks
are used when the YANG built-in validation constructs ('must', 'unique')
are not expressive enough.

Callbacks use the API described in confd_lib_maapi(3) to access whatever
other configuration values needed to perform the validation.

Validation callbacks are typically assigned to individual nodes in the
data model, but it may be feasible to use a single validation callback
on a root node. In that case the callback is responsible for validation
of all values and their relationships throughout the data store.

The 'validate' statement should in almost all cases have a
'tailf:dependency' substatement. If such a statement is not given, the
validate function is evaluated at every commit, leading to overall
performance degradation.

If the 'validate' statement is defined in a 'must' statement, then
dependencies are calculated for the 'must' expression, and then used for
invocation of the validation callback, unless explicit
'tailf:dependency' (or 'tailf:no-dependency') has been given for
'tailf:validate'.

The *validate* statement can be used in: *leaf*, *leaf-list*, *list*,
*container*, *grouping*, *refine*, and *must*.

The following substatements can be used:

*tailf:call-once* This optional statement can be used only if the parent
statement is a list or a leaf-list. If 'call-once' is 'true', the
validation callback is only called once, regardless of the number of
list or leaf-list entries, or even if there are none, in the data store.
This is useful if we have a huge amount of instances or if values
assigned to each instance have to be validated in comparison with its
siblings.

*tailf:dependency*

*tailf:no-dependency*

*tailf:opaque* Defines an opaque string which is passed to the callback
function in the context. The maximum length of the string is 255
characters.

*tailf:internal* For internal ConfD / NCS use only.

*tailf:priority* This extension takes an integer parameter specifying
the order validation code will be evaluated, in order of increasing
priority.

The default priority is 0.

### tailf:value-length *value*

Used only for the types: yang:object-identifier
yang:object-identifier-128 yang:phys-address yang:hex-string
tailf:hex-list tailf:octet-list xs:hexBinary And derived types from
above types.

This type restriction is used to limit the length of the value-space
value of the type. Note that since all these types are derived from
'string', the standard 'length' statement restricts the lexical
representation of the value.

The argument is a length expression string, with the same syntax as for
the standard YANG 'length' statement.

The *value-length* statement can be used in: *type*.

### tailf:writable *value*

This extension makes operational data (i.e., config false data)
writable. Only valid for leafs.

The *writable* statement can be used in: *leaf*.

### tailf:xpath-root *value*

Internal extension to 'chroot' XPath expressions

The *xpath-root* statement can be used in: *must*, *when*, *path*,
*tailf:display-when*, *tailf:cli-diff-dependency*,
*tailf:cli-diff-before*, *tailf:cli-diff-delete-before*,
*tailf:cli-diff-set-before*, *tailf:cli-diff-create-before*,
*tailf:cli-diff-modify-before*, *tailf:cli-diff-after*,
*tailf:cli-diff-delete-after*, *tailf:cli-diff-set-after*,
*tailf:cli-diff-create-after*, and *tailf:cli-diff-modify-after*.

## Yang Types

### aes-256-cfb-128-encrypted-string

The aes-256-cfb-128-encrypted-string works exactly like
aes-cfb-128-encrypted-string but AES/256bits in CFB mode is used to
encrypt the string. The prefix for encrypted values is '\$9\$'.

### aes-cfb-128-encrypted-string

The aes-cfb-128-encrypted-string type automatically encrypts a value
adhering to this type using AES in CFB mode followed by a base64
conversion. If the value isn't encrypted already, that is.

This is best explained using an example. Suppose we have a leaf:

<div class="informalexample">

       leaf enc {
           type tailf:aes-cfb-128-encrypted-string;
       }

</div>

A valid configuration is:

\<enc\>\$0\$My plain text.\</enc\>

The '\$0\$' prefix signals that this is plain text. When a plain text
value is received by the server, the value is AES/Base64 encrypted, and
the string '\$8\$' is prepended. The resulting string is stored in the
configuration data store.

When a value of this type is read, the encrypted value is always
returned. In the example above, the following value could be returned:

\<enc\>\$8\$Qxxsn8BVzxphCdflqRwZm6noKKmt0QoSWnRnhcXqocg=\</enc\>

If a value starting with '\$8\$' is received, the server knows that the
value is already encrypted, and stores it as is in the data store.

A value adhering to this type must have a '\$0\$' or a '\$8\$' prefix.

ConfD/NCS uses a configurable set of encryption keys to encrypt the
string. For details, see 'encryptedStrings' in the confd.conf(5) manual
page.

### des3-cbc-encrypted-string

This type has been obsoleted and may no longer be included in YANG
files. Doing so will result in a compilation error. Please use a
stronger algorithm such as tailf:aes-256-cfb-128-encrypted-string.

### hex-list

DEPRECATED: Use yang:hex-string instead. There are no plans to remove
tailf:hex-list.

A list of colon-separated hexa-decimal octets e.g. '4F:4C:41:71'.

The statement tailf:value-length can be used to restrict the number of
octets. Note that using the 'length' restriction limits the number of
characters in the lexical representation.

### ip-address-and-prefix-length

The ip-address-and-prefix-length type represents a combination of an IP
address and a prefix length and is IP version neutral. The format of the
textual representations implies the IP version.

### ipv4-address-and-prefix-length

The ipv4-address-and-prefix-length type represents a combination of an
IPv4 address and a prefix length. The prefix length is given by the
number following the slash character and must be less than or equal to
32.

### ipv6-address-and-prefix-length

The ipv6-address-and-prefix-length type represents a combination of an
IPv6 address and a prefix length. The prefix length is given by the
number following the slash character and must be less than or equal to
128.

### md5-digest-string

The md5-digest-string type automatically computes a MD5 digest for a
value adhering to this type.

This is best explained using an example. Suppose we have a leaf:

<div class="informalexample">

       leaf key {
           type tailf:md5-digest-string;
       }

</div>

A valid configuration is:

\<key\>\$0\$My plain text.\</key\>

The '\$0\$' prefix signals that this is plain text. When a plain text
value is received by the server, an MD5 digest is calculated, and the
string '\$1\$\<salt\>\$' is prepended to the result, where \<salt\> is a
random eight character salt used to generate the digest. This value is
stored in the configuration data store.

When a value of this type is read, the computed MD5 value is always
returned. In the example above, the following value could be returned:

\<key\>\$1\$fB\$ndk2z/PIS0S1SvzWLqTJb.\</key\>

If a value starting with '\$1\$' is received, the server knows that the
value already represents an MD5 digest, and stores it as is in the data
store.

A value adhering to this type must have a '\$0\$' or a '\$1\$\<salt\>\$'
prefix.

If a default value is specified, it must have a '\$1\$\<salt\>\$'
prefix.

The digest algorithm used is the same as the md5 crypt function used for
encrypting passwords for various UNIX systems, see e.g.
http://www.freebsd.org/cgi/cvsweb.cgi/~checkout/~/src/lib/libcrypt/crypt.c

### node-instance-identifier

This is the same type as the node-instance-identifier defined in the
ietf-netconf-acm module, replicated here to make it possible for Tail-f
YANG modules to avoid a dependency on ietf-netconf-acm. The description
from ietf-netconf-acm revision 2017-12-11 follows.

Path expression used to represent a special data node, action, or
notification instance identifier string.

A node-instance-identifier value is an unrestricted YANG
instance-identifier expression. All the same rules as an
instance-identifier apply except predicates for keys are optional. If a
key predicate is missing, then the node-instance-identifier represents
all possible server instances for that key.

This XPath expression is evaluated in the following context:

o The set of namespace declarations are those in scope on the leaf
element where this type is used.

o The set of variable bindings contains one variable, 'USER', which
contains the name of the user of the current session.

o The function library is the core function library, but note that due
to the syntax restrictions of an instance-identifier, no functions are
allowed.

o The context node is the root node in the data tree.

The accessible tree includes actions and notifications tied to data
nodes.

### octet-list

A list of dot-separated octets e.g. '192.168.255.1.0'.

The statement tailf:value-length can be used to restrict the number of
octets. Note that using the 'length' restriction limits the number of
characters in the lexical representation.

### sha-256-digest-string

The sha-256-digest-string type automatically computes a SHA-256 digest
for a value adhering to this type.

A value of this type matches one of the forms:

\$0\$\<clear text password\> \$5\$\<salt\>\$\<password hash\>
\$5\$rounds=\<number\>\$\<salt\>\$\<password hash\>

The '\$0\$' prefix signals that this is plain text. When a plain text
value is received by the server, a SHA-256 digest is calculated, and the
string '\$5\$\<salt\>\$' is prepended to the result, where \<salt\> is a
random 16 character salt used to generate the digest. This value is
stored in the configuration data store. The algorithm can be tuned via
the /confdConfig/cryptHash/rounds parameter, which if set to a number
other than the default will cause '\$5\$rounds=\<number\>\$\<salt\>\$'
to be prepended instead of only '\$5\$\<salt\>\$'.

If a value starting with '\$5\$' is received, the server knows that the
value already represents a SHA-256 digest, and stores it as is in the
data store.

If a default value is specified, it must have a '\$5\$' prefix.

The digest algorithm used is the same as the SHA-256 crypt function used
for encrypting passwords for various UNIX systems, see e.g.
http://www.akkadia.org/drepper/SHA-crypt.txt

### sha-512-digest-string

The sha-512-digest-string type automatically computes a SHA-512 digest
for a value adhering to this type.

A value of this type matches one of the forms:

\$0\$\<clear text password\> \$6\$\<salt\>\$\<password hash\>
\$6\$rounds=\<number\>\$\<salt\>\$\<password hash\>

The '\$0\$' prefix signals that this is plain text. When a plain text
value is received by the server, a SHA-512 digest is calculated, and the
string '\$6\$\<salt\>\$' is prepended to the result, where \<salt\> is a
random 16 character salt used to generate the digest. This value is
stored in the configuration data store. The algorithm can be tuned via
the /confdConfig/cryptHash/rounds parameter, which if set to a number
other than the default will cause '\$6\$rounds=\<number\>\$\<salt\>\$'
to be prepended instead of only '\$6\$\<salt\>\$'.

If a value starting with '\$6\$' is received, the server knows that the
value already represents a SHA-512 digest, and stores it as is in the
data store.

If a default value is specified, it must have a '\$6\$' prefix.

The digest algorithm used is the same as the SHA-512 crypt function used
for encrypting passwords for various UNIX systems, see e.g.
http://www.akkadia.org/drepper/SHA-crypt.txt

### size

A value that represents a number of bytes. An example could be
S1G8M7K956B; meaning 1GB + 8MB + 7KB + 956B = 1082138556 bytes. The
value must start with an S. Any byte magnifier can be left out, e.g.
S1K1B equals 1025 bytes. The order is significant though, i.e. S1B56G is
not a valid byte size.

In ConfD, a 'size' value is represented as an uint64.

## Xpath Functions

This section describes XPath functions that can be used for example in
"must" expressions in YANG modules.

*node-set* `deref`(*node-set*)  
> The `deref()` function follows the reference defined by the first node
> in document order in the argument node-set, and returns the nodes it
> refers to.
>
> If the first argument node is an `instance-identifier`, the function
> returns a node-set that contains the single node that the instance
> identifier refers to, if it exists. If no such node exists, an empty
> node-set is returned.
>
> If the first argument node is a `leafref`, the function returns a
> node-set that contains the nodes that the leafref refers to.
>
> If the first argument node is of any other type, an empty node-set is
> returned.

*bool* `re-match`(*string*, *string*)  
> The `re-match()` function returns `true` if the string in the first
> argument matches the regular expression in the second argument;
> otherwise it returns `false`.
>
> For example: `re-match('1.22.333', '\d{1,3}\.\d{1,3}\.\d{1,3}')`
> returns `true`. To count all logical interfaces called eth0.*number*:
> `count(/sys/ifc[re-match(name,'eth0\.\d+')])`.
>
> The regular expressions used are the XML Schema regular expressions,
> as specified by W3C in <http://www.w3.org/TR/xmlschema-2/#regexs>.
> Note that this includes implicit anchoring of the regular expression
> at the head and tail, i.e. if you want to match an interface that has
> a name that starts with 'eth' then the regular expression must be
> `'eth.*'`.

*number* `string-compare`(*string*, *string*)  
> The `string-compare()` function returns -1, 0, or 1 depending on
> whether the value of the string of the first argument is respectively
> less than, equal to, or greater than the value of the string of the
> second argument.

*number* `compare`(*Expression*, *Expression*)  
> The `compare()` function returns -1, 0, or 1 depending on whether the
> value of the first argument is respectively less than, equal to, or
> greater than the value of the second argument.
>
> The expressions are evaluated in a special way: If they both are XPath
> constants they are compared using the `string-compare()` function.
> But, more interestingly, if the expressions results in node-sets with
> at least one node, and that node is an existing leaf that leafs value
> is compared with the other expression, and if the other expression is
> a constant that expression is converted to an internal value with the
> same type as the expression that resulted in a leaf. Thus making it
> possible to order values based on the internal representation rather
> than the string representation. For example, given a leaf:
>
> <div class="informalexample">
>
>     leaf foo {
>       type enumeration {
>         enum ccc;
>         enum bbb;
>         enum aaa;
>       }
>     }
>
> </div>
>
> it would be possible to call `compare(foo, 'bbb')` (which, for
> example, would return -1 if foo='ccc'). Or to have a must expression
> like this: `must "compare(.,'bbb') >= 0";` which would require foo to
> be set to 'bbb' or 'aaa'.
>
> If one of the expressions result in an empty node-set, a non-leaf
> node, or if the constant can't be converted to the other expressions
> type then `NaN` is returned.

*number* `min`(*node-set*)  
> Returns the numerically smallest number in the node-set, or `NaN` if
> the node-set is empty.

*number* `max`(*node-set*)  
> Returns the numerically largest number in the node-set, or `NaN` if
> the node-set is empty.

*number* `avg`(*node-set*)  
> Returns the numerical average of the node-set, or `NaN` if the
> node-set is empty, or if any numerical conversion of a node failed.

*number* `band`(*number*, *number*)  
> Returns the result of bitwise AND:ing the two numbers. Unless the
> numbers are integers NaN will be returned.

*number* `bor`(*number*, *number*)  
> Returns the result of bitwise OR:ing the two numbers. Unless the
> numbers are integers NaN will be returned.

*number* `bxor`(*number*, *number*)  
> Returns the result of bitwise Exclusive OR:ing the two numbers. Unless
> the numbers are integers NaN will be returned.

*number* `bnot`(*number*)  
> Returns the result of bitwise NOT on number. Unless the number is an
> integer NaN will be returned.

*node-set* `sort-by`(*node-set*, *string*)  
> The `sort-by()` function makes it possible to order a node-set
> according to a secondary index (see the
> [tailf:secondary-index](#tailf-common.yang_statements) extension). The
> first argument must be an expression that evaluates to a node-set,
> where the nodes in the node-set are all list instances of the same
> list. The second argument must be the name of an existing secondary
> index on that list. For example given the YANG model:
>
> <div class="informalexample">
>
>       container sys {
>         list host {
>           key name;
>           unique number;
>           tailf:secondary-index number {
>             tailf:index-leafs "number";
>           }
>           leaf name {
>             type string;
>           }
>           leaf number {
>             type uint32;
>             mandatory true;
>           }
>           leaf enabled {
>             type boolean;
>             default true;
>           }
>         ...
>         }
>       }
>
> </div>
>
> The expression `sort-by(/sys/host,"number")` would result in all
> hosts, sorted by their number. And the expression,
> `sort-by(/sys/host[enabled='true'],"number")` would result in all
> enabled hosts, sorted by number. Note also that since the function
> returns a node-set it is also legal to add location steps to the
> result. I.e. the expression
> `sort-by(/sys/host[enabled='true'],"number")/name` results in all host
> names sorted by the hosts number.

## See Also

`tailf_yang_cli_extensions(5)`  
> Tail-f YANG CLI extensions

The NSO User Guide  
> 

`confdc(1)`  
> Confdc compiler
