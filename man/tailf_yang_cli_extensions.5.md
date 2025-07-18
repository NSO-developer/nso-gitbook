# tailf_yang_cli_extensions Man Page

`tailf_yang_cli extensions` - Tail-f YANG CLI extensions

## Synopsis

`tailf:cli-add-mode`

`tailf:cli-allow-join-with-key`

`tailf:cli-allow-join-with-value`

`tailf:cli-allow-key-abbreviation`

`tailf:cli-allow-range`

`tailf:cli-allow-wildcard`

`tailf:cli-autowizard`

`tailf:cli-boolean-no`

`tailf:cli-break-sequence-commands`

`tailf:cli-case-insensitive`

`tailf:cli-case-sensitive`

`tailf:cli-column-align`

`tailf:cli-column-stats`

`tailf:cli-column-width`

`tailf:cli-compact-stats`

`tailf:cli-compact-syntax`

`tailf:cli-completion-actionpoint`

`tailf:cli-configure-mode`

`tailf:cli-custom-error`

`tailf:cli-custom-range`

`tailf:cli-custom-range-actionpoint`

`tailf:cli-custom-range-enumerator`

`tailf:cli-delayed-auto-commit`

`tailf:cli-delete-container-on-delete`

`tailf:cli-delete-when-empty`

`tailf:cli-diff-after`

`tailf:cli-diff-before`

`tailf:cli-diff-create-after`

`tailf:cli-diff-create-before`

`tailf:cli-diff-delete-after`

`tailf:cli-diff-delete-before`

`tailf:cli-diff-dependency`

`tailf:cli-diff-modify-after`

`tailf:cli-diff-modify-before`

`tailf:cli-diff-set-after`

`tailf:cli-diff-set-before`

`tailf:cli-disabled-info`

`tailf:cli-disallow-value`

`tailf:cli-display-empty-config`

`tailf:cli-display-separated`

`tailf:cli-drop-node-name`

`tailf:cli-embed-no-on-delete`

`tailf:cli-enforce-table`

`tailf:cli-exit-command`

`tailf:cli-explicit-exit`

`tailf:cli-expose-key-name`

`tailf:cli-expose-ns-prefix`

`tailf:cli-flat-list-syntax`

`tailf:cli-flatten-container`

`tailf:cli-full-command`

`tailf:cli-full-no`

`tailf:cli-full-show-path`

`tailf:cli-hide-in-submode`

`tailf:cli-ignore-modified`

`tailf:cli-incomplete-command`

`tailf:cli-incomplete-no`

`tailf:cli-incomplete-show-path`

`tailf:cli-instance-info-leafs`

`tailf:cli-key-format`

`tailf:cli-list-syntax`

`tailf:cli-min-column-width`

`tailf:cli-mode-name`

`tailf:cli-mode-name-actionpoint`

`tailf:cli-mount-point`

`tailf:cli-multi-line-prompt`

`tailf:cli-multi-value`

`tailf:cli-multi-word-key`

`tailf:cli-no-key-completion`

`tailf:cli-no-keyword`

`tailf:cli-no-match-completion`

`tailf:cli-no-name-on-delete`

`tailf:cli-no-value-on-delete`

`tailf:cli-only-in-autowizard`

`tailf:cli-oper-info`

`tailf:cli-operational-mode`

`tailf:cli-optional-in-sequence`

`tailf:cli-prefix-key`

`tailf:cli-preformatted`

`tailf:cli-range-delimiters`

`tailf:cli-range-list-syntax`

`tailf:cli-recursive-delete`

`tailf:cli-remove-before-change`

`tailf:cli-replace-all`

`tailf:cli-reset-container`

`tailf:cli-run-template`

`tailf:cli-run-template-enter`

`tailf:cli-run-template-footer`

`tailf:cli-run-template-legend`

`tailf:cli-sequence-commands`

`tailf:cli-short-no`

`tailf:cli-show-config`

`tailf:cli-show-long-obu-diffs`

`tailf:cli-show-no`

`tailf:cli-show-obu-comments`

`tailf:cli-show-order-tag`

`tailf:cli-show-order-taglist`

`tailf:cli-show-template`

`tailf:cli-show-template-enter`

`tailf:cli-show-template-footer`

`tailf:cli-show-template-legend`

`tailf:cli-show-with-default`

`tailf:cli-strict-leafref`

`tailf:cli-suppress-error-message-value`

`tailf:cli-suppress-key-abbreviation`

`tailf:cli-suppress-key-sort`

`tailf:cli-suppress-leafref-in-diff`

`tailf:cli-suppress-list-no`

`tailf:cli-suppress-mode`

`tailf:cli-suppress-no`

`tailf:cli-suppress-quotes`

`tailf:cli-suppress-range`

`tailf:cli-suppress-shortenabled`

`tailf:cli-suppress-show-conf-path`

`tailf:cli-suppress-show-match`

`tailf:cli-suppress-show-path`

`tailf:cli-suppress-silent-no`

`tailf:cli-suppress-table`

`tailf:cli-suppress-validation-warning-prompt`

`tailf:cli-suppress-warning`

`tailf:cli-suppress-wildcard`

`tailf:cli-table-footer`

`tailf:cli-table-legend`

`tailf:cli-trim-default`

`tailf:cli-value-display-template`

## Description

This manpage describes all the Tail-f CLI extension statements.

The YANG source file `$NCS_DIR/src/ncs/yang/tailf-cli-extensions.yang`
gives the exact YANG syntax for all Tail-f YANG CLI extension
statements - using the YANG language itself.

Most of the concepts implemented by the extensions listed below are
described in the User Guide.

## Yang Statements

### tailf:cli-add-mode

Creates a mode of the container.

Can be used in config nodes only.

Used in I- and C-style CLIs.

The *cli-add-mode* statement can be used in: *container* and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-allow-join-with-key

Indicates that the list name may be written together with the first key,
without requiring a whitespace in between, ie allowing both interface
ethernet1/1 and interface ethernet 1/1

Used in I- and C-style CLIs.

The *cli-allow-join-with-key* statement can be used in: *list* and
*refine*.

The following substatements can be used:

*tailf:cli-display-joined* Specifies that the joined version should be
used when displaying the configuration in C- and I- mode.

### tailf:cli-allow-join-with-value

Indicates that the leaf name may be written together with the value,
without requiring a whitespace in between, ie allowing both interface
ethernet1/1 and interface ethernet 1/1

Used in I- and C-style CLIs.

The *cli-allow-join-with-value* statement can be used in: *leaf* and
*refine*.

The following substatements can be used:

*tailf:cli-display-joined* Specifies that the joined version should be
used when displaying the configuration in C- and I- mode.

### tailf:cli-allow-key-abbreviation

Key values can be abbreviated.

In the J-style CLI this is relevant when using the commands 'delete' and
'edit'.

In the I- and C-style CLIs this is relevant when using the commands
'no', 'show configuration' and for commands to enter submodes.

See also /confdConfig/cli/allowAbbrevKeys in confd.conf(5).

The *cli-allow-key-abbreviation* statement can be used in: *list* and
*refine*.

### tailf:cli-allow-range

Means that the non-integer key should allow range expressions and
wildcard usage.

Can be used in key leafs only.

Used in J-, I- and C-style CLIs.

The *cli-allow-range* statement can be used in: *leaf* and *refine*.

### tailf:cli-allow-wildcard

Means that the list allows wildcard expressions in the 'show' pattern.

See also /confdConfig/cli/allowWildcard in confd.conf(5).

Used in J-, I- and C-style CLIs.

The *cli-allow-wildcard* statement can be used in: *list* and *refine*.

### tailf:cli-autowizard

Specifies that the autowizard should include this leaf even if the leaf
is optional.

One use case is when implementing pre-configuration of devices. A config
false node can be defined for showing if the configuration is active or
not (preconfigured).

Used in J-, I- and C-style CLIs.

The *cli-autowizard* statement can be used in: *leaf* and *refine*.

### tailf:cli-boolean-no

Specifies that a leaf of type boolean should be displayed as
'\<leafname\>' if set to true, and 'no \<leafname\>' if set to false.

Cannot be used in conjunction with tailf:cli-hide-in-submode or
tailf:cli-compact-syntax.

Used in I- and C-style CLIs.

The *cli-boolean-no* statement can be used in: *typedef*, *leaf*, and
*refine*.

The following substatements can be used:

*tailf:cli-reversed* Specified that true should be displayed as 'no
\<name\>' and false as 'name'.

Used in I- and C-style CLIs.

*tailf:cli-suppress-warning*

### tailf:cli-break-sequence-commands

Specifies that previous cli-sequence-commands declaration should stop at
this point. This also means that the current node is not part of the
sequence. Only applicable when a cli-sequence-commands declaration has
been used in the parent container.

Used in I- and C-style CLIs.

The *cli-break-sequence-commands* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-case-insensitive

Specifies that node is case-insensitive. If applied to a container or a
list, any nodes below will also be case-insensitive.

Node names are discovered without care of the case. Also affect matching
of key values in lists. However it doesn't affect the storing of a leaf
value. E.g. a modification of a leaf value from upper case to lower case
is still considered a modification of data.

Note that this will override any case-insensitivity settings configured
in confd.conf

The *cli-case-insensitive* statement can be used in: *container*,
*list*, and *leaf*.

### tailf:cli-case-sensitive

Specifies that this node is case-sensitive. If applied to a container or
a list, any nodes below will also be case-sensitive.

This negates the cli-case-insensitive extension (see below).

Note that this will override any case-sensitivity settings configured in
confd.conf

The *cli-case-sensitive* statement can be used in: *container*, *list*,
and *leaf*.

### tailf:cli-column-align *value*

Specifies the alignment of the data in the column in the auto-rendered
tables.

Used in J-, I- and C-style CLIs.

The *cli-column-align* statement can be used in: *leaf*, *leaf-list*,
and *refine*.

### tailf:cli-column-stats

Display leafs in the container as columns, i.e., do not repeat the name
of the container on each line, but instead indent each leaf under the
container.

Used in I- and C-style CLIs.

The *cli-column-stats* statement can be used in: *container* and
*refine*.

### tailf:cli-column-width *value*

Set a fixed width for the column in the auto-rendered tables.

Used in J-, I- and C-style CLIs.

The *cli-column-width* statement can be used in: *leaf*, *leaf-list*,
and *refine*.

### tailf:cli-compact-stats

Instructs the CLI engine to use the compact representation for this
node. The compact representation means that all leaf elements are shown
on a single line.

Used in J-, I- and C-style CLIs.

The *cli-compact-stats* statement can be used in: *list*, *container*,
and *refine*.

The following substatements can be used:

*tailf:cli-wrap* If present, the line will be wrapped at screen width.

*tailf:cli-width* Specifies a fixed terminal width to use before
wrapping line. It is only used when tailf:cli-wrap is present. If a
width is not specified the line is wrapped when the terminal width is
reached.

*tailf:cli-delimiter* Specifies a string to print between the leaf name
and its value when displaying leaf values.

*tailf:cli-prettify* If present, dashes (-) and underscores (\_) in leaf
names are replaced with spaces.

*tailf:cli-spacer* Specifies a string to print between the nodes.

### tailf:cli-compact-syntax

Instructs the CLI engine to use the compact representation for this node
in the 'show running-configuration' command. The compact representation
means that all leaf elements are shown on a single line.

Cannot be used in conjunction with tailf:cli-boolean-no.

Used in I- and C-style CLIs.

The *cli-compact-syntax* statement can be used in: *list*, *container*,
and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-completion-actionpoint *value*

Specifies that completion for the leaf values is done through a callback
function.

The argument is the name of an actionpoint, which must be implemented by
custom code. In the actionpoint, the completion() callback function will
be invoked. See confd_lib_dp(3) for details.

Used in J-, I- and C-style CLIs.

The *cli-completion-actionpoint* statement can be used in: *leaf-list*,
*leaf*, and *refine*.

The following substatements can be used:

*tailf:cli-completion-id* Specifies a string which is passed to the
callback when invoked. This makes it possible to use the same callback
at several locations and still keep track of which point it is invoked
from.

### tailf:cli-configure-mode

An action or rpc with this attribute will be available in configure
mode, but not in operational mode.

The default is that the action or rpc is available in both configure and
operational mode.

Used in J-, I- and C-style CLIs.

The *cli-configure-mode* statement can be used in: *tailf:action*,
*rpc*, and *action*.

### tailf:cli-custom-error *text*

This statement specifies a custom error message to be displayed when the
user enters an invalid value.

The *cli-custom-error* statement can be used in: *leaf* and *refine*.

### tailf:cli-custom-range

Specifies that the key should support ranges. A type matching the range
expression must be supplied.

Can be used in key leafs only.

Used in J-, I- and C-style CLIs.

The *cli-custom-range* statement can be used in: *leaf* and *refine*.

The following substatements can be used:

*tailf:cli-range-type* This statement contains the name of a derived
type, possibly with a prefix. If no prefix is given, the type must be
defined in the local module. For example:

cli-range-type p:my-range-type;

All range expressions must match this type, and a valid key value must
not match this type.

*tailf:cli-suppress-warning*

### tailf:cli-custom-range-actionpoint *value*

Specifies that the list supports range expressions and that a custom
function will be invoked to determine if an instance belong in the range
or not. At least one key element needs a cli-custom-range statement.

The argument is the name of an actionpoint, which must be implemented by
custom code. In the actionpoint, the completion() callback function will
be invoked. See confd_lib_dp(3) for details.

When a range expression value which matches the type is given in the
CLI, the CLI engine will invoke the callback with each existing list
entry instance. If the callback returns CONFD_OK, it matches the range
expression, and if it returns CONFD_ERR, it doesn't match.

Used in J-, I- and C-style CLIs.

The *cli-custom-range-actionpoint* statement can be used in: *list* and
*refine*.

The following substatements can be used:

*tailf:cli-completion-id* Specifies a string which is passed to the
callback when invoked. This makes it possible to use the same callback
at several locations and still keep track of which point it is invoked
from.

*tailf:cli-allow-caching* Allow caching of the evaluation results
between different parent paths.

*tailf:cli-suppress-warning*

### tailf:cli-custom-range-enumerator *value*

Specifies a callback to invoke to get an array of instances matching a
regular expression. This is used when instances should be allowed to be
created using a range expression in set.

The callback is not used for delete or show operations.

The callback is allowed to return a superset of all matching instances
since the instances will be filtered using the range expression
afterwards.

Used in J-, I- and C-style CLIs.

The *cli-custom-range-enumerator* statement can be used in: *list* and
*refine*.

The following substatements can be used:

*tailf:cli-completion-id* Specifies a string which is passed to the
callback when invoked. This makes it possible to use the same callback
at several locations and still keep track of which point it is invoked
from.

*tailf:cli-allow-caching* Allow caching of the evaluation results
between different parent paths.

*tailf:cli-suppress-warning*

### tailf:cli-delayed-auto-commit

Enables transactions while in a specific submode (or submode of that
mode). The modifications performed in that mode will not take effect
until the user exits that submode.

Can be used in config nodes only. If used in a container, the container
must also have a tailf:cli-add-mode statement, and if used in a list,
the list must not also have a tailf:cli-suppress-mode statement.

Used in I- and C-style CLIs.

The *cli-delayed-auto-commit* statement can be used in: *container*,
*list*, and *refine*.

### tailf:cli-delete-container-on-delete

Specifies that the parent container should be deleted when . this leaf
is deleted.

The *cli-delete-container-on-delete* statement can be used in: *leaf*
and *refine*.

### tailf:cli-delete-when-empty

Instructs the CLI engine to delete the list when the last list instance
is deleted'. Requires that cli-suppress-mode is set.

The behavior is recursive. If all optional leafs in a list instance are
deleted the list instance itself is deleted. If that list instance
happens to be the last list instance in a list it is also deleted. And
so on. Used in I- and C-style CLIs.

The *cli-delete-when-empty* statement can be used in: *list* and
*container*.

### tailf:cli-diff-after *path*

When displaying C-style configuration diffs, display any changes made to
this node after any changes made to the target node(s).

Thus, the dependency will trigger when any changes (created, modified or
deleted) has been made to this node while any changes (created, modified
or deleted) has been made to the target node(s).

Applies to C-style

The *cli-diff-after* statement can be used in: *container*, *list*,
*leaf*, *leaf-list*, and *refine*.

The following substatements can be used:

*tailf:xpath-root*

*tailf:cli-when-target-set* Specify that the dependency should trigger
when the target node(s) has been set (created or modified). Note; using
this sub-statement is equivalent with using both
tailf:cli-when-target-create and tailf:cli-when-target-modify

*tailf:cli-when-target-create* Specify that the dependency should
trigger when the target node(s) has been created

*tailf:cli-when-target-modify* Specify that the dependency should
trigger when the target node(s) has been modified (not created or
deleted)

*tailf:cli-when-target-delete* Specify that the dependency should
trigger when the target node(s) has been deleted

*tailf:cli-suppress-warning*

### tailf:cli-diff-before *path*

When displaying C-style configuration diffs, display any changes made to
this node before any changes made to the target node(s).

Thus, the dependency will trigger when any changes (created, modified or
deleted) has been made to this node while any changes (created, modified
or deleted) has been made to the target node(s).

Applies to C-style

The *cli-diff-before* statement can be used in: *container*, *list*,
*leaf*, *leaf-list*, and *refine*.

The following substatements can be used:

*tailf:xpath-root*

*tailf:cli-when-target-set* Specify that the dependency should trigger
when the target node(s) has been set (created or modified). Note; using
this sub-statement is equivalent with using both
tailf:cli-when-target-create and tailf:cli-when-target-modify

*tailf:cli-when-target-create* Specify that the dependency should
trigger when the target node(s) has been created

*tailf:cli-when-target-modify* Specify that the dependency should
trigger when the target node(s) has been modified (not created or
deleted)

*tailf:cli-when-target-delete* Specify that the dependency should
trigger when the target node(s) has been deleted

*tailf:cli-suppress-warning*

### tailf:cli-diff-create-after *path*

When displaying C-style configuration diffs, display any create
operations made on this node after any changes made to the target
node(s).

Thus, the dependency will trigger when this node has been created while
any changes (created, modified or deleted) has been made to the target
node(s).

Applies to C-style

The *cli-diff-create-after* statement can be used in: *container*,
*list*, *leaf*, *leaf-list*, and *refine*.

The following substatements can be used:

*tailf:xpath-root*

*tailf:cli-when-target-set* Specify that the dependency should trigger
when the target node(s) has been set (created or modified). Note; using
this sub-statement is equivalent with using both
tailf:cli-when-target-create and tailf:cli-when-target-modify

*tailf:cli-when-target-create* Specify that the dependency should
trigger when the target node(s) has been created

*tailf:cli-when-target-modify* Specify that the dependency should
trigger when the target node(s) has been modified (not created or
deleted)

*tailf:cli-when-target-delete* Specify that the dependency should
trigger when the target node(s) has been deleted

*tailf:cli-suppress-warning*

### tailf:cli-diff-create-before *path*

When displaying C-style configuration diffs, display any create
operations made on this node before any changes made to the target
node(s).

Thus, the dependency will trigger when this node has been created while
any changes (created, modified or deleted) has been made to the target
node(s).

Applies to C-style

The *cli-diff-create-before* statement can be used in: *container*,
*list*, *leaf*, *leaf-list*, and *refine*.

The following substatements can be used:

*tailf:xpath-root*

*tailf:cli-when-target-set* Specify that the dependency should trigger
when the target node(s) has been set (created or modified). Note; using
this sub-statement is equivalent with using both
tailf:cli-when-target-create and tailf:cli-when-target-modify

*tailf:cli-when-target-create* Specify that the dependency should
trigger when the target node(s) has been created

*tailf:cli-when-target-modify* Specify that the dependency should
trigger when the target node(s) has been modified (not created or
deleted)

*tailf:cli-when-target-delete* Specify that the dependency should
trigger when the target node(s) has been deleted

*tailf:cli-suppress-warning*

### tailf:cli-diff-delete-after *path*

When displaying C-style configuration diffs, display any delete
operations made on this node after any changes made to the target
node(s).

Thus, the dependency will trigger when this node has been deleted while
any changes (created, modified or deleted) has been made to the target
node(s).

Applies to C-style

The *cli-diff-delete-after* statement can be used in: *container*,
*list*, *leaf*, *leaf-list*, and *refine*.

The following substatements can be used:

*tailf:xpath-root*

*tailf:cli-when-target-set* Specify that the dependency should trigger
when the target node(s) has been set (created or modified). Note; using
this sub-statement is equivalent with using both
tailf:cli-when-target-create and tailf:cli-when-target-modify

*tailf:cli-when-target-create* Specify that the dependency should
trigger when the target node(s) has been created

*tailf:cli-when-target-modify* Specify that the dependency should
trigger when the target node(s) has been modified (not created or
deleted)

*tailf:cli-when-target-delete* Specify that the dependency should
trigger when the target node(s) has been deleted

*tailf:cli-suppress-warning*

### tailf:cli-diff-delete-before *path*

When displaying C-style configuration diffs, display any delete
operations made on this node before any changes made to the target
node(s).

Thus, the dependency will trigger when this node has been deleted while
any changes (created, modified or deleted) has been made to the target
node(s).

Applies to C-style

The *cli-diff-delete-before* statement can be used in: *container*,
*list*, *leaf*, *leaf-list*, and *refine*.

The following substatements can be used:

*tailf:xpath-root*

*tailf:cli-when-target-set* Specify that the dependency should trigger
when the target node(s) has been set (created or modified). Note; using
this sub-statement is equivalent with using both
tailf:cli-when-target-create and tailf:cli-when-target-modify

*tailf:cli-when-target-create* Specify that the dependency should
trigger when the target node(s) has been created

*tailf:cli-when-target-modify* Specify that the dependency should
trigger when the target node(s) has been modified (not created or
deleted)

*tailf:cli-when-target-delete* Specify that the dependency should
trigger when the target node(s) has been deleted

*tailf:cli-suppress-warning*

### tailf:cli-diff-dependency *path*

Tells the 'show configuration' command, and the diff generator that this
node depends on another node. When removing the node with this
declaration, it should be removed before the node it depends on is
removed, ie the declaration controls the ordering of the commands in the
'show configuration' output.

Applies to C-style

The *cli-diff-dependency* statement can be used in: *container*, *list*,
*leaf*, *leaf-list*, and *refine*.

The following substatements can be used:

*tailf:xpath-root*

*tailf:cli-trigger-on-set* Specify that the dependency should trigger on
set/modify of the target path, but deletion of the target will trigger
the current node to be placed in front of the target.

The annotation can be used to get the diff behavior where one leaf is
first deleted before the other leaf is set. For example, having the data
model below:

container X { leaf A { tailf:cli-diff-dependency "../B" {
tailf:cli-trigger-on-set; } type empty; } leaf B {
tailf:cli-diff-dependency "../A" { tailf:cli-trigger-on-set; } type
empty; } }

produces the following diffs when setting one leaf and deleting the
other

no X A X B

and

no X B X A

this can also be done with list instances, for example

list a { key id;

leaf id { tailf:cli-diff-dependency "/c\[id=current()/../id\]" {
tailf:cli-trigger-on-set; } type string; } }

list c { key id; leaf id { tailf:cli-diff-dependency
"/a\[id=current()/../id\]" { tailf:cli-trigger-on-set; } type string; }
}

we get

no a foo c foo !

and

no c foo a foo !

In the above case if we have the same id in list "a" and "c" and we
delete the instance in one list, and add it in the other, then the
deletion will always precede the create.

*tailf:cli-trigger-on-delete* This annotation can be used together with
tailf:cli-trigger-on-set to also get the behavior that when deleting the
target display changes to this node first. For example:

container settings { tailf:cli-add-mode;

leaf opmode { tailf:cli-no-value-on-delete;

type enumeration { enum nat; enum transparent; } }

leaf manageip { when "../opmode = 'transparent'"; mandatory true;
tailf:cli-no-value-on-delete; tailf:cli-diff-dependency '../opmode' {
tailf:cli-trigger-on-set; tailf:cli-trigger-on-delete; }

type string; } }

What we are trying to achieve here is that if manageip is deleted, it
should be displayed before opmode, but if we configure both opmode and
manageip, we should display opmode first, ie get the diffs:

settings opmode transparent manageip 1.1.1.1 !

and

settings no manageip opmode nat !

and

settings no manageip no opmode !

The cli-trigger-on-set annotation will cause the 'no manageip' command
to be displayed before setting opmode. The tailf:cli-trigger-on-delete
will cause 'no manageip' to be placed before 'no opmode' when both are
deleted.

In the first diff where both are created, opmode will come first due to
the diff-dependency setting, regardless of the cli-trigger-on-delete and
cli-trigger-on-set.

*tailf:cli-trigger-on-all* Specify that the dependency should always
trigger. It is the same as placing one element before another in the
data model. For example, given the data model:

container X { leaf A { tailf:cli-diff-dependency '../B' {
tailf:cli-trigger-on-all; } type empty; } leaf B { type empty; } }

We get the diffs

X B X A

and

no X B no X A

*tailf:cli-suppress-warning*

### tailf:cli-diff-modify-after *path*

When displaying C-style configuration diffs, display any modify
operations made on this node after any changes made to the target
node(s).

Thus, the dependency will trigger when this node has been modified (not
created or deleted) while any changes (created, modified or deleted) has
been made to the target node(s).

Applies to C-style

The *cli-diff-modify-after* statement can be used in: *container*,
*list*, *leaf*, *leaf-list*, and *refine*.

The following substatements can be used:

*tailf:xpath-root*

*tailf:cli-when-target-set* Specify that the dependency should trigger
when the target node(s) has been set (created or modified). Note; using
this sub-statement is equivalent with using both
tailf:cli-when-target-create and tailf:cli-when-target-modify

*tailf:cli-when-target-create* Specify that the dependency should
trigger when the target node(s) has been created

*tailf:cli-when-target-modify* Specify that the dependency should
trigger when the target node(s) has been modified (not created or
deleted)

*tailf:cli-when-target-delete* Specify that the dependency should
trigger when the target node(s) has been deleted

*tailf:cli-suppress-warning*

### tailf:cli-diff-modify-before *path*

When displaying C-style configuration diffs, display any modify
operations made on this node before any changes made to the target
node(s).

Thus, the dependency will trigger when this node has been modified (not
created or deleted) while any changes (created, modified or deleted) has
been made to the target node(s).

Applies to C-style

The *cli-diff-modify-before* statement can be used in: *container*,
*list*, *leaf*, *leaf-list*, and *refine*.

The following substatements can be used:

*tailf:xpath-root*

*tailf:cli-when-target-set* Specify that the dependency should trigger
when the target node(s) has been set (created or modified). Note; using
this sub-statement is equivalent with using both
tailf:cli-when-target-create and tailf:cli-when-target-modify

*tailf:cli-when-target-create* Specify that the dependency should
trigger when the target node(s) has been created

*tailf:cli-when-target-modify* Specify that the dependency should
trigger when the target node(s) has been modified (not created or
deleted)

*tailf:cli-when-target-delete* Specify that the dependency should
trigger when the target node(s) has been deleted

*tailf:cli-suppress-warning*

### tailf:cli-diff-set-after *path*

When displaying C-style configuration diffs, display any set operations
(created or modified) made on this node after any changes made to the
target node(s).

Thus, the dependency will trigger when this node has been set (created
or modified) while any changes (created, modified or deleted) has been
made to the target node(s).

Applies to C-style

The *cli-diff-set-after* statement can be used in: *container*, *list*,
*leaf*, *leaf-list*, and *refine*.

The following substatements can be used:

*tailf:xpath-root*

*tailf:cli-when-target-set* Specify that the dependency should trigger
when the target node(s) has been set (created or modified). Note; using
this sub-statement is equivalent with using both
tailf:cli-when-target-create and tailf:cli-when-target-modify

*tailf:cli-when-target-create* Specify that the dependency should
trigger when the target node(s) has been created

*tailf:cli-when-target-modify* Specify that the dependency should
trigger when the target node(s) has been modified (not created or
deleted)

*tailf:cli-when-target-delete* Specify that the dependency should
trigger when the target node(s) has been deleted

*tailf:cli-suppress-warning*

### tailf:cli-diff-set-before *path*

When displaying C-style configuration diffs, display any set operations
(created or modified) made on this node before any changes made to the
target node(s).

Thus, the dependency will trigger when this node has been set (created
or modified) while any changes (created, modified or deleted) has been
made to the target node(s).

Applies to C-style

The *cli-diff-set-before* statement can be used in: *container*, *list*,
*leaf*, *leaf-list*, and *refine*.

The following substatements can be used:

*tailf:xpath-root*

*tailf:cli-when-target-set* Specify that the dependency should trigger
when the target node(s) has been set (created or modified). Note; using
this sub-statement is equivalent with using both
tailf:cli-when-target-create and tailf:cli-when-target-modify

*tailf:cli-when-target-create* Specify that the dependency should
trigger when the target node(s) has been created

*tailf:cli-when-target-modify* Specify that the dependency should
trigger when the target node(s) has been modified (not created or
deleted)

*tailf:cli-when-target-delete* Specify that the dependency should
trigger when the target node(s) has been deleted

*tailf:cli-suppress-warning*

### tailf:cli-disabled-info *value*

Specifies an info string that will be used as a descriptive text for the
value 'disable' (false) of boolean-typed leafs when the confd.conf(5)
setting /confdConfig/cli/useShortEnabled is set to 'true'.

Used in J-, I- and C-style CLIs.

The *cli-disabled-info* statement can be used in: *leaf* and *refine*.

### tailf:cli-disallow-value *value*

Specifies that a pattern for invalid values.

Used in I- and C-style CLIs.

The *cli-disallow-value* statement can be used in: *leaf*, *leaf-list*,
and *refine*.

### tailf:cli-display-empty-config

Specifies that the node will be included when doing a 'show stats', even
if it is a non-config node, provided that the list contains at least one
non-config node.

Used in J-style CLI.

The *cli-display-empty-config* statement can be used in: *list* and
*refine*.

### tailf:cli-display-separated

Tells CLI engine to display this container as a separate line item even
when it has children. Only applies to presence containers.

Applicable for optional containers in the C- and I- style CLIs.

The *cli-display-separated* statement can be used in: *container* and
*refine*.

### tailf:cli-drop-node-name

Specifies that the name of a node is not present in the CLI.

If tailf:cli-drop-node-name is given on a child to a list node, we
recommend that you also use tailf:cli-suppress-mode on that list node,
otherwise the CLI will be very confusing.

For example, consider this data model, from the tailf-aaa module:

<div class="informalexample">

    list alias {
     key name;
     leaf name {
       type string;
     }
     leaf expansion {
       type string;
       mandatory true;
       tailf:cli-drop-node-name;
     }
    }

</div>

If you type 'alias foo' in the CLI, you would end up in the 'alias'
submode. But since the expansion is dropped, you would end up specifying
the expansion value without typing any command.

If, on the other hand, the 'alias' list had a tailf:cli-suppress-mode
statement, you would set an expansion 'bar' by typing 'alias foo bar'.

Used in I- and C-style CLIs.

The *cli-drop-node-name* statement can be used in: *leaf*, *container*,
*list*, *leaf-list*, and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-embed-no-on-delete

Embed no in front of the element name instead of at the beginning of the
line.

Applies to C-style

The *cli-embed-no-on-delete* statement can be used in: *leaf*,
*container*, *list*, *leaf-list*, and *refine*.

### tailf:cli-enforce-table

Forces the generation of a table for a list element node regardless of
whether the table will be too wide or not. This applies to the tables
generated by the auto-rendered show commands for non-config data.

Used in I- and C-style CLIs.

The *cli-enforce-table* statement can be used in: *list* and *refine*.

### tailf:cli-exit-command *value*

Tells the CLI to add an explicit exit-from-submode command. The
tailf:info substatement can be used for adding a custom info text for
the command.

Used in I- and C-style CLIs.

The *cli-exit-command* statement can be used in: *list*, *container*,
and *refine*.

The following substatements can be used:

*tailf:info*

### tailf:cli-explicit-exit

Tells the CLI to add an explicit exit command when displaying the
configuration. It will not be added if cli-exit-command is defined as
well. The annotation is inherited by all sub-modes.

Used in I- and C-style CLIs.

The *cli-explicit-exit* statement can be used in: *list*, *container*,
and *refine*.

### tailf:cli-expose-key-name

Force the user to enter the name of the key and display the key name
when displaying the running-configuration.

Note: This extension isn't applicable on a list key which is type empty
or a union of type empty. It is because the name of a type empty list
key is already required to enter and is displayed when showing the
running-configuration.

Used in J-, I- and C-style CLIs.

The *cli-expose-key-name* statement can be used in: *leaf* and *refine*.

### tailf:cli-expose-ns-prefix

When used force the CLI to display namespace prefix of all children.

The *cli-expose-ns-prefix* statement can be used in: *container*,
*list*, and *refine*.

### tailf:cli-flat-list-syntax

Specifies that elements in a leaf-list should be entered without
surrounding brackets. Also, multiple elements can be added to a list or
deleted from a list. If this extension is set for a leaf-list and the
parent node of the leaf-list has cli-sequence-commands extension, then
the leaf-list should also have cli-disallow-value extension which should
contain names of all the sibling nodes of the leaf-list. This is to
correctly recognize the end of the leaf-list values among entered
tokens.

Used in J-, I- and C-style CLIs.

The *cli-flat-list-syntax* statement can be used in: *leaf-list* and
*refine*.

The following substatements can be used:

*tailf:cli-replace-all*

### tailf:cli-flatten-container

Allows the CLI to exit the container and continue to input from the
parent container when all leaves in the current container has been set.

Can be used in config nodes only.

Used in I- and C-style CLIs.

The *cli-flatten-container* statement can be used in: *container*,
*list*, and *refine*.

### tailf:cli-full-command

Specifies that an auto-rendered command should be considered complete,
ie, no additional leaves or containers can be entered on the same
command line.

It is not recommended to use this extension in combination with
tailf:cli-drop-node-name on a non-presence container if it doesnt have a
tailf:cli-add-mode extension.

Used in I- and C-style CLIs.

The *cli-full-command* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-full-no

Specifies that an auto-rendered 'no'-command should be considered
complete, ie, no additional leaves or containers can be entered on the
same command line.

Used in I- and C-style CLIs.

The *cli-full-no* statement can be used in: *leaf*, *leaf-list*, *list*,
*container*, and *refine*.

### tailf:cli-full-show-path

Specifies that a path to the show command is considered complete, i.e.,
no more elements can be added to the path. It can also be used to
specify a maximum number of keys to be given for lists.

Used in J-, I- and C-style CLIs.

The *cli-full-show-path* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

The following substatements can be used:

*tailf:cli-max-keys* Specifies the maximum number of allowed keys for
the show command.

### tailf:cli-hide-in-submode

Hide leaf when submode has been entered. Mostly useful when leaf has to
be entered in order to enter a submode. Also works for flattened
containers. This has effect on how a delete is handled for a leaf that
exists within a submode since that delete needs to be happen at the
submode level.

Cannot be used in conjunction with tailf:cli-boolean-no.

Used in I- and C-style CLIs.

The *cli-hide-in-submode* statement can be used in: *leaf*, *container*,
and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-ignore-modified

Tells the cdb_get_modifications_cli system call to not generate a CLI
string when this node is modified. A string will instead be generated
for any modified children, if such nodes exists.

Applies to C-style and I-style

The *cli-ignore-modified* statement can be used in: *container*, *list*,
*leaf*, *leaf-list*, and *refine*.

### tailf:cli-incomplete-command

Specifies that an auto-rendered command should be considered incomplete.
Can be used to prevent \<cr\> from appearing in the completion list for
optional internal nodes, for example, or to ensure that the user enters
all leaf values in a container (if used in combination with
cli-sequence-commands).

Used in I- and C-style CLIs.

The *cli-incomplete-command* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-incomplete-no

Specifies that an auto-rendered 'no'-command should not be considered
complete, ie, additional leaves or containers must be entered on the
same command line.

Used in I- and C-style CLIs.

The *cli-incomplete-no* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

### tailf:cli-incomplete-show-path

Specifies that a path to the show command is considered incomplete,
i.e., it needs more elements added to the path. It can also be used to
specify a minimum number of keys to be given for lists.

Used in J-, I- and C-style CLIs.

The *cli-incomplete-show-path* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

The following substatements can be used:

*tailf:cli-min-keys* Specifies the minimum number of required keys for
the show command.

### tailf:cli-instance-info-leafs *value*

This statement is used to specify how list entries are displayed when
doing completion in the CLI. By default, a list entry is displayed by
listing its key values, and the value of a leaf called 'description', if
such a leaf exists in the list entry.

The 'cli-instance-info-leafs' statement takes as its argument a space
separated string of leaf names. When a list entry is displayed, the
values of these leafs are concatenated with a space character as
separator and shown to the user.

For example, when asked to specify an interface the CLI will display a
list of possible interface instances, say 1 2 3 4. If the
cli-instance-info-leafs property is set to 'description' then the CLI
might show:

Possible completions: 1 - internet 2 - lab 3 - dmz 4 - wlan

Used in J-, I- and C-style CLIs.

The *cli-instance-info-leafs* statement can be used in: *list* and
*refine*.

### tailf:cli-key-format *value*

The format string is used when parsing a key value and when generating a
key value for an existing configuration. The key items are numbered from
1-N and the format string should indicate how they are related by using
\$(X) (where X is the key number). For example:

tailf:cli-key-format '\$(1)-\$(2)' means that the first key item is
concatenated with the second key item by a '-'.

Used in J-, I- and C-style CLIs.

The *cli-key-format* statement can be used in: *list* and *refine*.

### tailf:cli-list-syntax

Specifies that each entry in a leaf-list should be displayed as a
separate element.

Used in J-, I- and C-style CLIs.

The *cli-list-syntax* statement can be used in: *leaf-list* and
*refine*.

The following substatements can be used:

*tailf:cli-multi-word* Specifies that a multi-word value may be entered
without quotes.

### tailf:cli-min-column-width *value*

Set a minimum width for the column in the auto-rendered tables.

Used in J-, I- and C-style CLIs.

The *cli-min-column-width* statement can be used in: *leaf*,
*leaf-list*, and *refine*.

### tailf:cli-mode-name *value*

Specifies a custom mode name, instead of the default which is the name
of the list or container node.

Can be used in config nodes only. If used in a container, the container
must also have a tailf:cli-add-mode statement, and if used in a list,
the list must not also have a tailf:cli-suppress-mode statement.

Variables for the list keys in the current mode are available. For
examples, 'config-foo-xx\$(name)' (provided the key leaf is called
'name').

Used in I- and C-style CLIs.

The *cli-mode-name* statement can be used in: *container*, *list*, and
*refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-mode-name-actionpoint *value*

Specifies that a custom function will be invoked to find out the mode
name, instead of using the default with is the name of the list or
container node.

The argument is the name of an actionpoint, which must be implemented by
custom code. In the actionpoint, the command() callback function will be
invoked, and it must return a string with the mode name. See
confd_lib_dp(3) for details.

Can be used in config nodes only. If used in a container, the container
must also have a tailf:cli-add-mode statement, and if used in a list,
the list must not also have a tailf:cli-suppress-mode statement.

Used in I- and C-style CLIs.

The *cli-mode-name-actionpoint* statement can be used in: *container*,
*list*, and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-mount-point *value*

By default actions are mounted under the 'request' command in the
J-style CLI and at the top-level in the I- and C-style CLIs. This
annotation allows the action to be mounted under other top level
commands

The *cli-mount-point* statement can be used in: *tailf:action*, *rpc*,
and *action*.

### tailf:cli-multi-line-prompt

Tells the CLI to automatically enter multi-line mode when prompting the
user for a value to this leaf.

Used in J-, I- and C-style CLIs.

The *cli-multi-line-prompt* statement can be used in: *leaf* and
*refine*.

### tailf:cli-multi-value

Specifies that all remaining tokens on the command line should be
considered a value for this leaf. This prevents the need for quoting
values containing spaces, but also prevents multiple leaves from being
set on the same command line once a multi-value leaf has been given on a
line.

If the tailf:cli-max-words substatements is used then additional leaves
may be entered.

Note: This extension isn't applicable in actions

Used in I- and C-style CLIs.

The *cli-multi-value* statement can be used in: *leaf* and *refine*.

The following substatements can be used:

*tailf:cli-max-words* Specifies the maximum number of allowed words for
the key or value.

### tailf:cli-multi-word-key

Specifies that the key should allow multiple tokens for the value.
Proper type restrictions needs to be used to limit the range of the leaf
value.

Can be used in key leafs only.

Note: This extension isn't applicable in actions

Used in J-, I- and C-style CLIs.

The *cli-multi-word-key* statement can be used in: *leaf* and *refine*.

The following substatements can be used:

*tailf:cli-max-words* Specifies the maximum number of allowed words for
the key or value.

### tailf:cli-no-key-completion

Specifies that the CLI engine should not perform completion for key
leafs in the list. This is to avoid querying the data provider for all
existing keys.

Used in J-, I- and C-style CLIs.

The *cli-no-key-completion* statement can be used in: *list* and
*refine*.

### tailf:cli-no-keyword

Specifies that the name of a node is not present in the CLI.

Note that is must be used with some care, just like
tailf:cli-drop-node-name. The resulting data model must still be
possible to parse deterministically. For example, consider the data
model

<div class="informalexample">

    container interfaces {
       list traffic {
           tailf:cli-no-keyword;
           key id;
           leaf id { type string; }
           leaf mtu { type uint16; }
       }
       list management {
           tailf:cli-no-keyword;
           key id;
           leaf id { type string; }
           leaf mtu { type uint16; }
       }
    }

</div>

In this case it is impossible to determine if the config

<div class="informalexample">

    interfaces {
       eth0 {
          mtu 1400;
        }
    }

</div>

Means that there should be an traffic interface instance named 'eth0' or
a management interface instance maned 'eth0'. If, on the other hand, a
restriction on the type was used, for example

<div class="informalexample">

    container interfaces {
       list traffic {
           tailf:cli-no-keyword;
           key id;
           leaf id { type string; pattern 'eth.*'; }
           leaf mtu { type uint16; }
       }
       list management {
           tailf:cli-no-keyword;
           key id;
           leaf id { type string; pattern 'lo.*';}
           leaf mtu { type uint16; }
       }
    }

</div>

then the problem would disappear.

Used in the J-style CLIs.

The *cli-no-keyword* statement can be used in: *leaf*, *container*,
*list*, *leaf-list*, and *refine*.

### tailf:cli-no-match-completion

Specifies that the CLI engine should not provide match completion for
the key leafs in the list.

Used in J-, I- and C-style CLIs.

The *cli-no-match-completion* statement can be used in: *list* and
*refine*.

### tailf:cli-no-name-on-delete

When displaying the deleted version of this element do not include the
name.

Applies to C-style

The *cli-no-name-on-delete* statement can be used in: *leaf*,
*container*, *list*, *leaf-list*, and *refine*.

### tailf:cli-no-value-on-delete

When displaying the deleted version of this leaf do not include the old
value.

Applies to C-style

The *cli-no-value-on-delete* statement can be used in: *leaf*,
*leaf-list*, and *refine*.

### tailf:cli-only-in-autowizard

Force leaf values to be entered in the autowizard. This is intended to
prevent users from entering passwords and other sensitive information in
plain text.

Used in J-, I- and C-style CLIs.

The *cli-only-in-autowizard* statement can be used in: *leaf*.

### tailf:cli-oper-info *text*

This statement works exactly as tailf:info, with the exception that it
is used when displaying the element info in the context of stats.

Both tailf:info and tailf:cli-oper-info can be present at the same time.

The *cli-oper-info* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, *rpc*, *action*, *identity*, *tailf:action*, and
*refine*.

### tailf:cli-operational-mode

An action or rpc with this attribute will be available in operational
mode, but not in configure mode.

The default is that the action or rpc is available in both configure and
operational mode.

Used in J-, I- and C-style CLIs.

The *cli-operational-mode* statement can be used in: *tailf:action*,
*rpc*, and *action*.

### tailf:cli-optional-in-sequence

Specifies that this element is optional in the sequence. If it is set it
must be set in the right sequence but may be skipped.

Used in I- and C-style CLIs.

The *cli-optional-in-sequence* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-prefix-key

This leaf has to be given as a prefix before entering the actual list
keys. Very backwards but a construct that exists in some Cisco CLIs.

The construct can be used also for leaf-lists but only when then
tailf:cli-range-list-syntax is also used.

Used in I- and C-style CLIs.

The *cli-prefix-key* statement can be used in: *leaf*, *refine*, and
*leaf-list*.

The following substatements can be used:

*tailf:cli-before-key* Specifies before which key the prefix element
should be inserted. The first key has number 1.

*tailf:cli-suppress-warning*

### tailf:cli-preformatted

Suppresses quoting of non-config elements when displaying them. Newlines
will be preserved in strings etc.

Used in J-, I- and C-style CLIs.

The *cli-preformatted* statement can be used in: *leaf* and *refine*.

### tailf:cli-range-delimiters *value*

Allows for custom delimiters to be defined for range expressions. By
default only / is considered a delimiter, ie when processing a key like
1/2/3 then each of 1, 2 and 3 will be matched separately against range
expressions, ie given the expression 1-3/5-6/7,8 1 will be matched with
1-3, 2 with 5-6, and 3 with 7,8. If, for example, the delimiters value
is set to '/.' then both '/' and '.' will be considered delimiters and
an key such as 1/2/3.4 will consist of the entities 1,2,3,4, all matched
separately.

Used in J-, I- and C-style CLIs.

The *cli-range-delimiters* statement can be used in: *list* and
*refine*.

### tailf:cli-range-list-syntax

Specifies that elements in a leaf-list or a list should be entered
without surrounding brackets and presented as ranges. The element in the
list should be separated by a comma. For example:

vlan 1,3,10-20,30,32,300-310

When this statement is used for lists, the list must have a single key.
The elements are be presented as ranges as above.

The type of the list key, or the leaf-list, must be integer based.

Used in J-, I- and C-style CLIs.

The *cli-range-list-syntax* statement can be used in: *leaf-list*,
*list*, and *refine*.

### tailf:cli-recursive-delete

When generating configuration diffs delete all contents of a container
or list before deleting the node.

Applies to C-style

The *cli-recursive-delete* statement can be used in: *container*,
*list*, and *refine*.

### tailf:cli-remove-before-change

Instructs the CLI engine to generate a no-command for the internal data
of a instance before modifying it. If a internal leaf has the
tailf:cli-hide-in-submode extension the whole instance will be removed
instead of each internal leaf. It only applies when generating diffs, eg
'show configuration' in C-style.

The *cli-remove-before-change* statement can be used in: *leaf-list*,
*list*, *leaf*, and *refine*.

### tailf:cli-replace-all

Specifies that the new leaf-list value(s) should replace the old, as
opposed to be added to the old leaf-list.

The *cli-replace-all* statement can be used in: *leaf-list*,
*tailf:cli-flat-list-syntax*, and *refine*.

### tailf:cli-reset-container

Specifies that all sibling leaves in the container should be reset when
this element is set.

When used on a container its content is cleared when set.

The *cli-reset-container* statement can be used in: *leaf*, *list*,
*container*, and *refine*.

### tailf:cli-run-template *value*

Specifies a template string to be used by the 'show running-config'
command in operational mode. It is primarily intended for displaying
config data but non-config data may be included in the template as well.

Care has to be taken to not generate output that cannot be understood by
the parser.

See the definition of cli-template-string for more info.

Used in I- and C-style CLIs.

The *cli-run-template* statement can be used in: *leaf*, *leaf-list*,
and *refine*.

### tailf:cli-run-template-enter *value*

Specifies a template string to be printed before each list entry is
printed.

When used on a container it only has effect when the container also has
a tailf:cli-add-mode, and when tailf:cli-show-no isn't used on the
container.

See the definition of cli-template-string for more info.

The variable .reenter is set to 'true' when the 'show configuration'
command is executed and the list or container isn't created. This allow,
for example, to display

create foo

when an instance is created

edit foo

when something inside the instance is modified.

Care has to be taken to not generate output that cannot be understood by
the parser.

Used in I- and C-style CLIs.

The *cli-run-template-enter* statement can be used in: *list*,
*container*, and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-run-template-footer *value*

Specifies a template string to be printed after all list entries are
printed.

Care has to be taken to not generate output that cannot be understood by
the parser.

See the definition of cli-template-string for more info.

Used in I- and C-style CLIs.

The *cli-run-template-footer* statement can be used in: *list* and
*refine*.

### tailf:cli-run-template-legend *value*

Specifies a template string to be printed before all list entries are
printed.

Care has to be taken to not generate output that cannot be understood by
the parser.

See the definition of cli-template-string for more info.

Used in I- and C-style CLIs.

The *cli-run-template-legend* statement can be used in: *list* and
*refine*.

### tailf:cli-sequence-commands

Specifies that an auto-rendered command should only accept arguments in
the same order as they are specified in the YANG model. This, in
combination with tailf:cli-drop-node-name, can be used to create CLI
commands for setting multiple leafs in a container without having to
specify the leaf names.

In almost all cases this annotation should be accompanied by the
tailf:cli-compact-syntax annotation. Otherwise the output from 'show
running-config' will not be correct, and the sequence 'save xx' 'load
override xx' will not work.

Used in I- and C-style CLIs.

The *cli-sequence-commands* statement can be used in: *list*,
*container*, and *refine*.

The following substatements can be used:

*tailf:cli-reset-siblings* Specifies that all sibling leaves in the
sequence should be reset whenever the first leaf in the sequence is set.

*tailf:cli-reset-all-siblings* Specifies that all sibling leaves in the
container should be reset whenever the first leaf in the sequence is
set.

*tailf:cli-suppress-warning*

### tailf:cli-short-no

Specifies that the CLI should only auto-render 'no' command for this
list or container instead of auto-rendering 'no' commands for all its
children. Should not be used together with tailf:cli-incomplete-no
statement.

If used in a list, the list must also have a tailf:cli-suppress-mode
statement, and if used in a container, it must be a presence container
and must not have a tailf:cli-add-mode statement.

Used in I- and C-style CLIs.

The *cli-short-no* statement can be used in: *container*, *list*, and
*refine*.

### tailf:cli-show-config

Specifies that the node will be included when doing a 'show
running-configuration', even if it is a non-config node.

Used in I- and C-style CLIs.

The *cli-show-config* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

### tailf:cli-show-long-obu-diffs

Instructs the CLI engine to not generate 'insert' comments when
displaying configuration changes of ordered-by user lists, but instead
explicitly remove old instances with 'no' and then add the instances
following a newly inserted instance. Should not be used together with
tailf:cli-show-obu-comments

The *cli-show-long-obu-diffs* statement can be used in: *list* and
*refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

*tailf:cli-reset-full* Indicates that the list should be fully printed
out on change.

### tailf:cli-show-no

Specifies that an optional leaf node or presence container should be
displayed as 'no \<name\>' when it does not exist. For example, if a
leaf 'shutdown' has this property and does not exist, 'no shutdown' is
displayed.

Used in I- and C-style CLIs.

The *cli-show-no* statement can be used in: *leaf*, *list*, *leaf-list*,
*refine*, and *container*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-show-obu-comments

Enforces the CLI engine to generate 'insert' comments when displaying
configuration changes of ordered-by user lists. Should not be used
together with tailf:cli-show-long-obu-diffs

The *cli-show-obu-comments* statement can be used in: *list* and
*refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-show-order-tag *value*

Specifies a custom display order for nodes with the
tailf:cli-show-order-tag attribute. Nodes will be displayed in the order
indicated by a cli-show-order-taglist attribute in a parent node.

The scope of a tag reaches until a new taglist is encountered.

Used in I- and C-style CLIs.

The *cli-show-order-tag* statement can be used in: *container*, *list*,
*leaf*, *leaf-list*, and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-show-order-taglist *value*

Specifies a custom display order for nodes with the
tailf:cli-show-order-tag attribute. Nodes will be displayed in the order
indicated in the list. Nodes without a tag will be displayed after all
nodes with a tag have been displayed.

The scope of a taglist is until a new taglist is encountered.

Used in I- and C-style CLIs.

The *cli-show-order-taglist* statement can be used in: *container*,
*list*, and *refine*.

### tailf:cli-show-template *value*

Specifies a template string to be used by the 'show' command in
operational mode. It is primarily intended for displaying non-config
data but config data may be included in the template as well.

See the definition of cli-template-string for more info.

Some restrictions includes not applying templates on a leaf that is the
key in a list. It is recommended to use the template directly on the
list to format the whole list instead.

Used in J-, I- and C-style CLIs.

The *cli-show-template* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

The following substatements can be used:

*tailf:cli-auto-legend* Specifies that the legend should be
automatically rendered if not already displayed. Useful when using
templates for rendering tables.

### tailf:cli-show-template-enter *value*

Specifies a template string to be printed before each list entry is
printed.

See the definition of cli-template-string for more info.

Used in J-, I- and C-style CLIs.

The *cli-show-template-enter* statement can be used in: *list* and
*refine*.

### tailf:cli-show-template-footer *value*

Specifies a template string to be printed after all list entries are
printed.

See the definition of cli-template-string for more info.

Used in J-, I- and C-style CLIs.

The *cli-show-template-footer* statement can be used in: *list* and
*refine*.

### tailf:cli-show-template-legend *value*

Specifies a template string to be printed before all list entries are
printed.

See the definition of cli-template-string for more info.

Used in J-, I- and C-style CLIs.

The *cli-show-template-legend* statement can be used in: *list* and
*refine*.

### tailf:cli-show-with-default

This leaf will be displayed even when it has its default value. Note
that this will somewhat result in a slightly different behaviour when
you save a config and then load it again. With this setting in place a
leaf that has not been configured will be configured after the load.

Used in I- and C-style CLIs.

The *cli-show-with-default* statement can be used in: *leaf* and
*refine*.

### tailf:cli-strict-leafref

Specifies that the leaf should only be allowed to be assigned references
to existing instances when the command is executed. Without this
annotation the requirement is that the instance exists on commit time.

Used in I- and C-style CLIs.

The *cli-strict-leafref* statement can be used in: *leaf*, *leaf-list*,
and *refine*.

### tailf:cli-suppress-error-message-value

Allows you to suppress printing a value in an error message. This
extension can be placed in a 'list' or a 'leaf-list'.

The use-case in mind for this extension is that you for instance require
that the last element in a 'list' is the string 'router'. If the last
element is \*not\* 'router', you want to give an error message.

Without this extension, the error message would print the value of the
\*first\* element in the list, which would be confusing, as you
constrain the \*last\* element's value.

Used in J-, I- and C-style CLIs.

The *cli-suppress-error-message-value* statement can be used in: *list*,
*leaf-list*, and *refine*.

### tailf:cli-suppress-key-abbreviation

Key values cannot be abbreviated. The user must always give complete
values for keys.

In the J-style CLI this is relevant when using the commands 'delete' and
'edit'.

In the I- and C-style CLIs this is relevant when using the commands
'no', 'show configuration' and for commands to enter submodes.

See also /confdConfig/cli/allowAbbrevKeys in confd.conf(5).

The *cli-suppress-key-abbreviation* statement can be used in: *list* and
*refine*.

### tailf:cli-suppress-key-sort

Instructs the CLI engine to not sort the keys in alphabetical order when
presenting them to the user during TAB completion.

Used in J-, I- and C-style CLIs.

The *cli-suppress-key-sort* statement can be used in: *list* and
*refine*.

### tailf:cli-suppress-leafref-in-diff

Specifies that the leafref should not be considered when generating
configuration diff

The *cli-suppress-leafref-in-diff* statement can be used in: *leaf*,
*leaf-list*, and *refine*.

### tailf:cli-suppress-list-no

Specifies that the CLI should not accept deletion of the entire list or
leaf-list. Only specific instances should be deletable not the entire
list in one command. ie, 'no foo \<instance\>' should be allowed but not
'no foo'.

Used in I- and C-style CLIs.

The *cli-suppress-list-no* statement can be used in: *leaf-list*,
*list*, and *refine*.

### tailf:cli-suppress-mode

Instructs the CLI engine to not make a mode of the list node.

Can be used in config nodes only.

Used in I- and C-style CLIs.

The *cli-suppress-mode* statement can be used in: *list* and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-suppress-no

Specifies that the CLI should not auto-render 'no' commands for this
element. An element with this annotation will not appear in the
completion list to the 'no' command.

Used in I- and C-style CLIs.

The *cli-suppress-no* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

### tailf:cli-suppress-quotes

Specifies that configuration data for a leaf should never be wrapped
with quotes. All internal data will be escaped to make sure it can be
presented correctly.

Can't be used for keys.

Used in J-, I- and C-style CLIs.

The *cli-suppress-quotes* statement can be used in: *leaf*.

### tailf:cli-suppress-range

Means that the key should not allow range expressions.

Can be used in key leafs only.

Used in J-, I- and C-style CLIs.

The *cli-suppress-range* statement can be used in: *leaf* and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

### tailf:cli-suppress-shortenabled

Suppresses the confd.conf(5) setting /confdConfig/cli/useShortEnabled.

Used in J-, I- and C-style CLIs.

The *cli-suppress-shortenabled* statement can be used in: *leaf* and
*refine*.

### tailf:cli-suppress-show-conf-path

Specifies that the show running-config command cannot be invoked with
the path, ie the path is suppressed when auto-rendering show running-
config commands for config='true' data.

Used in J-, I- and C-style CLIs.

The *cli-suppress-show-conf-path* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

### tailf:cli-suppress-show-match

Specifies that a specific completion match (i.e., a filter match that
appear at list nodes as an alternative to specifying a single instance)
to the show command should not be available.

Used in J-, I- and C-style CLIs.

The *cli-suppress-show-match* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

### tailf:cli-suppress-show-path

Specifies that the show command cannot be invoked with the path, ie the
path is suppressed when auto-rendering show commands for config='false'
data.

Used in J-, I- and C-style CLIs.

The *cli-suppress-show-path* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

### tailf:cli-suppress-silent-no *value*

Specifies that the confd.cnof directive cSilentNo should be suppressed
for a leaf and that a custom error message should be displayed when the
user attempts to delete a non-existing element.

Used in I- and C-style CLIs.

The *cli-suppress-silent-no* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

### tailf:cli-suppress-table

Instructs the CLI engine to not print the list as a table in the 'show'
command.

Can be used in non-config nodes only.

Used in I- and C-style CLIs.

The *cli-suppress-table* statement can be used in: *list* and *refine*.

### tailf:cli-suppress-validation-warning-prompt

Instructs the CLI engine to not prompt the user whether to proceed or
not if a warning is generated for this node.

Used in I- and C-style CLIs.

The *cli-suppress-validation-warning-prompt* statement can be used in:
*list*, *leaf*, *container*, *leaf-list*, and *refine*.

### tailf:cli-suppress-warning *value*

Avoid involving specific CLI-extension related YANG statements in
warnings related to certain yanger error codes. For a list of yanger
error codes do 'yanger -e'.

Used in I- and C-style CLIs.

The *cli-suppress-warning* statement can be used in:
*tailf:cli-run-template-enter*, *tailf:cli-sequence-commands*,
*tailf:cli-hide-in-submode*, *tailf:cli-boolean-no*,
*tailf:cli-compact-syntax*, *tailf:cli-break-sequence-commands*,
*tailf:cli-show-long-obu-diffs*, *tailf:cli-show-obu-comments*,
*tailf:cli-suppress-range*, *tailf:cli-suppress-mode*,
*tailf:cli-custom-range*, *tailf:cli-custom-range-actionpoint*,
*tailf:cli-custom-range-enumerator*, *tailf:cli-drop-node-name*,
*tailf:cli-add-mode*, *tailf:cli-mode-name*,
*tailf:cli-incomplete-command*, *tailf:cli-full-command*,
*tailf:cli-mode-name-actionpoint*, *tailf:cli-optional-in-sequence*,
*tailf:cli-prefix-key*, *tailf:cli-show-no*, *tailf:cli-show-order-tag*,
*tailf:cli-diff-dependency*, and *container*.

### tailf:cli-suppress-wildcard

Means that the list does not allow wildcard expressions in the 'show'
pattern.

See also /confdConfig/cli/allowWildcard in confd.conf(5).

Used in J-, I- and C-style CLIs.

The *cli-suppress-wildcard* statement can be used in: *list* and
*refine*.

### tailf:cli-table-footer *value*

Specifies a template string to be printed after all list entries are
printed.

Used in J-, I- and C-style CLIs.

The *cli-table-footer* statement can be used in: *list* and *refine*.

### tailf:cli-table-legend *value*

Specifies a template string to be printed before all list entries are
printed.

Used in J-, I- and C-style CLIs.

The *cli-table-legend* statement can be used in: *list* and *refine*.

### tailf:cli-trim-default

Do not display value if it is same as default.

Used in I- and C-style CLIs.

The *cli-trim-default* statement can be used in: *leaf* and *refine*.

### tailf:cli-value-display-template *value*

Specifies a template string to be used when formatting the value of a
leaf for display. Note that other leaves cannot be referenced from a
display template of one leaf. The only value accessible is the leaf's
own value, accessed through \$(.).

This annotation is primarily for use in operational data since modified
leaf values cannot be automatically understood by the parser. Extreme
care should be taken when using this annotation for configuration data,
and it is generally strongly discouraged. The recommended approach is
instead to use a custom data type.

See the definition of cli-template-string for more info.

Used in J-, I- and C-style CLIs.

The *cli-value-display-template* statement can be used in: *leaf* and
*refine*.

## Yang Types

### cli-template-string

A template is a text string which is expanded by the CLI engine, and
then displayed to the user.

The template may contain a mix of text and expandable entries.
Expandable entries all start with \$( and end with a matching ).
Parentheses and dollar signs need to be quoted in plain text.

(Disclaimer: tailf:cli-template-string will not respect all CLI YANG
extensions existing from expandable entries. For instance,
tailf:cli-no-name-on-delete will have no effect when the value of a node
with this extension is fetched as a result of expanding CLI templates.)

The template is expanded as follows:

A parameter is either a relative or absolute path to a leaf element (eg
/foo/bar, foo/bar), or one of the builtin variables: .selected,
.entered, .legend_shown, .user, .groups, .ip, .display_groups, .path,
.ipath or .licounter. In addition the variables .spath and .ispath are
available when a command is executed from a show path.

.selected

The .selected variable contains the list of selected paths to be shown.
The show template can inspect this element to determine if a given
element should be displayed or not. For example:

\$(.selected~=hwaddr?HW Address)

.entered

The .entered variable is true if the "entered" text has been displayed
(either the auto generated text or a showTemplateEnter). This is useful
when having a non-table template where each instance should have a text.

\$(.entered?:host \$(name))

.legend_shown

The .legend_shown variable is true if the "legend" text has been
displayed (either the auto generated table header or a
showTemplateLegend). This is useful to inspect when displaying a table
row. If the user enters the path to a specific instance the builtin
table header will not be displayed and the showTemplateLegend will not
be invoked and it may be useful to render the legend specifically for
this instance.

\$(.legend_shown!=true?Address Interface)

.user

The .user variable contains the name of the current user. This can be
used for differentiating the content displayed for a specific user, or
in paths. For example:

<div class="informalexample">

            $(user{$(.user)}/settings)

</div>

.groups

The .groups variable contains the a list of groups that the user belongs
to.

.display_groups

The .display_groups variable contains a list of selected display groups.
This can be used to display different content depending on the selected
display group. For example:

\$(.display_groups~=details?details...)

.ip

The .ip variable contains the ip address that the user connected from.

.path

The .path variable contains the path to the entry, formatted in CLI
style.

.ipath

The .ipath variable contains the path to the entry, formatted in
template style.

.spath

The .spath variable contains the show path, formatted in CLI style.

.ispath

The .ispath variable contains the show path, formatted in template
style.

.licounter

The .licounter variable contains a counter that is incremented for each
instance in a list. This means that it will be 0 in the legend, contain
the total number of list instances in the footer and something in
between in the basic show template.

\$(parameter)

The value of 'parameter' is substituted.

\$(cond?word1:word2)

The expansion of 'word1' is substituted if 'cond' evaluates to true,
otherwise the expansion of 'word2' is substituted.

'cond' may be one of

parameter

Evaluates to true if the node exists.

parameter == \<value\>

Evaluates to true if the value of the parameter equals \<value\>.

parameter != \<value\>

Evaluates to true if the value of the parameter does not equal \<value\>

parameter ~= \<value\>

Provided that the value of the parameter is a list (i.e., the node that
the parameter refers to is a leaf-list), this expression evaluates to
true if \<value\> is a member of the list.

Note that it is also possible to omit ':word2' in order to print the
entire statement, or nothing. As an example \$(conf?word1) will print
'word1' if conf exists, otherwise it will print nothing.

\$(cond??word1)

Double question marks can be used to achieve the same effect as above,
but with the distinction that the 'cond' variable needs to be explicitly
configured, in order to be evaluated as existing. This is needed in the
case of evaluating leafs with default values, where the single question
mark operator would evaluate to existing even if not explicitly
configured.

\$(parameter\|filter)

The value of 'parameter' processed by 'filter' is substituted. Filters
may be either one of the built-ins or a customized filter defined in a
callback. See /confdConfig/cli/templateFilter.

A built-in 'filter' may be one of:

capfirst

Capitalizes the first character of the value.

lower

Converts the value into lowercase.

upper

Converts the value into uppercase.

filesizeformat

Formats the value in a human-readable format (e.g., '13 KB', '4.10 MB',
'102 bytes' etc), where K means 1024, M means 1024\*1024 etc.

When used without argument the default number of decimals displayed is
2. When used with a numeric integer argument, filesizeformat will
display the given number of decimal places.

humanreadable

Similar to filesizeformat except no bytes suffix is added (e.g., '13.00
k', '4.10 M' '102' etc), where k means 1000, M means 1000\*1000 etc.

When used without argument the default number of decimals displayed is
2. When used with a numeric integer argument, humanreadable will display
the given number of decimal places.

commasep

Separate the numerical values into groups of three digits using a comma
(e.g., 1234567 -\> 1,234,567)

hex

Display integer as hex number. An argument can be used to indicate how
many digits should be used in the output. If the hex number is too long
it will be truncated at the front, if it is too short it will be padded
with zeros at the front. If the width is a negative number then at most
that number of digits will be used, but short numbers will not be padded
with zeroes. Another argument can be given to indicate if the hex
numbers should be written with lower or upper case.

For example:

<div class="informalexample">

           value            Template                       Output
           12345           {{ value|hex }}                 3039
           12345           {{ value|hex:2 }}               39
           12345           {{ value|hex:8 }}               00003039
           12345           {{ value|hex:-8 }}              3039
           14911           {{ value|hex:-8:upper }}        3A3F
           14911           {{ value|hex:-8:lower }}        3a3f

</div>

hexlist

Display integer as hex number with : between pairs. An argument can be
used to indicate how many digits should be used in the output. If the
hex number is too long it will be truncated at the front, if it is too
short it will be padded with zeros at the front. If the width is a
negative number then at most that number of digits will be used, but
short numbers will not be padded with zeroes. Another argument can be
given to indicate if the hex numbers should be written with lower or
upper case.

For example:

<div class="informalexample">

           value            Template                       Output
           12345           {{ value|hexlist }}             30:39
           12345           {{ value|hexlist:2 }}           39
           12345           {{ value|hexlist:8 }}           00:00:30:39
           12345           {{ value|hexlist:-8 }}          30:39
           14911           {{ value|hexlist:-8:upper }}    3A:3F
           14911           {{ value|hexlist:-8:lower }}    3a:3f

</div>

floatformat

Used for type 'float' in tailf-xsd-types. We recommend that the YANG
built-in type 'decimal64' is used instead of 'float'.

When used without an argument, rounds a floating-point number to one
decimal place -- but only if there is a decimal part to be displayed.

For example:

<div class="informalexample">

           value           Template                        Output
           34.23234        {{ value|floatformat }}         34.2
           34.00000        {{ value|floatformat }}         34
           34.26000        {{ value|floatformat }}         34.3

</div>

If used with a numeric integer argument, floatformat rounds a number to
that many decimal places. For example:

<div class="informalexample">

           value           Template                        Output
           34.23234        {{ value|floatformat:3 }}       34.232
           34.00000        {{ value|floatformat:3 }}       34.000
           34.26000        {{ value|floatformat:3 }}       34.260

</div>

If the argument passed to floatformat is negative, it will round a
number to that many decimal places -- but only if there's a decimal part
to be displayed. For example:

<div class="informalexample">

           value           Template                        Output
           34.23234        {{ value|floatformat:-3 }}      34.232
           34.00000        {{ value|floatformat:-3 }}      34
           34.26000        {{ value|floatformat:-3 }}      34.260

</div>

Using floatformat with no argument is equivalent to using floatformat
with an argument of -1.

ljust:width

Left-align the value given a width.

rjust:width

Right-align the value given a width.

trunc:width

Truncate value to a given width.

lower

Convert the value into lowercase.

upper

Convert the value into uppercase.

show:\<dictionary\>

Substitutes the result of invoking the default display function for the
parameter. The dictionary can be used for introducing own variables that
can be accessed in the same manner as builtin variables. The user
defined variables overrides builtin variables. The dictionary is
specified as a string on the following form:

(key=value)(:key=value)\*

For example, with the following expression:

\$(foo\|show:myvar1=true:myvar2=Interface)

the user defined variables can be accessed like this:

\$(.myvar1!=true?Address) \$(.myvar2)

A special case is the dict variable 'indent'. It controls the
indentation level of the displayed path. The current indent level can be
incremented and decremented using =+ and =-.

For example:

\$(foobar\|show:indent=+2) \$(foobar\|show:indent=-1)
\$(foobar\|show:indent=10)

Another special case is he dict variable 'noalign'. It may be used to
suppress the default aligning that may occur when displaying an element.

For example:

\$(foobar\|show:noalign)

dict:\<dictionary\>

Translates the value using the dictionary. Can for example be used for
displaying on/off instead of true/false. The dictionary is specified as
a string on the following form:

(key=value)(:key=value)\*

For example, with the following expression:

\$(foo\|dict:true=on:false=off)

if the leaf 'foo' has value 'true', it is displayed as 'on', and if its
value is 'false' it is displayed as 'off'.

<div class="informalexample">

     Nested invocations are allowed, ie it is possible to have expressions
     like $($(state|dict:yes=Yes:no=No)|rjust:14), or $(/foo{$(../bar)})

</div>

For example:

<div class="informalexample">

     list interface {
       key name;
       leaf name { ... }
       leaf status { ... }
       container line {
         leaf status { ... }
       }
       leaf mtu { ... }
       leaf bw { ... }
       leaf encapsulation { ... }
       leaf loopback { ... }
       tailf:cli-show-template
         '$(name) is administratively $(status),'
       + ' line protocol is $(line/status)\n'
       + 'MTU $(mtu) bytes, BW $(bw|humanreadable)bit, \n'
       + 'Encap $(encapsulation|upper), $(loopback?:loopback not set)\n';
     }

</div>

## See Also

The User Guide  
> 

`ncsc(1)`  
> NCS Yang compiler

`tailf_yang_extensions(5)`  
> Tail-f YANG extensions
