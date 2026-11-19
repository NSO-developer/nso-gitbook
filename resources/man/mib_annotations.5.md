# mib_annotations Man Page

`mib_annotations` - MIB annotations file format

## Description

This manual page describes the syntax and semantics used to write MIB
annotations. A MIB annotation file is used to modify the behavior of
certain MIB objects without having to edit the original MIB file.

MIB annotations are separate file with a .miba suffix, and is applied to
a MIB when a YANG module is generated and when the MIB is compiled. See
[ncsc(1)](ncsc.1.md).

## Syntax

Each line in a MIB annotation file has the following syntax:

<div class="informalexample">

    <MIB Object Name> <modifier> [= <value>]
        

</div>

where `modifier` is one of `max_access`, `display_hint`, `behavior`,
`unique`, or `operational`.

Blank lines are ignored, and lines starting with \# are treated as
comments and ignored.

If `modifier` is `max_access`, `value` must be one of `not_accessible`
or `read_only`.

If `modifier` is `display_hint`, `value` must be a valid DISPLAY-HINT
value. The display hint is used to determine if a string object should
be treated as text or binary data.

If `modifier` is `behavior`, `value` must be one of `noSuchObject` or
`noSuchInstance`. When a YANG module is generated from a MIB, objects
with a specified behavior are not converted to YANG. When the SNMP agent
responds to SNMP requests for such an object, the corresponding error
code is used.

If `modifier` is `unique`, `value` must be a valid YANG "unique"
expression, i.e., a space-separated list of column names. This modifier
must be given on table entries.

If `modifier` is `operational`, there must not be any `value` given. A
writable object marked as `operational` will be translated into a
non-configuration YANG node, marked with a `tailf:writable true`
statement, indicating that the object represents writable operational
data.

If `modifier` is `sort-priority`, `value` must be a 32 bit integer. The
object will be generated with a `tailf:sort-priority` statement. See
[tailf_yang_extensions(5)](tailf_yang_extensions.5.md).

If `modifier` is `ned-modification-dependent`, there must not by any
`value` given. The object will be generated with a
`tailf:snmp-ned-modification-dependent` statement. See
[tailf_yang_extensions(5)](tailf_yang_extensions.5.md).

If `modifier` is `ned-set-before-row-modification`, `value` is a valid
value for the column. The object will be generated with a
`tailf:snmp-ned-set-before-row-modification` statement. See
[tailf_yang_extensions(5)](tailf_yang_extensions.5.md).

If `modifier` is `ned-accessible-column`, `value` refers to a column by
name or subid (integer). The object will be generated with a
`tailf:snmp-ned-accessible-column` statement. See
[tailf_yang_extensions(5)](tailf_yang_extensions.5.md).

If `modifier` is `ned-delete-before-create`, there must not by any
`value` given. The object will be generated with a
`tailf:snmp-ned-delete-before-create` statement. See
[tailf_yang_extensions(5)](tailf_yang_extensions.5.md).

If `modifier` is `ned-recreate-when-modified`, there must not by any
`value` given. The object will be generated with a
`tailf:snmp-ned-recreate-when-modified` statement. See
[tailf_yang_extensions(5)](tailf_yang_extensions.5.md).

## Example

An example of a MIB annotation file.

<div class="informalexample">

    # the following object does not have value
    ifStackLastChange behavior = noSuchInstance

    # this deprecated table is not implemented
    ifTestTable behavior = noSuchObject
          

</div>

## See Also

The NSO User Guide  
> 
