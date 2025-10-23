# clispec Man Page

`clispec` - CLI specification file format

## Description

This manual page describes the syntax and semantics of a NSO CLI
specification file (from now on called "clispec"). A clispec is an XML
configuration file describing commands to be added to the automatically
rendered Juniper and Cisco style NSO CLI. It also makes it possible to
modify the behavior of standard/built-in commands, using move/delete
operations and customizable confirmation prompts. In Cisco style custom
mode-specific commands can be added by specifying a mount point relating
to the specified mode.

<div class="tip">

In the NSO distribution there is an Emacs mode suitable for clispec
editing.

</div>

A clispec file (with a .cli suffix) is to be compiled using the `ncsc`
compiler into an internal representation (with a .ccl suffix), ready to
be loaded by the NSO daemon on startup. Like this:

        $ ncsc -c commands.cli
        $ ls commands.ccl
        commands.ccl
      

The .ccl file should be put in the NSO daemon loadPath as described in
[ncs.conf(5)](ncs.conf.5.md) When the NSO daemon is started the
clispec is loaded accordingly.

The NSO daemon loads all .ccl files it finds on startup. Ie, you can
have one or more clispec files for Cisco XR (C) style CLI emulation, one
or more for Cisco IOS (I), and one or more for Juniper (J) style
emulation. If you drop several .ccl files in the loadPath all will be
loaded. The standard commands are defined in ncs.cli (available in the
NSO distribution). The intention is that we use ncs.cli as a starting
point, i.e. first we delete, reorder and replace built-in commands (if
needed) and we then proceed to add our own custom commands.

## Example

The ncs-light.cli example is a light version of the standard ncs.cli. It
adds one operational mode command and one configure mode command,
implemented by two OS executables, it also removes the 'save' command
from the pipe commands.

    <clispec xmlns="http://tail-f.com/ns/clispec/1.0" style="j">
      <operationalMode>
        <modifications>
          <delete src="file"/>
          <confirmText src="quit">
            Are you really sure you want to quit?
          </confirmText>
          <help src="configure private">Edit a private copy of the configuration</help>
          <info src="configure private">Edit a private copy of the configuration</info>
        </modifications>

        <cmd name="copy" mount="file">
          <info>Copy a file</info>
          <help>Copy a file in the file system.</help>
          <callback>
            <exec>
              <osCommand>cp</osCommand>
              <options>
                <uid>confd</uid>
              </options>
            </exec>
          </callback>
          <params>
            <param>
              <type><file/></type>
              <info>&lt;source file&gt;</info>
            </param>
            <param>
              <type><file/></type>
              <info>&lt;destination&gt;</info>
            </param>
          </params>
        </cmd>
      </operationalMode>

      <configureMode>
        <cmd name="adduser" mount="wizard">
          <info>Create a user</info>
          <help>Create a user and assign him/her to a group.</help>
          <callback>
            <exec>
              <osCommand>adduser.sh</osCommand>
            </exec>
          </callback>
        </cmd>
      </configureMode>

      <pipeCmds>
        <modifications>
          <delete src="save"/>
        </modifications>
      </pipeCmds>
    </clispec>
          

ncs-light.cli achieves the following:

- Adds a confirmation prompt to the standard operation "delete" command.

- Deletes the standard "file" command.

- Adds the operational mode command "copy" and mounts it under the
  standard "file" command.

- The "copy" command is implemented using the OS executable
  "/usr/bin/cp".

- The executable is called with parameters as defined by the "params"
  element.

- The executable runs as the same user id as NSO as defined by the "uid"
  element.

- Adds the configure command "adduser" and mounts it under the standard
  "wizard" command.

Below we present the gory details when it comes to constructs in a
clispec.

## Elements And Attributes

This section lists all clispec elements and their attributes including
their type (within parentheses) and default values (within square
brackets). Elements are written using a path notation to make it easier
to see how they relate to each other.

*Note:* \$MODE is either "operationalMode", "configureMode" or
"pipeCmds".

### `/clispec`

This is the top level element which contains (in order) zero or more
"operationalMode" elements, zero or more "configureMode" element, and
zero or more "pipeCmds" elements.

### `/clispec/$MODE`

The \$MODE ("operationalMode", "configureMode", or "pipeCmds") element
contains (in order) zero or one "modifications" elements, zero or more
"start" elements, zero or more "show" elements, and zero or more "cmd"
elements.

The "show" elements are only used in the C-style CLI.

It has a name attribute which is used to create a named custom mode. A
custom command can be defined for entering custom modes. See the
cmd/callback/mode elements below.

### `/clispec/$MODE/modifications`

The "modifications" element describes which operations to apply to the
built-in commands. It contains (in any order) zero or more "delete",
"move", "paginate", "info", "paraminfo", "help", "paramhelp",
"confirmText", "defaultConfirmOption", "dropElem", "compactElem",
"compactStatsElem", "columnStats", "multiValue", "columnWidth",
"minColumnWidth", "columnAlign", "defaultColumnAlign",
"noKeyCompletion", "noMatchCompletion", "modeName", "suppressMode",
"suppressTable", "enforceTable", "showTemplate", "showTemplateLegend",
"showTemplateEnter", "showTemplateFooter", "runTemplate",
"runTemplateLegend", "runTemplateEnter", "runTemplateFooter", "addMode",
"autocommitDelay", "keymap", "pipeFlags", "addPipeFlags",
"negPipeFlags", "legend", "footer", "suppressKeyAbbrev",
"allowKeyAbbrev", "hasRange", "suppressRange", "allowWildcard",
"suppressWildcard", "suppressValidationWarningPrompt",
"displayEmptyConfig", "displayWhen", "customRange", "completion",
"suppressKeySort" and "simpleType" elements.

### `/clispec/$MODE/modifications/paginate`

The "paginate" element can be used to change the default paginate
behavior for a built-in command.

Attributes:

*path* (cmdpathType)  
> The "path" attribute is mandatory. It specifies which command to
> change. cmdpathType is a space-separated list of commands, pointing
> out a specific sub-command.

*value* (true\|false)  
> The "value" attribute is mandatory. It specifies whether the paginate
> attribute should be enabled or disabled by default.

### `/clispec/$MODE/modifications/displayWhen`

The "displayWhen" element can be used to add a displayWhen xpath
condition to a command.

Attributes:

*path* (cmdpathType)  
> The "path" attribute is mandatory. It specifies which command to
> change. cmdpathType is a space-separated list of commands, pointing
> out a specific sub-command.

*expr* (xpath expression)  
> The "expr" attribute is mandatory. It specifies an xpath expression.
> If the expression evaluates to true then the command is available,
> otherwise not.

*ctx* (path)  
> The "ctx" attribute is optional. If not specified the current
> editpath/mode-path is used as context node for the xpath evaluation.
> Note that the xpath expression will automatically evaluate to false if
> a display when expression is used for a top-level command and no ctx
> is specified. The path may contain variables defined in the dict.

### `/clispec/$MODE/modifications/move`

The "move" element can be used to move (rename) a built-in command.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to move.
> cmdpathType is a space-separated list of commands, pointing out a
> specific sub-command.

*dest* (cmdpathType)  
> The "dest" attribute is mandatory. It specifies where to move the
> command specified by the "src" attribute. cmdpathType is a
> space-separated list of commands, pointing out a specific sub-command.

*inclSubCmds* (xs:boolean)  
> The "inclSubCmds" attribute is optional. If specified and set to true
> then all commands to which the 'src' command is a prefix command will
> be included in the move operation.
>
> An example:
>
>             <configureMode>
>               <modifications>
>                 <move src="load" dest="xload" inclSubCmds="true"/>
>               </modifications>
>             </configureMode>
>             
>
> would in the C-style CLI move 'load', 'load merge', 'load override'
> and 'load replace' to 'xload', 'xload merge', 'xload override' and
> 'xload replace', respectively.

### `/clispec/$MODE/modifications/copy`

The "copy" element can be used to copy a built-in command.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to copy.
> cmdpathType is a space-separated list of commands, pointing out a
> specific sub-command.

*dest* (cmdpathType)  
> The "dest" attribute is mandatory. It specifies where to copy the
> command specified by the "src" attribute. cmdpathType is a
> space-separated list of commands, pointing out a specific sub-command.

*inclSubCmds* (xs:boolean)  
> The "inclSubCmds" attribute is optional. If specified and set to true
> then all commands to which the 'src' command is a prefix command will
> be included in the copy operation.
>
> An example:
>
>             <configureMode>
>               <modifications>
>                 <copy src="load" dest="xload" inclSubCmds="true"/>
>               </modifications>
>             </configureMode>
>             
>
> would in the C-style CLI copy 'load', 'load merge', 'load override'
> and 'load replace' to 'xload', 'xload merge', 'xload override' and
> 'xload replace', respectively.

### `/clispec/$MODE/modifications/delete`

The "delete" element makes it possible to delete a built-in command.
Note that commands that are auto-rendered from the data model cannot be
removed using this modification. To remove an auto-rendered command use
the 'tailf:hidden' element in the data model.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to
> delete. cmdpathType is a space-separated list of commands, pointing
> out a specific sub-command.

### `/clispec/$MODE/modifications/pipeFlags`

The "pipeFlags" element makes it possible to modify the pipe flags of
the builtin commands. The argument is a space separated list of pipe
flags. It will replace the builtin list.

The "pipeFlags" will be inherited by pipe commands attached to a builtin
command.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to
> modify. cmdpathType is a space-separated list of commands, pointing
> out a specific sub-command.

### `/clispec/$MODE/modifications/addPipeFlags`

The "addPipeFlags" element makes it possible to add pipe flags to the
existing list of pipe flags for a builtin command. The argument is a
space separated list of pipe flags.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to
> modify. cmdpathType is a space-separated list of commands, pointing
> out a specific sub-command.

### `/clispec/$MODE/modifications/negPipeFlags`

The "negPipeFlags" element makes it possible to modify the neg pipe
flags of the builtin commands. The argument is a space separated list of
neg pipe flags. It will replace the builtin list.

Read how these flags works in /clispec/\$MODE/cmd/options/negPipeFlags

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to
> modify. cmdpathType is a space-separated list of commands, pointing
> out a specific sub-command.

### `/clispec/$MODE/modifications/columnWidth`

The "columnWidth" element can be used to set fixed widths for specific
columns in auto-rendered tables.

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies which path to set the
> column width for. pathType is a space-separated list of node names,
> pointing out a specific data model node.

*width* (xs:positiveInteger)  
> The "width" attribute is mandatory. It specified a fixed column width.

Note that the tailf:cli-column-width YANG extension can be used to the
same effect directly in YANG file.

### `/clispec/$MODE/modifications/minColumnWidth`

The "minColumnWidth" element can be used to set minimum widths for
specific columns in auto-rendered tables.

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies which path to set the
> minimum column width for. pathType is a space-separated list of node
> names, pointing out a specific data model node.

*minWidth* (xs:positiveInteger)  
> The "minWidth" attribute is mandatory. It specified a minimum column
> width.

Note that the tailf:cli-min-column-width YANG extension can be used to
the same effect directly in YANG file.

### `/clispec/$MODE/modifications/columnAlign`

The "columnAlign" element can be used to specify the alignment of the
data in specific columns in auto-rendered tables.

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies which path to set the
> column alignment for. pathType is a space-separated list of node
> names, pointing out a specific data model node.

*align* (left\|right\|center)  
> The "align" attribute is mandatory.

Note that the tailf:cli-column-align YANG extension can be used to the
same effect directly in YANG file.

### `/clispec/$MODE/modifications/defaultColumnAlign`

The "defaultColumnAlign" element can be used to specify a default
alignment of a simpletype when used in auto-rendered tables.

Attributes:

*namespace* (xs:string)  
> The "namespace" attribute is required. It specifies in which namespace
> the type is found. It can be either the namespace URI or the namespace
> prefix.

*name* (xs:string)  
> The "name" attribute is required. It specifies the name of the type in
> the given namespace.

*align* (left\|right\|center)  
> The "align" attribute is mandatory.

### `/clispec/$MODE/modifications/multiLinePrompt`

The "multiLinePrompt" element can be used to specify that the CLI should
automatically enter multi-line prompt mode when prompting for values of
the given type.

Attributes:

*namespace* (xs:string)  
> The "namespace" attribute is required. It specifies in which namespace
> the type is found. It can be either the namespace URI or the namespace
> prefix.

*name* (xs:string)  
> The "name" attribute is required. It specifies the name of the type in
> the given namespace.

### `/clispec/$MODE/modifications/runTemplate`

The "run" element is used for specifying a template to use by the "show
running-config" command in the C- and I-style CLIs. The syntax is the
same as for the showTemplate above. The template is only used if it is
associated with a leaf element. Containers and lists cannot have
runTemplates.

Note that extreme care must be taken when using this feature if the
result should be paste:able into the CLI again.

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies on which path to apply
> the show running-config template. pathType is a space-separated list
> of elements, pointing out a specific container element.

Note that the tailf:cli-run-template YANG extension can be used to the
same effect directly in YANG file.

### `/clispec/$MODE/modifications/runTemplateLegend`

The "runTemplateLegend" element is used for specifying a template to use
by the show running-config command in the C- and I-style CLIs when
displaying a set of list nodes as a legend.

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies on which path to apply
> the show running-config template. pathType is a space-separated list
> of elements, pointing out a specific container element.

Note that the tailf:cli-run-template-legend YANG extension can be used
to the same effect directly in YANG file.

### `/clispec/$MODE/modifications/runTemplateEnter`

The "runTemplateEnter" element is used for specifying a template to use
by the show running-config command in the C- and I-style CLIs when
displaying a set of list element nodes before displaying each instance.

In addition to the builtin variables in ordinary templates there are two
additional variables available: .prefix_str and .key_str.

*.prefix_str*  
> The *.prefix_str* variable contains the text displayed before the key
> values when auto-rendering an enter text.

*.key_str*  
> The *.key_str* variable contains the keys as a text

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies on which path to apply
> the show running-config template. pathType is a space-separated list
> of elements, pointing out a specific container element.

Note that the tailf:cli-run-template-enter YANG extension can be used to
the same effect directly in YANG file.

### `/clispec/$MODE/modifications/runTemplateFooter`

The "runTemplateFooter" element is used for specifying a template to use
by the show running-config command in the C- and I-style CLIs after a
set of list nodes has been displayed as a table.

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies on which path to apply
> the show running-config template. pathType is a space-separated list
> of elements, pointing out a specific container element.

Note that the tailf:cli-run-template-footer YANG extension can be used
to the same effect directly in YANG file.

### `/clispec/$MODE/modifications/hasRange`

The "hasRange" element is used for specifying that a given non-integer
key element should allow range expressions

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies on which path to allow
> range expressions. pathType is a space-separated list of elements,
> pointing out a specific list element.

Note that the tailf:cli-allow-range YANG extension can be used to the
same effect directly in YANG file.

### `/clispec/$MODE/modifications/suppressRange`

The "suppressRange" element is used for specifying that a given integer
key element should not allow range expressions

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies on which path to
> suppress range expressions. pathType is a space-separated list of
> elements, pointing out a specific list element.

Note that the tailf:cli-suppress-range YANG extension can be used to the
same effect directly in YANG file.

### `/clispec/$MODE/modifications/customRange`

The "customRange" element is used for specifying that a given list
element should support ranges. A type matching the range expression must
be supplied, as well as a callback to use to determine if a given
instance is covered by a given range expression. It contains one or more
"rangeType" elements and one "callback" element.

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies on which path to apply
> the custom range. pathType is a space-separated list of elements,
> pointing out a specific list element.

Note that the tailf:cli-custom-range YANG extension can be used to the
same effect directly in YANG file.

### `/clispec/$MODE/modifications/customRange/callback`

The "callback" element is used for specifying which callback to invoke
for checking if a list element instance belongs to a range. It contains
a "capi" element.

Note that the tailf:cli-custom-range-actionpoint YANG extension can be
used to the same effect directly in YANG file.

### `/clispec/$MODE/modifications/customRange/callback/capi`

The "capi" element is used for specifying the name of the callback to
invoke for checking if a list element instance belongs to a range.

Attributes:

*id* (string)  
> The "id" attribute is optional. It specifies a string which is passed
> to the callback when invoked to check if a value belongs in a range.
> This makes it possible to use the same callback at several locations
> and still keep track of which point it is invoked from.

### `/clispec/$MODE/modifications/customRange/rangeType`

The "rangeType" element is used for specifying which key element of a
list element should support range expressions. It is also used for
specifying a matching type. All range expressions must belong to the
specified type, and a valid key element must not be a valid element of
this type.

Attributes:

*key* (string)  
> The "key" attribute is mandatory. It specifies which key element of
> the list that the rangeType applies to.

*namespace* (string)  
> The "namespace" attribute is mandatory. It specifies which namespace
> the type belongs to.

*name* (string)  
> The "name" attribute is mandatory. It specifies the name of the range
> type.

Note that the tailf:cli-range-type YANG extension can be used to the
same effect directly in YANG file.

### `/clispec/$MODE/modifications/allowWildcard`

The "allowWildcard" element is used for specifying that a given list
element should allow wildcard expressions in the show pattern

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies on which path to allow
> wildcard expressions. pathType is a space-separated list of elements,
> pointing out a specific list element.

Note that the tailf:cli-allow-wildcard YANG extension can be used to the
same effect directly in YANG file.

### `/clispec/$MODE/modifications/suppressWildcard`

The "suppressWildcard" element is used for specifying that a given list
element should not allow wildcard expressions in the show pattern

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies on which path to
> suppress wildcard expressions. pathType is a space-separated list of
> elements, pointing out a specific list element.

Note that the tailf:cli-suppress-wildcard YANG extension can be used to
the same effect directly in YANG file.

### `/clispec/$MODE/modifications/suppressValidationWarningPrompt`

The "suppressValidationWarningPrompt" element is used for specifying
that for a given path a validate warning should not result in a prompt
to the user. The warning is displayed but without blocking the commit
operation.

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies on which path to
> suppress the validation warning prompt. pathType is a space-separated
> list of elements, pointing out a specific list element.

Note that the tailf:cli-suppress-validate-warning-prompt YANG extension
can be used to the same effect directly in YANG file.

### `/clispec/$MODE/modifications/errorMessageRewrite`

The "errorMessageRewrite" element is used for specifying that a callback
should be invoked for possibly rewriting error messages before
displaying them.

### `/clispec/$MODE/modifications/errorMessageRewrite/callback`

The "callback" element is used for specifying which callback to invoke
for rewriting a message. It contains a "capi" element.

### `/clispec/$MODE/modifications/errorMessageRewrite/callback/capi`

The "capi" element is used for specifying the name of the callback to
invoke for rewriting a message.

### `/clispec/$MODE/modifications/showPathRewrite`

The "showPathRewrite" element is used for specifying that a callback
should be invoked for possibly rewriting the show path before executing
a show command. The callback is invoked by the builtin show command.

### `/clispec/$MODE/modifications/showPathRewrite/callback`

The "callback" element is used for specifying which callback to invoke
for rewriting the show path. It contains a "capi" element.

### `/clispec/$MODE/modifications/showPathRewrite/callback/capi`

The "capi" element is used for specifying the name of the callback to
invoke for rewriting the show path.

### `/clispec/$MODE/modifications/noKeyCompletion`

The "noKeyCompletion" element tells the CLI to not perform completion
for key elements for a given path. This is to avoid querying the data
provider for all existing keys.

Attributes:

*src* (pathType)  
> The "src" attribute is mandatory. It specifies which path to make not
> do completion for. pathType is a space-separated list of elements,
> pointing out a specific list element.

Note that the tailf:cli-no-key-completion extension can be used to the
same effect directly in YANG file.

### `/clispec/$MODE/modifications/noMatchCompletion`

The "noMatchCompletion" element tells the CLI to not provide match
completion for a given element path for show commands.

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies which path to make not
> do match completion for. pathType is a space-separated list of
> elements, pointing out a specific list element.

Note that the tailf:cli-no-match-completion YANG extension can be used
to the same effect directly in YANG file.

### `/clispec/$MODE/modifications/suppressShowMatch`

The "suppressShowMatch" element makes it possible to specify that a
specific completion match (ie a filter match that appear at list element
nodes as an alternative to specifying a single instance) to the show
command should not be available.

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies which path to
> suppress. pathType is a space-separated list of elements, pointing out
> a specific list element.

Note that the tailf:cli-suppress-show-match YANG extension can be used
to the same effect directly in YANG file.

### `/clispec/$MODE/modifications/enforceTable`

The "enforceTable" element makes it possible to force the generation of
a table for a list element node regardless of whether the table will be
too wide or not. This applies to the tables generated by the
auto-rendered show commands for config="false" data in the C- and I-
style CLIs.

Attributes:

*src* (pathType)  
> The "src" attribute is mandatory. It specifies which path to enforce.
> pathType is a space-separated list of elements, pointing out a
> specific list element.

Note that the tailf:cli-enforce-table YANG extension can be used to the
same effect directly in YANG file.

### `/clispec/$MODE/modifications/preformatted`

The "preformatted" element makes it possible to suppress quoting of
stats elements when displaying them. Newlines will be preserved in
strings etc

Attributes:

*src* (pathType)  
> The "src" attribute is mandatory. It specifies which path to consider
> preformatted. pathType is a space-separated list of elements, pointing
> out a specific list element.

Note that the tailf:cli-preformatted YANG extension can be used to the
same effect directly in YANG file.

### `/clispec/$MODE/modifications/exposeKeyName`

The "exposeKeyName" element makes it possible to force the C- and
I-style CLIs to expose the key name to the CLI user. The user will be
required to enter the name of the key and the key name will be displayed
when showing the configuration.

Note that "exposeKeyName" element has no effect on a list key which is
type empty or a union of type empty. It is because the name of the key
is already required to enter and is displayed when showing the
configuration.

Attributes:

*path* (pathType)  
> The "src" attribute is mandatory. It specifies which leaf to expose.
> pathType is a space-separated list of elements, pointing out a
> specific list key element.

Note that the tailf:cli-expose-key-name YANG extension can be used to
the same effect directly in YANG file.

### `/clispec/$MODE/modifications/displayEmptyConfig`

The "displayEmptyConfig" element makes it possible to tell confd to
display empty configuration list elements when displaying stats data in
J-style CLI, provided that the list element has at least one optional
config="false" element.

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies which path to apply
> the mod to. pathType is a space-separated list of elements, pointing
> out a specific list element.

Note that the tailf:cli-display-empty-config YANG extension can be used
to the same effect directly in YANG file.

### `/clispec/$MODE/modifications/suppressKeyAbbrev`

The "suppressKeyAbbrev" element makes it possible to suppress the use of
abbreviations for specific key elements.

Attributes:

*src* (pathType)  
> The "src" attribute is mandatory. It specifies which path to suppress.
> pathType is a space-separated list of elements, pointing out a
> specific list element.

Note that the tailf:cli-suppress-key-abbreviation YANG extension can be
used to the same effect directly in YANG file.

### `/clispec/$MODE/modifications/allowKeyAbbrev`

The "allowKeyAbbrev" element makes it possible to allow the use of
abbreviations for specific key elements.

Attributes:

*src* (pathType)  
> The "src" attribute is mandatory. It specifies which path to suppress.
> pathType is a space-separated list of elements, pointing out a
> specific list element.

Note that the tailf:allow-key-abbreviation YANG extension can be used to
the same effect directly in YANG file.

### `/clispec/$MODE/modifications/modeName/fixed (xs:string)`

Specifies a fixed mode name.

Note that the tailf:cli-mode-name YANG extension can be used to the same
effect directly in YANG file.

### `/clispec/$MODE/modifications/modeName/capi`

Specifies that the mode name should be calculated through a callback
function. It contains exactly one "cmdpoint" element.

Note that the tailf:cli-mode-name-actionpoint YANG extension can be used
to the same effect directly in YANG file.

### `/clispec/$MODE/modifications/modeName/capi/cmdpoint (xs:string)`

Specifies the callpoint name of the mode name function.

### `/clispec/$MODE/modifications/autocommitDelay`

The "autocommitDelay" element makes it possible to enable transactions
while in a specific submode (or submode of that mode). The modifications
performed in that mode will not take effect until the user exits that
submode.

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies which path to delay
> autocommit for. pathType is a space-separated list of elements,
> pointing out a specific non-list, non-leaf element.

Note that the tailf:cli-delayed-auto-commit YANG extension can be used
to the same effect directly in YANG file.

### `/clispec/$MODE/modifications/suppressKeySort`

The "suppressKeySort" element makes it possible to suppress sorting of
key-values in the completion list. Instead the values will be displayed
in the same order as they are provided by the data-provider (external or
CDB).

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies which path to not
> sort. pathType is a space-separated list of elements, pointing out a
> specific list element.

Note that the tailf:cli-suppress-key-sort YANG extension can be used to
the same effect directly in YANG file.

### `/clispec/$MODE/modifications/legend` (xs:string)

The "legend" element makes it possible to add a custom legend to be
displayed when before printing a table. The legend is specified as a
template string.

Attributes:

*path* (cmdpathType)  
> The "path" attribute is mandatory. It specifies for which path the
> legend should be printed. cmdpathType is a space-separated list of
> commands.

Note that the tailf:cli-legend YANG extension can be used to the same
effect directly in YANG file.

### `/clispec/$MODE/modifications/footer` (xs:string)

The "footer" element makes it possible to specify a template that will
be displayed after printing a table.

Attributes:

*path* (cmdpathType)  
> The "path" attribute is mandatory. It specifies for which path the
> footer should be printed. cmdpathType is a space-separated list of
> commands.

Note that the tailf:cli-footer YANG extension can be used to the same
effect directly in YANG file.

### `/clispec/$MODE/modifications/help` (xs:string)

The "help" element makes it possible to add a custom help text to the
specified built-in command.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to add
> the text to. cmdpathType is a space-separated list of commands,
> pointing out a specific sub-command.

### `/clispec/$MODE/modifications/paramhelp` (xs:string)

The "paramhelp" element makes it possible to add a custom help text to a
parameter to a specified built-in command.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to add
> the text to. cmdpathType is a space-separated list of commands,
> pointing out a specific sub-command.

*nr* (positiveInteger)  
> The "nr" attribute is mandatory. It specifies which parameter of the
> command to add the text to.

### `/clispec/$MODE/modifications/typehelp` (xs:string)

The "typehelp" element makes it possible to add a custom help text for
the built-in primitive types, e.g. to change the default type name in
the CLI. For example, to display "\<integer\>" instead of
"\<unsignedShort\>".

The built-in primitive types are: string, atom, normalizedString,
boolean, float, decimal, double, hexBinary, base64Binary, anyURI,
anySimpleType, QName, NOTATION, token, integer, nonPositiveInteger,
negativeInteger, long, int, short, byte, nonNegativeInteger,
unsignedLong, positiveInteger, unsignedInt, unsignedShort, unsignedByte,
dateTime, date, gYearMonth, gDay, gYear, time, gMonthDay, gMonth,
duration, inetAddress, inetAddressIPv4, inetAddressIP, inetAddressIPv6,
inetAddressDNS, inetPortNumber, size, MD5DigestString,
AESCFB128EncryptedString, objectRef, bits_type_32, bits_type_64,
hexValue, hexList, octetList, Gauge32, Counter32, Counter64, and oid.

Attributes:

*type* (xs:Name)  
> The "type" attribute is mandatory. It specifies which primitive type
> to modify.

### `/clispec/$MODE/modifications/info` (xs:string)

The "info" element makes it possible to add a custom info text to the
specified built-in command.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to hide.
> cmdpathType is a space-separated list of commands, pointing out a
> specific sub-command.

### `/clispec/$MODE/modifications/paraminfo` (xs:string)

The "paraminfo" element makes it possible to add a custom info text to a
parameter to a specified built-in command.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to add
> the text to. cmdpathType is a space-separated list of commands,
> pointing out a specific sub-command.

*nr* (positiveInteger)  
> The "nr" attribute is mandatory. It specifies which parameter of the
> command to add the text to.

### `/clispec/$MODE/modifications/timeout` (xs:integer\|infinity)

The "timeout" element makes it possible to add a custom command timeout
(in seconds) to the specified built-in command.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to add
> the timeout to. cmdpathType is a space-separated list of commands,
> pointing out a specific sub-command.

### `/clispec/$MODE/modifications/hide`

The "hide" element makes it possible to hide a built-in command

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to hide.
> cmdpathType is a space-separated list of commands, pointing out a
> specific sub-command.
>
> An example:
>
>             <modifications>
>             <hide src="file show"/>
>             </modifications>
>             

### `/clispec/$MODE/modifications/hideGroup`

The "hideGroup" element makes it possible to hide a built-in command
under a hide group.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to hide.
> cmdpathType is a space-separated list of commands, pointing out a
> specific sub-command.

*name* (xs:string)  
> The "name" attribute is mandatory. It specifies which hide group to
> hide the command.
>
> An example:
>
>     <modifications>
>       <hideGroup src="file show" name="debug"/>
>     </modifications>

### `/clispec/$MODE/modifications/submodeCommand`

The "submodeCommand" element makes it possible to make a command visible
in the completion lists of all submodes.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to make
> available. cmdpathType is a space-separated list of commands, pointing
> out a specific sub-command.
>
> An example:
>
>     <modifications>
>       <submodeCommand src="clear"/>
>     </modifications>

### `/clispec/$MODE/modifications/confirmText` (xs:string)

The "confirmText" element makes it possible to add a confirmation text
to the specified command, i.e. the CLI user is prompted whenever this
command is executed. The prompt to be used is given as a body to the
element as seen in ncs-light.cli above. The valid answers are "yes" and
"no" - the text " \[yes, no\]" will automatically be added to the given
confirmation text.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to add a
> confirmation prompt to. cmdpathType is a space-separated list of
> commands, pointing out a specific sub-command.

*defaultOption* (yes\|no)  
> The "defaultOption" attribute is optional. It makes it possible to
> customize if "yes" or "no" should be the default option, i.e. if the
> user just hits ENTER. If this element is not defined it defaults to
> whatever is specified by the
> /clispec/\$MODE/modifications/defaultConfirmOption element.

### `/clispec/$MODE/modifications/defaultConfirmOption` (yes\|no)

The "defaultConfirmOption" element makes it possible to customize if
"yes" or "no" should be the default option, i.e. if the user just hits
ENTER, for the confirmation text added by the "confirmText" element.

If this element is not defined it defaults to "yes".

This element affects both /clispec/\$MODE/modifications/confirmText and
/clispec/\$MODE/cmd/confirmText if they have not defined their
"defaultOption" attributes.

### `/clispec/$MODE/modifications/keymap`

The "keymap" element makes it possible to modify the key bindings in the
command line editor. Note that the actions for the keymap are not the
same as regular clispec actions but rather command line editor action
events. The values for these can only be among the pre-defined set
described below as keymapActionType.

Attributes:

*key* (xs:string)  
> The "key" attribute is mandatory. It specifies which sequence of
> keystrokes to modify.

*action* (keymapActionType)  
> The "action" attribute is mandatory. It specifies what should happen
> when the specified key sequence is executed. Possible values are:
> "unset", "new", "exist", "start_of_line", "back", "abort", "tab",
> "delete_forward", "delete_forward_no_eof", "end_of_line", "forward",
> "kill_rest", "redraw", "redraw_clear", "newline", "insert(chars)",
> "history_next", "history_prev", "isearch_back", "transpose",
> "kill_line", "quote", "word_delete_back", "yank", "end_mode",
> "delete", "word_delete_forward", "beginning_of_line", "delete",
> "end_of_line", "word_forward", "word_back", "end_of_line",
> "beginning_of_line", "word_back", "word_forward", "word_capitalize",
> "word_lowercase", "word_uppercase", "word_delete_back",
> "word_delete_forward", "multiline_mode", "yank_killring", and "quot".
> To remove a default binding use the action "remove_binding".
>
> The default keymap is:
>
>           <keymap key="\^A" action="start_of_line"/>
>           <keymap key="\^B" action="back"/>
>           <keymap key="\^C" action="abort"/>
>           <keymap key="\^D" action="delete_forward"/>
>           <keymap key="\^E" action="end_of_line"/>
>           <keymap key="\^F" action="forward"/>
>           <keymap key="\^J" action="newline"/>
>           <keymap key="\^K" action="kill_rest"/>
>           <keymap key="\^L" action="redraw_clear"/>
>           <keymap key="\^M" action="newline"/>
>           <keymap key="\^N" action="history_next"/>
>           <keymap key="\^P" action="history_prev"/>
>           <keymap key="\^R" action="isearch_back"/>
>           <keymap key="\^T" action="transpose"/>
>           <keymap key="\^U" action="kill_line"/>
>           <keymap key="\^V" action="quote"/>
>           <keymap key="\^W" action="word_delete_back"/>
>           <keymap key="\^X" action="kill_line"/>
>           <keymap key="\^Y" action="yank"/>
>           <keymap key="\^Z" action="end_mode"/>
>           <keymap key="\d" action="delete"/>
>           <keymap key="\t" action="tab"/>
>           <keymap key="\b" action="delete"/>
>           <keymap key="\ed" action="word_delete_forward"/>
>           <keymap key="\e[Z" action="tab"/>
>           <keymap key="\e[A" action="history_prev"/>
>           <keymap key="\e[1~" action="beginning_of_line"/>
>           <keymap key="\e[3~" action="delete"/>
>           <keymap key="\e[4~" action="end_of_line"/>
>           <keymap key="\eOA" action="history_prev"/>
>           <keymap key="\eOB" action="history_next"/>
>           <keymap key="\eOC" action="forward"/>
>           <keymap key="\eOD" action="back"/>
>           <keymap key="\eOM" action="newline"/>
>           <keymap key="\eOp" action="insert(0)"/>
>           <keymap key="\eOq" action="insert(1)"/>
>           <keymap key="\eOr" action="insert(2)"/>
>           <keymap key="\eOs" action="insert(3)"/>
>           <keymap key="\eOt" action="insert(4)"/>
>           <keymap key="\eOu" action="insert(5)"/>
>           <keymap key="\eOv" action="insert(6)"/>
>           <keymap key="\eOw" action="insert(7)"/>
>           <keymap key="\eOx" action="insert(8)"/>
>           <keymap key="\eOy" action="insert(9)"/>
>           <keymap key="\eOm" action="insert(-)"/>
>           <keymap key="\eOl" action="insert(*)"/>
>           <keymap key="\eOn" action="insert(.)"/>
>           <keymap key="\e[5C" action="word_forward"/>
>           <keymap key="\e[5D" action="word_back"/>
>           <keymap key="\e[1;5C" action="word_forward"/>
>           <keymap key="\e[1;5D" action="word_back"/>
>           <keymap key="\e[B" action="history_next"/>
>           <keymap key="\e[C" action="forward"/>
>           <keymap key="\e[D" action="back"/>
>           <keymap key="\e[F" action="end_of_line"/>
>           <keymap key="\e[H" action="beginning_of_line"/>
>           <keymap key="\eb" action="word_back"/>
>           <keymap key="\ef" action="word_forward"/>
>           <keymap key="\ec" action="word_capitalize"/>
>           <keymap key="\el" action="word_lowercase"/>
>           <keymap key="\eu" action="word_uppercase"/>
>           <keymap key="\e\b" action="word_delete_back"/>
>           <keymap key="\e\d" action="word_delete_back"/>
>           <keymap key="\ed" action="word_delete_forward"/>
>           <keymap key="\em" action="multiline_mode"/>
>           <keymap key="\ey" action="yank_killring"/>
>           <keymap key="\eq" action="quote"/>
>
> The default keymap for I-style differs with the following mapping:
>
>       <keymap key="\^D" action="delete_forward_no_eof"/>

### `/clispec/$MODE/show/callback/capi`

The "capi" element specifies that the command is implemented using Java
API using the same API as for actions. It contains one "cmdpoint"
element and one or zero "args" element.

An example:

    <callback>
      <capi>
        <cmdpoint>adduser</cmdpoint>
      </capi>
    </callback>

### `/clispec/$MODE/show/callback/capi/args` (argsType)

The "args" element specifies the arguments to use when executing the
command specified by the "callpoint" element. argsType is a
space-separated list of argument strings.

The string may contain a number of built-in variables which are expanded
on execution. The built-in variables are: "cwd", "user", "groups", "ip",
"maapi", "uid", "gid", "tty", "ssh_connection", "opaque", "path",
"cpath", "ipath" and "licounter". In addition the variables "spath" and
"ispath" are available when a command is executed from a show path. For
example:

    <args>$(user)</args>

Will expand to the username.

### `/clispec/$MODE/show/callback/capi/cmdpoint` (xs:NCName)

The "cmdpoint" element specifies the name of the Java API action to be
called. For this to work, a actionpoint must be registered with the NSO
daemon at startup.

### `/clispec/$MODE/show/callback/exec`

The "exec" element specifies how the command is implemented using an
executable or a shell script. It contains (in order) one "osCommand"
element, zero or one "args" elements and zero or one "options" elements.

An example:

<div class="informalexample">

        
      
      <callback>
      <exec>
        <osCommand>cp</osCommand>
        <options>
          <uid>ncs</uid>
          <wd>/var/tmp</wd>
          ...
        </options>
      </exec>
      </callback>
      

</div>

### `/clispec/$MODE/show/callback/exec/osCommand` (xs:token)

The "osCommand" element specifies the path to the executable or shell
script to be called. If the command is in the \$PATH (as specified when
we start the NSO daemon) the path may just be the name of the command.

The "osCommand" and "args" for "show" differs a bit from the ones for
"cmd". For "show" there are a few built-in arguments that always are
given to the "osCommand". These are appended to "args". The built-in
arguments are "0", the keypath (ispath) and an optional filter. Like
this: "0 /prefix:keypath \*".

The command is not paginated by default in the CLI and will only do so
if it is piped to more.

<div class="informalexample">

        joe@io> example_os_command | more
      

</div>

The command is invoked as if it had been executed by exec(3), i.e. not
in a shell environment such as "/bin/sh -c ...".

### `/clispec/$MODE/show/callback/exec/args` (argsType)

The "args" element specifies additional arguments to use when executing
the command specified by the "osCommand" element. The "args" arguments
are prepended to the mandatory ones listed in "osCommand". argsType is a
space-separated list of argument strings.

The string may contain a number of built-in variables which are expanded
on execution. The built-in variables are: "cwd", "user", "groups", "ip",
"maapi", "uid", "gid", "tty", "ssh_connection", "opaque", "path",
"cpath", "ipath" and "licounter". In addition the variables "spath" and
"ispath" are available when a command is executed from a show path. For
example:

    <args>$(user)</args>

Will expand to the username and the three built-in arguments. For
example: "admin 0 /prefix:keypath \*".

### `/clispec/$MODE/show/callback/exec/options`

The "options" element specifies how the command is be executed. It
contains (in any order) zero or one "uid" elements, zero or one "gid"
elements, zero or one "wd" elements, zero or one "batch" elements, zero
or one "pty" element, zero or one of "interrupt" elements, zero or one
of "noInput", zero or one "raw" elements, and zero or one
"ignoreExitValue" elements.

### `/clispec/$MODE/show/callback/exec/options/uid` (idType) \[confd\]

The "uid" element specifies which user id to use when executing the
command. Possible values are:

*confd* (default)  
> The command is run as the same user id as the NSO daemon.

*user*  
> The command is run as the same user id as the user logged in to the
> CLI, i.e. we have to make sure that this user id exists as an actual
> user id on the device.

*root*  
> The command is run as root.

*\<uid\>* (the numerical user *\<uid\>*)  
> The command is run as the user id \<uid\>.
>
> *Note:* If uid is set to either "user", "root" or "\<uid\>" the the
> NSO daemon must have been started as root (or setuid), or the
> showptywrapper must have setuid root permissions.

### `/clispec/$MODE/show/callback/exec/options/gid` (idType) \[confd\]

The "gid" element specifies which group id to use when executing the
command. Possible values are:

*confd* (default)  
> The command is run as the same group id as the NSO daemon.

*user*  
> The command is run as the same group id as the user logged in to the
> CLI, i.e. we have to make sure that this group id exists as an actual
> group on the device.

*root*  
> The command is run as root.

*\<gid\>* (the numerical group *\<gid\>*)  
> The command is run as the group id \<gid\>.
>
> *Note:* If gid is set to either "user", "root" or "\<gid\>" the the
> NSO daemon must have been started as root (or setuid), or the
> showptywrapper must have setuid root permissions.

### `/clispec/$MODE/show/callback/exec/options/wd` (xs:token)

The "wd" element specifies which working directory to use when executing
the command. If not given, the command is executed from the location of
the CLI.

### `/clispec/$MODE/show/callback/exec/options/pty` (xs:boolean)

The "pty" element specifies weather a pty should be allocated when
executing the command. The default is to allocate a pty for operational
and configure osCommands, but not for osCommands executing as a pipe
command. This behavior can be overridden with this parameter.

### `/clispec/$MODE/show/callback/exec/options/interrupt` (interruptType) \[sigkill\]

The "interrupt" element specifies what should happen when the user
enters ctrl-c in the CLI. Possible values are:

*sigkill* (default)  
> The command is terminated by sending the sigkill signal.

*sigint*  
> The command is interrupted by the sigint signal.

*sigterm*  
> The command is interrupted by the sigterm signal.

*ctrlc*  
> The command is sent the ctrl-c character which is interpreted by the
> pty.

### `/clispec/$MODE/show/callback/exec/options/ignoreExitValue`

The "ignoreExitValue" element specifies that the CLI engine should
ignore the fact that the command returns a non-zero value. Normally it
signals an error on stdout if a non-zero value is returned.

### `/clispec/$MODE/show/callback/exec/options/raw`

The "raw" element specifies that the CLI engine should set the pty in
raw mode when executing the command. This prevents normal output
processing like converting \n to \n\r.

### `/clispec/$MODE/show/callback/exec/options/globalNoDuplicate` (xs:token)

The "globalNoDuplicate" element specifies that only one instance with
the same name can be run at any one time in the system. The command can
be started either from the CLI, the Web UI or through NETCONF.

### `/clispec/$MODE/show/callback/exec/options/noInput` (xs:token)

The "noInput" element specifies that the command should not grab the
input stream and consume freely from that. This option should be used if
the command should not consume input characters. If not used then the
command will eat all data from the input stream and cut-and-paste may
not work as intended.

### `/clispec/$MODE/show/options`

The "options" element specifies under what circumstances the CLI command
should execute. It contains (in any order) zero or one
"notInterruptible" elements, zero or one of "displayWhen" elements, and
zero or one "paginate" elements.

### `/clispec/$MODE/show/options/notInterruptible`

The "notInterruptible" element disables \<ctrl-c\> and the execution of
the CLI command can thus not be interrupted.

### `/clispec/$MODE/show/options/paginate`

The "paginate" element enables a filter for paging through CLI command
output text one screen at a time.

### `/clispec/$MODE/show/options/displayWhen`

The "displayWhen" element can be used to add a displayWhen xpath
condition to a command.

Attributes:

*expr* (xpath expression)  
> The "expr" attribute is mandatory. It specifies an xpath expression.
> If the expression evaluates to true then the command is available,
> otherwise not.

*ctx* (path)  
> The "ctx" attribute is optional. If not specified the current
> editpath/mode-path is used as context node for the xpath evaluation.
> Note that the xpath expression will automatically evaluate to false if
> a display when expression is used for a top-level command and no ctx
> is specified. The path may contain variables defined in the dict.

### `/clispec/operationalMode/start`

The "start" command is executed when the CLI is started. It can be used
to, for example, remind the user to change an expired password. It
contains (in order) zero or one "callback" elements, and zero or one
"options" elements.

This element must occur after the \<modifications\> section and before
any \<cmd\> entries.

An example:

    <start>
      <callback>
        <exec>
          <osCommand>./startup.sh</osCommand>
        </exec>
      </callback>
    </start>

### `/clispec/operationalMode/start/callback`

The "callback" element specifies how the command is implemented, e.g. as
a OS executable or an API callback. It contains one of the elements
"capi", and "exec".

### `/clispec/operationalMode/start/callback/capi`

The "capi" element specifies that the command is implemented using Java
API using the same API as for actions. It contains one "cmdpoint"
element.

An example:

    <callback>
      <capi>
        <cmdpoint>adduser</cmdpoint>
      </capi>
    </callback>

### `/clispec/operationalMode/start/callback/capi/cmdpoint` (xs:NCName)

The "cmdpoint" element specifies the name of the Java API action to be
called. For this to work, a actionpoint must be registered with the NSO
daemon at startup.

### `/clispec/operationalMode/start/callback/exec`

The "exec" element specifies how the command is implemented using an
executable or a shell script. It contains (in order) one "osCommand"
element, zero or one "args" elements and zero or one "options" elements.

An example:

    <callback>
      <exec>
        <osCommand>cp</osCommand>
        <options>
          <uid>confd</uid>
          <wd>/var/tmp</wd>
          ...
        </options>
      </exec>
    </callback>

### `/clispec/operationalMode/start/callback/exec/osCommand` (xs:token)

The "osCommand" element specifies the path to the executable or shell
script to be called. If the command is in the \$PATH (as specified when
we start the NSO daemon) the path may just be the name of the command.

The command is invoked as if it had been executed by exec(3), i.e. not
in a shell environment such as "/bin/sh -c ...".

### `/clispec/operationalMode/start/callback/exec/args` (argsType)

The "args" element specifies the arguments to use when executing the
command specified by the "osCommand" element. argsType is a
space-separated list of argument strings. The built-in variables are:
"cwd", "user", "groups", "ip", "maapi", "uid", "gid", "tty",
"ssh_connection", "opaque", "path", "cpath", "ipath" and "licounter". In
addition the variables "spath" and "ispath" are available when a command
is executed from a show path. For example:

    <args>$(user)</args>

Will expand to the username.

### `/clispec/operationalMode/start/callback/exec/options`

The "options" element specifies how the command is be executed. It
contains (in any order) zero or one "uid" elements, zero or one "gid"
elements, zero or one "wd" elements, zero or one "batch" elements, zero
or one of "interrupt" elements, and zero or one "ignoreExitValue"
elements.

### `/clispec/operationalMode/start/callback/exec/options/uid` (idType) \[confd\]

The "uid" element specifies which user id to use when executing the
command. Possible values are:

*confd* (default)  
> The command is run as the same user id as the NSO daemon.

*user*  
> The command is run as the same user id as the user logged in to the
> CLI, i.e. we have to make sure that this user id exists as an actual
> user id on the device.

*root*  
> The command is run as root.

*\<uid\>* (the numerical user *\<uid\>*)  
> The command is run as the user id \<uid\>.
>
> *Note:* If uid is set to either "user", "root" or "\<uid\>" the the
> NSO daemon must have been started as root (or setuid), or the
> startptywrapper must have setuid root permissions.

### `/clispec/operationalMode/start/callback/exec/options/gid` (idType) \[confd\]

The "gid" element specifies which group id to use when executing the
command. Possible values are:

*confd* (default)  
> The command is run as the same group id as the NSO daemon.

*user*  
> The command is run as the same group id as the user logged in to the
> CLI, i.e. we have to make sure that this group id exists as an actual
> group on the device.

*root*  
> The command is run as root.

*\<gid\>* (the numerical group *\<gid\>*)  
> The command is run as the group id \<gid\>.
>
> *Note:* If gid is set to either "user", "root" or "\<gid\>" the the
> NSO daemon must have been started as root (or setuid), or the
> startptywrapper must have setuid root permissions.

### `/clispec/operationalMode/start/callback/exec/options/wd` (xs:token)

The "wd" element specifies which working directory to use when executing
the command. If not given, the command is executed from the location of
the CLI.

### `/clispec/operationalMode/start/callback/exec/options/globalNoDuplicate` (xs:token)

The "globalNoDuplicate" element specifies that only one instance with
the same name can be run at any one time in the system. The command can
be started either from the CLI, the Web UI or through NETCONF.

### `/clispec/operationalMode/start/callback/exec/options/interrupt` (interruptType) \[sigkill\]

The "interrupt" element specifies what should happen when the user
enters ctrl-c in the CLI. Possible values are:

*sigkill* (default)  
> The command is terminated by sending the sigkill signal.

*sigint*  
> The command is interrupted by the sigint signal.

*sigterm*  
> The command is interrupted by the sigterm signal.

*ctrlc*  
> The command is sent the ctrl-c character which is interpreted by the
> pty.

### `/clispec/operationalMode/start/callback/exec/options/ignoreExitValue`(xs:boolean) \[false\]

The "ignoreExitValue" element specifies if the CLI engine should ignore
the fact that the command returns a non-zero value. Normally it signals
an error on stdout if a non-zero value is returned.

### `/clispec/operationalMode/start/options`

The "options" element specifies under what circumstances the CLI command
should execute. It contains (in any order) zero or one
"notInterruptible" elements, and zero or one "paginate" elements.

### `/clispec/operationalMode/start/options/notInterruptible`

The "notInterruptible" element disables \<ctrl-c\> and the execution of
the CLI command can thus not be interrupted.

### `/clispec/operationalMode/start/options/paginate`

The "paginate" element enables a filter for paging through CLI command
output text one screen at a time.

### `/clispec/$MODE/cmd`

The "cmd" element adds a new command to the CLI hierarchy as defined by
its "mount" and "mode" attributes. It contains (in order) one "info"
element, one "help" element, zero or one "confirmText" element, zero or
one "callback" elements, zero or one "params" elements, zero or one
"options" elements and finally zero or more "cmd" elements
(recursively).

If the new command with its parameters' names has the same path as a
node in data model, then the data model path in the model will NOT be
reachable.

If in data model there is a path that corresponds to some shortened
version of the command then the command can be invoked only in the
complete form.

Examples:

Assume the CLI spec has the following commands:

    <cmd name="one">
    ...
      <param>
        <name>two</name>
      </param>
    ...
    </cmd>
    <cmd name="longcommand">
    ...
      <param>
        <name>longparam</name>
      </param>
    ...
    </cmd>

And the data model has the following nodes:

    container one {
      leaf two {
        type string;
      }
    }
    container longcom {
      leaf longpar {
        type string;
      }
    }

Then the following will invoke the CLI command, not set the leaf value:

    joe@dev# one two abc

And the following will instead set the leaf value:

    joe@dev# longcom longpar def

Attributes:

*name* (xs:NCName)  
> The "name" attribute is mandatory. It specifies the name of the
> command.

*extend* (xs:boolean) \[false\]  
> The "extend" attribute is optional. It specifies that the command
> should be mounted on top of an existing command, ie with the exact
> same name as an existing command but with different parameters. Which
> command is executed depends on which parameters are supplied when the
> command is invoked. This can be used to overlay an existing command.

*mount* (cmdpathType) \[\]  
> The "mount" attribute is optional. It specifies where in the command
> hierarchy of built-in commands this command should be mounted. If no
> mount attribute is given, or if it is empty (""), the command is
> mounted on the top-level of the CLI hierarchy.
>
> An example:
>
>     <cmd name="copy" mount="file">
>       <info>Copy a file</info>
>       <help>Copy a file from in the file system.</help>
>       <callback>
>         <exec>
>           <osCommand>cp</osCommand>
>           <options>
>             <uid>confd</uid>
>           </options>
>         </exec>
>       </callback>
>       <params>
>         <param>
>           <type><file/></type>
>           <info>&amp;lt;source file&amp;gt;</info>
>         </param>
>         <param>
>           <type><file/></type>
>           <info>&amp;lt;destination&amp;gt;</info>
>         </param>
>       </params>
>
>       <cmd ...>
>         ...
>         <cmd ...>
>           ...
>         </cmd>
>       </cmd>
>
>       <cmd ...>
>         ...
>       </cmd>
>     </cmd>

### `/clispec/$MODE/cmd/info (xs:string)`

The "info" element is a single text line describing the command.

An example:

    <cmd name="start">
      <info>Start displaying the system log or trace a file</info>
      ...

and when we do the following in the CLI we get:

    joe@xev> monitor st<TAB>
    Possible completions:
      start - Start displaying the system log or trace a file
      stop  - Stop displaying the system log or trace a file
    joe@xev> monitor st

### `/clispec/$MODE/cmd/help (xs:string)`

The "help" element is a multi-line text string describing the command.
This text is shown when we use the "help" command.

An example:

    joe@xev> help monitor start
    Help for command: monitor start
    Start displaying the system log or trace a file in the background.
    We can abort the logging using the "monitor stop" command.
    joe@xev>

### `/clispec/$MODE/cmd/timeout (xs:integer|infinity)`

The "timeout" element is a timeout for the command in seconds. Default
is infinity.

### `/clispec/$MODE/cmd/confirmText`

See /clispec/\$MODE/modifications/confirmText

### `/clispec/$MODE/cmd/callback`

The "callback" element specifies how the command is implemented, e.g. as
a OS executable or a CAPI callback. It contains one of the elements
"capi", "exec", "table" or "execStop".

*Note:* A command which has a callback defined may not have recursive
sub-commands. Likewise, a command which has recursive sub-commands may
not have a callback defined. A command without sub-commands must have a
callback defined.

### `/clispec/$MODE/cmd/callback/table`

The "table" element specifies that the command should display parts of
the configuration in the form of a table.

An example:

    <callback>
      <table>
        <root>/all:config/hosts/host</root>
        <item>
          <width>20</width>
          <header>NAME</header>
          <path>name</path>
          <align>lefg</align>
        </item>
        <item>
          <header>DOMAIN</header>
          <path>domain</path>
        </item>
        <item>
          <header>IP</header>
          <path>interfaces/interface/ip</path>
          <align>right</align>
        </item>
      </table>
    </callback>

### `/clispec/$MODE/cmd/callback/table/root` (xs:string)

Should be a path to a list element. All item paths in the table are
relative to this path.

### `/clispec/$MODE/cmd/callback/table/legend` (xs:string)

Should be a legend template to display before showing the table.

### `/clispec/$MODE/cmd/callback/table/footer` (xs:string)

Should be a footer template to display after showing the table.

### `/clispec/$MODE/cmd/callback/table/item`

Specifies a column in the table. It contains a "header" element and a
"path" element, and optionally a "width" element.

### `/clispec/$MODE/cmd/callback/table/item/header` (xs:string)

Header of this column in the table.

### `/clispec/$MODE/cmd/callback/table/item/path` (xs:string)

Path to the element in this column.

### `/clispec/$MODE/cmd/callback/table/item/width` (xs:integer)

The width in characters of this column.

### `/clispec/$MODE/cmd/callback/table/item/align` (left\|right\|center)

The data alignment of this column.

### `/clispec/$MODE/cmd/callback/capi`

The "capi" element specifies that the command is implemented using Java
API using the same API as for actions. It contains one "cmdpoint"
element.

An example:

    <callback>
      <capi>
        <cmdpoint>adduser</cmdpoint>
      </capi>
    </callback>

### `/clispec/$MODE/cmd/callback/capi/cmdpoint` (xs:NCName)

The "cmdpoint" element specifies the name of the Java API action to be
called. For this to work, a actionpoint must be registered with the NSO
daemon at startup.

### `/clispec/$MODE/cmd/callback/exec`

The "exec" element specifies how the command is implemented using an
executable or a shell script. It contains (in order) one "osCommand"
element, zero or one "args" elements and zero or one "options" elements.

An example:

    <callback>
      <exec>
        <osCommand>cp</osCommand>
        <options>
          <uid>confd</uid>
          <wd>/var/tmp</wd>
          ...
        </options>
      </exec>
    </callback>

### `/clispec/$MODE/cmd/callback/exec/osCommand` (xs:token)

The "osCommand" element specifies the path to the executable or shell
script to be called. If the command is in the \$PATH (as specified when
we start the NSO daemon) the path may just be the name of the command.

The command is invoked as if it had been executed by exec(3), i.e. not
in a shell environment such as "/bin/sh -c ...".

### `/clispec/$MODE/cmd/callback/exec/args` (argsType)

The "args" element specifies the arguments to use when executing the
command specified by the "osCommand" element. argsType is a
space-separated list of argument strings. The built-in variables are:
"cwd", "user", "groups", "ip", "maapi", "uid", "gid", "tty",
"ssh_connection", "opaque", "path", "cpath", "ipath" and "licounter".
The variable "pipecmd_XYZ" can be used to determine whether a certain
builtin pipe command has been run together with the command. Here XYZ is
the name of the pipe command. An example of such a variable is
"pipecmd_include". In addition the variables "spath" and "ispath" are
available when a command is executed from a show path. For example:

    <args>$(user)</args>

Will expand to the username.

### `/clispec/$MODE/cmd/callback/exec/options`

The "options" element specifies how the command is be executed. It
contains (in any order) zero or one "uid" elements, zero or one "gid"
elements, zero or one "wd" elements, zero or one "batch" elements, zero
or one of "interrupt" elements, and zero or one "ignoreExitValue"
elements.

### `/clispec/$MODE/cmd/callback/exec/options/uid` (idType) \[confd\]

The "uid" element specifies which user id to use when executing the
command. Possible values are:

*confd* (default)  
> The command is run as the same user id as the NSO daemon.

*user*  
> The command is run as the same user id as the user logged in to the
> CLI, i.e. we have to make sure that this user id exists as an actual
> user id on the device.

*root*  
> The command is run as root.

*\<uid\>* (the numerical user *\<uid\>*)  
> The command is run as the user id \<uid\>.
>
> *Note:* If uid is set to either "user", "root" or "\<uid\>" the the
> NSO daemon must have been started as root (or setuid), or the
> cmdptywrapper must have setuid root permissions.

### `/clispec/$MODE/cmd/callback/exec/options/gid` (idType) \[confd\]

The "gid" element specifies which group id to use when executing the
command. Possible values are:

*confd* (default)  
> The command is run as the same group id as the NSO daemon.

*user*  
> The command is run as the same group id as the user logged in to the
> CLI, i.e. we have to make sure that this group id exists as an actual
> group on the device.

*root*  
> The command is run as root.

*\<gid\>* (the numerical group *\<gid\>*)  
> The command is run as the group id \<gid\>.
>
> *Note:* If gid is set to either "user", "root" or "\<gid\>" the the
> NSO daemon must have been started as root (or setuid), or the
> cmdptywrapper must have setuid root permissions.

### `/clispec/$MODE/cmd/callback/exec/options/wd` (xs:token)

The "wd" element specifies which working directory to use when executing
the command. If not given, the command is executed from the location of
the CLI.

### `/clispec/$MODE/cmd/callback/exec/options/pty` (xs:boolean)

The "pty" element specifies weather a pty should be allocated when
executing the command. The default is to allocate a pty for operational
and configure osCommands, but not for osCommands executing as a pipe
command. This behavior can be overridden with this parameter.

### `/clispec/$MODE/cmd/callback/exec/options/globalNoDuplicate` (xs:token)

The "globalNoDuplicate" element specifies that only one instance with
the same name can be run at any one time in the system. The command can
be started either from the CLI, the Web UI or through NETCONF.

### `/clispec/$MODE/cmd/callback/exec/options/noInput` (xs:token)

The "noInput" element specifies that the command should not grab the
input stream and consume freely from that. This option should be used if
the command should not consume input characters. If not used then the
command will eat all data from the input stream and cut-and-paste may
not work as intended.

### `/clispec/$MODE/cmd/callback/exec/options/batch`

The "batch" element makes it possible to specify that a command returns
immediately but still runs in the background, optionally generating
output on stdout. An example of such a command is the standard "monitor
start" command, which prints additional data appended to a (log) file:

    joe@io> monitor start /var/log/messages
    joe@io>
    log: Apr 10 11:59:32 earth ntpd[530]: kernel time sync enabled 2001

*Ten seconds later...*

    log: Apr 12 01:59:02 earth sshd[26847]: error: PAM: auth error for cathy
    joe@io> monitor stop /var/log/messages
    joe@io>

The "batch" element contains (in order) one "group" element, an optional
"prefix" element, and an optional "noDuplicate" element. The prefix
defaults to the empty string.

An example from ncs.cli implementing the monitor functionality:

    <cmd name="start">
      ...
      <callback>
        <exec>
          <osCommand>tail</osCommand>
          <args>-f -n 0</args>
          <options>
            ...
            <batch>
              <group>monitor_file</group>
              <prefix>log:</prefix>
              <noDuplicate/>
            </batch>
          </options>
        </exec>
      </callback>
      ...
    </cmd>

The batch group is used to kill the command as exemplified in the
"execStop" element description below. "noDuplicate" indicates that a
specific file is not allowed to be monitored by several commands in
parallel.

### `/clispec/$MODE/cmd/callback/exec/options/batch/group` (xs:NCName)

The "group" element attaches a group label to the command. The group
label is used when defining a "stop" command whose job it is to kill the
background command. Take a look at the monitor example above for better
understanding.

The stop command is defined using a "execStop" element as described
below.

### `/clispec/$MODE/cmd/callback/exec/options/batch/prefix` (xs:NCName)

The "prefix" element specifies a string to prepend to all lines printed
by the background command. In the monitor example above, "log:" is the
chosen prefix.

### `/clispec/$MODE/cmd/callback/exec/options/batch/noDuplicate`

The "noDuplicate" element specifies that only a single instance of this
batch command, including the given/specified parameters, can run in the
background.

### `/clispec/$MODE/cmd/callback/exec/options/interrupt` (interruptType) \[sigkill\]

The "interrupt" element specifies what should happen when the user
enters ctrl-c in the CLI. Possible values are:

*sigkill* (default)  
> The command is terminated by sending the sigkill signal.

*sigint*  
> The command is interrupted by the sigint signal.

*sigterm*  
> The command is interrupted by the sigterm signal.

*ctrlc*  
> The command is sent the ctrl-c character which is interpreted by the
> pty.

### `/clispec/$MODE/cmd/callback/exec/options/ignoreExitValue`(xs:boolean) \[false\]

The "ignoreExitValue" element specifies if the CLI engine should ignore
the fact that the command returns a non-zero value. Normally it signals
an error on stdout if a non-zero value is returned.

### `/clispec/$MODE/cmd/callback/execStop`

The "execStop" element specifies that a command defined by an "exec"
element is to be killed.

Attributes:

*batchGroup* (xs:NCName)  
> The "batchGroup" attribute is mandatory. It specifies a background
> command to kill. It corresponds to a group label defined by another
> "exec" command using the "batch" element.
>
> An example from ncs.cli which kills a background monitor session:
>
>     <cmd name="stop">
>       ...
>       <callback>
>         <execStop batchGroup="monitor_file"/>
>       </callback>
>       ...
>     </cmd>

### `/clispec/$MODE/cmd/params`

The "params" element lists which parameters the CLI should prompt for.
These parameters are then used as arguments to either the CAPI callback
or the OS executable command (as specified by the "capi" element or the
"exec" element, respectively). If an "args" element as well as a
"params" element has been specified, all of them are used as arguments:
first the "args" arguments and then the "params" values are passed to
the CAPI callback or executable.

The "params" element contains (in order) zero or more "param" elements
and zero or one "any" elements.

Attributes:

*mode* (list\|choice)  
> This is an optional attribute. If it is "choice" then at least "min"
> and at most "max" params must be given by the user. If it is "list"
> then all non-optional parameters must be given the command in the
> order they appear in the list.

*min* (xs:nonNegativeInteger)  
> This optional attribute defines the minumun number of parameters from
> the body of the "params" element that the user must supply with the
> command. It is only applicable if the mode attribute has been set to
> "choice". The default value is "1".

*max* (xs:nonNegativeInteger \| unlimited)  
> This optional attribute defines the maximum number of parameters from
> the body of the "params" element that the user may supply with the
> command. It is only applicable if the mode attribute has been set to
> "choice". The default value is "1" unless multi is specified, in which
> case the default is "unlimited".

*multi* (xs:boolean)  
> This optional attribute controls if each parameters should be allowed
> to be entered more than once. If set to "true" then each parameter may
> occur multiple times. The default is "false".

An example from ncs.cli which copies one file to another:

    <params>
      <param>
        <type><file/></type>
        ...
      </param>
      <param>
        <type><file/></type>
        ...
       </param>
       ...
    </params>

### `/clispec/$MODE/cmd/params/param`

The "param" element defines the nature of a single parameter which the
CLI should prompt for. It contains (in any order) zero or one "type"
element, zero or one "info" element, zero or one "help" element, zero or
one "optional" element, zero or one "name" element, zero or one "params"
element, zero or one "auditLogHide" element, zero or one "prefix"
element, zero or one "flag" element, zero or one "id" element, zero or
one "hideGroup" element, and zero or one "simpleType" element and zero
or one "completionId" element.

### `/clispec/$MODE/cmd/params/param/type`

The "type" element is optional and defines the parameter type. It
contains either a "enums", "enumerate", "void", "keypath", "key",
"pattern" (and zero or one "patternRaw"), "file", "url_file",
"simpleType", "xpath", "url_directory_file", "directory_file",
"url_directory" or a "directory" element. If the "type" element is not
present, the value entered by the user is passed unmodified to the
callback.

### `/clispec/$MODE/cmd/params/param/type/enums` (enumsType)

The "enums" element defines a list of allowed enum values for the
parameter. enumsType is a space-separated list of string enums.

An example:

    <enums>for bar baz</enums>

### `/clispec/$MODE/cmd/params/param/type/enumerate`

The "enumerate" is used to define a set of values with info text. It can
contain one of more of the element "elem".

### `/clispec/$MODE/cmd/params/param/type/enumerate/enum`

The "enum" is used to define an enumeration value with help text. It
must contain the element "name" and optionally an "info" element and a
"hideGroup" element.

### `/clispec/$MODE/cmd/params/param/type/enumerate/enum/name`(xs:token)

The "name" is used to define the name of an enumeration.

### `/clispec/$MODE/cmd/params/param/type/enumerate/enum/info`(xs:string)

The "info" is used to define the info that is displayed during
completion in the CLI. The element is optional.

### `/clispec/$MODE/cmd/params/param/type/enumerate/enum/hideGroup`(xs:string)

The "hideGroup" element makes an enum value invisible and it cannot be
used even if a user knows about its existence. The enum value will
become visible when the hide group is 'unhidden' using the unhide
command.

### `/clispec/$MODE/cmd/params/param/type/void`

The "void" element is used to indicate that this parameter should not
prompt for a value. It can only be used when the "name" element is used.

### `/clispec/$MODE/cmd/params/param/type/keypath` (keypathType)

The "keypath" element specifies that the parameter must be a keypath
pointing to a configuration value. Valid keypath values are: *new* or
*exist*:

*new*  
> The keypath is either an already existing configuration value or an
> instance value to be created.

*exist*  
> The keypath must be an already existing configuration value.

### `/clispec/$MODE/cmd/params/param/type/key` (path)

The "key" element specifies that the parameter is an instance
identifier, either an existing instance or a new. If the list has
multiple key elements then they will be entered with a space in between.

The path should point to a list element, not the actual key leaf. If the
list has multiple keys then they user will be requested to enter all
keys of an instance. The path may be either absolute or relative to the
current submode path. Also variables referring to key elements in the
current submode path may be used, where the closes key is named
\$(key-1-1), \$(key-1-2) etc. Eg

    /foo{key-2-1,key-2-2}/bar{key-1-1,key-1-2}/...

Attributes:

*mode* (keypathType)  
> The "mode" attribute is mandatory. It specifies if the parameter
> refers to an existing (exist) instance or a new (new) instance.

### `/clispec/$MODE/cmd/params/param/type/pattern` (patternType)

The "pattern" element specifies that the parameter must be a show
command pattern. Valid pattern values are: *stats* or *config* or *all*:

*stats*  
> The pattern is only related to "config false" nodes in the data model.
> Note that CLI modifications such as fullShowPath, incompleteShowPath
> etc are applied to this pattern.

*config*  
> The pattern is only related to "config true" elements in the data
> model.

*all*  
> The pattern spans over all visible nodes in the data model.

Attributes:

*unhide* (xs:string)  
> The "unhide" attribute is optional. It specifies hide groups to
> temporarily unhide while parsing the argument. This is useful when,
> for example, creating a show command that takes an otherwise hidden
> path as argument.

### `/clispec/$MODE/cmd/params/param/type/patternRaw`

The "patternRaw" element is used to indicate that the parameter must be
a show command pattern but the raw argument string shall be sent to the
command callback instead of the formatted one. This prevents the case
that an exposed list key name which is an argument gets omitted by the
pattern if its key value is not included in the argument list being sent
to the command callback. It can only be used when the "pattern" element
is used.

### `/clispec/$MODE/cmd/params/param/type/file`

The "file" element specifies that the parameter is a file on disk. The
CLI automatically enables tab completion to help the user to choose the
correct file.

Attributes:

*wd* (xs:token)  
> The "wd" attribute is optional. It specifies a working directory to be
> used as the root for the tab completion algorithm. If no "wd"
> attribute is specified, the working directory is as defined for the
> "/clispec/\$MODE/cmd/callback/exec/options/wd" element.

An example:

    <file wd="/var/log/"/>

### `/clispec/$MODE/cmd/params/param/type/url_file`

The "url_file" element specifies that the parameter is a file on disk or
an URL. The CLI automatically enables tab completion to help the user to
choose the correct file.

Attributes:

*wd* (xs:token)  
> The "wd" attribute is optional. It specifies a working directory to be
> used as the root for the tab completion algorithm. If no "wd"
> attribute is specified, the working directory is as defined for the
> "/clispec/\$MODE/cmd/callback/exec/options/wd" element.

An example:

    <file wd="/var/log/"/>

### `/clispec/$MODE/cmd/params/param/type/directory`

The "directory" element specifies that the parameter is a directory on
disk. The CLI automatically enables tab completion to help the user
choose the correct directory.

Attributes:

*wd* (xs:token)  
> The "wd" attribute is optional. It specifies a working directory to be
> used as the root for the tab completion algorithm. If no "wd"
> attribute is specified, the working directory is as defined for the
> "wd" element.

An example:

    <directory wd="/var/log/"/>

### `/clispec/$MODE/cmd/params/param/type/url_directory`

The "url_directory" element specifies that the parameter is a directory
on disk or an URL. The CLI automatically enables tab completion to help
the user choose the correct directory.

Attributes:

*wd* (xs:token)  
> The "wd" attribute is optional. It specifies a working directory to be
> used as the root for the tab completion algorithm. If no "wd"
> attribute is specified, the working directory is as defined for the
> "wd" element.

An example:

    <directory wd="/var/log/"/>

### `/clispec/$MODE/cmd/params/param/type/directory_file`

The "directory_file" element specifies that the parameter is a directory
or a file on disk. The CLI automatically enables tab completion to help
the user choose the correct directory or file.

An example:

    <directory_file/>

### `/clispec/$MODE/cmd/params/param/type/url_directory_file`

The "url_directory_file" element specifies that the parameter is a
directory or a file on disk or an URL. The CLI automatically enables tab
completion to help the user choose the correct directory or file.

An example:

    <directory_file/>

### `/clispec/$MODE/cmd/params/param/info (xs:string)`

The "info" element is a single text line describing the parameter.

An example:

    <cmd name="id" mount="">
      <info>Find uid and groups of a user</info>
      <help>Find uid and groups of a user, using the id program</help>
      <callback>
        <exec>
          <osCommand>id</osCommand>
        </exec>
      </callback>
      <params>
        <param>
          <info>User name</info>
          <help>User name</help>
        </param>
      </params>
    </cmd>

and when we do the following in the CLI we get:

    joe@x15> id <TAB>
    User name
    joe@x15> id snmp
    uid=108(snmp) gid=65534(nogroup) groups=65534(nogroup)
    [ok][2006-08-30 14:51:28]

*Note:* This description is *only* shown if the "type" element is left
out.

### `/clispec/$MODE/cmd/params/param/help (xs:string)`

The "help" element is a multi-line text string describing the parameter.
This text is shown when we use the '?' character.

### `/clispec/$MODE/cmd/params/param/hideGroup (xs:string)`

The "hideGroup" element makes a CLI parameter invisible and it cannot be
used even if a user knows about its existence. The parameter will become
visible when the hide group is 'unhidden' using the unhide command.

This mechanism correspond to the 'tailf:hidden' statement in a YANG
module.

### `/clispec/$MODE/cmd/params/param/name (xs:token)`

The "name" element is a token which has to be entered by the user before
entering the actual parameter value. It is used to get named parameters.

An example:

    <cmd name="copy" mount="file">
      <info>Copy a file</info>
      <help>Copy a file from one location to another in the file system</help>
      <callback>
        <exec>
          <osCommand>cp</osCommand>
          <options>
            <uid>user</uid>
          </options>
        </exec>
      </callback>
      <params>
        <param>
          <type><file/></type>
          <info>&amp;lt;source file&amp;gt;</info>
          <help>source file</help>
          <name>from</name>
        </param>
        <param>
          <type><file/></type>
          <info>&amp;lt;destination file&amp;gt;></info>
          <help>destination file</help>
          <name>to</name>
        </param>
      </params>
    </cmd>

The result is that the user has to enter

    file copy from /tmp/orig to /tmp/copy

### `/clispec/$MODE/cmd/params/param/prefix (xs:string)`

The "prefix" element is a string that is prepended to the argument
before calling the osCommand. This can be used to add Unix style command
flags in front of the supplied parameters.

An example:

    <cmd name="ssh">
      <info>Open a secure shell on another host</info>
      <help>Open a secure shell on another host</help>
      <callback>
        <exec>
          <osCommand>ssh</osCommand>
          <options>
            <uid>user</uid>
            <interrupt>ctrlc</interrupt>
          </options>
        </exec>
      </callback>
      <params>
        <param>
          <info>&amp;lt;login&amp;gt;</info>
          <help>Users login name on host</help>
          <name>user</name>
          <prefix>--login=</prefix>
        </param>
        <param>
          <info>&amp;lt;host&amp;gt;</info>
          <help>host name or IP</help>
          <name>host</name>
        </param>
      </params>
    </cmd>

The user would enter for example

    ssh user joe host router.intranet.net

and the resulting call to the ssh executable would become

    ssh --login=joe router.intranet.net

### `/clispec/$MODE/cmd/params/param/flag (xs:string)`

The "flag" element is a string that is prepended to the argument before
calling the osCommand. In contrast to the prefix element it will not be
appended to the current parameter, but instead appear as a separate
argument, ie instead of adding a unix style flag as "--foo=" (prefix)
you add arguments in the style of "-f \<param\>" where -f is one arg and
\<param\> is another. Both \<prefix\> and \<flag\> can be used at the
same time.

An example:

    <cmd name="ssh">
      <info>Open a secure shell on another host</info>
      <help>Open a secure shell on another host</help>
      <callback>
        <exec>
          <osCommand>ssh</osCommand>
          <options>
            <uid>user</uid>
            <interrupt>ctrlc</interrupt>
          </options>
        </exec>
      </callback>
      <params>
        <param>
          <info>&amp;lt;login&amp;gt;</info>
          <help>Users login name on host</help>
          <name>user</name>
          <flag>-l</flag>
        </param>
        <param>
          <info>&amp;lt;host&amp;gt;</info>
          <help>host name or IP</help>
          <name>host</name>
        </param>
      </params>
    </cmd>

The user would enter for example

    ssh user joe host router.intranet.net

and the resulting call to the ssh executable would become

    ssh -l joe router.intranet.net

### `/clispec/$MODE/cmd/params/param/id (xs:string)`

The "id" is used for identifying the value of the parameter and can be
used as a variable in the value of a key parameter.

An example:

    <cmd name="test">
      <info/>
      <help/>
      <callback>
        <exec>
          <osCommand>/bin/echo</osCommand>
        </exec>
      </callback>
      <params>
        <param>
          <name>host</name>
          <id>h</id>
          <type><key mode="exist">/host</key></type>
        </param>
        <param>
          <name>interface</name>
          <type><key mode="exist">/host{$(h)}/interface</key></type>
        </param>
      </params>
    </cmd>

There are also three builtin variables: user, uid and gid. The id and
the builtin variables can be used in when specifying the path value of a
key parameter, and also when specifying the wd attribute of the file,
url_file, directory, and url_directory.

### `/clispec/$MODE/cmd/params/param/callback/capi`

Specifies that the parameter completion should be calculated through a
callback function. It contains exactly one "completionpoint" element.

### `/clispec/$MODE/cmd/params/param/auditLogHide`

The "auditLogHide" element specifies that the parameter should be
obfuscated in the audit log, during command display in the CLI, and in
the CLI history. This is suitable when clear text passwords are passed
as command parameters.

### `/clispec/$MODE/cmd/params/param/optional`

The "optional" element specifies that the parameter is optional and not
required. It contains zero or one "default" element. It cannot be used
inside a params of type "choice".

### `/clispec/$MODE/cmd/params/param/optional/default`

The "default" element makes it possible to specify a default value,
should the parameter be left out.

An example:

    <optional>
        <default>42</default>
    </optional>

### `/clispec/$MODE/cmd/params/any`

The "any" element specifies that any number of parameters are allowed.
It contains (in any order) one "info" element and one "help" element.

### `/clispec/$MODE/cmd/params/any/info (xs:string)`

The "info" element is a single text line describing the parameter(s)
expected.

An example:

    <cmd name="evaluate" mount="">
      <info>Evaluate an arithmetic expression</info>
      <help>Evaluate an arithmetic expression, using the expr program</help>
      <callback>
        <exec>
          <osCommand>expr</osCommand>
        </exec>
      </callback>
      <params>
        <any>
          <info>Arithmetic expression</info>
          <help>Arithmetic expression</help>
        </any>
      </params>
    </cmd>

and when we do the following in the CLI we get:

    joe@xev> eva<TAB>
    joe@xev> evaluate <TAB>
    Arithmetic expression
    joe@xev> evaluate 2 + 5
    7
    [ok][2006-08-30 14:47:17]

### `/clispec/$MODE/cmd/params/any/help (xs:string)`

The "help" element is a multi-line text string describing these
anonymous parameters. This text is shown we use the '?' character.

### `/clispec/$MODE/cmd/options`

The "options" element specifies under what circumstances the CLI command
should execute. It contains (in any order) zero or one "hidden" element,
zero or one "hideGroup" element, zero or one "denyRunAccess" element,
zero or one "notInterruptible" element, zero or one "pipeFlags" element,
zero or one "negPipeFlags" element, zero or one of "submodeCommand" and
"topModeCommand", zero or one of "displayWhen" element, and zero or one
"paginate" element.

### `/clispec/$MODE/cmd/options/hidden`

The "hidden" element makes a CLI command invisible even though it can be
evaluated if we know about its existence. This comes handy for commands
which are used for debugging or are in pre-release state.

### `/clispec/$MODE/cmd/options/hideGroup (xs:string)`

The "hideGroup" element makes a CLI command invisible and it cannot be
used even if a user knows about its existence. The command will become
visible when the hide group is 'unhidden' using the unhide command.

This mechanism correspond to the 'tailf:hidden' statement in a YANG
module.

### `/clispec/operationalMode/cmd/options/denyRunAccess`

The "denyRunAccess" element is used to restrict the possibility to run
an operational mode command from configure mode.

*Comment:* The built-in "run" command is used to execute operational
mode commands from configure mode.

### `/clispec/$MODE/cmd/options/displayWhen`

The "displayWhen" element can be used to add a displayWhen XPath
condition to a command.

Attributes:

*expr* (xpath expression)  
> The "expr" attribute is mandatory. It specifies an xpath expression.
> If the expression evaluates to true then the command is available,
> otherwise not.

*ctx* (path)  
> The "ctx" attribute is optional. If not specified the current
> editpath/mode-path is used as context node for the xpath evaluation.
> Note that the xpath expression will automatically evaluate to false if
> a display when expression is used for a top-level command and no ctx
> is specified. The path may contain variables defined in the dict.

### `/clispec/$MODE/cmd/options/notInterruptible`

The "notInterruptible" element disables \<ctrl-c\> and the execution of
the CLI command can thus not be interrupted.

### `/clispec/$MODE/cmd/options/pipeFlags`

The "pipeFlags" element is used to signal that certain pipe commands
should be made available if this command is entered.

### `/clispec/$MODE/cmd/options/negPipeFlags`

The "negPipeFlags" element is used to signal that certain pipe commands
should not be made available if this command is entered, ie it is used
to block out specific pipe commands.

By adding a "negPipeFlags" to a builtin command it will be removed if it
has the same flag set as a "pipeFlags". It works as a negation of the
"pipeFlags" to remove the command.

The "pipeFlags" will be inherited to any pipe commands that are executed
after the builtin command. Thus the "pipeFlags" can be set on the
builtin command and the "negPipeFlags" can be set on the pipe command to
remove it for a specific builtin command.

### `/clispec/$MODE/cmd/options/paginate`

The "paginate" element enables a filter for paging through CLI command
output text one screen at a time.
