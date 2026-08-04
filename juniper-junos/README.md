# 1. Introduction
--------------------------------------------------------------------------------

This NED is an aggregation of several Juniper device-models/versions. The
current goal is that the NED should be compatible with all Juniper devices
running Junos 16 and later. Since a single yang-model can not contain structural
variations (e.g. where one version of a device-model has a leaf at one point in
the model-tree, and another has a container in the same place), and since there
might be structurally incompatible changes done (by Juniper) between Junos
versions, these can not be included in the NED. In effect this NED is an attempt
to be a greatest common super-set of the yang-models of all Juniper
devices/versions >= Junos 16.

For a background, and some pre-requisites when using this NED with juniper
devices, please read this article:

https://community.cisco.com/t5/nso-developer-hub-blogs/going-junos-native-with-nso/ba-p/3995765

Especially note that the netconf configuration must be set accordingly to allow
this "legacy" juniper-junos NED to work with the device (e.g. see setting
"rfc-compliant", which must NOT be enabled).

Note that in ncs_cli, even when in "juniper style" mode, it's not always the
same as on a Juniper device.

On a Juniper device there are a lot of shortcuts that are not available in the
ncs_cli. This is due to the fact that the ncs_cli is based on the data-model,
i.e. the XML representation of the Juniper configuration.

The most obvious example is that on a Juniper device you can skip the
"interface" list name when referring to an interface. So, for example in the
Juniper CLI you would:

    set interfaces ge-0/0/0 unit 0 family inet address 1.1.2.31/24

But in the ncs_cli you have to:

    set interfaces interface ge-0/0/0 unit 0 family inet address 1.1.2.31/24

In other cases the Juniper CLI hides structure, and it is not all that obvious
how to set something in NCS to achieve the same thing. Take for example:

    set system syslog file messages any info

Which in the ncs_cli has to be configured like so:

    set system syslog file messages contents any info

It is always possible to figure out how to configure something in NCS by
requesting the XML configuration on the Juniper device. On your Juniper device,
if you would have configured the above syslog, you can take a look at it like
this:

    show system syslog file messages | display xml ...  <file>
    <name>messages</name> <contents> <name>any</name> <info/> </contents> ...

Here the extra structure of <contents> is shown.

Note: in all examples above only the part inside the device config is shown,
i.e. like if you would have started with the below, which is the top of the
configuration tree in the Juniper yang-model:

    edit devices device <device-name> config junos:configuration

NOTE: Please consult the file src/JUNOS_INCOMPATS.txt for incompatible changes
made between junos versions which we have included support for (i.e. which can
be selectively included/excluded as needed through the re-compilation process
described in section 2).


# 2. Re-compiling for a specific Junos version range
--------------------------------------------------------------------------------

The reason for the NED being a "greatest common super-set" is that NSO (before
version 5) can only handle a single yang-model of each device-type, hence only
one juniper-junos NED can be loaded at one time, so to be able to connect to
several devices (of different type/version) the approach was to have a single
model, which is a "best-fit".

While this approach works great in most scenarios, it makes others impossible
(i.e. when an "incompatible" node/sub-tree is really needed, for all or specific
devices). However, in NSO 5.x the "common data model" feature makes it possible
to load several NEDs of same type, but different versions/yang-models in
parallel. Hence, the possibility to split the NED arises.

Also, for a particular scenario (before NSO 5.x), one might only have Juniper
devices with say Junos 17 and later, this means that incompatibilities with
versions before Junos 17 doesn't need to be considered.

This implies the need to re-compile/package the NED to fit a specific range of
Junos versions. Therefore the possiblity to "carve" out the correct yang-model
for specific ranges of Junos versions was introduced. This feature has two
use-cases. For NSO version before 5.x, one can create a custom juniper-junos to
best fit the scenario at hand (i.e. for a given range of Junos version(s) in
use). With NSO 5.x and later, this is exended to the possiblity to create
several juniper-junos NEDs to be used in parallel for different sub-sets of
devices in use.

As stated previously, the NED as shipped is compiled to work for Junos 16 and
later. To re-compile the NED for a specific range, open a shell, source the
'ncscrc' file from the NSO distribution in use. In the directory src/ in the
juniper-junos package one needs to run make with the target 'all', using
specific make variables. The only pre-requisite is that python (v2 or 3) is
available.

Dependencies for NED recompile:

  ```
  - Apache Ant
  - Bash
  - Gnu Sed
  - Gnu Sort
  - Gnu awk
  - Grep
  - Python3 (with packages: re, sys, getopt, subprocess, argparse, os, glob)
  ```

For example, to create a juniper-junos for Junos 17 and later, do:

  ```
  make JUNOS_MIN_VER=17 clean all
  ```

The general form is:

  ```
  make JUNOS_MIN_VER=<min-ver> JUNOS_MAX_VER=<max-ver> clean all
  ```

If not given, the min/max is 16 and 99. Note, the given range is "inclusive",
meaning:

 JUNOS_MIN_VER <= DESIRED_JUNOS_RANGE <= JUNOS_MAX_VER

So, for example, to filter out all "modern" incompatibilities (most introduced in
Junos 14 and later, compared to pre-junos 14) introduced by Juniper, to run on
older devices, in src/, do:

  ```
  make JUNOS_MIN_VER=10 JUNOS_MAX_VER=13 clean all
  ```

In NSO 5.x and later, since several NEDs may be loaded in parallel, these needs
to be identified by unique ned-ids. To re-compile the juniper-junos NED to be
used in multiple instances in parallel within the same NSO process, one need to
give a suffix which will be appended to the ned-id generated by NSO. To do this,
the make variable JUNOS_NEDID_SUFFIX is used. To re-compile the above example,
for Junos 17 and later, to be used in parallel with some other re-compilation,
or the standard NED, do:

  ```
  make JUNOS_MIN_VER=17 JUNOS_NEDID_SUFFIX=17 clean all
  ```

This will create a NED with the ned-id: juniper-junos17-nc-4.3

NOTE: This only applies to NSO 5.x and later. Also note that the default general
form of the ned-id of the NED is 'juniper-junos-nc-<major>.<minor>' (i.e. the
above mentioned "suffix" is appended directly after the original "juniper-junos"
identifier.

There are exceptions to the strict min/max junos version rules. Seemingly there
are places where the version is not the only factor deciding which structure is
used. One such place is /configuration/system/ntp/source-address, this node can
be either a list or a single leaf. By default this node is a list for junos
version 14 and higher, however if your device represents this node as a single
leaf, you can use the make variable FORCE_NTP_SINGLE_SRC_ADDR to force it into
being represented as a leaf, recompiling the NED (setting a suffix as described
above if needed):

  ```
  make FORCE_NTP_SINGLE_SRC_ADDR=True clean all
  ```

If you have the inverse situation to the above, i.e. your device has junos
version < 14, but the structure of source-address is still a list, you can
forcibly use that structure by doing:

  ```
  make FORCE_NTP_MULTI_SRC_ADDR=True clean all
  ```
Another behavioral quirk is that the auto-negotiation and
flow-control ether options can't be toggled in a single transaction,
semantically the empty leaf nodes used to configure these options
behaves as if present within a yang choice, this was not the case in
earlier versions of the NED (before v4.6.35). In version 4.6.36 this
was changed so that auto-negotiation and flow-control are enclosed in
choices to model the behaviour of the device. If this behaviour is not
desired for some reason, the NED needs to be recompile with the
variable FORCE_ETHER_OPTS_NO_CHOICE set like this:

  ```
  make FORCE_ETHER_OPTS_NO_CHOICE=True clean all
  ```


# 3. Running arbitrary CLI commands on device
--------------------------------------------------------------------------------

A very convenient RPC present on most junos devices is
'request-shell-execute'. With this RPC, one can execute shell commands (i.e. in
the unix shell on the juniper device). However, since the command 'cli' can also
be executed, any junos cli command can be executed. Since all arguments to the
command 'cli' are passed to the junos cli, note, pipe-character needs to be
escaped with a preceding backslash to avoid interpretation by juniper
unix-shell. This means that RPCs not modeled in the NED can still be invoked
(including getting XML or JSON response, see below). It also means that cli
commands that are not even available as RPCs can be invoked. Example usages to
leverage this feature:

  Example invocation of cli command not available as netconf RPC:

  ```
  admin@ncs# devices device mx960-1 rpc rpc-request-shell-execute request-shell-execute command "cli show cli"
  ```

  Example invocation of cli command, not modeled, giving JSON output:

  ```
  admin@ncs# devices device mx960-1 rpc rpc-request-shell-execute request-shell-execute command "cli request unified-edge sgw call-trace show brief \\| display json"
  ```


# 4. Special handling for config of type 'unreadable' for keys and passwords
--------------------------------------------------------------------------------

In the junos yang model the string type 'unreadable' is used for many values
which contains keys and passwords. The semantic of these are that the user can
set a clear-text value but the value is then not returned back from the device
as clear-text but as a 'hash'. These values can pose a problem when used to
provision clear-text keys and passwords since there will immediately be a diff
when NSO compares the value (clear-text) with the value ('hashed') from the
device.

The standard way to handle this (in netconf in general), is to do a sync-from
after setting clear-text values, this will get NSO back in the state where the
stored value in CDB will be the same as the 'hashed' device-value.

However, in some situations it might be desirable to avoid the sync-from, but
still be able to provision clear-text keys and passwords. This can be achieved
by use of the make variable IGNORE_DIFF_IN_UNREADABLE. Setting this make
variable to True and recompiling the ned will cause all leaf nodes with type
'unreadable' in the model to have 'tailf:ned-ignore-compare-config'
enabled. This will make NSO disregard these nodes when calculating a diff, hence
not causing trouble.

  Example on how to rebuild with ignoring diff in 'unreadable' nodes:

  ```
  make IGNORE_DIFF_IN_UNREADABLE=True clean all
  ```

NOTE: When this feature is turned on, out-of-band changes of keys/passwords of
type 'unreadable' will still be detected with a 'check-sync' (i.e. showing
device is out of sync with NSO), however if this occurs, doing a
'compare-config' in NSO will not show a diff (i.e. since diffs are ignored for
these nodes).

There is also a compile-time feature to avoid storing these keys/passwords as
clear-text in CDB (i.e. keys and passwords in the device model), which is
similar to CLI NEDs with the NEDCOM_SECRET_TYPE available. To use this,
recompile the NED and set the variable NEDCOM_SECRET_TYPE to the desired
type. This yang-type will then be used for all nodes marked with the type
'unreadable'. Example of using the tailf type 'aes-cfb-128-encrypted-string':

  ```
  make NEDCOM_SECRET_TYPE="tailf:aes-cfb-128-encrypted-string" IGNORE_DIFF_IN_UNREADABLE=True clean all
  ```

This will change the yang type of all leaf nodes containing keys/passwords. When
NED is recompiled like this.

NOTE: The IGNORE_DIFF_IN_UNREADABLE=True must be used to avoid diff. It is also
worth noting that a sync-from will still replace the original clear-text set in
NSO with the device-hashed value.

See section 2 for more details on rebuilding the NED using different make
variables.


# 5. Forcing list prefix-list/prefix-list-items in grouping juniper-policy-options to be "ordered-by user"
--------------------------------------------------------------------------------

This list seems to potentially have different behaviour/semantics than declared
in the XSD. Also it doesn't seem to behave like an ordered list on some devices
but on others it does. So to force a new (non-backwards compatible) behaviour to
have this list sorted by user, set the compile time option
FORCE_ORDERED_PREFIX_LIST_ITEM like this:

  ```
  make FORCE_ORDERED_PREFIX_LIST_ITEM=True clean all
  ```


# 6. Forcing list /configuration/routing-options/static/route to be "ordered-by system"
---------------------------------------------------------------------------------------

Juniper introduced a change in Junos OS, where the `/configuration/routing-options/static/route`
list transitioned from `ordered-by user` to `ordered-by system`. This change took effect in
Junos OS version 22.4.

However, it's important to note that some **intermediate service releases** (e.g., 21.2R3-S8.5)
also adopted the `ordered-by system` behavior. This can lead to non-backward compatible behavior
for configurations that rely on the previous `ordered-by user` sorting.

To explicitly force the `ordered-by system` behavior for this list, regardless of the specific
Junos version or its intermediate releases, set the compile-time option
`FORCE_ORDERED_BY_SYSTEM_ROUTE` to `True` when building:

  ```
  make JUNOS_MIN_VER=<JUNOS_TWO_DIGIT_VERSION> FORCE_ORDERED_BY_SYSTEM_ROUTE=True clean all
  ```


# 7. Customizing yang model for specific schema paths at build time
--------------------------------------------------------------------------------

In some situations the yang-model doesn't fit the semantics and/or specific
needs of a certain use-case. For example, Juniper have modeled all
lists/leaf-lists to be 'ordered-by user' which in some cases doesn't make
sense. In NSO this might even cause trouble.

Another case might be when doing a PoC, one might need to quickly add some
node(s) into the schema for testing, but time is limited so a new NED release is
not an option.

While editing the original yang-model is doable in theory, in practice it's a
very daunting task. In these situations there is a special feature to
add/remove/replace yang-statements given only the schema-path to the node in
question.

Only limitation is that since this is done as a pre-processing directive, it
means that if a node pointed to in the schema is from within a grouping, all
schema-paths including that node (i.e. where the grouping is used) will get the
same change(s). This is usually not a problem, but worth mentioning to avoid
misunderstandings as to what can be achieved.

This feature is used by creating a file containing lines with directives
describing the intended changes. The format of the file is described below. The
Makefile will by default look for a file called customize-schema.schypp inside
the src directory. But if another name and/or location is preferred, it can be
given through the make variable CUSTOMIZE_SCHEMA, like this:

  ```
  make CUSTOMIZE_SCHEMA=/users/test/my-schema-customization.txt clean all
  ```

Each line in this file contains one directive, starting with one of the keywords
add, remove, or replace. This keyword is followed by the schema-path (no
prefixes needed) to the node to 'operate' on followed by '::' (i.e. two
colons). Depending on the type of operation in the directive, what comes after
the colons differ. The details for each type is as follows.

For adding yang-statement(s):

  ```
    add <schema-path>::<yang-stmt(s)>

    NOTE: The <yang-stmt(s)> must be on same line, no line-breaks. Statements
    are given exactly as they would appear, e.g. including ending
    semi-colon. When several yang-statements are provided, they must be enclosed
    in curly-braces.

    Examples:

    add /configuration/protocols/l2circuit/neighbor::uses apply-advanced;

    add /configuration/protocols/l2circuit/neighbor/interface::{ min-elements 1; max-elements 10; }
  ```

For removing yang-statement(s):

  ```
    remove <schema-path>::<stmt-match>

    NOTE: The <stmt-match> can be a single keyword, for example 'ordered-by',
    but it can also be more complex, even containing regular expressions
    (see the output of 'tools/turboy --plugin schypp --help' for details)

    Example:

    remove /configuration/routing-instances/instance/protocols/vpls/mesh-group/neighbor/vpls-id-list::ordered-by
  ```

For replacing a yang-statement:

  ```
    replace <schema-path>::<stmt-match>::<yang-stmt(s)>

    In this case the matching statement (must be unique match) is replaced by
    the given statement(s), same rules for <stmt-match> and <yang-stmt(s)> as
    for add/remove.
  ```


# 8. Disabling hack with transaction hook which expands vlan ranges
--------------------------------------------------------------------

By default there is a transaction hook attached to the below nodes, which
mitigates the non-standard juniper behaviour where vlan ranges are "compressed"
into a single range-string (much like in a CLI) even though the type of the yang
node is a leaf-list (e.g. adding vlans 100, 101, 102 will make the device reply
with a single entry 100-102 which is clearly wrong, but will cause NSO to see it
as a diff). To disable this transaction hook, set the compile time option
DISABLE_VLAN_RANGE_HOOK_CP like this:

  ```
  make DISABLE_VLAN_RANGE_HOOK_CP=True clean all
  ```

The nodes which currently has the transaction hook attached by default:

  (in grouping <ethernet-switching-type@76622>)
  /configuration/...
  /configuration/groups/...
  dynamic-profiles/interfaces/interface-range/unit/family/ethernet-switching/...
  dynamic-profiles/interfaces/interface/unit/family/ethernet-switching/...
  interfaces/interface-range/unit/family/ethernet-switching/...
  interfaces/interface/unit/family/ethernet-switching/...
  logical-systems/interfaces/interface/unit/family/ethernet-switching/...
          vlan/members

  (in grouping <interfaces-type@107438>)
  /configuration/dynamic-profiles/interfaces/interface/...
  /configuration/groups/dynamic-profiles/interfaces/interface/...
  /configuration/groups/interfaces/interface/...
  /configuration/interfaces/interface/...
      unit/vlan-tags/inner-list

  (in grouping <juniper-protocols-l2vpn@205105>)
  /configuration/groups/logical-systems/routing-instances/instance/protocols/...
  /configuration/groups/routing-instances/instance/protocols/...
  /configuration/logical-systems/routing-instances/instance/protocols/...
  /configuration/routing-instances/instance/protocols/...
      evpn/...
      l2vpn/...
      vpls/...
	      extended-vlan-list

  /configuration/dynamic-profiles/interfaces/interface/...
  /configuration/groups/dynamic-profiles/interfaces/interface/...
  /configuration/groups/interfaces/interface/...
  /configuration/interfaces/interface/...
      unit/vlan-id-list


# 9. Forcing rpc-get-interface-information 'alarm-not-present' leaf to have a value
------------------------------------------------------------------------------------
Path: /get-interface-information/interface-information/physical-interface/active-alarms/interface-alarms/alarm-not-present

Some Junos OS devices have the alarm-not-present leaf as empty, while others have the alarm-not-present
leaf with the value none. By default, the `alarm-not-present` leaf type is empty. To force this leaf to have
a value, set the compile-time option `FORCE_ALARM_NOT_PRESENT_WITH_VALUE` to `True` when building:


  ```
  make FORCE_ALARM_NOT_PRESENT_WITH_VALUE=True clean all
  ```


# 10. Migrating from juniper-junos to the juniper-junos_nc generic NED
---------------------------------------------------------------------

NSO has supported Junos devices from early on. The legacy juniper-junos NED is NETCONF-based, but as Junos devices did not provide YANG modules in the past, complex NSO machinery translated Juniper's XML Schema Description (XSD) files into a single YANG module. This was an attempt to aggregate several Juniper device modules/versions.

Juniper nowadays provides YANG modules for Junos devices. Junos YANG modules can be downloaded from the device and used directly in NSO with the new juniper-junos_nc generic NED.

By downloading the YANG modules using juniper-junos_nc NED tools and rebuilding the NED, the NED can provide full coverage immediately when the device is updated instead of waiting for a new legacy NED release.

The guide in below link describes how to replace the legacy juniper-junos NED and migrate NSO applications to the juniper-junos_nc generic NED.

Junos NED Migration Guide: https://cisco-tailf.gitbook.io/nso-docs/development/advanced-development/developing-neds#migrating-to-the-juniper-junos_nc-ned

