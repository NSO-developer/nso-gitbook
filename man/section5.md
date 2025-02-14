# Man-pages Section 5

---

## `clispec`

`clispec` - CLI specification file format

### Description

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
[ncs.conf(5)](section5.md#ncs.conf) When the NSO daemon is started the
clispec is loaded accordingly.

The NSO daemon loads all .ccl files it finds on startup. Ie, you can
have one or more clispec files for Cisco XR (C) style CLI emulation, one
or more for Cisco IOS (I), and one or more for Juniper (J) style
emulation. If you drop several .ccl files in the loadPath all will be
loaded. The standard commands are defined in ncs.cli (available in the
NSO distribution). The intention is that we use ncs.cli as a starting
point, i.e. first we delete, reorder and replace built-in commands (if
needed) and we then proceed to add our own custom commands.

### Example

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

### Elements And Attributes

This section lists all clispec elements and their attributes including
their type (within parentheses) and default values (within square
brackets). Elements are written using a path notation to make it easier
to see how they relate to each other.

*Note:* \$MODE is either "operationalMode", "configureMode" or
"pipeCmds".

#### `/clispec`

This is the top level element which contains (in order) zero or more
"operationalMode" elements, zero or more "configureMode" element, and
zero or more "pipeCmds" elements.

#### `/clispec/$MODE`

The \$MODE ("operationalMode", "configureMode", or "pipeCmds") element
contains (in order) zero or one "modifications" elements, zero or more
"start" elements, zero or more "show" elements, and zero or more "cmd"
elements.

The "show" elements are only used in the C-style CLI.

It has a name attribute which is used to create a named custom mode. A
custom command can be defined for entering custom modes. See the
cmd/callback/mode elements below.

#### `/clispec/$MODE/modifications`

The "modifications" element describes which operations to apply to the
built-in commands. It contains (in any order) zero or more "delete",
"move", "paginate", "info", "paraminfo", "help", "paramhelp",
"confirmText", "defaultConfirmOption", "dropElem", "compactElem",
"compactStatsElem", "columnStats", "multiValue", "columnWidth",
"columnAlign", "defaultColumnAlign", "noKeyCompletion",
"noMatchCompletion", "modeName", "suppressMode", "suppressTable",
"enforceTable", "showTemplate", "showTemplateLegend",
"showTemplateEnter", "showTemplateFooter", "runTemplate",
"runTemplateLegend", "runTemplateEnter", "runTemplateFooter", "addMode",
"autocommitDelay", "keymap", "pipeFlags", "addPipeFlags",
"negPipeFlags", "legend", "footer", "suppressKeyAbbrev",
"allowKeyAbbrev", "hasRange", "suppressRange", "allowWildcard",
"suppressWildcard", "suppressValidationWarningPrompt",
"displayEmptyConfig", "displayWhen", "customRange", "completion",
"suppressKeySort" and "simpleType" elements.

#### `/clispec/$MODE/modifications/paginate`

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

#### `/clispec/$MODE/modifications/displayWhen`

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

#### `/clispec/$MODE/modifications/move`

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

#### `/clispec/$MODE/modifications/copy`

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

#### `/clispec/$MODE/modifications/delete`

The "delete" element makes it possible to delete a built-in command.
Note that commands that are auto-rendered from the data model cannot be
removed using this modification. To remove an auto-rendered command use
the 'tailf:hidden' element in the data model.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to
> delete. cmdpathType is a space-separated list of commands, pointing
> out a specific sub-command.

#### `/clispec/$MODE/modifications/pipeFlags`

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

#### `/clispec/$MODE/modifications/addPipeFlags`

The "addPipeFlags" element makes it possible to add pipe flags to the
existing list of pipe flags for a builtin command. The argument is a
space separated list of pipe flags.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to
> modify. cmdpathType is a space-separated list of commands, pointing
> out a specific sub-command.

#### `/clispec/$MODE/modifications/negPipeFlags`

The "negPipeFlags" element makes it possible to modify the neg pipe
flags of the builtin commands. The argument is a space separated list of
neg pipe flags. It will replace the builtin list.

Read how these flags works in /clispec/\$MODE/cmd/options/negPipeFlags

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to
> modify. cmdpathType is a space-separated list of commands, pointing
> out a specific sub-command.

#### `/clispec/$MODE/modifications/columnWidth`

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

#### `/clispec/$MODE/modifications/columnAlign`

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

#### `/clispec/$MODE/modifications/defaultColumnAlign`

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

#### `/clispec/$MODE/modifications/multiLinePrompt`

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

#### `/clispec/$MODE/modifications/runTemplate`

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

#### `/clispec/$MODE/modifications/runTemplateLegend`

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

#### `/clispec/$MODE/modifications/runTemplateEnter`

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

#### `/clispec/$MODE/modifications/runTemplateFooter`

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

#### `/clispec/$MODE/modifications/hasRange`

The "hasRange" element is used for specifying that a given non-integer
key element should allow range expressions

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies on which path to allow
> range expressions. pathType is a space-separated list of elements,
> pointing out a specific list element.

Note that the tailf:cli-allow-range YANG extension can be used to the
same effect directly in YANG file.

#### `/clispec/$MODE/modifications/suppressRange`

The "suppressRange" element is used for specifying that a given integer
key element should not allow range expressions

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies on which path to
> suppress range expressions. pathType is a space-separated list of
> elements, pointing out a specific list element.

Note that the tailf:cli-suppress-range YANG extension can be used to the
same effect directly in YANG file.

#### `/clispec/$MODE/modifications/customRange`

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

#### `/clispec/$MODE/modifications/customRange/callback`

The "callback" element is used for specifying which callback to invoke
for checking if a list element instance belongs to a range. It contains
a "capi" element.

Note that the tailf:cli-custom-range-actionpoint YANG extension can be
used to the same effect directly in YANG file.

#### `/clispec/$MODE/modifications/customRange/callback/capi`

The "capi" element is used for specifying the name of the callback to
invoke for checking if a list element instance belongs to a range.

Attributes:

*id* (string)  
> The "id" attribute is optional. It specifies a string which is passed
> to the callback when invoked to check if a value belongs in a range.
> This makes it possible to use the same callback at several locations
> and still keep track of which point it is invoked from.

#### `/clispec/$MODE/modifications/customRange/rangeType`

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

#### `/clispec/$MODE/modifications/allowWildcard`

The "allowWildcard" element is used for specifying that a given list
element should allow wildcard expressions in the show pattern

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies on which path to allow
> wildcard expressions. pathType is a space-separated list of elements,
> pointing out a specific list element.

Note that the tailf:cli-allow-wildcard YANG extension can be used to the
same effect directly in YANG file.

#### `/clispec/$MODE/modifications/suppressWildcard`

The "suppressWildcard" element is used for specifying that a given list
element should not allow wildcard expressions in the show pattern

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies on which path to
> suppress wildcard expressions. pathType is a space-separated list of
> elements, pointing out a specific list element.

Note that the tailf:cli-suppress-wildcard YANG extension can be used to
the same effect directly in YANG file.

#### `/clispec/$MODE/modifications/suppressValidationWarningPrompt`

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

#### `/clispec/$MODE/modifications/errorMessageRewrite`

The "errorMessageRewrite" element is used for specifying that a callback
should be invoked for possibly rewriting error messages before
displaying them.

#### `/clispec/$MODE/modifications/errorMessageRewrite/callback`

The "callback" element is used for specifying which callback to invoke
for rewriting a message. It contains a "capi" element.

#### `/clispec/$MODE/modifications/errorMessageRewrite/callback/capi`

The "capi" element is used for specifying the name of the callback to
invoke for rewriting a message.

#### `/clispec/$MODE/modifications/showPathRewrite`

The "showPathRewrite" element is used for specifying that a callback
should be invoked for possibly rewriting the show path before executing
a show command. The callback is invoked by the builtin show command.

#### `/clispec/$MODE/modifications/showPathRewrite/callback`

The "callback" element is used for specifying which callback to invoke
for rewriting the show path. It contains a "capi" element.

#### `/clispec/$MODE/modifications/showPathRewrite/callback/capi`

The "capi" element is used for specifying the name of the callback to
invoke for rewriting the show path.

#### `/clispec/$MODE/modifications/noKeyCompletion`

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

#### `/clispec/$MODE/modifications/noMatchCompletion`

The "noMatchCompletion" element tells the CLI to not provide match
completion for a given element path for show commands.

Attributes:

*path* (pathType)  
> The "path" attribute is mandatory. It specifies which path to make not
> do match completion for. pathType is a space-separated list of
> elements, pointing out a specific list element.

Note that the tailf:cli-no-match-completion YANG extension can be used
to the same effect directly in YANG file.

#### `/clispec/$MODE/modifications/suppressShowMatch`

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

#### `/clispec/$MODE/modifications/enforceTable`

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

#### `/clispec/$MODE/modifications/preformatted`

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

#### `/clispec/$MODE/modifications/exposeKeyName`

The "exposeKeyName" element makes it possible to force the C- and
I-style CLIs to expose the key name to the CLI user. The user will be
required to enter the name of the key and the key name will be displayed
when showing the configuration.

Attributes:

*path* (pathType)  
> The "src" attribute is mandatory. It specifies which leaf to expose.
> pathType is a space-separated list of elements, pointing out a
> specific list key element.

Note that the tailf:cli-expose-key-name YANG extension can be used to
the same effect directly in YANG file.

#### `/clispec/$MODE/modifications/displayEmptyConfig`

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

#### `/clispec/$MODE/modifications/suppressKeyAbbrev`

The "suppressKeyAbbrev" element makes it possible to suppress the use of
abbreviations for specific key elements.

Attributes:

*src* (pathType)  
> The "src" attribute is mandatory. It specifies which path to suppress.
> pathType is a space-separated list of elements, pointing out a
> specific list element.

Note that the tailf:cli-suppress-key-abbreviation YANG extension can be
used to the same effect directly in YANG file.

#### `/clispec/$MODE/modifications/allowKeyAbbrev`

The "allowKeyAbbrev" element makes it possible to allow the use of
abbreviations for specific key elements.

Attributes:

*src* (pathType)  
> The "src" attribute is mandatory. It specifies which path to suppress.
> pathType is a space-separated list of elements, pointing out a
> specific list element.

Note that the tailf:allow-key-abbreviation YANG extension can be used to
the same effect directly in YANG file.

#### `/clispec/$MODE/modifications/modeName/fixed (xs:string)`

Specifies a fixed mode name.

Note that the tailf:cli-mode-name YANG extension can be used to the same
effect directly in YANG file.

#### `/clispec/$MODE/modifications/modeName/capi`

Specifies that the mode name should be calculated through a callback
function. It contains exactly one "cmdpoint" element.

Note that the tailf:cli-mode-name-actionpoint YANG extension can be used
to the same effect directly in YANG file.

#### `/clispec/$MODE/modifications/modeName/capi/cmdpoint (xs:string)`

Specifies the callpoint name of the mode name function.

#### `/clispec/$MODE/modifications/autocommitDelay`

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

#### `/clispec/$MODE/modifications/suppressKeySort`

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

#### `/clispec/$MODE/modifications/legend` (xs:string)

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

#### `/clispec/$MODE/modifications/footer` (xs:string)

The "footer" element makes it possible to specify a template that will
be displayed after printing a table.

Attributes:

*path* (cmdpathType)  
> The "path" attribute is mandatory. It specifies for which path the
> footer should be printed. cmdpathType is a space-separated list of
> commands.

Note that the tailf:cli-footer YANG extension can be used to the same
effect directly in YANG file.

#### `/clispec/$MODE/modifications/help` (xs:string)

The "help" element makes it possible to add a custom help text to the
specified built-in command.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to add
> the text to. cmdpathType is a space-separated list of commands,
> pointing out a specific sub-command.

#### `/clispec/$MODE/modifications/paramhelp` (xs:string)

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

#### `/clispec/$MODE/modifications/typehelp` (xs:string)

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
DES3CBCEncryptedString, AESCFB128EncryptedString, objectRef,
bits_type_32, bits_type_64, hexValue, hexList, octetList, Gauge32,
Counter32, Counter64, and oid.

Attributes:

*type* (xs:Name)  
> The "type" attribute is mandatory. It specifies which primitive type
> to modify.

#### `/clispec/$MODE/modifications/info` (xs:string)

The "info" element makes it possible to add a custom info text to the
specified built-in command.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to hide.
> cmdpathType is a space-separated list of commands, pointing out a
> specific sub-command.

#### `/clispec/$MODE/modifications/paraminfo` (xs:string)

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

#### `/clispec/$MODE/modifications/timeout` (xs:integer\|infinity)

The "timeout" element makes it possible to add a custom command timeout
(in seconds) to the specified built-in command.

Attributes:

*src* (cmdpathType)  
> The "src" attribute is mandatory. It specifies which command to add
> the timeout to. cmdpathType is a space-separated list of commands,
> pointing out a specific sub-command.

#### `/clispec/$MODE/modifications/hide`

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

#### `/clispec/$MODE/modifications/hideGroup`

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

#### `/clispec/$MODE/modifications/submodeCommand`

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

#### `/clispec/$MODE/modifications/confirmText` (xs:string)

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

#### `/clispec/$MODE/modifications/defaultConfirmOption` (yes\|no)

The "defaultConfirmOption" element makes it possible to customize if
"yes" or "no" should be the default option, i.e. if the user just hits
ENTER, for the confirmation text added by the "confirmText" element.

If this element is not defined it defaults to "yes".

This element affects both /clispec/\$MODE/modifications/confirmText and
/clispec/\$MODE/cmd/confirmText if they have not defined their
"defaultOption" attributes.

#### `/clispec/$MODE/modifications/keymap`

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

#### `/clispec/$MODE/show/callback/capi`

The "capi" element specifies that the command is implemented using Java
API using the same API as for actions. It contains one "cmdpoint"
element and one or zero "args" element.

An example:

    <callback>
      <capi>
        <cmdpoint>adduser</cmdpoint>
      </capi>
    </callback>

#### `/clispec/$MODE/show/callback/capi/args` (argsType)

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

#### `/clispec/$MODE/show/callback/capi/cmdpoint` (xs:NCName)

The "cmdpoint" element specifies the name of the Java API action to be
called. For this to work, a actionpoint must be registered with the NSO
daemon at startup.

#### `/clispec/$MODE/show/callback/exec`

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

#### `/clispec/$MODE/show/callback/exec/osCommand` (xs:token)

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

#### `/clispec/$MODE/show/callback/exec/args` (argsType)

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

#### `/clispec/$MODE/show/callback/exec/options`

The "options" element specifies how the command is be executed. It
contains (in any order) zero or one "uid" elements, zero or one "gid"
elements, zero or one "wd" elements, zero or one "batch" elements, zero
or one "pty" element, zero or one of "interrupt" elements, zero or one
of "noInput", zero or one "raw" elements, and zero or one
"ignoreExitValue" elements.

#### `/clispec/$MODE/show/callback/exec/options/uid` (idType) \[confd\]

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

#### `/clispec/$MODE/show/callback/exec/options/gid` (idType) \[confd\]

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

#### `/clispec/$MODE/show/callback/exec/options/wd` (xs:token)

The "wd" element specifies which working directory to use when executing
the command. If not given, the command is executed from the location of
the CLI.

#### `/clispec/$MODE/show/callback/exec/options/pty` (xs:boolean)

The "pty" element specifies weather a pty should be allocated when
executing the command. The default is to allocate a pty for operational
and configure osCommands, but not for osCommands executing as a pipe
command. This behavior can be overridden with this parameter.

#### `/clispec/$MODE/show/callback/exec/options/interrupt` (interruptType) \[sigkill\]

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

#### `/clispec/$MODE/show/callback/exec/options/ignoreExitValue`

The "ignoreExitValue" element specifies that the CLI engine should
ignore the fact that the command returns a non-zero value. Normally it
signals an error on stdout if a non-zero value is returned.

#### `/clispec/$MODE/show/callback/exec/options/raw`

The "raw" element specifies that the CLI engine should set the pty in
raw mode when executing the command. This prevents normal output
processing like converting \n to \n\r.

#### `/clispec/$MODE/show/callback/exec/options/globalNoDuplicate` (xs:token)

The "globalNoDuplicate" element specifies that only one instance with
the same name can be run at any one time in the system. The command can
be started either from the CLI, the Web UI or through NETCONF.

#### `/clispec/$MODE/show/callback/exec/options/noInput` (xs:token)

The "noInput" element specifies that the command should not grab the
input stream and consume freely from that. This option should be used if
the command should not consume input characters. If not used then the
command will eat all data from the input stream and cut-and-paste may
not work as intended.

#### `/clispec/$MODE/show/options`

The "options" element specifies under what circumstances the CLI command
should execute. It contains (in any order) zero or one
"notInterruptible" elements, zero or one of "displayWhen" elements, and
zero or one "paginate" elements.

#### `/clispec/$MODE/show/options/notInterruptible`

The "notInterruptible" element disables \<ctrl-c\> and the execution of
the CLI command can thus not be interrupted.

#### `/clispec/$MODE/show/options/paginate`

The "paginate" element enables a filter for paging through CLI command
output text one screen at a time.

#### `/clispec/$MODE/show/options/displayWhen`

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

#### `/clispec/operationalMode/start`

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

#### `/clispec/operationalMode/start/callback`

The "callback" element specifies how the command is implemented, e.g. as
a OS executable or an API callback. It contains one of the elements
"capi", and "exec".

#### `/clispec/operationalMode/start/callback/capi`

The "capi" element specifies that the command is implemented using Java
API using the same API as for actions. It contains one "cmdpoint"
element.

An example:

    <callback>
      <capi>
        <cmdpoint>adduser</cmdpoint>
      </capi>
    </callback>

#### `/clispec/operationalMode/start/callback/capi/cmdpoint` (xs:NCName)

The "cmdpoint" element specifies the name of the Java API action to be
called. For this to work, a actionpoint must be registered with the NSO
daemon at startup.

#### `/clispec/operationalMode/start/callback/exec`

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

#### `/clispec/operationalMode/start/callback/exec/osCommand` (xs:token)

The "osCommand" element specifies the path to the executable or shell
script to be called. If the command is in the \$PATH (as specified when
we start the NSO daemon) the path may just be the name of the command.

The command is invoked as if it had been executed by exec(3), i.e. not
in a shell environment such as "/bin/sh -c ...".

#### `/clispec/operationalMode/start/callback/exec/args` (argsType)

The "args" element specifies the arguments to use when executing the
command specified by the "osCommand" element. argsType is a
space-separated list of argument strings. The built-in variables are:
"cwd", "user", "groups", "ip", "maapi", "uid", "gid", "tty",
"ssh_connection", "opaque", "path", "cpath", "ipath" and "licounter". In
addition the variables "spath" and "ispath" are available when a command
is executed from a show path. For example:

    <args>$(user)</args>

Will expand to the username.

#### `/clispec/operationalMode/start/callback/exec/options`

The "options" element specifies how the command is be executed. It
contains (in any order) zero or one "uid" elements, zero or one "gid"
elements, zero or one "wd" elements, zero or one "batch" elements, zero
or one of "interrupt" elements, and zero or one "ignoreExitValue"
elements.

#### `/clispec/operationalMode/start/callback/exec/options/uid` (idType) \[confd\]

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

#### `/clispec/operationalMode/start/callback/exec/options/gid` (idType) \[confd\]

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

#### `/clispec/operationalMode/start/callback/exec/options/wd` (xs:token)

The "wd" element specifies which working directory to use when executing
the command. If not given, the command is executed from the location of
the CLI.

#### `/clispec/operationalMode/start/callback/exec/options/globalNoDuplicate` (xs:token)

The "globalNoDuplicate" element specifies that only one instance with
the same name can be run at any one time in the system. The command can
be started either from the CLI, the Web UI or through NETCONF.

#### `/clispec/operationalMode/start/callback/exec/options/interrupt` (interruptType) \[sigkill\]

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

#### `/clispec/operationalMode/start/callback/exec/options/ignoreExitValue`(xs:boolean) \[false\]

The "ignoreExitValue" element specifies if the CLI engine should ignore
the fact that the command returns a non-zero value. Normally it signals
an error on stdout if a non-zero value is returned.

#### `/clispec/operationalMode/start/options`

The "options" element specifies under what circumstances the CLI command
should execute. It contains (in any order) zero or one
"notInterruptible" elements, and zero or one "paginate" elements.

#### `/clispec/operationalMode/start/options/notInterruptible`

The "notInterruptible" element disables \<ctrl-c\> and the execution of
the CLI command can thus not be interrupted.

#### `/clispec/operationalMode/start/options/paginate`

The "paginate" element enables a filter for paging through CLI command
output text one screen at a time.

#### `/clispec/$MODE/cmd`

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

#### `/clispec/$MODE/cmd/info (xs:string)`

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

#### `/clispec/$MODE/cmd/help (xs:string)`

The "help" element is a multi-line text string describing the command.
This text is shown when we use the "help" command.

An example:

    joe@xev> help monitor start
    Help for command: monitor start
    Start displaying the system log or trace a file in the background.
    We can abort the logging using the "monitor stop" command.
    joe@xev>

#### `/clispec/$MODE/cmd/timeout (xs:integer|infinity)`

The "timeout" element is a timeout for the command in seconds. Default
is infinity.

#### `/clispec/$MODE/cmd/confirmText`

See /clispec/\$MODE/modifications/confirmText

#### `/clispec/$MODE/cmd/callback`

The "callback" element specifies how the command is implemented, e.g. as
a OS executable or a CAPI callback. It contains one of the elements
"capi", "exec", "table" or "execStop".

*Note:* A command which has a callback defined may not have recursive
sub-commands. Likewise, a command which has recursive sub-commands may
not have a callback defined. A command without sub-commands must have a
callback defined.

#### `/clispec/$MODE/cmd/callback/table`

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

#### `/clispec/$MODE/cmd/callback/table/root` (xs:string)

Should be a path to a list element. All item paths in the table are
relative to this path.

#### `/clispec/$MODE/cmd/callback/table/legend` (xs:string)

Should be a legend template to display before showing the table.

#### `/clispec/$MODE/cmd/callback/table/footer` (xs:string)

Should be a footer template to display after showing the table.

#### `/clispec/$MODE/cmd/callback/table/item`

Specifies a column in the table. It contains a "header" element and a
"path" element, and optionally a "width" element.

#### `/clispec/$MODE/cmd/callback/table/item/header` (xs:string)

Header of this column in the table.

#### `/clispec/$MODE/cmd/callback/table/item/path` (xs:string)

Path to the element in this column.

#### `/clispec/$MODE/cmd/callback/table/item/width` (xs:integer)

The width in characters of this column.

#### `/clispec/$MODE/cmd/callback/table/item/align` (left\|right\|center)

The data alignment of this column.

#### `/clispec/$MODE/cmd/callback/capi`

The "capi" element specifies that the command is implemented using Java
API using the same API as for actions. It contains one "cmdpoint"
element.

An example:

    <callback>
      <capi>
        <cmdpoint>adduser</cmdpoint>
      </capi>
    </callback>

#### `/clispec/$MODE/cmd/callback/capi/cmdpoint` (xs:NCName)

The "cmdpoint" element specifies the name of the Java API action to be
called. For this to work, a actionpoint must be registered with the NSO
daemon at startup.

#### `/clispec/$MODE/cmd/callback/exec`

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

#### `/clispec/$MODE/cmd/callback/exec/osCommand` (xs:token)

The "osCommand" element specifies the path to the executable or shell
script to be called. If the command is in the \$PATH (as specified when
we start the NSO daemon) the path may just be the name of the command.

The command is invoked as if it had been executed by exec(3), i.e. not
in a shell environment such as "/bin/sh -c ...".

#### `/clispec/$MODE/cmd/callback/exec/args` (argsType)

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

#### `/clispec/$MODE/cmd/callback/exec/options`

The "options" element specifies how the command is be executed. It
contains (in any order) zero or one "uid" elements, zero or one "gid"
elements, zero or one "wd" elements, zero or one "batch" elements, zero
or one of "interrupt" elements, and zero or one "ignoreExitValue"
elements.

#### `/clispec/$MODE/cmd/callback/exec/options/uid` (idType) \[confd\]

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

#### `/clispec/$MODE/cmd/callback/exec/options/gid` (idType) \[confd\]

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

#### `/clispec/$MODE/cmd/callback/exec/options/wd` (xs:token)

The "wd" element specifies which working directory to use when executing
the command. If not given, the command is executed from the location of
the CLI.

#### `/clispec/$MODE/cmd/callback/exec/options/pty` (xs:boolean)

The "pty" element specifies weather a pty should be allocated when
executing the command. The default is to allocate a pty for operational
and configure osCommands, but not for osCommands executing as a pipe
command. This behavior can be overridden with this parameter.

#### `/clispec/$MODE/cmd/callback/exec/options/globalNoDuplicate` (xs:token)

The "globalNoDuplicate" element specifies that only one instance with
the same name can be run at any one time in the system. The command can
be started either from the CLI, the Web UI or through NETCONF.

#### `/clispec/$MODE/cmd/callback/exec/options/noInput` (xs:token)

The "noInput" element specifies that the command should not grab the
input stream and consume freely from that. This option should be used if
the command should not consume input characters. If not used then the
command will eat all data from the input stream and cut-and-paste may
not work as intended.

#### `/clispec/$MODE/cmd/callback/exec/options/batch`

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

#### `/clispec/$MODE/cmd/callback/exec/options/batch/group` (xs:NCName)

The "group" element attaches a group label to the command. The group
label is used when defining a "stop" command whose job it is to kill the
background command. Take a look at the monitor example above for better
understanding.

The stop command is defined using a "execStop" element as described
below.

#### `/clispec/$MODE/cmd/callback/exec/options/batch/prefix` (xs:NCName)

The "prefix" element specifies a string to prepend to all lines printed
by the background command. In the monitor example above, "log:" is the
chosen prefix.

#### `/clispec/$MODE/cmd/callback/exec/options/batch/noDuplicate`

The "noDuplicate" element specifies that only a single instance of this
batch command, including the given/specified parameters, can run in the
background.

#### `/clispec/$MODE/cmd/callback/exec/options/interrupt` (interruptType) \[sigkill\]

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

#### `/clispec/$MODE/cmd/callback/exec/options/ignoreExitValue`(xs:boolean) \[false\]

The "ignoreExitValue" element specifies if the CLI engine should ignore
the fact that the command returns a non-zero value. Normally it signals
an error on stdout if a non-zero value is returned.

#### `/clispec/$MODE/cmd/callback/execStop`

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

#### `/clispec/$MODE/cmd/params`

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

#### `/clispec/$MODE/cmd/params/param`

The "param" element defines the nature of a single parameter which the
CLI should prompt for. It contains (in any order) zero or one "type"
element, zero or one "info" element, zero or one "help" element, zero or
one "optional" element, zero or one "name" element, zero or one "params"
element, zero or one "auditLogHide" element, zero or one "prefix"
element, zero or one "flag" element, zero or one "id" element, zero or
one "hideGroup" element, and zero or one "simpleType" element and zero
or one "completionId" element.

#### `/clispec/$MODE/cmd/params/param/type`

The "type" element is optional and defines the parameter type. It
contains either a "enums", "enumerate", "void", "keypath", "key",
"pattern" (and zero or one "patternRaw"), "file", "url_file",
"simpleType", "xpath", "url_directory_file", "directory_file",
"url_directory" or a "directory" element. If the "type" element is not
present, the value entered by the user is passed unmodified to the
callback.

#### `/clispec/$MODE/cmd/params/param/type/enums` (enumsType)

The "enums" element defines a list of allowed enum values for the
parameter. enumsType is a space-separated list of string enums.

An example:

    <enums>for bar baz</enums>

#### `/clispec/$MODE/cmd/params/param/type/enumerate`

The "enumerate" is used to define a set of values with info text. It can
contain one of more of the element "elem".

#### `/clispec/$MODE/cmd/params/param/type/enumerate/enum`

The "enum" is used to define an enumeration value with help text. It
must contain the element "name" and optionally an "info" element and a
"hideGroup" element.

#### `/clispec/$MODE/cmd/params/param/type/enumerate/enum/name`(xs:token)

The "name" is used to define the name of an enumeration.

#### `/clispec/$MODE/cmd/params/param/type/enumerate/enum/info`(xs:string)

The "info" is used to define the info that is displayed during
completion in the CLI. The element is optional.

#### `/clispec/$MODE/cmd/params/param/type/enumerate/enum/hideGroup`(xs:string)

The "hideGroup" element makes an enum value invisible and it cannot be
used even if a user knows about its existence. The enum value will
become visible when the hide group is 'unhidden' using the unhide
command.

#### `/clispec/$MODE/cmd/params/param/type/void`

The "void" element is used to indicate that this parameter should not
prompt for a value. It can only be used when the "name" element is used.

#### `/clispec/$MODE/cmd/params/param/type/keypath` (keypathType)

The "keypath" element specifies that the parameter must be a keypath
pointing to a configuration value. Valid keypath values are: *new* or
*exist*:

*new*  
> The keypath is either an already existing configuration value or an
> instance value to be created.

*exist*  
> The keypath must be an already existing configuration value.

#### `/clispec/$MODE/cmd/params/param/type/key` (path)

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

#### `/clispec/$MODE/cmd/params/param/type/pattern` (patternType)

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

#### `/clispec/$MODE/cmd/params/param/type/patternRaw`

The "patternRaw" element is used to indicate that the parameter must be
a show command pattern but the raw argument string shall be sent to the
command callback instead of the formatted one. This prevents the case
that an exposed list key name which is an argument gets omitted by the
pattern if its key value is not included in the argument list being sent
to the command callback. It can only be used when the "pattern" element
is used.

#### `/clispec/$MODE/cmd/params/param/type/file`

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

#### `/clispec/$MODE/cmd/params/param/type/url_file`

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

#### `/clispec/$MODE/cmd/params/param/type/directory`

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

#### `/clispec/$MODE/cmd/params/param/type/url_directory`

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

#### `/clispec/$MODE/cmd/params/param/type/directory_file`

The "directory_file" element specifies that the parameter is a directory
or a file on disk. The CLI automatically enables tab completion to help
the user choose the correct directory or file.

An example:

    <directory_file/>

#### `/clispec/$MODE/cmd/params/param/type/url_directory_file`

The "url_directory_file" element specifies that the parameter is a
directory or a file on disk or an URL. The CLI automatically enables tab
completion to help the user choose the correct directory or file.

An example:

    <directory_file/>

#### `/clispec/$MODE/cmd/params/param/info (xs:string)`

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

#### `/clispec/$MODE/cmd/params/param/help (xs:string)`

The "help" element is a multi-line text string describing the parameter.
This text is shown when we use the '?' character.

#### `/clispec/$MODE/cmd/params/param/hideGroup (xs:string)`

The "hideGroup" element makes a CLI parameter invisible and it cannot be
used even if a user knows about its existence. The parameter will become
visible when the hide group is 'unhidden' using the unhide command.

This mechanism correspond to the 'tailf:hidden' statement in a YANG
module.

#### `/clispec/$MODE/cmd/params/param/name (xs:token)`

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

#### `/clispec/$MODE/cmd/params/param/prefix (xs:string)`

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

#### `/clispec/$MODE/cmd/params/param/flag (xs:string)`

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

#### `/clispec/$MODE/cmd/params/param/id (xs:string)`

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

#### `/clispec/$MODE/cmd/params/param/callback/capi`

Specifies that the parameter completion should be calculated through a
callback function. It contains exactly one "completionpoint" element.

#### `/clispec/$MODE/cmd/params/param/auditLogHide`

The "auditLogHide" element specifies that the parameter should be
obfuscated in the audit log, during command display in the CLI, and in
the CLI history. This is suitable when clear text passwords are passed
as command parameters.

#### `/clispec/$MODE/cmd/params/param/optional`

The "optional" element specifies that the parameter is optional and not
required. It contains zero or one "default" element. It cannot be used
inside a params of type "choice".

#### `/clispec/$MODE/cmd/params/param/optional/default`

The "default" element makes it possible to specify a default value,
should the parameter be left out.

An example:

    <optional>
        <default>42</default>
    </optional>

#### `/clispec/$MODE/cmd/params/any`

The "any" element specifies that any number of parameters are allowed.
It contains (in any order) one "info" element and one "help" element.

#### `/clispec/$MODE/cmd/params/any/info (xs:string)`

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

#### `/clispec/$MODE/cmd/params/any/help (xs:string)`

The "help" element is a multi-line text string describing these
anonymous parameters. This text is shown we use the '?' character.

#### `/clispec/$MODE/cmd/options`

The "options" element specifies under what circumstances the CLI command
should execute. It contains (in any order) zero or one "hidden" element,
zero or one "hideGroup" element, zero or one "denyRunAccess" element,
zero or one "notInterruptible" element, zero or one "pipeFlags" element,
zero or one "negPipeFlags" element, zero or one of "submodeCommand" and
"topModeCommand", zero or one of "displayWhen" element, and zero or one
"paginate" element.

#### `/clispec/$MODE/cmd/options/hidden`

The "hidden" element makes a CLI command invisible even though it can be
evaluated if we know about its existence. This comes handy for commands
which are used for debugging or are in pre-release state.

#### `/clispec/$MODE/cmd/options/hideGroup (xs:string)`

The "hideGroup" element makes a CLI command invisible and it cannot be
used even if a user knows about its existence. The command will become
visible when the hide group is 'unhidden' using the unhide command.

This mechanism correspond to the 'tailf:hidden' statement in a YANG
module.

#### `/clispec/operationalMode/cmd/options/denyRunAccess`

The "denyRunAccess" element is used to restrict the possibility to run
an operational mode command from configure mode.

*Comment:* The built-in "run" command is used to execute operational
mode commands from configure mode.

#### `/clispec/$MODE/cmd/options/displayWhen`

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

#### `/clispec/$MODE/cmd/options/notInterruptible`

The "notInterruptible" element disables \<ctrl-c\> and the execution of
the CLI command can thus not be interrupted.

#### `/clispec/$MODE/cmd/options/pipeFlags`

The "pipeFlags" element is used to signal that certain pipe commands
should be made available if this command is entered.

#### `/clispec/$MODE/cmd/options/negPipeFlags`

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

#### `/clispec/$MODE/cmd/options/paginate`

The "paginate" element enables a filter for paging through CLI command
output text one screen at a time.

---

## `mib_annotations`

`mib_annotations` - MIB annotations file format

### Description

This manual page describes the syntax and semantics used to write MIB
annotations. A MIB annotation file is used to modify the behavior of
certain MIB objects without having to edit the original MIB file.

MIB annotations are separate file with a .miba suffix, and is applied to
a MIB when a YANG module is generated and when the MIB is compiled. See
[ncsc(1)](section1.md#confdc).

### Syntax

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
[tailf_yang_extensions(5)](section5.md#tailf_yang_extensions).

If `modifier` is `ned-modification-dependent`, there must not by any
`value` given. The object will be generated with a
`tailf:snmp-ned-modification-dependent` statement. See
[tailf_yang_extensions(5)](section5.md#tailf_yang_extensions).

If `modifier` is `ned-set-before-row-modification`, `value` is a valid
value for the column. The object will be generated with a
`tailf:snmp-ned-set-before-row-modification` statement. See
[tailf_yang_extensions(5)](section5.md#tailf_yang_extensions).

If `modifier` is `ned-accessible-column`, `value` refers to a column by
name or subid (integer). The object will be generated with a
`tailf:snmp-ned-accessible-column` statement. See
[tailf_yang_extensions(5)](section5.md#tailf_yang_extensions).

If `modifier` is `ned-delete-before-create`, there must not by any
`value` given. The object will be generated with a
`tailf:snmp-ned-delete-before-create` statement. See
[tailf_yang_extensions(5)](section5.md#tailf_yang_extensions).

If `modifier` is `ned-recreate-when-modified`, there must not by any
`value` given. The object will be generated with a
`tailf:snmp-ned-recreate-when-modified` statement. See
[tailf_yang_extensions(5)](section5.md#tailf_yang_extensions).

### Example

An example of a MIB annotation file.

<div class="informalexample">

    # the following object does not have value
    ifStackLastChange behavior = noSuchInstance

    # this deprecated table is not implemented
    ifTestTable behavior = noSuchObject
          

</div>

### See Also

The NSO User Guide  

---

## `ncs.conf`

`ncs.conf` - NCS daemon configuration file format

### Description

Whenever we start (or reload) the NCS daemon it reads its configuration
from `./ncs.conf` or `${NCS_DIR}/etc/ncs/ncs.conf` or from the file
specified with the `-c` option, as described in [ncs(1)](section1.md#ncs).

`ncs.conf` is an XML configuration file formally defined by a YANG
model, `tailf-ncs-config.yang` as referred to in the SEE ALSO section.
This YANG file is included in the distribution. The NCS distribution
also includes a commented ncs.conf.example file.

A short example: A NCS configuration file which specifies where to find
fxs files etc, which facility to use for syslog, that the developer log
should be disabled and that the audit log should be enabled. Finally, it
also disables clear text NETCONF support:

<div class="informalexample">

    <?xml version="1.0" encoding="UTF-8"?>
    <ncs-config xmlns="http://tail-f.com/yang/tailf-ncs-config/1.0">

      <load-path>
        <dir>/etc/ncs</dir>
        <dir>.</dir>
      </load-path>

      <state-dir>/var/ncs/state</state-dir>

      <cdb>
        <db-dir>/var/ncs/cdb</db-dir>
      </cdb>

      <aaa>
        <ssh-server-key-dir>/etc/ncs/ssh</ssh-server-key-dir>
      </aaa>


      <logs>
        <syslog-config>
          <facility>daemon</facility>
        </syslog-config>
        <developer-log>
          <enabled>false</enabled>
        </developer-log>
        <audit-log>
          <enabled>true</enabled>
        </audit-log>
      </logs>

      <netconf-north-bound>
        <transport>
          <tcp>
            <enabled>false</enabled>
          </tcp>
        </transport>
      </netconf-north-bound>

      <webui>
        <transport>
          <tcp>
            <enabled>false</enabled>
            <ip>0.0.0.0</ip>
            <port>8008>/ip>
          </tcp>
        </transport>
      </webui>
    </ncs-config>

</div>

Many configuration parameters get their default values as defined in the
YANG file. Filename parameters have no default values.

### Configuration Parameters

This section lists all available configuration parameters and their type
(within parenthesis) and default values (within square brackets).
Parameters are written using a path notation to make it easier to see
how they relate to each other.

/ncs-config  
> NCS configuration.

/ncs-config/validate-utf8  
> This section defines settings which affect UTF-8 validation.

/ncs-config/validate-utf8/enabled (boolean) \[true\]  
> By default (true) NCS will validate any data modeled as 'string' to be
> valid UTF-8 and conform to yang-string.
>
> NOTE: String data from data providers and in the ncs.conf file itself
> are not validated.
>
> The possibility to disable UTF-8 validation is supplied because it can
> help in certain situations if there is data which is invalid UTF-8 or
> does not conform to yang-string. Disabling UTF-8 and yang-string
> validation allows invalid data input.
>
> It is possible to check CDB contents for invalid UTF-8 string data
> with the following
>
> ncs --cdb-validate cdb-dir
>
> Invalid data will need to be corrected manually with UTF-8 validation
> disabled.
>
> For further details see:
>
> <div class="informalexample">
>
>     o RFC 3629 UTF-8, a transformation format of ISO 10646
>       and the Unicode standard.
>     o RFC 7950 The YANG 1.1 Data Modeling Language,
>       Section 14 YANG ABNF Grammar, yang-string definition.
>
> </div>

/ncs-config/ncs-ipc-address  
> NCS listens by default on 127.0.0.1:4569 for incoming TCP connections
> from NCS client libraries, such as CDB, MAAPI, the CLI, the external
> database API, as well as commands from the ncs script (such as 'ncs
> --reload').
>
> The IP address and port can be changed. If they are changed all
> clients using MAAPI, CDB et.c. must be re-compiled to handle this. See
> the deployment user-guide on how to do this.
>
> Note that there are severe security implications involved if NCS is
> instructed to bind(2) to anything but localhost. Read more about this
> in the NCS IPC section in the System Managent Topics section of the
> User Guide. Use the IP 0.0.0.0 if you want NCS to listen(2) on all
> IPv4 addresses.

/ncs-config/ncs-ipc-address/ip (ipv4-address \| ipv6-address) \[127.0.0.1\]  
> The IP address which NCS listens on for incoming connections from the
> Java library

/ncs-config/ncs-ipc-address/port (port-number) \[4569\]  
> The port number which NCS listens on for incoming connections from the
> Java library

/ncs-config/ncs-ipc-extra-listen-ip (ipv4-address \| ipv6-address)  
> This parameter may be given multiple times.
>
> A list of additional IPs to which we wish to bind the NCS IPC
> listener. This is useful if we don't want to use the wildcard 0.0.0.0
> address in order to never expose the NCS IPC to certain interfaces.

/ncs-config/ncs-ipc-access-check  
> NCS can be configured to restrict access for incoming connections to
> the IPC listener sockets. The access check requires that connecting
> clients prove possession of a shared secret.

/ncs-config/ncs-ipc-access-check/enabled (boolean) \[false\]  
> If set to 'true', access check for IPC connections is enabled.

/ncs-config/ncs-ipc-access-check/filename (string)  
> This parameter is mandatory.
>
> filename is the full path to a file containing the shared secret for
> the IPC access check. The file should be protected via OS file
> permissions, such that it can only be read by the NCS daemon and
> client processes that are allowed to connect to the IPC listener
> sockets.

/ncs-config/enable-shared-memory-schema (boolean) \[true\]  
> enabled is either true or false. If true, then a C program will be
> started that loads the schema into shared memory (which then can be
> accessed by e.g Python)

/ncs-config/shared-memory-schema-path (string)  
> Path to the shared memory file holding the schema. If left
> unconfigured, it defaults to 'state/schema' in the run-directory. Note
> that if the value is configured, it must be specified as an absolute
> path (i.e containing the root directory and all other subdirectories
> leading to the executable).

/ncs-config/load-path/dir (string)  
> This parameter may be given multiple times.
>
> The load-path element contains any number of dir elements. Each dir
> element points to a directory path on disk which is searched for
> compiled and imported YANG files (.fxs files) and compiled clispec
> files (.ccl files) during daemon startup. NCS also searches the load
> path for packages at initial startup, or when requested by the
> /packages/reload action.

/ncs-config/enable-compressed-schema (boolean) \[false\]  
> If set to true, NCS's internal storage of the schema information from
> the .fxs files will be compressed. This will reduce the memory usage
> for large data models, but may also cause reduced performance when
> looking up the schema information. The trade off depends on the total
> amount of schema information and typical usage patterns, thus the
> effect should be evaluated before enabling this functionality.

/ncs-config/compressed-schema-level (compressed-schema-level-type) \[1\]  
> Controls the level of compression when enable-compressed-schema is set
> to true. Setting the value to 1 results in more aggressive compression
> at the cost of performance, 2 results in slightly less memory saved,
> but at higher performance.

/ncs-config/state-dir (string)  
> This parameter is mandatory.
>
> This is where NCS writes persistent state data. Currently it is used
> to store a private copy of all packages found in the load path, in a
> directory tree rooted at 'packages-in-use.cur' (also referenced by a
> symlink 'packages-in-use'). It is also used for the state files
> 'running.invalid', which exists only if the running database status is
> invalid, which it will be if one of the database implementation fails
> during the two-phase commit protocol, and 'global.data' which is used
> to store some data that needs to be retained across reboots, and the
> high-availabillity raft storage consisting of snapshots and file log.

/ncs-config/commit-retry-timeout (xs:duration \| infinity) \[infinity\]  
> Commit timeout in the NCS backplane. This timeout controls for how
> long the commit operation in the CLI and the JSON-RPC API will attempt
> to complete the operation when some other entity is locking the
> database, e.g. some other commit is in progress or some managed object
> is locking the database.

/ncs-config/max-validation-errors (uint32 \| unbounded) \[1\]  
> Controls how many validation errors are collected and presented to the
> user at a time.

/ncs-config/transaction-lock-time-violation-alarm/timeout (xs:duration \| infinity) \[infinity\]  
> Timeout before an alarm is raised due to a transaction taking too much
> time inside of the critical section. 'infinity' or PT0S, i.e. 0
> seconds, indicates that the alarm will never be raised.

/ncs-config/notifications  
> This section defines settings which affect notifications.
>
> NETCONF and RESTCONF northbound notification settings

/ncs-config/notifications/event-streams  
> Lists all available notification event streams.

/ncs-config/notifications/event-streams/stream  
> Parameters for a single notification event stream.

/ncs-config/notifications/event-streams/stream/name (string)  
> The name attached to a specific event stream.

/ncs-config/notifications/event-streams/stream/description (string)  
> This parameter is mandatory.
>
> A descriptive text attached to a specific event stream.

/ncs-config/notifications/event-streams/stream/replay-support (boolean)  
> This parameter is mandatory.
>
> Signals if replay support is available for a specific event stream.

/ncs-config/notifications/event-streams/stream/builtin-replay-store  
> Parameters for the built in replay store for this event stream.
>
> If replay support is enabled NCS automatically stores all
> notifications on disk ready to be replayed should a NETCONF manager or
> RESTCONF event notification subscriber ask for logged notifications.
> The replay store uses a set of wrapping log files on disk (of a
> certain number and size) to store the notifications.
>
> The max size of each wrap log file (see below) should not be too
> large. This to acheive fast replay of notifications in a certain time
> range. If possible use a larger number of wrap log files instead.
>
> If in doubt use the recommended settings (see below).

/ncs-config/notifications/event-streams/stream/builtin-replay-store/enabled (boolean) \[false\]  
> If set to 'false', the application must implement its own replay
> support.

/ncs-config/notifications/event-streams/stream/builtin-replay-store/dir (string)  
> This parameter is mandatory.
>
> The wrapping log files will be put in this disk location

/ncs-config/notifications/event-streams/stream/builtin-replay-store/max-size (tailf:size)  
> This parameter is mandatory.
>
> The max size of each log wrap file. The recommended setting is
> approximately S10M.

/ncs-config/notifications/event-streams/stream/builtin-replay-store/max-files (int64)  
> This parameter is mandatory.
>
> The max number of log wrap files. The recommended setting is around 50
> files.

/ncs-config/opcache  
> This section defines settings which affect the behavior of the
> operational data cache.

/ncs-config/opcache/enabled (boolean) \[false\]  
> If set to 'true', the cache is enabled.

/ncs-config/opcache/timeout (uint64)  
> This parameter is mandatory.
>
> The amount of time to keep data in the cache, in seconds.

/ncs-config/hide-group  
> Hide groups that can be unhidden must be listed here. There can be
> zero, one or many hide-group entries in the configuraion.
>
> If a hide group does not have a hide-group entry, then it cannot be
> unhidden using the CLI 'unhide' command. However, it is possible to
> add a hide-group entry to the ncs.conf file and then use ncs --reload
> to make it available in the CLI. This may be useful to enable for
> example a diagnostics hide groups that you do not even want accessible
> using a password.

/ncs-config/hide-group/name (string)  
> Name of hide group. This name should correspond to a hide group name
> defined in some YANG module with 'tailf:hidden'.

/ncs-config/hide-group/password (tailf:md5-digest-string) \[\]  
> A password can optionally be specified for a hide group. If no
> password or callback is given then the hide group can be unhidden
> without giving a password.
>
> If a password is specified then the hide group cannot be enabled
> unless the password is entered.
>
> To completely disable a hide group, ie make it impossible to unhide
> it, remove the entire hide-group container for that hide group.

/ncs-config/hide-group/callback (string)  
> A callback can optionally be specified for a hide group. If no
> callback or password is given then the hide group can be unhidden
> without giving a password.
>
> If a callback is specified then the hide group cannot be enabled
> unless a password is entered and the successfully verifies the
> password. The callback receives both the name of the hide group, the
> name of the user issuing the unhide command, and the passowrd.
>
> Using a callback it is possible to have short lived unhide passwords
> and per-user unhide passwords.

/ncs-config/cdb/db-dir (string)  
> db-dir is the directory on disk which CDB use for its storage and any
> temporary files being used. It is also the directory where CDB
> searches for initialization files.

/ncs-config/cdb/init-path/dir (string)  
> This parameter may be given multiple times.
>
> The init-path can contain any number of dir elements. Each dir element
> points to a directory path which CDB will search for .xml files before
> looking in db-dir. The directories are searched in the order they are
> listed.

/ncs-config/cdb/client-timeout (xs:duration \| infinity) \[infinity\]  
> Specifies how long CDB should wait for a response to e.g. a
> subscription notification before considering a client unresponsive. If
> a client fails to call Cdb.syncSubscriptionSocket() within the timeout
> period, CDB will syslog this failure and then, considering the client
> dead, close the socket and proceed with the subscription
> notifications. If set to infinity, CDB will never timeout waiting for
> a response from a client.

/ncs-config/cdb/subscription-replay/enabled (boolean) \[false\]  
> If enabled it is possible to request a replay of the previous
> subscription notification to a new cdb subscriber.

/ncs-config/cdb/journal-compaction (automatic \| manual) \[automatic\]  
> DEPRECATED - use /ncs-config/compaction/journal-compaction instead.
>
> Controls the way the CDB configuration store does its journal
> compaction. Never set to anything but the default 'automatic' unless
> there is an external mechanism which controls the compaction using the
> cdb_initiate_journal_compaction() API call.

/ncs-config/cdb/operational  
> Operational data can either be implemented by external callbacks, or
> stored in CDB (or a combination of both). The operational datastore is
> used when data is to be stored in CDB.

/ncs-config/cdb/operational/db-dir (string)  
> db-dir is the directory on disk which CDB operational uses for its
> storage and any temporary files being used. If left unset (default)
> the same directory as db-dir for CDB is used.

/ncs-config/cdb/snapshot  
> The snapshot datastore is used by the commit queue to calculate the
> southbound diff towards the devices outside of the transaction lock.

/ncs-config/cdb/snapshot/pre-populate (boolean) \[false\]  
> This parameter controls if the snapshot datastore should be
> pre-populated during upgrade. Switching this on or off implies
> different trade-offs.
>
> If 'false', NCS is optimized for using normal transaction commits. The
> snapshot is populated in a lazy manner (when a device is committed
> through the commit queue for the first time). The drawback is that
> this commit will suffer performance wise, which is especially true for
> devices with large configurations. Subsequent commits on the same
> devices will not have the same penalty.
>
> If 'true', NCS is optimized for systems using the commit queue
> extensively. This will lead to better performance when committing
> using the commit queue with no additional penalty for the first time
> commits. The drawbacks are that upgrade times will increase and an
> almost doubling of NCS memory consumption.

/ncs-config/compaction/journal-compaction (automatic \| manual) \[automatic\]  
> Controls the way the CDB files does its journal compaction. Never set
> to anything but the default 'automatic' unless there is an external
> mechanism which controls the compaction using the
> cdb_initiate_journal_compaction() API call.

/ncs-config/compaction/file-size-relative (uint8) \[50\]  
> States the threshold in percentage of size increase in a CDB file
> since the last compaction. By default, compaction is initiated if a
> CDB file size grows more than 50 percent since the last compaction. If
> set to 0, the threshold will be disabled.

/ncs-config/compaction/num-node-relative (uint8) \[50\]  
> States the threshold in percentage of number of node increase in a CDB
> file since the last compaction. By default, compaction is initiated if
> the number of nodes grows more than 50 percent since the last
> compaction. If set to 0, the threshold will be disabled.

/ncs-config/compaction/file-size-absolute (tailf:size)  
> States the threshold of size increase in a CDB file since the last
> compaction. Compaction is initiated if a CDB file size grows more than
> file-size-absolute since the last compaction.

/ncs-config/compaction/num-transactions (uint16)  
> States the threshold of number of transactions committed in a CDB file
> since the last compaction. Compaction is initiated if the number of
> transactions are greater than num-transactions since the last
> compaction.

/ncs-config/compaction/delayed-compaction-timeout (xs:duration) \[PT5S\]  
> Controls for how long CDB will delay the compaction before initiating.
> Note that once the timeout elapses, compaction will be initiated only
> if no new transaction occurs during the delay time.

/ncs-config/encrypted-strings  
> encrypted-strings defines keys used to encrypt strings adhering to the
> types tailf:des3-cbc-encrypted-string,
> tailf:aes-cfb-128-encrypted-string and
> tailf:aes-256-cfb-128-encrypted-string.

/ncs-config/encrypted-strings/external-keys  
> Configuration of an external command that will provide the keys used
> for encryptedStrings. When set no keys for encrypted-strings can be
> set in the configuration.

/ncs-config/encrypted-strings/external-keys/command (string)  
> This parameter is mandatory.
>
> Path to command executed to output keys.

/ncs-config/encrypted-strings/external-keys/command-timeout (xs:duration \| infinity) \[PT60S\]  
> Command timeout. Timeout is measured between complete lines read from
> the output.

/ncs-config/encrypted-strings/external-keys/command-argument (string)  
> Argument available in external-keys command as the environment
> variable NCS_EXTERNAL_KEYS_ARGUMENT.

/ncs-config/encrypted-strings/DES3CBC  
> In the DES3CBC case three 64 bits (8 bytes) keys and a random initial
> vector are used to encrypt the string. The initVector leaf is only
> used when upgrading from versions before NCS-4.2, but it is kept for
> backward compatibility reasons.

/ncs-config/encrypted-strings/DES3CBC/key1 (hex8-value-type)  
> This parameter is mandatory.

/ncs-config/encrypted-strings/DES3CBC/key2 (hex8-value-type)  
> This parameter is mandatory.

/ncs-config/encrypted-strings/DES3CBC/key3 (hex8-value-type)  
> This parameter is mandatory.

/ncs-config/encrypted-strings/DES3CBC/initVector (hex8-value-type)  

/ncs-config/encrypted-strings/AESCFB128  
> In the AESCFB128 case one 128 bits (16 bytes) key and a random initial
> vector are used to encrypt the string. The initVector leaf is only
> used when upgrading from versions before NCS-4.2, but it is kept for
> backward compatibility reasons.

/ncs-config/encrypted-strings/AESCFB128/key (hex16-value-type)  
> This parameter is mandatory.

/ncs-config/encrypted-strings/AESCFB128/initVector (hex16-value-type)  

/ncs-config/encrypted-strings/AES256CFB128  
> In the AES256CFB128 case one 256 bits (32 bytes) key and a random
> initial vector are used to encrypt the string.

/ncs-config/encrypted-strings/AES256CFB128/key (hex32-value-type)  
> This parameter is mandatory.

/ncs-config/crypt-hash  
> crypt-hash specifies how cleartext values should be hashed for leafs
> of the types ianach:crypt-hash, tailf:sha-256-digest-string, and
> tailf:sha-512-digest-string.

/ncs-config/crypt-hash/algorithm (md5 \| sha-256 \| sha-512) \[md5\]  
> algorithm can be set to one of the values 'md5', 'sha-256', or
> 'sha-512', to choose the corresponding hash algorithm for hashing of
> cleartext input for the ianach:crypt-hash type.

/ncs-config/crypt-hash/rounds (crypt-hash-rounds-type) \[5000\]  
> For the 'sha-256' and 'sha-512' algorithms for the ianach:crypt-hash
> type, and for the tailf:sha-256-digest-string and
> tailf:sha-512-digest-string types, 'rounds' specifies how many times
> the hashing loop should be executed. If a value other than the default
> 5000 is specified, the hashed format will have 'rounds=N\$', where N
> is the specified value, prepended to the salt. This parameter is
> ignored for the 'md5' algorithm for ianach:crypt-hash.

/ncs-config/logs/syslog-config  
> Shared settings for how to log to syslog. Logs (see below) can be
> configured to log to file and/or syslog. If a log is configured to log
> to syslog, the settings under /ncs-config/logs/syslog-config are used.

/ncs-config/logs/syslog-config/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32) \[daemon\]  
> This facility setting is the default facility. It's also possible to
> set individual facilities in the different logs below.

/ncs-config/logs/trace-id (boolean) \[true\]  
> Enable a per request unique trace id, included in headers and entries
> for relevant logs

/ncs-config/logs/ncs-log  
> ncs-log is NCS's daemon log. Check this log for startup problems of
> the NCS daemon itself. This log is not rotated, i.e. use logrotate(8).

/ncs-config/logs/ncs-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/ncs-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/ncs-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/ncs-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/ncs-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/ncs-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/developer-log  
> developer-log is a debug log for troubleshooting user-written Java
> code. Enable and check this log for problems with validation code etc.
> This log is enabled by default. In all other regards it can be
> configured as ncs-log. This log is not rotated, i.e. use logrotate(8).

/ncs-config/logs/developer-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/developer-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/developer-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/developer-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/developer-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/developer-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/developer-log-level (error \| info \| trace) \[info\]  
> Controls which level of developer messages are printed in the
> developer log.

/ncs-config/logs/upgrade-log  
> Contains information about CDB upgrade. This log is enabled by default
> and is not rotated, i.e. use logrotate(8).

/ncs-config/logs/upgrade-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/upgrade-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/upgrade-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/upgrade-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/upgrade-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/upgrade-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/audit-log  
> audit-log is an audit log recording successful and failed logins to
> the NCS backplane and also user operations performed from the CLI or
> northbound interfaces. This log is enabled by default. In all other
> regards it can be configured as /ncs-config/logs/ncs-log. This log is
> not rotated, i.e. use logrotate(8).

/ncs-config/logs/audit-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/audit-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/audit-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/audit-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/audit-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/audit-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/audit-log-commit (boolean) \[false\]  
> Controls whether the audit log should include messages about the
> resulting configuration changes for each commit to the running data
> store.

/ncs-config/logs/audit-log-commit-defaults (boolean) \[false\]  
> Controls whether the audit log should include messages about default
> values being set. Enabling this may have a performance impact.

/ncs-config/logs/audit-network-log  
> audit-network-log is an audit log recording southbound traffic towards
> devices.

/ncs-config/logs/audit-network-log/enabled (boolean) \[false\]  
> If set to true, the log is enabled.

/ncs-config/logs/audit-network-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/audit-network-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/audit-network-log/syslog  
> Syslog is not available for audit-network-log. This parameter has no
> effect.

/ncs-config/logs/audit-network-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/audit-network-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/audit-network-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/raft-log  
> The raft-log is used for tracing raft state and events written by the
> WhatsApp Raft library used by HA Raft. This log is not rotated, i.e.
> use logrotate(8).

/ncs-config/logs/raft-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/raft-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/raft-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/raft-log/syslog  
> Syslog is not available for raft-log. This parameter has no effect.

/ncs-config/logs/raft-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/raft-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/raft-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/raft-log/level (error \| info \| trace) \[info\]  
> The severity level for the message to be logged.

/ncs-config/logs/netconf-log  
> netconf-log is a log for troubleshooting northbound NETCONF
> operations, such as checking why e.g. a filter operation didn't return
> the data requested. This log is enabled by default. In all other
> regards it can be configured as /ncs-config/logs/ncs-log. This log is
> not rotated, i.e. use logrotate(8).

/ncs-config/logs/netconf-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/netconf-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/netconf-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/netconf-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/netconf-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/netconf-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/netconf-log/log-reply-status (boolean) \[false\]  
> When set to 'true', NCS extends netconf log with rpc-reply status
> ('ok' or 'error').

/ncs-config/logs/jsonrpc-log  
> jsonrpc-log is a log of JSON-RPC traffic. This log is enabled by
> default. In all other regards it can be configured as
> /ncs-config/logs/ncs-log. This log is not rotated, i.e. use
> logrotate(8).

/ncs-config/logs/jsonrpc-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/jsonrpc-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/jsonrpc-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/jsonrpc-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/jsonrpc-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/jsonrpc-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/snmp-log/enabled (boolean) \[true\]  
> If set to true, the log is enabled.

/ncs-config/logs/snmp-log/file/name (string)  
> Name is the full path to the actual log file.

/ncs-config/logs/snmp-log/file/enabled (boolean) \[false\]  
> If set to true, file logging is enabled

/ncs-config/logs/snmp-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/snmp-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/snmp-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/snmp-log-level (error \| info) \[info\]  
> Controls which level of SNMP pdus are printed in the SNMP log. The
> value 'error' means that only PDUs with error-status not equal to
> 'noError' are printed.

/ncs-config/logs/webui-browser-log  
> Deprecated. Should not be used.

/ncs-config/logs/webui-browser-log/enabled (boolean) \[false\]  
> Deprecated. Should not be used.

/ncs-config/logs/webui-browser-log/filename (string)  
> This parameter is mandatory.
>
> Deprecated. Should not be used.

/ncs-config/logs/webui-access-log  
> webui-access-log is an access log for the embedded NCS Web server.
> This file adheres to the Common Log Format, as defined by Apache and
> others. This log is not enabled by default and is not rotated, i.e.
> use logrotate(8).

/ncs-config/logs/webui-access-log/enabled (boolean) \[false\]  
> If set to 'true', the access log is used.

/ncs-config/logs/webui-access-log/traffic-log (boolean) \[false\]  
> Is either true or false. If true, all HTTP(S) traffic towards the
> embedded Web server is logged in a log file named traffic.trace. The
> log file can be used to debugging JSON-RPC/REST/RESTCONF. Beware: Do
> not use this log in a production setting. This log is not enabled by
> default and is not rotated, i.e. use logrotate(8).

/ncs-config/logs/webui-access-log/dir (string)  
> This parameter is mandatory.
>
> The path to the directory whereas the access log should be written to.

/ncs-config/logs/webui-access-log/syslog/enabled (boolean) \[false\]  
> If set to true, syslog messages are sent.

/ncs-config/logs/webui-access-log/syslog/facility (daemon \| authpriv \| local0 \| local1 \| local2 \| local3 \| local4 \| local5 \| local6 \| local7 \| uint32)  
> This optional value overrides the
> /ncs-config/logs/syslog-config/facility for this particular log.

/ncs-config/logs/netconf-trace-log  
> netconf-trace-log is a log for understanding and troubleshooting
> northbound NETCONF protocol interactions. When this log is enabled,
> all NETCONF traffic to and from NCS is stored to a file. By default,
> all XML is pretty-printed. This will slow down the NETCONF server, so
> be careful when enabling this log. This log is not rotated, i.e. use
> logrotate(8).
>
> Please note that this means that everything, including potentially
> sensitive data, is logged. No filtering is done.

/ncs-config/logs/netconf-trace-log/enabled (boolean) \[false\]  
> If set to 'true', all NETCONF traffic is logged. NOTE: This
> configuration parameter takes effect for new sessions while existing
> sessions will be terminated.

/ncs-config/logs/netconf-trace-log/filename (string)  
> This parameter is mandatory.
>
> The name of the file where the NETCONF traffic trace log is written.

/ncs-config/logs/netconf-trace-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/netconf-trace-log/format (pretty \| raw) \[pretty\]  
> The value 'pretty' means that the XML data is pretty-printed. The
> value 'raw' means that it is not.

/ncs-config/logs/xpath-trace-log  
> xpath-trace-log is a log for understanding and troubleshooting XPath
> evaluations. When this log is enabled, the execution of all XPath
> queries evaluated by NCS are logged to a file.
>
> This will slow down NCS, so be careful when enabling this log. This
> log is not rotated, i.e. use logrotate(8).

/ncs-config/logs/xpath-trace-log/enabled (boolean) \[false\]  
> If set to 'true', all XPath execution is logged.

/ncs-config/logs/xpath-trace-log/filename (string)  
> The name of the file where the XPath trace log is written

/ncs-config/logs/xpath-trace-log/external/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', send log data to
> external command for processing.

/ncs-config/logs/transaction-error-log  
> transaction-error-log is a log for collecting information on failed
> transactions that lead to either CDB boot error or runtime transaction
> failure.

/ncs-config/logs/transaction-error-log/enabled (boolean) \[false\]  
> If 'true' on CDB boot error a traceback of the failed load will be
> logged or in case of a runtime transaction error the transaction
> information will be dumped to the log.

/ncs-config/logs/transaction-error-log/filename (string)  
> The name of the file where the transaction error log is written.

/ncs-config/logs/transaction-error-log/external/enabled (boolean) \[false\]  
> If 'true', send log data to external command for processing.

/ncs-config/logs/ext-log  
> ext-log is a log for logging events related to external log processing
> such as process execution, unexpected termination etc.
>
> This log is not rotated, i.e. use logrotate(8).

/ncs-config/logs/ext-log/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', external log
> processing events is logged.

/ncs-config/logs/ext-log/filename (string)  
> This parameter is mandatory.
>
> The name of the file where the log for external log processing is
> written.

/ncs-config/logs/ext-log/level (uint8) \[2\]  
> The log level of extLog. 0 is the most critical, 7 is trace logging.

/ncs-config/logs/error-log  
> error-log is an error log used for internal logging from the NCS
> daemon. It is used for troubleshooting the NCS daemon itself, and
> should normally be disabled. This log is rotated by the NCS daemon
> (see below).

/ncs-config/logs/error-log/enabled (boolean) \[false\]  
> If set to 'true', error logging is performed.

/ncs-config/logs/error-log/filename (string)  
> This parameter is mandatory.
>
> filename is the full path to the actual log file. This parameter must
> be set if the error-log is enabled.

/ncs-config/logs/error-log/max-size (tailf:size) \[S1M\]  
> max-size is the maximum size of an individual log file before it is
> rotated. Log filenames are reused when five logs have been exhausted.

/ncs-config/logs/error-log/debug/enabled (boolean) \[false\]  

/ncs-config/logs/error-log/debug/level (uint16) \[2\]  

/ncs-config/logs/error-log/debug/tag (string)  
> This parameter may be given multiple times.

/ncs-config/logs/progress-trace  
> progress-trace is used for tracing progress events emitted by
> transactions and actions in the system. It provides useful information
> for debugging, diagnostics and profiling. Enabling this setting allows
> progress trace files to be written to the configured directory. What
> data to be emitted are configured in /progress/trace.

/ncs-config/logs/progress-trace/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', progress trace files
> are written to the configured directory.

/ncs-config/logs/progress-trace/dir (string)  
> This parameter is mandatory.
>
> The directory path to the location of the progress trace files.

/ncs-config/logs/external/enabled (boolean) \[false\]  

/ncs-config/logs/external/command (string)  
> This parameter is mandatory.
>
> Path to command executed to process log data from stdin.

/ncs-config/logs/external/restart/max-attempts (uint8) \[3\]  
> Max restart attempts within period, includes time used by delay. If
> maxAttempts restarts is exceeded the external processing will be
> disabled until a reload is issued or the configuration is changed.

/ncs-config/logs/external/restart/delay (xs:duration \| infinity) \[PT1S\]  
> Delay between start attempts if the command failed to start or stopped
> unexpectedly.

/ncs-config/logs/external/restart/period (xs:duration \| infinity) \[PT30S\]  
> Period of time start attempts are counted in. Period is reset if a
> command runs for more than period amount of time.

/ncs-config/sort-transactions (boolean) \[true\]  
> This parameter controls how NCS lists newly created, not yet committed
> list entries. If this value is set to 'false', NCS will list all new
> elements before listing existing data.
>
> If this value is set to 'true', NCS will merge new and existing
> entries, and provide one sorted view of the data. This behavior works
> well when CDB is used to store configuration data, but if an external
> data provider is used, NCS does not know the sort order, and can thus
> not merge the new entries correctly. If an external data provider is
> used for configuration data, and the sort order differs from CDB's
> sort order, this parameter should be set to 'false'.

/ncs-config/enable-inactive (boolean) \[true\]  
> This parameter controls if the NCS's inactive feature should be
> enabled or not. When NCS is used to control Juniper routers, this
> feature is required

/ncs-config/enable-origin (boolean) \[false\]  
> This parameter controls if NCS's NMDA origin feature should be enabled
> or not.

/ncs-config/session-limits  
> Parameters for limiting concurrent access to NCS.

/ncs-config/session-limits/max-sessions (uint32 \| unbounded) \[unbounded\]  
> Puts a limit on the total number of concurrent sessions to NCS.

/ncs-config/session-limits/session-limit  
> Parameters for limiting concurrent access for a specific context to
> NCS. There can be multiple instances of this container element, each
> one specifying parameters for a specific context.

/ncs-config/session-limits/session-limit/context (string)  
> The context is either one of cli, netconf, webui, snmp or it can be
> any other context string defined through the use of MAAPI. As an
> example, if we use MAAPI to implement a CORBA interface to NCS, our
> MAAPI program could send the string 'corba' as context.

/ncs-config/session-limits/session-limit/max-sessions (uint32 \| unbounded)  
> This parameter is mandatory.
>
> Puts a limit on the total number of concurrent sessions to NCS.

/ncs-config/session-limits/max-config-sessions (uint32 \| unbounded) \[unbounded\]  
> Puts a limit on the total number of concurrent configuration sessions
> to NCS.

/ncs-config/session-limits/config-session-limit  
> Parameters for limiting concurrent read-write transactions for a
> specific context to NCS. There can be multiple instances of this
> container element, each one specifying parameters for a specific
> context.

/ncs-config/session-limits/config-session-limit/context (string)  
> The context is either one of cli, netconf, webui, snmp, or it can be
> any other context string defined through the use of MAAPI. As an
> example, if we use MAAPI to implement a CORBA interface to NCS, our
> MAAPI program could send the string 'corba' as context.

/ncs-config/session-limits/config-session-limit/max-sessions (uint32 \| unbounded)  
> This parameter is mandatory.
>
> Puts a limit to the total number of concurrent configuration sessions
> to NCS for the corresponding context.

/ncs-config/transaction-limits  
> Parameters for limiting the number of concurrent transactions being
> applied in NCS.

/ncs-config/transaction-limits/max-transactions (uint8 \| unbounded \| logical-processors) \[logical-processors\]  
> Puts a limit on the total number of concurrent transactions being
> applied towards the running datastore.
>
> If this value is too high it can cause performance degradation due to
> increased contention on system internals and resources.
>
> In some cases, especially when transactions are prone to conflicting
> or other parts of the system has high load, the optimal value for this
> setting can be smaller than the number of logical processors.

/ncs-config/transaction-limits/scheduling-mode (relaxed \| strict) \[relaxed\]  

/ncs-config/parser-limits  
> Parameters for limiting parsing of XML data.

/ncs-config/parser-limits/max-processing-instruction-length (uint32 \| unbounded \| model) \[32768\]  
> Maximum number of bytes for processing instructions.

/ncs-config/parser-limits/max-tag-length (uint32 \| unbounded \| model) \[1024\]  
> Maximum number of bytes for tag names excluding namespace prefix.

/ncs-config/parser-limits/max-attribute-length (uint32 \| unbounded \| model) \[1024\]  
> Maximum number of bytes for attribute names including namespace
> prefix.

/ncs-config/parser-limits/max-attribute-value-length (uint32 \| unbounded) \[unbounded\]  
> Maximum number of bytes for attribute values in escaped form.

/ncs-config/parser-limits/max-attribute-count (uint32 \| unbounded \| model) \[64\]  
> Maximum number of attributes on a single tag.

/ncs-config/parser-limits/max-xmlns-prefix-length (uint32 \| unbounded) \[1024\]  
> Maximum number of bytes for xmlns prefix.

/ncs-config/parser-limits/max-xmlns-valueLength (uint32 \| unbounded \| model) \[1024\]  
> Maximum number of bytes for a namespace value in escaped form.

/ncs-config/parser-limits/max-xmlns-count (uint32 \| unbounded) \[1024\]  
> Maximum number of xmlns declarations on a single tag.

/ncs-config/parser-limits/max-data-length (uint32 \| unbounded) \[unbounded\]  
> Maximum number of bytes of continuous data.

/ncs-config/aaa  
> The login procedure to NCS is fully described in the NCS User Guide.

/ncs-config/aaa/ssh-login-grace-time (xs:duration) \[PT10M\]  
> NCS servers close ssh connections after this time if the client has
> not successfully authenticated itself by then. If the value is 0,
> there is no time limit for client authentication.
>
> This is a global value for all ssh servers in NCS.
>
> Modification of this value will only affect ssh connections that are
> established after the modification has been done.

/ncs-config/aaa/ssh-max-auth-tries (uint32 \| unbounded) \[unbounded\]  
> NCS servers close ssh connections when the client has made this number
> of unsuccessful authentication attempts.
>
> This is a global value for all ssh servers in NCS.
>
> Modification of this value will only affect ssh connections that are
> established after the modification has been done.

/ncs-config/aaa/ssh-server-key-dir (string)  
> ssh-server-key-dir is the directory file path where the keys used by
> the NCS SSH daemon are found. This parameter must be set if SSH is
> enabled for NETCONF or the CLI. If SSH is enabled, the server keys
> used by NCS are om the same format as the server keys used by openssh,
> i.e. the same format as generated by 'ssh-keygen'
>
> Only DSA- and RSA-type keys can be used with the NCS SSH daemon, as
> generated by 'ssh-keygen' with the '-t dsa' and '-t rsa' switches,
> respectively.
>
> The key must be stored with an empty passphrase, and with the name
> 'ssh_host_dsa_key' if it is a DSA-type key, and with the name
> 'ssh_host_rsa_key' if it is an RSA-type key.
>
> The SSH server will advertise support for those key types for which
> there is a key file available and for which the required algorithm is
> enabled, see the /ncs-config/ssh/algorithms/server-host-key leaf.

/ncs-config/aaa/ssh-pubkey-authentication (none \| local \| system) \[system\]  
> Controls how the NCS SSH daemon locates the user keys for public key
> authentication.
>
> If set to 'none', public key authentication is disabled.
>
> If set to 'local', and the user exists in /aaa/authentication/users,
> the keys in the user's 'ssh_keydir' directory are used.
>
> If set to 'system', the user is first looked up in
> /aaa/authentication/users, but only if
> /ncs-config/aaa/local-authentication/enabled is set to 'true' - if
> local-authentication is disabled, or the user does not exist in
> /aaa/authentication/users, but the user does exist in the OS password
> database, the keys in the user's \$HOME/.ssh directory are used.

/ncs-config/aaa/default-group (string)  
> If the group of a user cannot be found in the AAA sub-system, a logged
> in user will end up as a member of the default group (if specified).
> If a user logs in and the group membership cannot be established, the
> user will have zero access rights.

/ncs-config/aaa/auth-order (string)  
> The default order for authentication is 'local-authentication pam
> external-authentication'. It is possible to change this order through
> this parameter

/ncs-config/aaa/validation-order (string)  
> By default the AAA system will try token validation for a user by the
> external-validation configurables, as that is the only one currently
> available - i.e. an external program is invoked to validate the token.
>
> The default is thus:
>
> <div class="informalexample">
>
>     'external-validation'
>
> </div>

/ncs-config/aaa/challenge-order (string)  
> By default the AAA system will try the challenge mechanisms for a user
> by the challenge configurables, invoking them in order to authenticate
> the challenge id and response.
>
> The default is:
>
> <div class="informalexample">
>
>     'external-challenge, package-challenge'
>
> </div>

/ncs-config/aaa/expiration-warning (ignore \| display \| prompt) \[ignore\]  
> When PAM or external authentication is used, the authentication
> mechanism may give a warning that the user's password is about to
> expire. This parameter controls how the NCS daemon processes that
> warning message.
>
> If set to 'ignore', the warning is ignored.
>
> If set to 'display', interactive user interfaces will display the
> warning message at login time.
>
> If set to 'prompt', interactive user interfaces will display the
> warning message at login time, and require that the user acknowledges
> the message before proceeding.

/ncs-config/aaa/audit-user-name (known \| never) \[known\]  
> Controls the logging of the user name when a failed authentication
> attempt is logged to the audit log.
>
> If set to "known", the user name is only logged when it is known to be
> valid (i.e. when attempting local-authentication and the user exists
> in /aaa/authentication/users), otherwise it is logged as
> "\[withheld\]".
>
> If set to "never", the user name is always logged as "\[withheld\]".

/ncs-config/aaa/max-password-length (uint16) \[1024\]  
> The maximum length of the cleartext password for all forms of password
> authentication. Authentication attempts using a longer password are
> rejected without attempting verification.
>
> The hashing algorithms used for password verification, in particular
> those based on sha-256 and sha-512, require extremely high amounts of
> CPU usage when verification of very long passwords is attempted.

/ncs-config/aaa/pam  
> If PAM is to be used for login the NCS daemon typically must run as
> root.

/ncs-config/aaa/pam/enabled (boolean) \[false\]  
> When set to 'true', NCS uses PAM for authentication.

/ncs-config/aaa/pam/service (string) \[common-auth\]  
> The PAM service to be used for the login NETCONF/SSH CLI procedure.
> This can be any service we have installed in the /etc/pam.d directory.
> Different unices have different services installed under /etc/pam.d -
> choose a service which makes sense or create a new one.

/ncs-config/aaa/pam/timeout (xs:duration) \[PT10S\]  
> The maximum time that authentication will wait for a reply from PAM.
> If the timeout is reached, the PAM authentication will fail, but
> authentication attempts may still be done with other mechanisms as
> configured for /ncs-config/aaa/authOrder. Default is PT10S, i.e. 10
> seconds.

/ncs-config/aaa/restconf/auth-cache-ttl (xs:duration) \[PT10S\]  
> The amount of time that RESTCONF locally caches authentication
> credentials before querying the AAA server. Default is PT10S, i.e. 10
> seconds. Setting to PT0S, i.e. 0 seconds, effectively disables the
> authentication cache.

/ncs-config/aaa/restconf/enable-auth-cache-client-ip (boolean) \[false\]  
> If enabled, a clients source IP address will also be stored in the
> RESTCONF authentication cache.

/ncs-config/aaa/single-sign-on/enabled (boolean) \[false\]  
> When set to 'true' Single Sign-On (SSO) functionality is enabled for
> NCS.
>
> SSO is a valid authentication method for webui and JSON-RPC
> interfaces.
>
> The endpoint for SSO in NCS is hardcoded to '/sso'.
>
> The SSO functionality needs package-authentication to be enabled in
> order to work.

/ncs-config/aaa/single-sign-on/enable-automatic-redirect (boolean) \[false\]  
> When set to 'true' and there is only a single Authentication Package
> which has SSO enabled (has an SSO URL) a request to the servers root
> will be redirected to that URL.

/ncs-config/aaa/package-authentication/enabled (boolean) \[false\]  
> When set to 'true', package authentication is used.
>
> The package needs to have an executable in 'scripts/authenticate'
> which adheres to the package authentication API in order to be used by
> the package authentication.

/ncs-config/aaa/package-authentication/package-challenge/enabled (boolean) \[false\]  
> When set to 'true', package challenge is used.
>
> The package needs to have an executable in 'scripts/challenge' which
> adheres to the package challenge API in order to be used by the
> package challenge authentication.

/ncs-config/aaa/package-authentication/packages  
> Specifies the authentication packages to be used by the server as a
> whitespace separated list from the loaded authentication package
> names. If there are multiple packages, the order of the package names
> is the order they will be tried for authentication requests.

/ncs-config/aaa/package-authentication/packages/package (string)  
> The name of the authentication package.

/ncs-config/aaa/package-authentication/packages/display-name (string)  
> The display name of the authentication package.
>
> If no display-name is set, the package name will be used.

/ncs-config/aaa/external-authentication/enabled (boolean) \[false\]  
> When set to 'true', external authentication is used.

/ncs-config/aaa/external-authentication/executable (string)  
> If we enable external authentication, an executable on the local host
> can be launched to authenticate a user. The executable will receive
> the username and the cleartext password on its standard input. The
> format is '\[\${USER};\${PASS};\]\n'. For example if user is 'bob' and
> password is 'secret', the executable will receive the line
> '\[bob;secret;\]' followed by a newline on its standard input. The
> program must parse this line.
>
> The task of the external program, which for example could be a RADIUS
> client is to authenticate the user and also provide the user to groups
> mapping. So if 'bob' is member of the 'oper' and the 'lamers' group,
> the program should echo 'accept oper lamers' on its standard output.
> If the user fails to authenticate, the program should echo 'reject
> \${reason}' on its standard output.

/ncs-config/aaa/external-authentication/use-base64 (boolean) \[false\]  
> When set to 'true', \${USER} and \${PASS} in the data passed to the
> executable will be base64-encoded, allowing e.g. for the password to
> contain ';' characters. For example if user is 'bob' and password is
> 'secret', the executable will receive the string '\[Ym9i;c2VjcmV0;\]'
> followed by a newline.

/ncs-config/aaa/external-authentication/include-extra (boolean) \[false\]  
> When set to 'true', additional information items will be provided to
> the executable: source IP address and port, context, and protocol.
> I.e. the complete format will be
> '\[\${USER};\${PASS};\${IP};\${PORT};\${CONTEXT};\${PROTO};\]\n'.
> Example: '\[bob;secret;192.168.1.1;12345;cli;ssh;\]\n'.

/ncs-config/aaa/local-authentication/enabled (boolean) \[true\]  
> When set to true, NCS uses local authentication. That means that the
> user data kept in the aaa namespace is used to authenticate users.
> When set to false some other authentication mechanism such as PAM or
> external authentication must be used.

/ncs-config/aaa/authentication-callback/enabled (boolean) \[false\]  
> When set to true, NCS will invoke an application callback when
> authentication has succeeded or failed. The callback may reject an
> otherwise successful authentication. If the callback has not been
> registered, all authentication attempts will fail. See Javadoc for
> DpAuthCallback for the callback details.

/ncs-config/aaa/external-validation/enabled (boolean) \[false\]  
> When set to 'true', external token validation is used.

/ncs-config/aaa/external-validation/executable (string)  
> If we enable external token validation, an executable on the local
> host can be launched to validate a user. The executable will receive a
> cleartext token on its standard input. The format is
> '\[\${TOKEN};\]\n'. For example if the token is '7ea345123', the
> executable will receive the string '\[7ea345123;\]' followed by a
> newline on its standard input. The program must parse this line.
>
> The task of the external program, which for example could be a FUSION
> client, is to validate the token and also provide the token to user
> and groups mappings. Refer to the External validation section of the
> AAA chapter in the User Guide for the details of how the program
> should report the result back to NCS.

/ncs-config/aaa/external-validation/use-base64 (boolean) \[false\]  
> When set to true, \${TOKEN} in the data passed to the executable will
> be base64-encoded, allowing e.g. for the token to contain ';'
> characters.

/ncs-config/aaa/external-validation/include-extra (boolean) \[false\]  
> When set to true, additional information items will be provided to the
> executable: source IP address and port, context, and protocol. I.e.
> the complete format will be
> '\[\${TOKEN};\${IP};\${PORT};\${CONTEXT};\${PROTO};\]\n'. Example:
> '\[7ea345123;192.168.1.1;12345;cli;ssh;\]\n'.

/ncs-config/aaa/validation-callback/enabled (boolean) \[false\]  
> When set to true, NCS will invoke an application callback when
> validation has succeeded or failed. The callback may reject an
> otherwise successful validation. If the callback has not been
> registered, all validation attempts will fail.

/ncs-config/aaa/external-challenge/enabled (boolean) \[false\]  
> When set to 'true', the external challenge mechanism is used.

/ncs-config/aaa/external-challenge/executable (string)  
> If we enable the external challenge mechanism, an executable on the
> local host can be launched to authenticate a user. The executable will
> receive a cleartext token on its standard input. The format is
> '\[\${CHALL-ID};\${RESPONSE};\]\n'. For example if the challenge id is
> '6yu125' and the response is '989yuey', the executable will receive
> the string '\[6yu125;989yuey;\]' followed by a newline on its standard
> input. The program must parse this line.
>
> The task of the external program, which for example could be a RADIUS
> client, is to authenticate the combination of the challenge id and the
> response, and also provide a mapping to user and groups. Refer to the
> External challenge section of the AAA chapter in the User Guide for
> the details of how the program should report the result back to NCS.

/ncs-config/aaa/external-challenge/use-base64 (boolean) \[false\]  
> When set to true, \${CHALL-ID} and\${RESPONSE} in the data passed to
> the executable will be base64-encoded, allowing e.g. for them to
> contain ';' characters.

/ncs-config/aaa/external-challenge/include-extra (boolean) \[false\]  
> When set to true, additional information items will be provided to the
> executable: source IP address and port, context, and protocol. I.e.
> the complete format will be
> '\[\${CHALL-ID};\${RESPONSE};\${IP};\${PORT};\${CONTEXT};\${PROTO};\]\n'.
> Example: '\[6yu125;989yuey;192.168.1.1;12345;cli;ssh;\]\n'.

/ncs-config/aaa/challenge-callback/enabled (boolean) \[false\]  
> When set to true, NCS will invoke an application callback when the
> challenge machanism has succeeded or failed. The callback may reject
> an otherwise successful authentication. If the callback has not been
> registered, all challenge mechnism attempts will fail.

/ncs-config/aaa/authorization/enabled (boolean) \[true\]  
> When set to false, all authorization checks are turned off, similar to
> the -noaaa flag in ncs_cli.

/ncs-config/aaa/authorization/callback/enabled (boolean) \[false\]  
> When set to true, NCS will invoke application callbacks for
> authorization. If the callbacks have not been registered, all
> authorization checks will be rejected. See Javadoc for
> DpAuthorizationCallback for the callback details.

/ncs-config/aaa/authorization/nacm-compliant (boolean) \[true\]  
> In earlier versions, NCS did not fully comply with the NACM
> specification: the 'module-name' leaf was required to match toplevel
> nodes, but it was not considered for the node being accessed. If this
> leaf is set to false, this non-compliant behavior remains - this
> setting is only provided for backward compatibility with existing rule
> sets, and is not recommended.

/ncs-config/aaa/namespace (string) \[http://tail-f.com/ns/aaa/1.1\]  
> If we want to move the AAA data into another userdefine namespace, we
> indicate that here.

/ncs-config/aaa/prefix (string) \[/\]  
> If we want to move the AAA data into another userdefined namespace, we
> indicate the prefix path in that namespace where the NCS AAA namespace
> has been mounted.

/ncs-config/aaa/action-input-rules  
> Configuration of NACM action input statements.

/ncs-config/aaa/action-input-rules/enabled (boolean) \[false\]  
> Allows NACM rules to be set for individual action input leafs.

/ncs-config/rollback  
> Settings controlling if and where rollback files are created. A
> rollback file contains the data required to restore the changes that
> were made when the rollback was created.

/ncs-config/rollback/enabled (boolean) \[false\]  
> When set to true a rollback file will be created whenever the running
> configuration is modified.

/ncs-config/rollback/directory (string)  
> This parameter is mandatory.
>
> Location where rollback files will be created.

/ncs-config/rollback/history-size (uint32) \[35\]  
> Number of old rollback files to save.

/ncs-config/ssh  
> This section defines settings which affect the behavior of the SSH
> server built into NCS.

/ncs-config/ssh/idle-connection-timeout (xs:duration) \[PT10M\]  
> The maximum time that an authenticated connection to the SSH server is
> allowed to exist without open channels. If the timeout is reached, the
> SSH server closes the connection. Default is PT10M, i.e. 10 minutes.
> If the value is 0, there is no timeout.

/ncs-config/ssh/algorithms  
> This section defines custom lists of algorithms to be usable with the
> built-in SSH implementation.
>
> For each type of algorithm, an empty value means that all supported
> algorithms should be usable, and a non-empty value (a comma-separated
> list of algorithm names) means that the intersection of the supported
> algorithms and the configured algorithms should be usable.

/ncs-config/ssh/algorithms/server-host-key (string) \[ssh-ed25519\]  
> The supported serverHostKey algorithms (if implemented in libcrypto)
> are "ecdsa-sha2-nistp521", "ecdsa-sha2-nistp384",
> "ecdsa-sha2-nistp256", "ssh-ed25519", "ssh-rsa", "rsa-sha2-256",
> "rsa-sha2-512" and "ssh-dss" but for any SSH server, it is limited to
> those algorithms for which there is a host key installed in the
> directory given by /ncs-config/aaa/ssh-server-key-dir.
>
> To limit the usable serverHostKey algorithms to "ssh-dss", set this
> value to "ssh-dss" or avoid installing a key of any other type than
> ssh-dss in the sshServerKeyDir.

/ncs-config/ssh/algorithms/kex (string) \[curve25519-sha256,ecdh-sha2-nistp256,diffie-hellman-group14-sha256\]  
> The supported key exchange algorithms (as long as their hash functions
> are implemented in libcrypto) are "ecdh-sha2-nistp521",
> "ecdh-sha2-nistp384", "ecdh-sha2-nistp256", "curve25519-sha256",
> "diffie-hellman-group14-sha256", "diffie-hellman-group14-sha1".
>
> To limit the usable key exchange algorithms to
> "diffie-hellman-group14-sha1" and "diffie-hellman-group14-sha256" (in
> that order) set this value to "diffie-hellman-group14-sha1,
> diffie-hellman-group14-sha256".

/ncs-config/ssh/algorithms/dh-group  
> Range of allowed group size, the SSH server responds to the client
> during a "diffie-hellman-group-exchange". The range will be the
> intersection of what the client requests, if there is none the key
> exchange will be aborted.

/ncs-config/ssh/algorithms/dh-group/min-size (dh-group-size-type) \[2048\]  
> Minimal size of p in bits.

/ncs-config/ssh/algorithms/dh-group/max-size (dh-group-size-type) \[4096\]  
> Maximal size of p in bits.

/ncs-config/ssh/algorithms/mac (string) \[hmac-sha2-512,hmac-sha2-256,hmac-sha1\]  
> The supported mac algorithms (if implemented in libcrypto) are
> "hmac-sha1", "hmac-sha2-256" and "hmac-sha2-512".

/ncs-config/ssh/algorithms/encryption (string) \[aes128-gcm@openssh.com,chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,aes256-ctr\]  
> The supported encryption algorithms (if implemented in libcrypto) are
> "aes128-gcm@openssh.com", "chacha20-poly1305@openssh.com",
> "aes128-ctr", "aes192-ctr", "aes256-ctr", "aes128-cbc", "aes256-cbc"
> and "3des-cbc".

/ncs-config/ssh/client-alive-interval (xs:duration \| infinity) \[PT20S\]  
> If no data has been received from a connected client for this long, a
> request that requires a response from the client will be sent over the
> SSH transport.
>
> NOTE: Configuring a client-alive-interval to 'infinity' is not
> recommended. This as a non 'infinity' value is a protection against
> stale SSH connections. Depending on which activity has been carried
> out over a connection (NETCONF notification subscriptions or NETCONF
> locking in particular) a stale connection can lead to memory
> allocation growth or prevention of any transactions to be committed in
> NSO for as long as the connection appears to be up.

/ncs-config/ssh/client-alive-count-max (uint32) \[3\]  
> If no data has been received from the client, after this many
> consecutive client-alive-interval has passed, the connection will be
> dropped.

/ncs-config/ssh/parallel-login (boolean) \[false\]  
> By default parallel logins are disabled and will block more than one
> password authenticated session from seeing the password prompt. If
> enabled, then up to max_sessions minus active authenticated sessions
> will be shown password prompts.

/ncs-config/ssh/rekey-limit  
> This section defines when the local peer will initiate the SSH
> rekeying procedure. Setting both values to 0 will disable rekeying
> from local side entirely. Note, that rekeying initiated by the other
> peer will still be performed

/ncs-config/ssh/rekey-limit/bytes (uint64) \[10737418240\]  
> The limit of transferred data, after which the rekeying is to be
> initiated. The limit check occurs every minute. A positive value in
> bytes, default is 10737418240 for 1 GB. Value 0 means rekeying will
> not trigger after any amount of transferred data.

/ncs-config/ssh/rekey-limit/minutes (uint32) \[60\]  
> The limit of time, after which the rekeying is to be initiated. A
> positive value greater than 0, default is 60 for 1 hour. Value 0 means
> rekeying will not trigger after any time duration.

/ncs-config/cli  
> CLI parameters.

/ncs-config/cli/enabled (boolean) \[true\]  
> When set to true, the CLI server is started.

/ncs-config/cli/enable-cli-cache (boolean) \[true\]  
> enable-cli-cache is either 'true' or 'false'. If 'true' the CLI will
> operate with a builtin caching mechanism to speed up some of its
> operations. This is the default and preferred method. Only turn this
> off for very special cases.

/ncs-config/cli/allow-implicit-wildcard (boolean) \[true\]  
> When set to true, users do not need to explicitly type \* in the place
> of keys in lists, in order to see all list instances. When set to
> false, users have to explicitly type \* to see all list instances.
>
> This option can be set to 'false', to help in the case where tab
> completion in the CLI takes long time when performed on lists with
> many instances.

/ncs-config/cli/enable-last-login-banner (boolean) \[true\]  
> When set to 'true', the last-login-counter is enabled and displayed in
> the CLI during login.

/ncs-config/cli/completion-show-max (cli-max) \[100\]  
> Maximum number of possible alternatives for the CLI to present when
> doing completion.

/ncs-config/cli/style (j \| c)  
> Style is either 'j', 'c', or 'i'. If 'j', then the CLI will be
> presented as a Juniper style CLI. If 'c' then the CLI will appear as
> Cisco XR style, and if 'i' then a Cisco IOS style CLI will be
> rendered.

/ncs-config/cli/ssh/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true' the NCS CLI will use
> the built in SSH server.

/ncs-config/cli/ssh/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> ip is an IP address which the NCS CLI should listen on for SSH
> connections. 0.0.0.0 means that it listens on the port
> (/ncs-config/cli/ssh/port) for all IPv4 addresses on the machine.

/ncs-config/cli/ssh/port (port-number) \[2024\]  
> The port number for CLI SSH

/ncs-config/cli/ssh/use-keyboard-interactive (boolean) \[false\]  
> Need to be set to true if using challenge/response authentication for
> CLI SSH.

/ncs-config/cli/ssh/banner (string) \[\]  
> banner is a string that will be presented to the client before
> authenticating when logging in to the CLI via the built-in SSH server.

/ncs-config/cli/ssh/banner-file (string) \[\]  
> banner-file is the name of a file whose contents will be presented
> (after any string given by the banner directive) to the client before
> authenticating when logging in to the CLI via the built-in SSH server.

/ncs-config/cli/ssh/extra-listen  
> A list of additional IP address and port pairs which the NCS CLI
> should also listen on for SSH connections.

/ncs-config/cli/ssh/extra-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/cli/ssh/extra-listen/port (port-number)  

/ncs-config/cli/ssh/ha-primary-listen  
> When /ncs-config/ha/enable or /ncs-config/ha-raft/enable is set to
> 'true' and the current NCS node is active (i.e. primary/leader), then
> NCS will listen(2) to the following IPv4 or IPv6 addresses and ports.
> Once the previously active high-availability node transitions to a
> different role, then NCS will shutdown these listen addresses and
> terminate any ongoing traffic.

/ncs-config/cli/ssh/ha-primary-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/cli/ssh/ha-primary-listen/port (port-number)  

/ncs-config/cli/top-level-cmds-in-sub-mode (boolean) \[false\]  
> topLevelCmdsInSubMode is either 'true' or 'false'. If set to 'true'
> all top level commands in I and C-style CLI are available in sub
> modes.

/ncs-config/cli/completion-meta-info (false \| alt1 \| alt2) \[false\]  
> completionMetaInfo is either 'false', 'alt1' or 'alt2'. If set to
> 'alt1' then the alternatives shown for possible completions will be
> prefixed as follows:
>
> <div class="informalexample">
>
>     containers with >
>     lists with +
>     leaf-lists with +
>
> </div>
>
> For example:
>
> <div class="informalexample">
>
>     Possible completions:
>     ...
>     > applications
>     + apply-groups
>     ...
>     + dns-servers
>     ...
>
> </div>
>
> If set to 'alt2', then possible completions will be prefixed as
> follows:
>
> <div class="informalexample">
>
>     containers with >
>     lists with children with +>
>     lists without children +
>
> </div>
>
> For example:
>
> <div class="informalexample">
>
>     Possible completions:
>     ...
>     > applications
>     +>apply-groups
>     ...
>     + dns-servers
>     ...
>
> </div>

/ncs-config/cli/allow-abbrev-keys (boolean) \[false\]  
> allowAbbrevKeys is either 'true' or 'false'. If 'false' then key
> elements are not allowed to be abbreviated in the CLI. This is
> relevant in the J-style CLI when using the commands 'delete' and
> 'edit'. In the C/I-style CLIs when using the commands 'no', 'show
> configuration' and for commands to enter submodes.

/ncs-config/cli/action-call-no-list-instance (deny-call \| create-instance) \[deny-call\]  
> action-call-no-list-instance can be set to either 'deny-call', or
> 'create-instance'. If attempting to call an action placed in a non
> existing list instance, 'deny-call' will give an error.
> 'create-instance' will create the missing list instance and
> subsequently call the action. This is only effective in configuration
> mode in C-style CLI

/ncs-config/cli/allow-abbrev-enums (boolean) \[false\]  
> allowAbbrevEnums is either 'true' or 'false'. If 'false' then enums
> entered in the CLI cannot be abbreviated.

/ncs-config/cli/allow-case-insensitive-enums (boolean) \[false\]  
> allowCaseInsensitiveEnums is either 'true' or 'false'. If 'false' then
> enums entered in the CLI must match in case, ie you cannot enter FALSE
> if the CLI asks for 'true' or 'false'.

/ncs-config/cli/j-align-leaf-values (boolean) \[true\]  
> j-align-leaf-values is either 'true' or 'false'. If 'true' then the
> leaf values of all siblings in a container or list will be aligned.

/ncs-config/cli/c-align-leaf-values (boolean) \[true\]  
> c-align-leaf-values is either 'true' or 'false'. If 'true' then the
> leaf values of all siblings in a container or list will be aligned.

/ncs-config/cli/c-config-align-leaf-values (boolean) \[true\]  
> c-align-leaf-values is either 'true' or 'false'. If 'true' then the
> leaf values of all siblings in a container or list will be aligned
> when displaying configuration.

/ncs-config/cli/enter-submode-on-leaf (boolean) \[true\]  
> enterSubmodeOnLeaf is either 'true' or 'false'. If set to 'true' (the
> default) then setting a leaf in a submode from a parent mode results
> in entering the submode after the command has completed. If set to
> 'false' then an explicit command for entering the submode is needed.
> For example, if running the command
>
> interface FastEthernet 1/1/1 mtu 1400
>
> from the top level in config mode. If enterSubmodeOnLeaf is true the
> CLI will end up in the 'interface FastEthernet 1/1/1' submode after
> the command execution. If set to 'false' then the CLI will remain at
> the top level. To enter the submode when set to 'false' the command
>
> interface FastEthernet 1/1/1
>
> is needed. Applied to the C-style CLI.

/ncs-config/cli/table-look-ahead (int64) \[50\]  
> The tableLookAhead element tells the system how many rows to pre-fetch
> when displaying a table. The prefetched rows are used for calculating
> the required column widths for the table. If set to a small number it
> is recommended to explicitly configure the column widhts in the
> clispec file.

/ncs-config/cli/default-table-behavior (dynamic \| suppress \| enforce) \[suppress\]  
> defaultTableBehavior is either 'dynamic', 'suppress', or 'enforce'. If
> set to 'dynamic' then list nodes will be displayed as tables if the
> resulting table will fit on the screen. If set to 'suppress', then
> list nodes will not be displayed as tables unless a table has been
> specified by some other means (ie through a setting in the
> clispec-file or through a command line parameter). If set to 'enforce'
> then list nodes will always be displayed as tables unless otherwise
> specified in the clispec-file or on the command line.

/ncs-config/cli/more-buffer-lines (uint32 \| unbounded) \[unbounded\]  
> moreBufferLines is used to limit the buffering done by the more
> process. It can be 'unbounded' or a possitive integer describing the
> maximum number of lines to buffer.

/ncs-config/cli/show-all-ns (boolean) \[false\]  
> If showAllNs is true then all elem names will be prefixed with the
> namespace prefix in the CLI. This is visible when setting values and
> when showing the configuration

/ncs-config/cli/show-action-completions (boolean) \[false\]  
> If set to 'true' then the action completions will be displayed
> separated.

/ncs-config/cli/action-completions-format (string) \[Action completions:\]  
> action-completions-format is the string displayed before the
> displaying the action completion possibilities.

/ncs-config/cli/suppress-fast-show (boolean) \[false\]  
> suppressFastShow is either 'true' or 'false'. If 'true' then the fast
> show optimization will be suppressed in the C-style CLI. The fast show
> optimization is somewhat experimental and may break certain
> operations.

/ncs-config/cli/use-expose-ns-prefix (boolean) \[false\]  
> If 'true' then all nodes annotated with the tailf:cli-expose-ns-prefix
> will result in the namespace prefix being shown/required. If set to
> 'false' then the tailf:cli-expose-ns-prefix annotation will be
> ignored. The container /devices/device/config has this annotation.

/ncs-config/cli/show-defaults (boolean) \[false\]  
> show-defaults is either 'true' or 'false'. If 'true' then default
> values will be shown when displaying the configuration. The default
> value is shown inside a comment on the same line as the value. Showing
> default values can also be enabled in the CLI per session using the
> operational mode command 'set show defaults true'.

/ncs-config/cli/default-prefix (string) \[\]  
> default-prefix is a string that is placed in front of the default
> value when a configuration is shown with default values as comments.

/ncs-config/cli/timezone (utc \| local) \[local\]  
> Time in the CLI can be either local, as configured on the host, or
> UTC.

/ncs-config/cli/with-defaults (boolean) \[false\]  
> withDefaults is either 'true' or 'false'. If 'false' then leaf nodes
> that have their default values will not be shown when the user
> displays the configuration, unless the user gives the 'details' option
> to the 'show' command.
>
> This is useful when there are many settings which are seldom used.
> When set to 'false' only the values actually modified by the user will
> be shown.

/ncs-config/cli/banner (string) \[\]  
> Banner shown to the user when the CLI is started. Default is empty.

/ncs-config/cli/banner-file (string) \[\]  
> File whose contents are shown to the user (after any string set by the
> 'banner' directive) when the CLI is started. Default is empty.

/ncs-config/cli/prompt1 (string) \[\u@\h\M\> \]  
> Prompt used in operational mode.
>
> This string is not validated to be legal UTF-8, for details see
> /ncs-config/validate-utf8.
>
> The string may contain a number of backslash-escaped special
> characters which are decoded as follows:
>
> <div class="informalexample">
>
>     \[ and \]
>         Enclosing sections of the prompt in \[ and \] makes
>         that part not count when calculating the width of the
>         prompt. This makes sense, for example, when including
>         non-printable characters, or control codes that are
>         consumed by the terminal. The common control codes for
>         setting text properties for vt100/xterm are ignored
>         automatically, so are control characters. Updating the
>         xterm title can be done using a control sequence that
>         may look like this:
>             <prompt1>\[&#x1b;]0;\u@\h&#x07;\]\u@\h&gt; </prompt1>
>     \d
>        the date in 'YYYY-MM-DD' format (e.g., '2006-01-18')
>     \h
>        the hostname up to the first '.' (or delimiter as defined
>        by promptHostnameDelimiter)
>     \H
>        the hostname
>     \s
>        the client source ip
>     \S
>        the name provided by the -H argument to ncs_cli
>     \t
>        the current time in 24-hour HH:MM:SS format
>     \T
>        the current time in 12-hour HH:MM:SS format
>     \@
>        the current time in 12-hour am/pm format
>     \A
>        the current time in 24-hour HH:MM format
>     \u
>        the username of the current user
>     \m
>        the mode name (only used in XR style)
>     \m{N}
>        same as \m, but the number of trailing components in
>        the displayed path is limited to be max N (an integer).
>        Characters removed are replaced with an ellipsis (...).
>     \M
>        the mode name inside parenthesis if in a mode
>     \M{N}
>        same as \M, but the number of trailing components in
>        the displayed path is limited to be max N (an integer).
>        Characters removed are replaced with an ellipsis (...).
>
> </div>

/ncs-config/cli/prompt2 (string) \[\u@\h\M% \]  
> Prompt used in configuration mode.
>
> This string is not validated to be legal UTF-8, for details see
> /ncs-config/validate-utf8.
>
> The string may contain a number of backslash-escaped special
> characters which are decoded as described for prompt1.

/ncs-config/cli/c-prompt1 (string) \[\u@\h\M\> \]  
> Prompt used in operational mode in the Cisco XR style CLI.
>
> This string is not validated to be legal UTF-8, for details see
> /ncs-config/validate-utf8.
>
> The string may contain a number of backslash-escaped special
> characters which are decoded as described for prompt1.

/ncs-config/cli/c-prompt2 (string) \[\u@\h\M% \]  
> Prompt used in configuration mode in the Cisco XR style CLI.
>
> This string is not validated to be legal UTF-8, for details see
> /ncs-config/validate-utf8.
>
> The string may contain a number of backslash-escaped special
> characters which are decoded as described for prompt1.

/ncs-config/cli/prompt-hostname-delimiter (string) \[.\]  
> When the \h token is used in a prompt the first part of the hostname
> up until the first occurance of the promptHostnameDelimiter is used.

/ncs-config/cli/idle-timeout (xs:duration) \[PT30M\]  
> Maximum idle time before terminating a CLI session. Default is PT30M,
> ie 30 minutes.

/ncs-config/cli/prompt-sessions-cli (boolean) \[false\]  
> promptSessionsCLI is either 'true' or 'false'. If set to 'true' then
> only the current CLI sessions will be displayed when the user tries to
> start a new CLI session and the maximum number of sessions has been
> reached. Note that MAAPI sessions with their context set to 'cli'
> would be regarded as CLI sessions and would be listed as such.

/ncs-config/cli/suppress-ned-errors (boolean) \[false\]  
> Suppress errors from NED devices. Make log-communication between ncs
> and its devices more silent. Be cautious with this option since errors
> that might be interesting can get suppressed as well.

/ncs-config/cli/disable-idle-timeout-on-cmd (boolean) \[true\]  
> disable-idle-timeout-on-cmd is either 'true' or 'false'. If set to
> 'false' then the idle timeout will trigger even when a command is
> running in the CLI. If set to 'true' the idle timeout will only
> trigger if the user is idling at the CLI prompt.

/ncs-config/cli/command-timeout (xs:duration \| infinity) \[infinity\]  
> Global command timeout. Terminate command unless the command has
> completed within the timeout. It is generally a bad idea to use this
> feature since it may have undesirable effects in a loaded system where
> normal commands take longer to complete than usual.
>
> This timeout can be overridden by a command specific timeout specified
> in the ncs.cli file.

/ncs-config/cli/space-completion/enabled (boolean)  

/ncs-config/cli/ignore-leading-whitespace (boolean)  
> If 'false' then the CLI will show completion help when the user enters
> TAB or SPACE as the first characters on a row. If set to 'true' then
> leading SPACE and TAB are ignored. The user can enter '?' to get a
> list of possible alternatives. Setting the value to 'true' makes it
> easier to paste scripts into the CLI.

/ncs-config/cli/auto-wizard  
> Default value for autowizard in the CLI. The user can always enable or
> disable the auto wizard in each session, this controls the initial
> session value.

/ncs-config/cli/auto-wizard/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true' the CLI will prompt the
> user for required attributes when a new identifier is created.

/ncs-config/cli/restricted-file-access (boolean) \[false\]  
> restricted-file-access is either 'true' or 'false'. If 'true' then a
> CLI user will not be able to access files and directories outside the
> home directory tree.

/ncs-config/cli/restricted-file-regexp (string) \[\]  
> restricted-file-regexp is either an empty string or an regular
> expression (AWK style). If not empty then all files and directories
> created or accessed must match the regular expression. This can be
> used to ensure that certain symbols does not occur in created files.

/ncs-config/cli/history-save (boolean) \[true\]  
> If set to 'true' then the CLI history will be saved between CLI
> sessions. The history is stored in the state directory.

/ncs-config/cli/history-remove-duplicates (boolean) \[false\]  
> If set to 'true' then repeated commands in the CLI will only be stored
> once in the history. Each invocation of the command will only update
> the date of the last entry. If set to 'false' duplicates will be
> stored in the history.

/ncs-config/cli/history-max-size (int64) \[1000\]  
> Sets maximum configurable history size.

/ncs-config/cli/message-max-size (int64) \[10000\]  
> Maximum size of user message.

/ncs-config/cli/show-commit-progress (boolean) \[true\]  
> show-commit-progress can be either 'true' or 'false'. If set to 'true'
> then the commit operation in the CLI will provide some progress
> information.

/ncs-config/cli/commit-message (boolean) \[true\]  
> CLI prints out a message when a commit is executed

/ncs-config/cli/use-double-dot-ranges (boolean) \[true\]  
> useDoubleDotRanges is either 'true' or 'false'. If 'true' then range
> expressions are types as 1..3, if set to 'false' then ranges are given
> as 1-3.

/ncs-config/cli/allow-range-expression-all-types (boolean) \[true\]  
> allowRangeExpressionAllTypes is either 'true' or 'false'. If 'true'
> then range expressions are allowed for all key values regardless of
> type.

/ncs-config/cli/suppress-range-keyword (boolean) \[false\]  
> suppressRangeKeyword is either 'true' or 'false'. If 'true' then
> 'range' keyword is not allowed in C- and I-style for range
> expressions.

/ncs-config/cli/commit-message-format (string) \[ System message at \$(time)... Commit performed by \$(user) via \$(proto) using \$(ctx). \]  
> The format of the CLI commit messages

/ncs-config/cli/suppress-commit-message-context (string)  
> This parameter may be given multiple times.
>
> A list of contexts for which no commit message shall be displayed. A
> good value is \[ system \] which will make all system generated
> commits to go unnoticed in the CLI. A context is either the name of an
> agent i.e cli, webui, netconf, snmp or any free form text string if
> the transaction is initated from Maapi

/ncs-config/cli/show-subsystem-messages (boolean) \[true\]  
> show-subsystem-messages is either 'true' or 'false'. If 'true' the CLI
> will display a system message whenever a connected daemon is started
> or stopped.

/ncs-config/cli/show-editors (boolean) \[true\]  
> show-editors is either 'true' or 'false'. If set to true then a list
> of current editors will be displayed when a user enters configure
> mode.

/ncs-config/cli/rollback-aaa (boolean) \[false\]  
> If set to true then AAA rules will be applied when a rollback file is
> loaded. This means that rollback may not be possible if some other
> user have made changes that the current user does not have access
> privileges to.

/ncs-config/cli/rollback-numbering (rolling \| fixed) \[fixed\]  
> rollbackNumbering is either 'fixed' or 'rolling'. If set to 'rolling'
> then rollback file '0' will always contain the last commit. When using
> 'fixed' each rollback will get a unique increasing number.

/ncs-config/cli/show-service-meta-data (boolean) \[false\]  
> If set to true, then backpointers and refcounts are displayed by
> default when showing the configuration. If set to false, they are not.
> The default can be overridden by the pipe flags 'display service-meta'
> and 'hide service-meta'.

/ncs-config/cli/escape-backslash (boolean) \[false\]  
> escapeBackslash is either 'true' or 'false'. If set to 'true' then
> backslash is escaped in the CLI.

/ncs-config/cli/preserveSemicolon (boolean) \[false\]  
> preserveSemicolon is either 'true' or 'false'. If set to 'true' the
> semicolon is preserved as an ordinary char instead of using the
> semicolon as a keyword to separate CLI statements in the I and C-style
> CLI.

/ncs-config/cli/bypass-allow-abbrev-keys (boolean) \[false\]  
> bypassAllowAbbrevKeys is either 'true' or 'false'. If 'true' then
> /ncs-config/cli/allow-abbrev-keys setting does not take any effect. It
> means that no matter what is set for
> /ncs-config/cli/allow-abbrev-keys, the key elements are not allowed to
> be abbreviated in the CLI. This is relevant in the J-style CLI when
> using the commands 'delete' and 'edit'. In the C/I-style CLIs when
> using the commands 'no', 'show configuration' and for commands to
> enter submodes.

/ncs-config/cli/mode-info-in-aaa (true \| false \| path) \[false\]  
> modeInfoInAAA is either 'true', 'false' or 'path', If 'true', then all
> commands will be prefixed with major and minor mode name when
> processed by the AAA-rules. This means that it is possible to
> differentiate between commands with the same name in different modes.
> Major mode is 'operational' or 'configure' and minor mode is 'top' in
> J-style and the name of the submode in C- and I-mode. On the top-level
> in C- and I-mode it is also 'top'. If set to 'path' the major mode
> will be followed by the full command path to the submode.

/ncs-config/cli/match-completions-search-limit (uint32 \| unbounded) \[50\]  
> match-completions-search-limit is either unbounded or an integer
> value. It determines how many list instances should be looked at in
> order to determine if a leaf should be included in the match
> completions list. It can be very expensive to explore all instances if
> the configuration contains many list instances.

/ncs-config/cli/nmda  
> CLI settings for NMDA.

/ncs-config/cli/nmda/show-operational-state (boolean) \[false\]  
> show-operational-state is either 'true' or 'false'. If 'true', the
> 'operational-state' option to the show command will be available in
> the CLI.
>
> The operational-state option is to display the content of the
> operational datastore.

/ncs-config/cli/allow-brackets-in-no-leaf-list (boolean) \[true\]  
> This parameter controls if the CLI allows brackets when deleting a
> leaf-list.

/ncs-config/restconf  
> This section defines settings for the RESTCONF API.

/ncs-config/restconf/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the RESTCONF API is
> enabled.

/ncs-config/restconf/show-hidden (boolean) \[false\]  
> show-hidden is either 'true' or 'false'. If 'true' all hidden nodes
> will be reachable. If 'false' query parameter ?unhide overrides.

/ncs-config/restconf/root-resource (string) \[restconf\]  
> The RESTCONF root resource path.

/ncs-config/restconf/schema-server-url (string)  
> Change the schema element in the ietf-yang-library:modules-state
> resource response.
>
> It is possible to use the placeholders @X_FORWARDED_HOST@ and
> @X_FORWARDED_PORT@ in order to set the schema URL with HTTP headers
> X-Forwarded-Host and X-Forwarded_Port, e.g.
> https://@X_FORWARDED_HOST@:@X_FORWARDED_PORT@ .

/ncs-config/restconf/token-response  
> When authenticating via AAA external-authentication or
> external-validation and a token is returned, it is possible to include
> a header with the token in the response.

/ncs-config/restconf/token-response/x-auth-token (boolean) \[false\]  
> Either 'true' or 'false'. If 'true', a x-auth-token header is included
> in the response with any token returned from AAA.

/ncs-config/restconf/token-response/token-cookie  
> Configuration of RESTCONF token cookies.

/ncs-config/restconf/token-response/token-cookie/name (string) \[\]  
> The cookie name, exactly as it is to be sent. If configured, a HTTP
> cookie with that name is included in the response with any token
> returned from AAA as value.

/ncs-config/restconf/token-response/token-cookie/directives (string) \[\]  
> An optional string with directives appended to the cookie, exactly as
> it is to be sent.

/ncs-config/restconf/custom-headers  
> The custom-headers element contains any number of header elements,
> with a valid header-field as defined in RFC7230.
>
> The headers will be part of all HTTP responses.

/ncs-config/restconf/custom-headers/header/name (string)  

/ncs-config/restconf/custom-headers/header/value (string)  
> This parameter is mandatory.

/ncs-config/restconf/x-frame-options (DENY \| SAMEORIGIN \| ALLOW-FROM) \[DENY\]  
> By default the X-Frame-Options header is set to DENY for the
> /login.html and /index.html pages. With this header it can be set to
> SAMEORIGIN or ALLOW-FROM instead.

/ncs-config/restconf/x-content-type-options (string) \[nosniff\]  
> The X-Content-Type-Options response HTTP header is a marker used by
> the server to indicate that the MIME types advertised in the
> Content-Type headers should not be changed and be followed. This
> allows to opt-out of MIME type sniffing, or, in other words, it is a
> way to say that the web admins knew what they were doing.
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/restconf/x-xss-protection (string) \[1; mode=block\]  
> The HTTP X-XSS-Protection response header is a feature of Internet
> Explorer, Chrome and Safari that stops pages from loading when they
> detect reflected cross-site scripting (XSS) attacks. Although these
> protections are largely unnecessary in modern browsers when sites
> implement a strong Content-Security-Policy that disables the use of
> inline JavaScript ('unsafe-inline'), they can still provide
> protections for users of older web browsers that don't yet support
> CSP.
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/restconf/strict-transport-security (string) \[max-age=15552000; includeSubDomains\]  
> The HTTP Strict-Transport-Security response header (often abbreviated
> as HSTS) lets a web site tell browsers that it should only be accessed
> using HTTPS, instead of using HTTP.
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/restconf/content-security-policy (string) \[default-src 'self'; block-all-mixed-content; base-uri 'self'; frame-ancestors 'none';\]  
> The HTTP Content-Security-Policy response header allows web site
> administrators to control resources the user agent is allowed to load
> for a given page.
>
> The default value means that: Resources like fonts, scripts,
> connections, images, and styles will all only load from the same
> origin as the protected resource. All mixed contents will be blocked
> and frame-ancestors like iframes and applets is prohibited. See also:
>
> <div class="informalexample">
>
>       https://www.w3.org/TR/CSP3/
>
> </div>
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/restconf/cross-origin-embedder-policy (string) \[require-corp\]  
> The HTTP Cross-Origin-Embedder-Policy (COEP) response header
> configures embedding cross-origin resources into the document.
>
> Always sent by default, can be disabled by setting the value to empty
> string.

/ncs-config/restconf/cross-origin-opener-policy (string) \[same-origin\]  
> The HTTP Cross-Origin-Opener-Policy (COOP) response header allows you
> to ensure a top-level document does not share a browsing context group
> with cross-origin documents.
>
> Always sent by default, can be disabled by setting the value to empty
> string.

/ncs-config/restconf/wasm-script-policy-pattern (string) \[(?i)\bwasm\b.\*\\js\$\]  
> The wasmScriptPolicyPattern is a regular expression that matches
> filenames in HTTP requests. If there is a match and the response
> includes a Content-Security-Policy (CSP), the 'script-src' policy is
> updated with the 'wasm-unsafe-eval' directive.
>
> The 'wasm-unsafe-eval' source expression controls the execution of
> WebAssembly. If a page contains a CSP header and the
> 'wasm-unsafe-eval' is specified in the script-src directive, the web
> browser allows the loading and execution of WebAssembly on the page.
>
> Setting the value to an empty string deactivates the match. If you
> still want to allow loading WebAssembly content with this disabled you
> would have to add 'wasm-unsafe-eval' to the 'script-src' rule in the
> CSP header, which. allows it for ALL files.
>
> The default value is a pattern that would case insensitively match any
> filename that contains the word 'wasm' surrounded by at least one
> non-word character (for example ' ', '.' or '-') and has the file
> extension 'js'.
>
> As an example 'dot.wasm.js' and 'WASM-dash.js' would match while
> 'underscore_wasm.js' would not.

/ncs-config/restconf/transport  
> Settings deciding which transport services the RESTCONF server should
> listen to, e.g. TCP and SSL.

/ncs-config/restconf/transport/tcp  
> Settings deciding how the RESTCONF server TCP transport service should
> behave.

/ncs-config/restconf/transport/tcp/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the RESTCONF server
> uses clear text TCP as a transport service.

/ncs-config/restconf/transport/tcp/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> The IP address which the RESTCONF server should listen to for TCP
> connections. 0.0.0.0 means that it listens to the port for all IPv4
> addresses on the machine.

/ncs-config/restconf/transport/tcp/port (port-number) \[8009\]  
> port is a valid port number to be used in combination with the
> address.

/ncs-config/restconf/transport/tcp/extra-listen  
> A list of additional IP address and port pairs which the RESTCONF
> server should also listen on.

/ncs-config/restconf/transport/tcp/extra-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/restconf/transport/tcp/extra-listen/port (port-number)  

/ncs-config/restconf/transport/tcp/ha-primary-listen  
> When /ncs-config/ha/enable or /ncs-config/ha-raft/enable is set to
> 'true' and the current NCS node is active (i.e. primary/leader), then
> NCS will listen(2) to the following IPv4 or IPv6 addresses and ports.
> Once the previously active high-availability node transitions to a
> different role, then NCS will shutdown these listen addresses and
> terminate any ongoing traffic.

/ncs-config/restconf/transport/tcp/ha-primary-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/restconf/transport/tcp/ha-primary-listen/port (port-number)  

/ncs-config/restconf/transport/tcp/dscp (dscp-type)  
> Support for setting the Differentiated Services Code Point (6 bits)
> for traffic originating from the RESTCONF server for TCP connections.

/ncs-config/restconf/transport/ssl  
> Settings deciding how the RESTCONF server SSL (Secure Sockets Layer)
> transport service should behave.

/ncs-config/restconf/transport/ssl/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the RESTCONF server
> uses SSL as a transport service.

/ncs-config/restconf/transport/ssl/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> The IP address which the RESTCONF server should listen to for incoming
> SSL connections. 0.0.0.0 means that it listens to the port for all
> IPv4 addresses on the machine.

/ncs-config/restconf/transport/ssl/port (port-number) \[8889\]  
> port is a valid port number.

/ncs-config/restconf/transport/ssl/extra-listen  
> A list of additional IP address and port pairs which the RESTCONF
> server should also listen on for incoming ssl connections.

/ncs-config/restconf/transport/ssl/extra-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/restconf/transport/ssl/extra-listen/port (port-number)  

/ncs-config/restconf/transport/ssl/ha-primary-listen  
> When /ncs-config/ha/enable or /ncs-config/ha-raft/enable is set to
> 'true' and the current NCS node is active (i.e. primary/leader), then
> NCS will listen(2) to the following IPv4 or IPv6 addresses and ports.
> Once the previously active high-availability node transitions to a
> different role, then NCS will shutdown these listen addresses and
> terminate any ongoing traffic.

/ncs-config/restconf/transport/ssl/ha-primary-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/restconf/transport/ssl/ha-primary-listen/port (port-number)  

/ncs-config/restconf/transport/ssl/dscp (dscp-type)  
> Support for setting the Differentiated Services Code Point (6 bits)
> for traffic originating from the RESTCONF server for SSL connections.

/ncs-config/restconf/transport/ssl/key-file (string)  
> Specifies which file contains the private key for the certificate.
>
> If this configurable is omitted, the system defaults to a built-in
> self-signed certificate/key
> (\$NCS_DIR/etc/ncs/ssl/cert/host.{cert,key}). Note: Only ever use this
> built-in certificate/key for test purposes.

/ncs-config/restconf/transport/ssl/cert-file (string)  
> Specifies which file contains the server certificate. The certificate
> is either a self-signed test certificate or a genuine and validated
> certificate from a CA (Certificate Authority).
>
> If this configurable is omitted, the system defaults to a built-in
> self-signed certificate/key
> (\$NCS_DIR/etc/ncs/ssl/cert/host.{cert,key}). Note: Only ever use this
> built-in certificate/key for test purposes.
>
> The built-in test certificate has been generated using a local CA:
>
> <div class="informalexample">
>
>     $ openssl
>     OpenSSL> genrsa -out ca.key 4096
>     OpenSSL> req -new -x509 -days 3650 -key ca.key -out ca.cert
>     OpenSSL> genrsa -out host.key 4096
>     OpenSSL> req -new -key host.key -out host.csr
>     OpenSSL> x509 -req -days 365 -in host.csr -CA ca.cert \
>       -CAkey ca.key -set_serial 01 -out host.cert
>
> </div>

/ncs-config/restconf/transport/ssl/ca-cert-file (string)  
> Specifies which file contains the trusted certificates to use during
> client authentication and to use when attempting to build the server
> certificate chain. The list is also used in the list of acceptable CA
> certificates passed to the client when a certificate is requested.
>
> The distribution comes with a CA certificate which can be used for
> testing purposes (\$NCS_DIR/etc/ncs/ssl/ca_cert/ca.cert). This CA
> certificate has been generated as shown above.

/ncs-config/restconf/transport/ssl/verify (1 \| 2 \| 3) \[1\]  
> Specifies the level of verification the server does on client
> certificates. 1 means nothing, 2 means the server will ask the client
> for a certificate but not fail if the client does not supply a client
> certificate, 3 means that the server requires the client to supply a
> client certificate.
>
> If ca-cert-file has been set to the ca.cert file generated above you
> can verify that it works correctly using, for example:
>
> <div class="informalexample">
>
>     $ openssl s_client -connect 127.0.0.1:8888 \
>           -cert client.cert -key client.key
>
> </div>
>
> For this to work client.cert must have been generated using the
> ca.cert from above:
>
> <div class="informalexample">
>
>     $ openssl
>     OpenSSL> genrsa -out client.key 4096
>     OpenSSL> req -new -key client.key -out client.csr
>     OpenSSL> x509 -req -days 3650 -in client.csr -CA ca.cert \
>       -CAkey ca.key -set_serial 01 -out client.cert
>
> </div>

/ncs-config/restconf/transport/ssl/depth (uint64) \[1\]  
> Specifies the depth of certificate chains the server is prepared to
> follow when verifying client certificates.

/ncs-config/restconf/transport/ssl/ciphers (string) \[DEFAULT\]  
> Specifies the cipher suites to be used by the server as a
> colon-separated list from the set
>
> TLS_AES_128_GCM_SHA256, TLS_AES_256_GCM_SHA384,
> TLS_AES_128_CCM_SHA256, ECDHE-ECDSA-AES256-GCM-SHA384,
> ECDHE-RSA-AES256-GCM-SHA384, ECDHE-ECDSA-AES256-SHA384,
> ECDHE-RSA-AES256-SHA384, ECDH-ECDSA-AES256-GCM-SHA384,
> ECDH-RSA-AES256-GCM-SHA384, ECDH-ECDSA-AES256-SHA384,
> ECDH-RSA-AES256-SHA384, DHE-RSA-AES256-GCM-SHA384,
> DHE-DSS-AES256-GCM-SHA384, DHE-RSA-AES256-SHA256,
> DHE-DSS-AES256-SHA256, AES256-GCM-SHA384, AES256-SHA256,
> ECDHE-ECDSA-AES128-GCM-SHA256, ECDHE-RSA-AES128-GCM-SHA256,
> ECDHE-ECDSA-AES128-SHA256, ECDHE-RSA-AES128-SHA256,
> ECDH-ECDSA-AES128-GCM-SHA256, ECDH-RSA-AES128-GCM-SHA256,
> ECDH-ECDSA-AES128-SHA256, ECDH-RSA-AES128-SHA256,
> DHE-RSA-AES128-GCM-SHA256, DHE-DSS-AES128-GCM-SHA256,
> DHE-RSA-AES128-SHA256, DHE-DSS-AES128-SHA256, AES128-GCM-SHA256,
> AES128-SHA256, ECDHE-ECDSA-AES256-SHA, ECDHE-RSA-AES256-SHA,
> DHE-RSA-AES256-SHA, DHE-DSS-AES256-SHA, ECDH-ECDSA-AES256-SHA,
> ECDH-RSA-AES256-SHA, AES256-SHA, ECDHE-ECDSA-AES128-SHA,
> ECDHE-RSA-AES128-SHA, DHE-RSA-AES128-SHA, DHE-DSS-AES128-SHA,
> ECDH-ECDSA-AES128-SHA, ECDH-RSA-AES128-SHA, AES128-SHA,
> ECDHE-ECDSA-DES-CBC3-SHA, ECDHE-RSA-DES-CBC3-SHA,
> EDH-RSA-DES-CBC3-SHA, EDH-DSS-DES-CBC3-SHA, ECDH-ECDSA-DES-CBC3-SHA,
> ECDH-RSA-DES-CBC3-SHA, and DES-CBC3-SHA,
>
> or the word 'DEFAULT' (use all cipher suites in that list for which
> the required support is implemented in libcrypto). See the OpenSSL
> manual page ciphers(1) for the definition of the cipher suites. NOTE:
> The general cipher list syntax described in ciphers(1) is not
> supported.

/ncs-config/restconf/transport/ssl/protocols (string) \[DEFAULT\]  
> Specifies the SSL/TLS protocol versions to be used by the server as a
> whitespace-separated list from the set tlsv1 tlsv1.1 tlsv1.2 tlsv1.3,
> or the word 'DEFAULT' (use all supported protocol versions except the
> set tlsv1 tlsv1.1).

/ncs-config/restconf/transport/ssl/elliptic-curves (string) \[DEFAULT\]  
> Specifies the curves for Elliptic Curve cipher suites to be used by
> the server as a whitespace-separated list from the set
>
> sect571r1, sect571k1, secp521r1, brainpoolP512r1, sect409k1,
> sect409r1, brainpoolP384r1, secp384r1, sect283k1, sect283r1,
> brainpoolP256r1, secp256k1, secp256r1, sect239k1, sect233k1,
> sect233r1, secp224k1, secp224r1, sect193r1, sect193r2, secp192k1,
> secp192r1, sect163k1, sect163r1, sect163r2, secp160k1, secp160r1, and
> secp160r2,
>
> or the word 'DEFAULT' (use all supported curves).

/ncs-config/restconf/require-module-name/enabled (boolean) \[true\]  
> When set to 'true', the client must explicitly provide the module name
> of the node if it is defined in a module other than its parent node or
> its parent node is the datastore. When set to 'false', this
> configuration parameter allows the client to bypass above
> requirements. Refer to RFC 8040, section 3.5.3 for detailed
> information.

/ncs-config/webui  
> This section defines settings which decide how the embedded NCS Web
> server should behave, with respect to TCP and SSL etc.

/ncs-config/webui/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the Web server is
> started.

/ncs-config/webui/server-name (string) \[localhost\]  
> The hostname the Web server serves.

/ncs-config/webui/match-host-name (boolean) \[false\]  
> This setting specifies if the Web server only should serve URLs
> adhering to the serverName defined above. By default the server-name
> is 'localhost' and match-host-name is 'false', i.e. any server name
> can be given in the URL. If you want the server to only accept URLs
> adhering to the server-name, enable this setting.

/ncs-config/webui/cache-refresh-secs (uint64) \[0\]  
> The NCS Web server uses a RAM cache for static content. An entry sits
> in the cache for a number of seconds before it is reread from disk (on
> access). The default is 0.

/ncs-config/webui/max-ref-entries (uint64) \[100\]  
> Leafref and keyref entries are represented as drop-down menues in the
> automatically generated Web UI. By default no more than 100 entries
> are fetched. This element makes this number configurable.

/ncs-config/webui/docroot (string)  
> The location of the document root on disk. If this configurable is
> omited the docroot points to the next generation docroot in the NCS
> distro instead.

/ncs-config/webui/webui-index-url (string) \[/index.html\]  
> Where to redirect after successful login, which by default is
> '/index.html'.

/ncs-config/webui/webui-one-url (string) \[/webui-one\]  
> Url where the 'webui-one' webui is mapped if webui is enabled. The
> default is '/webui-one'.

/ncs-config/webui/login-dir (string)  
> The login-dir element points out an alternative login directory which
> contains your HTML code etc used to login to the Web UI. This
> directory will be mapped https://\<ip-address\>/login. If this element
> is not specified the default login/ directory in the docroot will be
> used instead.

/ncs-config/webui/custom-headers  
> The custom-headers element contains any number of header elements,
> with a valid header-field as defined in RFC7230.
>
> The headers will be part of all HTTP responses.

/ncs-config/webui/custom-headers/header/name (string)  

/ncs-config/webui/custom-headers/header/value (string)  
> This parameter is mandatory.

/ncs-config/webui/x-frame-options (DENY \| SAMEORIGIN \| ALLOW-FROM) \[DENY\]  
> By default the X-Frame-Options header is set to DENY for the
> /login.html and /index.html pages. With this header it can be set to
> SAMEORIGIN or ALLOW-FROM instead.

/ncs-config/webui/x-content-type-options (string) \[nosniff\]  
> The X-Content-Type-Options response HTTP header is a marker used by
> the server to indicate that the MIME types advertised in the
> Content-Type headers should not be changed and be followed. This
> allows to opt-out of MIME type sniffing, or, in other words, it is a
> way to say that the web admins knew what they were doing.
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/webui/x-xss-protection (string) \[1; mode=block\]  
> The HTTP X-XSS-Protection response header is a feature of Internet
> Explorer, Chrome and Safari that stops pages from loading when they
> detect reflected cross-site scripting (XSS) attacks. Although these
> protections are largely unnecessary in modern browsers when sites
> implement a strong Content-Security-Policy that disables the use of
> inline JavaScript ('unsafe-inline'), they can still provide
> protections for users of older web browsers that don't yet support
> CSP.
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/webui/strict-transport-security (string) \[max-age=15552000; includeSubDomains\]  
> The HTTP Strict-Transport-Security response header (often abbreviated
> as HSTS) lets a web site tell browsers that it should only be accessed
> using HTTPS, instead of using HTTP.
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/webui/content-security-policy (string) \[default-src 'self'; block-all-mixed-content; base-uri 'self'; frame-ancestors 'none';\]  
> The HTTP Content-Security-Policy response header allows web site
> administrators to control resources the user agent is allowed to load
> for a given page.
>
> The default value means that: Resources like fonts, scripts,
> connections, images, and styles will all only load from the same
> origin as the protected resource. All mixed contents will be blocked
> and frame-ancestors like iframes and applets is prohibited. See also:
>
> <div class="informalexample">
>
>       https://www.w3.org/TR/CSP3/
>
> </div>
>
> This header is always sent in HTTP responses. By setting the value to
> the empty string will cause the header not to be sent.

/ncs-config/webui/cross-origin-embedder-policy (string) \[require-corp\]  
> The HTTP Cross-Origin-Embedder-Policy (COEP) response header
> configures embedding cross-origin resources into the document.
>
> Always sent by default, can be disabled by setting the value to empty
> string.

/ncs-config/webui/cross-origin-opener-policy (string) \[same-origin\]  
> The HTTP Cross-Origin-Opener-Policy (COOP) response header allows you
> to ensure a top-level document does not share a browsing context group
> with cross-origin documents.
>
> Always sent by default, can be disabled by setting the value to empty
> string.

/ncs-config/webui/wasm-script-policy-pattern (string) \[(?i)\bwasm\b.\*\\js\$\]  
> The wasmScriptPolicyPattern is a regular expression that matches
> filenames in HTTP requests. If there is a match and the response
> includes a Content-Security-Policy (CSP), the 'script-src' policy is
> updated with the 'wasm-unsafe-eval' directive.
>
> The 'wasm-unsafe-eval' source expression controls the execution of
> WebAssembly. If a page contains a CSP header and the
> 'wasm-unsafe-eval' is specified in the script-src directive, the web
> browser allows the loading and execution of WebAssembly on the page.
>
> Setting the value to an empty string deactivates the match. If you
> still want to allow loading WebAssembly content with this disabled you
> would have to add 'wasm-unsafe-eval' to the 'script-src' rule in the
> CSP header, which. allows it for ALL files.
>
> The default value is a pattern that would case insensitively match any
> filename that contains the word 'wasm' surrounded by at least one
> non-word character (for example ' ', '.' or '-') and has the file
> extension 'js'.
>
> As an example 'dot.wasm.js' and 'WASM-dash.js' would match while
> 'underscore_wasm.js' would not.

/ncs-config/webui/disable-auth/dir (string)  
> This parameter may be given multiple times.
>
> The disable-auth element contains any number of dir elements. Each dir
> element points to a directory path in the docroot which should not be
> restricted by the AAA engine. If no dir elements are specifed the
> following directories and files will not be restricted by the AAA
> engine: '/login' and '/login.html'.

/ncs-config/webui/allow-symlinks (boolean) \[true\]  
> Allow symlinks in the docroot directory.

/ncs-config/webui/transport  
> Settings deciding which transport services the Web server should
> listen on, e.g. TCP and SSL.

/ncs-config/webui/transport/tcp  
> Settings deciding how the Web server TCP transport service should
> behave.

/ncs-config/webui/transport/tcp/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true', the Web server uses
> cleart text TCP as a transport service.

/ncs-config/webui/transport/tcp/redirect (string)  
> If given the user will be redirected to the specified URL. Two macros
> can be specified, i.e. @HOST@ and @PORT@. For example
> https://@HOST@:443 or https://192.12.4.3:@PORT@

/ncs-config/webui/transport/tcp/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> The IP address which the Web server should listen on. 0.0.0.0 means
> that it listens on the port (/ncs-config/webui/transport/tcp/port) for
> all IPv4 addresses on the machine.

/ncs-config/webui/transport/tcp/port (port-number) \[8008\]  
> port is a valid port number to be used in combination with the address
> in /ncs-config/webui/transport/tcp/ip.

/ncs-config/webui/transport/tcp/keepalive (boolean) \[false\]  
> keepalive is either 'true' or 'false' (default). When 'true' periodic
> polling of the other end of the connection will be done for sockets
> that have not exchanged data during the OS defined interval. The
> server will also periodicly send messages (':keepalive test') over the
> connection to detect if it is alive. The first message may not detect
> that the connection is down, but the subsequent one will. The OS
> keepalive service will only clean the OS socket, this timeout will
> clean the server processes.

/ncs-config/webui/transport/tcp/keepalive-timeout (uint64) \[3600\]  
> keepalive-timeout defines the time (in seconds, default 3600) the
> server will wait before trying to send keepalive messages.

/ncs-config/webui/transport/tcp/extra-listen  
> A list of additional IP address and port pairs which the Web server
> should also listen on.

/ncs-config/webui/transport/tcp/extra-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/webui/transport/tcp/extra-listen/port (port-number)  

/ncs-config/webui/transport/tcp/ha-primary-listen  
> When /ncs-config/ha/enable or /ncs-config/ha-raft/enable is set to
> 'true' and the current NCS node is active (i.e. primary/leader), then
> NCS will listen(2) to the following IPv4 or IPv6 addresses and ports.
> Once the previously active high-availability node transitions to a
> different role, then NCS will shutdown these listen addresses and
> terminate any ongoing traffic.

/ncs-config/webui/transport/tcp/ha-primary-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/webui/transport/tcp/ha-primary-listen/port (port-number)  

/ncs-config/webui/transport/ssl  
> Settings deciding how the Web server SSL (Secure Sockets Layer)
> transport service should behave.
>
> SSL is widely deployed on the Internet and virtually all bank
> transactions as well as all on-line shopping today is done with SSL
> encryption. There are many good sources on describing SSL in detail,
> e.g. http://www.tldp.org/HOWTO/SSL-Certificates-HOWTO/ which describes
> how to manage certificates and keys.

/ncs-config/webui/transport/ssl/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the Web server uses
> SSL as a transport service.

/ncs-config/webui/transport/ssl/redirect (string)  
> If given the user will be redirected to the specified URL. Two macros
> can be specified, i.e. @HOST@ and @PORT@. For example http://@HOST@:80
> or http://192.12.4.3:@PORT@

/ncs-config/webui/transport/ssl/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> The IP address which the Web server should listen on for incoming ssl
> connections. 0.0.0.0 means that it listens on the port
> (/ncs-config/webui/transport/ssl/port) for all IPv4 addresses on the
> machine.

/ncs-config/webui/transport/ssl/port (port-number) \[8888\]  
> port is a valid port number to be used in combination with
> /ncs-config/webui/transport/ssl/ip.

/ncs-config/webui/transport/ssl/keepalive (boolean) \[false\]  
> keepalive is either 'true' or 'false' (default). When 'true' periodic
> polling of the other end of the connection will be done for sockets
> that have not exchanged data during the OS defined interval. The
> server will also periodicly send messages (':keepalive test') over the
> connection to detect if it is alive. The first message may not detect
> that the connection is down, but the subsequent one will. The OS
> keepalive service will only clean the OS socket, this timeout will
> clean the server processes.

/ncs-config/webui/transport/ssl/keepalive-timeout (uint64) \[3600\]  
> keepalive-timeout defines the time (in seconds, default 3600) the
> server will wait before trying to send keepalive messages.

/ncs-config/webui/transport/ssl/extra-listen  
> A list of additional IP address and port pairs which the Web server
> should also listen on for incoming ssl connections.

/ncs-config/webui/transport/ssl/extra-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/webui/transport/ssl/extra-listen/port (port-number)  

/ncs-config/webui/transport/ssl/ha-primary-listen  
> When /ncs-config/ha/enable or /ncs-config/ha-raft/enable is set to
> 'true' and the current NCS node is active (i.e. primary/leader), then
> NCS will listen(2) to the following IPv4 or IPv6 addresses and ports.
> Once the previously active high-availability node transitions to a
> different role, then NCS will shutdown these listen addresses and
> terminate any ongoing traffic.

/ncs-config/webui/transport/ssl/ha-primary-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/webui/transport/ssl/ha-primary-listen/port (port-number)  

/ncs-config/webui/transport/ssl/read-from-db (boolean) \[false\]  
> If enabled, TLS data (certificate, private key, and CA certificates)
> is read from database. Corresponding configuration regarding reading
> TLS data (i.e. /ncs-config/webui/transport/ssl/key-file,
> /ncs-config/webui/transport/ssl/cert-file,
> /ncs-config/webui/transport/ssl/ca-cert-file) is ignored when enabled.
>
> See tailf-tls.yang and the NCS User Guide for more information.

/ncs-config/webui/transport/ssl/key-file (string)  
> Specifies which file that contains the private key for the
> certificate. Read more about certificates in
> /ncs-config/webui/transport/ssl/cert-file.
>
> During installation self signed certificates/keys are generated if the
> openssl binary is available on the host. Note: Only use these
> certificates/keys for test purposes.

/ncs-config/webui/transport/ssl/cert-file (string)  
> Specifies which file that contains the server certificate. The
> certificate is either a self-signed test certificate or a genuin and
> validated certificate bought from a CA (Certificate Authority).
>
> During installation self signed certificates/keys are generated if the
> openssl binary is available on the host. Note: Only use these
> certificates/keys for test purposes.
>
> This server certificate has been generated using a local CA
> certificate:
>
> <div class="informalexample">
>
>     $ openssl
>     OpenSSL> genrsa -out ca.key 4096
>     OpenSSL> req -new -x509 -days 3650 -key ca.key -out ca.cert
>     OpenSSL> genrsa -out host.key 4096
>     OpenSSL> req -new -key host.key -out host.csr
>     OpenSSL> x509 -req -days 365 -in host.csr -CA ca.cert \
>     -CAkey ca.key -set_serial 01 -out host.cert
>
> </div>

/ncs-config/webui/transport/ssl/ca-cert-file (string)  
> Specifies which file that contains the trusted certificates to use
> during client authentication and to use when attempting to build the
> server certificate chain. The list is also used in the list of
> acceptable CA certificates passed to the client when a certificate is
> requested.
>
> During installation self signed certificates/keys are generated if the
> openssl binary is available on the host. Note: Only use these
> certificates/keys for test purposes.
>
> This CA certificate has been generated as shown above.

/ncs-config/webui/transport/ssl/verify (uint32) \[1\]  
> Specifies the level of verification the server does on client
> certificates. 1 means nothing, 2 means the server will ask the client
> for a certificate but not fail if the client does not supply a client
> certificate, 3 means that the server requires the client to supply a
> client certificate.
>
> If ca-cert-file has been set to the ca.cert file generated above you
> can verify that it works correctly using, for example:
>
> <div class="informalexample">
>
>     $ openssl s_client -connect 127.0.0.1:8888 \
>     -cert client.cert -key client.key
>
> </div>
>
> For this to work client.cert must have been generated using the
> ca.cert from above:
>
> <div class="informalexample">
>
>     $ openssl
>     OpenSSL> genrsa -out client.key 4096
>     OpenSSL> req -new -key client.key -out client.csr
>     OpenSSL> x509 -req -days 3650 -in client.csr -CA ca.cert \
>       -CAkey ca.key -set_serial 01 -out client.cert
>
> </div>

/ncs-config/webui/transport/ssl/depth (uint64) \[1\]  
> Specifies the depth of certificate chains the server is prepared to
> follow when verifying client certificates.

/ncs-config/webui/transport/ssl/ciphers (string) \[DEFAULT\]  
> Specifies the cipher suites to be used by the server as a
> colon-separated list from the set
>
> TLS_AES_128_GCM_SHA256, TLS_AES_256_GCM_SHA384,
> TLS_AES_128_CCM_SHA256, ECDHE-ECDSA-AES128-SHA,
> ECDHE-ECDSA-AES128-GCM-SHA256, ECDHE-RSA-AES128-GCM-SHA256,
> DHE-RSA-AES128-GCM-SHA256, DHE-DSS-AES128-GCM-SHA256,
> ECDHE-ECDSA-AES128-SHA256, ECDHE-RSA-AES128-SHA256,
> ECDHE-RSA-AES128-SHA, DHE-RSA-AES128-SHA256, DHE-RSA-AES128-SHA,
> DHE-DSS-AES128-SHA256, DHE-DSS-AES128-SHA, AES128-GCM-SHA256,
> AES128-SHA256, AES128-SHA, ECDHE-ECDSA-DES-CBC3-SHA,
> ECDHE-RSA-DES-CBC3-SHA, EDH-RSA-DES-CBC3-SHA, EDH-DSS-DES-CBC3-SHA,
> ECDH-ECDSA-DES-CBC3-SHA, DES-CBC3-SHA, DHE-RSA-AES256-SHA, AES256-SHA,
> ECDHE-ECDSA-AES256-GCM-SHA384, ECDHE-RSA-AES256-GCM-SHA384,
> DHE-RSA-AES256-GCM-SHA384, DHE-DSS-AES256-GCM-SHA384,
> ECDHE-ECDSA-AES256-SHA384, ECDHE-RSA-AES256-SHA384,
> DHE-RSA-AES256-SHA256, DHE-DSS-AES256-SHA256, AES256-GCM-SHA384, and
> AES256-SHA256,
>
> or the word "DEFAULT", which expands to a list containing
>
> ECDHE-ECDSA-AES128-SHA, ECDHE-ECDSA-AES128-GCM-SHA256,
> ECDHE-RSA-AES128-GCM-SHA256, DHE-RSA-AES128-GCM-SHA256,
> DHE-DSS-AES128-GCM-SHA256, ECDHE-ECDSA-AES128-SHA256,
> ECDHE-RSA-AES128-SHA256, ECDHE-RSA-AES128-SHA, DHE-RSA-AES128-SHA256,
> DHE-RSA-AES128-SHA, DHE-DSS-AES128-SHA256, DHE-DSS-AES128-SHA,
> AES128-GCM-SHA256, AES128-SHA256, AES128-SHA,
> ECDHE-ECDSA-AES256-GCM-SHA384, ECDHE-RSA-AES256-GCM-SHA384,
> DHE-RSA-AES256-GCM-SHA384, DHE-DSS-AES256-GCM-SHA384,
> ECDHE-ECDSA-AES256-SHA384, ECDHE-RSA-AES256-SHA384,
> DHE-RSA-AES256-SHA256, DHE-DSS-AES256-SHA256, AES256-GCM-SHA384, and
> AES256-SHA256.
>
> See the OpenSSL manual page ciphers(1) for the definition of the
> cipher suites. NOTE: The general cipher list syntax described in
> ciphers(1) is not supported.

/ncs-config/webui/transport/ssl/protocols (string) \[DEFAULT\]  
> Specifies the SSL/TLS protocol versions to be used by the server as a
> whitespace-separated list from the set tlsv1 tlsv1.1 tlsv1.2 tlsv1.3,
> or the word "DEFAULT" (use all supported protocol versions except the
> set tlsv1 tlsv1.1).

/ncs-config/webui/transport/ssl/elliptic-curves (string) \[DEFAULT\]  
> Specifies the curves for Elliptic Curve cipher suites to be used by
> the server as a whitespace-separated list from the set
>
> secp256r1, secp256k1, secp384r1, secp521r1, sect571r1, sect571k1,
> brainpoolP512r1, sect409k1, sect409r1, brainpoolP384r1, sect283k1,
> sect283r1, brainpoolP256r1, sect239k1, sect233k1, sect233r1,
> secp224k1, and secp224r1,
>
> or the word "DEFAULT", which expands to a list containing
>
> secp256r1, secp256k1, secp384r1, secp521r1, sect571r1, sect571k1,
> brainpoolP512r1, sect409k1, sect409r1, brainpoolP384r1, sect283k1,
> sect283r1, and brainpoolP256r1.

/ncs-config/webui/transport/unauthenticated-message-limit (uint32 \| nolimit) \[65536\]  
> Limit the size of allowed unauthenticated messages. Limit is given in
> bytes or 'nolimit'. The default is 64kB.

/ncs-config/webui/cgi  
> CGI-script support

/ncs-config/webui/cgi/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', CGI-script support is
> enabled.

/ncs-config/webui/cgi/dir (string) \[cgi-bin\]  
> The directory path to the location of the CGI-scripts.

/ncs-config/webui/cgi/request-filter (string)  
> Specifies that characters not specified in the given regexp should be
> filtered out silently.

/ncs-config/webui/cgi/max-request-length (uint16)  
> Specifies the maximum amount of characters in a request. All
> characters exceedig this limit are silenty ignored.

/ncs-config/webui/cgi/php  
> PHP support

/ncs-config/webui/cgi/php/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', PHP support is
> enabled.

/ncs-config/webui/idle-timeout (xs:duration) \[PT30M\]  
> Maximum idle time before terminating a Web UI session. PT0M means no
> timeout. Default is PT30M, ie 30 minutes.

/ncs-config/webui/absolute-timeout (xs:duration) \[PT16H\]  
> Maximum absolute time before terminating a Web UI session. PT0M means
> no timeout. Default is PT16H, ie 16 hours.

/ncs-config/webui/rate-limiting (uint64) \[1000000\]  
> Maximum number of allowed JSON-RPC requests every hour. 0 means
> infinity. Default is 1 million.

/ncs-config/webui/audit (boolean) \[false\]  
> audit is either 'true' or 'false'. If 'true', then JSON-RPC/CGI
> requests are logged to the audit log.

/ncs-config/webui/use-forwarded-client-ip  
> This section is created if a Client IP address should be looked for
> among HTTP headers such as 'X-Forwarded-For' or 'X-REAL-IP', etc.

/ncs-config/webui/use-forwarded-client-ip/proxy-headers (string)  
> This parameter is mandatory.
>
> This parameter may be given multiple times.
>
> Name of HTTP headers that contain the true Client IP address.
>
> Typically the de facto standard is to use the 'X-Forwarded-For'
> header, but other headers exists, e.g: 'X-REAL-IP'.
>
> The first header in this list, found to contain an IP address will
> cause this IP address to be used as the Client IP address. In case of
> several elements, the first element, separated by a space or comma,
> will be used. The header name specified here is not case sensitive.
>
> Example of HTTP headers containing a ClientIP:
>
> <div class="informalexample">
>
>          X-Forwarded-For: ClientIP, ProxyIP1, ProxyIP2
>          X-REAL-IP: ClientIP
>
> </div>

/ncs-config/webui/use-forwarded-client-ip/allowed-proxy-ip-prefix (inet:ip-prefix)  
> This parameter is mandatory.
>
> This parameter may be given multiple times.
>
> Only the source IP-prefix addresses listed here will be trusted to
> contain a Client IP address in a HTTP header as specified in
> 'proxyHeaders'

/ncs-config/webui/package-upload  
> Settings for the /package-upload URL.

/ncs-config/webui/package-upload/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the /package-upload
> URL will be available.

/ncs-config/webui/package-upload/max-files (uint64) \[1\]  
> Specifies the maximum number of files allowed in an upload request. If
> a request contains more files than max-files, then the remaining file
> parts will result in an error and its content will be ignored.

/ncs-config/webui/resources  
> Settings for the /resources URL.

/ncs-config/webui/resources/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the /resources URL
> will be available.

/ncs-config/japi  
> Java-API parameters.

/ncs-config/japi/new-session-timeout (xs:duration) \[PT30S\]  
> Timeout for a data provider to respond to a control socket request,
> see DpTrans. If the Dp fails to respond within the given time, it will
> be disconnected.

/ncs-config/japi/query-timeout (xs:duration) \[PT120S\]  
> Timeout for a data provider to respond to a worker socket query, see
> DpTrans. If the dp fails to respond within the given time, it will be
> disconnected.

/ncs-config/japi/connect-timeout (xs:duration) \[PT60S\]  
> Timeout for data provider to send initial message after connecting the
> socket to the NCS server. If the dp fails to initiate the connection
> within the given time, it will be disconnected.

/ncs-config/japi/object-cache-timeout (xs:duration) \[PT2S\]  
> Timeout for the cache used by the getObject() and
> iterator(),nextObject() callback requests. NCS caches the result of
> these calls and serves getElem() requests from northbound agents from
> the cache. NOTE: Setting this timeout too low will effectively cause
> the callbacks to be non-functional - e.g. getObject() may be invoked
> for each getElem() request from a northbound agent.

/ncs-config/japi/event-reply-timeout (xs:duration) \[PT120S\]  
> Timeout for the reply from an event notification subscriber for a
> notification that requires a reply, see the Notif class. If the
> subscriber fails to reply within the given time, the event
> notification socket will be closed.

/ncs-config/netconf-north-bound  
> This section defines settings which decide how the NETCONF agent
> should behave, with respect to NETCONF and SSH.

/ncs-config/netconf-north-bound/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true', the NETCONF agent is
> started.

/ncs-config/netconf-north-bound/transport  
> Settings deciding which transport services the NETCONF agent should
> listen on, e.g. TCP and SSH.

/ncs-config/netconf-north-bound/transport/ssh-call-home-source-address  
> This section provides the possibility to specify the source address to
> use for NETCONF call home connnections. In most cases the source
> address assignment is best left to the TCP/IP stack in the OS, since
> an incorrectly chosen address may result in connection failures.
> However in case there is more than one address that could be chosen by
> the stack, and we need to restrict the choice to one of them, these
> settings can be used. Currently only supported when the internal SSH
> stack is used.

/ncs-config/netconf-north-bound/transport/ssh-call-home-source-address/ipv4 (ipv4-address)  
> The source address to use for call home IPv4 connections. If not set,
> the source address will be assigned by the OS.

/ncs-config/netconf-north-bound/transport/ssh-call-home-source-address/ipv6 (ipv6-address)  
> The source address to use for call home IPv6 connections. If not set,
> the source address will be assigned by the OS.

/ncs-config/netconf-north-bound/transport/ssh  
> Settings deciding how the NETCONF SSH transport service should behave.

/ncs-config/netconf-north-bound/transport/ssh/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true', the NETCONF agent uses
> SSH as a transport service.

/ncs-config/netconf-north-bound/transport/ssh/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> ip is an IP address which the NCS NETCONF agent should listen on.
> 0.0.0.0 means that it listens on the port
> (/ncs-config/netconf-north-bound/transport/ssh/port) for all IPv4
> addresses on the machine.

/ncs-config/netconf-north-bound/transport/ssh/port (port-number) \[2022\]  
> port is a valid port number to be used in combination with
> /ncs-config/netconf-north-bound/transport/ssh/ip. Note that the
> standard port for NETCONF over SSH is 830.

/ncs-config/netconf-north-bound/transport/ssh/use-keyboard-interactive (boolean) \[false\]  
> Need to be set to true if using challenge/response authentication for
> NETCONF SSH.

/ncs-config/netconf-north-bound/transport/ssh/extra-listen  
> A list of additional IP address and port pairs which the NCS NETCONF
> agent should also listen on.

/ncs-config/netconf-north-bound/transport/ssh/extra-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/netconf-north-bound/transport/ssh/extra-listen/port (port-number)  

/ncs-config/netconf-north-bound/transport/ssh/ha-primary-listen  
> When /ncs-config/ha/enable or /ncs-config/ha-raft/enable is set to
> 'true' and the current NCS node is active (i.e. primary/leader), then
> NCS will listen(2) to the following IPv4 or IPv6 addresses and ports.
> Once the previously active high-availability node transitions to a
> different role, then NCS will shutdown these listen addresses and
> terminate any ongoing traffic.

/ncs-config/netconf-north-bound/transport/ssh/ha-primary-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/netconf-north-bound/transport/ssh/ha-primary-listen/port (port-number)  

/ncs-config/netconf-north-bound/transport/tcp  
> NETCONF over TCP is not standardized, but it can be useful during
> development in order to use e.g. netcat for scripting. It is also
> useful if we want to use our own proprietary transport. In that case
> we setup the NETCONF agent to listen on localhost and then proxy it
> from our transport service module.

/ncs-config/netconf-north-bound/transport/tcp/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the NETCONF agent uses
> clear text TCP as a transport service.

/ncs-config/netconf-north-bound/transport/tcp/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> ip is an IP address which the NCS NETCONF agent should listen on.
> 0.0.0.0 means that it listens on the port
> (/ncs-config/netconf-north-bound/transport/tcp/port) for all IPv4
> addresses on the machine.

/ncs-config/netconf-north-bound/transport/tcp/port (port-number) \[2023\]  
> port is a valid port number to be used in combination with
> /ncs-config/netconf-north-bound/transport/tcp/ip.

/ncs-config/netconf-north-bound/transport/tcp/keepalive (boolean) \[false\]  
> keepalive is either 'true' or 'false' (default). When 'true' periodic
> polling of the other end of the connection will be done for sockets
> that have not exchanged data during the OS defined interval.

/ncs-config/netconf-north-bound/transport/tcp/extra-listen  
> A list of additional IP address and port pairs which the NCS NETCONF
> agent should also listen on.

/ncs-config/netconf-north-bound/transport/tcp/extra-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/netconf-north-bound/transport/tcp/extra-listen/port (port-number)  

/ncs-config/netconf-north-bound/transport/tcp/ha-primary-listen  
> When /ncs-config/ha/enable or /ncs-config/ha-raft/enable is set to
> 'true' and the current NCS node is active (i.e. primary/leader), then
> NCS will listen(2) to the following IPv4 or IPv6 addresses and ports.
> Once the previously active high-availability node transitions to a
> different role, then NCS will shutdown these listen addresses and
> terminate any ongoing traffic.

/ncs-config/netconf-north-bound/transport/tcp/ha-primary-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/netconf-north-bound/transport/tcp/ha-primary-listen/port (port-number)  

/ncs-config/netconf-north-bound/extended-sessions (boolean) \[false\]  
> If extended-sessions are enabled, all NCS sessions can be terminated
> using \<kill-session\>, i.e. not only can other NETCONF session be
> terminated, but also CLI sessions, Webui sessions etc. If such a
> session holds a lock, it's session id will be returned in the
> \<lock-denied\>, instead of '0'.
>
> Strictly speaking, this extension is not covered by the NETCONF
> specification; therefore it's false by default.

/ncs-config/netconf-north-bound/idle-timeout (xs:duration) \[PT0S\]  
> Maximum idle time before terminating a NETCONF session. If the session
> is waiting for notifications, or has a pending confirmed commit, the
> idle timeout is not used. The default value is 0, which means no
> timeout.
>
> Modification of this value will only affect connections that are
> established after the modification has been done.

/ncs-config/netconf-north-bound/write-timeout (xs:duration) \[PT0S\]  
> Maximum time for a write operation towards a client to complete. If
> the time is exceeded, the NETCONF session is terminated. The default
> value is 0, which means no timeout.
>
> Modification of this value will only affect connections that are
> established after the modification has been done.

/ncs-config/netconf-north-bound/transaction-reuse-timeout (xs:duration) \[PT2S\]  
> Maximum time after the completion of a transaction the system will
> wait to close the transaction or reuse it for another NETCONF request.
>
> Modification of this value will only affect connections that are
> established after the modification has been done.

/ncs-config/netconf-north-bound/rpc-errors (close \| inline) \[close\]  
> If rpc-errors is 'inline', and an error occurs during the processing
> of a \<get\> or \<get-config\> request when NCS tries to fetch some
> data from a data provider, NCS will generate an rpc-error element in
> the faulty element, and continue to process the next element.
>
> If an error occurs and rpc-errors is 'close', the NETCONF transport is
> closed by NCS.

/ncs-config/netconf-north-bound/max-batch-processes (uint32 \| unbounded) \[unbounded\]  
> Controls how many concurrent NETCONF batch processes there can be at
> any time. A batch process can be started by the agent if a new NETCONF
> operation is implemented as a batch operation. See the NETCONF chapter
> in the NCS User's Guide for details.

/ncs-config/netconf-north-bound/capabilities  
> Decide which NETCONF capabilities to enable here.

/ncs-config/netconf-north-bound/capabilities/url  
> Turn on the URL capability options we want to support.

/ncs-config/netconf-north-bound/capabilities/url/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the url NETCONF
> capability is enabled.

/ncs-config/netconf-north-bound/capabilities/url/file  
> Decide how the url file support should behave.

/ncs-config/netconf-north-bound/capabilities/url/file/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true', the url file scheme is
> enabled.

/ncs-config/netconf-north-bound/capabilities/url/file/root-dir (string)  
> root-dir is a directory path on disk where the system stores the
> result from a NETCONF operation using the url capability. This
> parameter must be set if the file url scheme is enabled.

/ncs-config/netconf-north-bound/capabilities/url/ftp  
> Decide how the url ftp scheme should behave.

/ncs-config/netconf-north-bound/capabilities/url/ftp/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true', the url ftp scheme is
> enabled.

/ncs-config/netconf-north-bound/capabilities/url/ftp/source-address  
> This section provides the possibility to specify the source address to
> use for ftp connnections. In most cases the source address assignment
> is best left to the TCP/IP stack in the OS, since an incorrectly
> chosen address may result in connection failures. However in case
> there is more than one address that could be chosen by the stack, and
> we need to restrict the choice to one of them, these settings can be
> used.

/ncs-config/netconf-north-bound/capabilities/url/ftp/source-address/ipv4 (ipv4-address)  
> The source address to use for IPv4 connections. If not set, the source
> address will be assigned by the OS.

/ncs-config/netconf-north-bound/capabilities/url/ftp/source-address/ipv6 (ipv6-address)  
> The source address to use for IPv6 connections. If not set, the source
> address will be assigned by the OS.

/ncs-config/netconf-north-bound/capabilities/url/sftp  
> Decide how the url sftp scheme should behave.

/ncs-config/netconf-north-bound/capabilities/url/sftp/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true', the url sftp scheme is
> enabled.

/ncs-config/netconf-north-bound/capabilities/url/sftp/source-address  
> This section provides the possibility to specify the source address to
> use for sftp connnections. In most cases the source address assignment
> is best left to the TCP/IP stack in the OS, since an incorrectly
> chosen address may result in connection failures. However in case
> there is more than one address that could be chosen by the stack, and
> we need to restrict the choice to one of them, these settings can be
> used.

/ncs-config/netconf-north-bound/capabilities/url/sftp/source-address/ipv4 (ipv4-address)  
> The source address to use for IPv4 connections. If not set, the source
> address will be assigned by the OS.

/ncs-config/netconf-north-bound/capabilities/url/sftp/source-address/ipv6 (ipv6-address)  
> The source address to use for IPv6 connections. If not set, the source
> address will be assigned by the OS.

/ncs-config/netconf-north-bound/capabilities/inactive  
> DEPRECATED - the YANG module tailf-netconf-inactive will be announced
> if its fxs file is found in the loadPath and
> /ncs-config/enable-inactive is set.
>
> Control of the inactive capability option.

/ncs-config/netconf-north-bound/capabilities/inactive/enabled (boolean) \[true\]  
> enabled is either 'true' or 'false'. If 'true', the
> 'http://tail-f.com/ns/netconf/inactive/1.0' capability is enabled.

/ncs-config/netconf-call-home  
> This section defines settings which decide how the NETCONF Call Home
> client should behave, with respect to TCP.

/ncs-config/netconf-call-home/enabled (boolean) \[false\]  
> enabled is either 'true' or 'false'. If 'true', the NETCONF Call Home
> client is started.

/ncs-config/netconf-call-home/transport  
> Settings for the NETCONF Call Home transport service.

/ncs-config/netconf-call-home/transport/tcp  
> The NETCONF Call Home client listens for TCP connection requests.

/ncs-config/netconf-call-home/transport/tcp/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> ip is an IP address which the NETCONF Call Home client should listen
> on. 0.0.0.0 means that it listens on the port
> (/ncs-config/netconf-call-home/transport/tcp/port) for all IPv4
> addresses on the machine.

/ncs-config/netconf-call-home/transport/tcp/port (port-number) \[4334\]  
> port is a valid port number to be used in combination with
> /ncs-config/netconf-call-home/transport/tcp/ip.

/ncs-config/netconf-call-home/transport/tcp/extra-listen  
> A list of additional IP address and port pairs which the NETCONF Call
> Home client should also listen on.

/ncs-config/netconf-call-home/transport/tcp/extra-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/netconf-call-home/transport/tcp/extra-listen/port (port-number)  

/ncs-config/netconf-call-home/transport/tcp/dscp (dscp-type)  
> Support for setting the Differentiated Services Code Point (6 bits)
> for traffic originating from the NETCONF Call Home client for TCP
> connections.

/ncs-config/netconf-call-home/transport/ssh/idle-connection-timeout (xs:duration) \[PT30S\]  
> The maximum time that the authenticated SSH connection is allowed to
> exist without open channels. If the timeout is reached, the SSH server
> closes the connection. Default is PT30S, i.e. 30 seconds. If the value
> is 0, there is no timeout.

/ncs-config/southbound-source-address  
> This section provides the possibility to specify the source address to
> use for southbound connnections from NCS to the devices. In most cases
> the source address assignment is best left to the TCP/IP stack in the
> OS, since an incorrectly chosen address may result in connection
> failures. However in case there is more than one address that could be
> chosen by the stack, and we need to restrict the choice to one of
> them, these settings can be used.

/ncs-config/southbound-source-address/ipv4 (ipv4-address)  
> The source address to use for southbound IPv4 connections. If not set,
> the source address will be assigned by the OS.

/ncs-config/southbound-source-address/ipv6 (ipv6-address)  
> The source address to use for southbound IPv6 connections. If not set,
> the source address will be assigned by the OS.

/ncs-config/ha-raft/enabled (boolean) \[false\]  
> If set to true, the HA Raft mode is enabled.

/ncs-config/ha-raft/cluster-name (string)  
> Unique cluster identifier. All HA nodes of a cluster must be
> configured with the same cluster-name.

/ncs-config/ha-raft/listen/node-address (fq-domain-name-with-optional-node-id \| ipv4-address-with-optional-node-id \| ipv6-address-with-optional-node-id)  
> This parameter is mandatory.
>
> The address uniquely identifies the NCS HA node and also binds
> corresponding address for incoming connections. The format is either
> n1.acme.com, 10.45.22.11, fe11::ff or with the optional node-id part
> ncsd@n1.acme.com, ncsd@10.45.22.11 or ncsd@fe11::ff The latter
> addresses allow multiple NCS HA nodes to run on the same host.
>
> Note: wildcard addresses (such as '0.0.0.0' and '::') are invalid

/ncs-config/ha-raft/listen/min-port (inet:port-number) \[4370\]  
> Specifies the lower bound in the range of ports the local HA node is
> allowed to listen for incoming connections.

/ncs-config/ha-raft/listen/max-port (inet:port-number) \[4399\]  
> Specifies the upper bound in the range of ports the local HA node is
> allowed to listen for incoming connections.

/ncs-config/ha-raft/seed-nodes/seed-node (fq-domain-name-with-optional-node-id \| ipv4-address-with-optional-node-id \| ipv6-address-with-optional-node-id)  
> This parameter may be given multiple times.
>
> The address of an NCS HA node that the local NCS node should try to
> connect to when starting up to establish connectivity to the HA
> cluster.

/ncs-config/ha-raft/ssl/enabled (boolean) \[true\]  
> If set to 'true', all communication between NCS HA nodes is done over
> SSL/TLS.
>
> WARNING: only set this leaf to 'false' during testing/debugging, all
> communication between HA nodes is transported unencrypted and no
> authentication is performed. HA Raft communicates over Distributed
> Erlang protocol which allows any Erlang node to execute code remotely
> on the nodes connected to using Remote Process Calls (rpc).

/ncs-config/ha-raft/ssl/key-file (string)  
> Specifies which file that contains the private key for the
> certificate.

/ncs-config/ha-raft/ssl/cert-file (string)  
> Specifies which file that contains the HA node certificate.

/ncs-config/ha-raft/ssl/ca-cert-file (string)  
> Specifies which file that contains the trusted certificates to use
> during peer authentication and to use when attempting to build the
> certificate chain.

/ncs-config/ha-raft/ssl/crl-dir (string)  
> Path to directory where Certificate Revocation Lists (CRL) are stored
> in files named by the hash of the issuer name suffixed with '.rN'
> where 'N' is an integer represention the version, e.g., 90a3ab2b.r0.
>
> The hash of the CRL issuer can be displayed using openssl, for
> example:
>
> <div class="informalexample">
>
>        $ openssl crl -hash -noout -in crl.pem
>
> </div>

/ncs-config/ha-raft/tick-timeout (xs:duration) \[PT1S\]  
> Defines the timeout between keepalive ticks sent between HA RAFT
> nodes. If a node fails to reply to three ticks, an alarm is raised. If
> later on the node recovers, the alarm is cleared.
>
> Since this mechanism does not automatically disconnect the node but
> only raises an alarm, and the ability of clients to commit
> transactions relies on availability of sufficient number of nodes, the
> leaf uses a more aggresive default value.

/ncs-config/ha-raft/storage-timeout (xs:duration) \[PT2H\]  
> Defines the timeout value for snapshot loading on HA RAFT follower
> nodes.

/ncs-config/ha-raft/follower-max-lag (uint32) \[50000\]  
> Maximum number of RAFT log entries that an HA node can lag behing the
> leader node before triggering a bulk log transfer or snapshot recovery
> to catch up to the leader.

/ncs-config/ha-raft/log-max-entries (uint64) \[200000\]  
> Maximum number of RAFT log entries kept as state on the HA cluster
> leader. Upon reaching this limit all previous entries will be trimmed.
>
> Note, cluster members lagging behind the oldest available entry will
> require snapshot recovery. It is recommended to keep at least twice
> the amount of entries than the allowed follower lag.

/ncs-config/ha/enabled (boolean) \[false\]  
> If set to true, the HA mode is enabled.

/ncs-config/ha/ip (ipv4-address \| ipv6-address) \[0.0.0.0\]  
> The IP address which NCS listens to for incoming connections from
> other HA nodes

/ncs-config/ha/port (port-number) \[4570\]  
> The port number which NCS listens to for incoming connections from
> other HA nodes

/ncs-config/ha/extra-listen  
> A list of additional IP address and port pairs which are used for
> incoming requests from other HA nodes.

/ncs-config/ha/extra-listen/ip (ipv4-address \| ipv6-address)  

/ncs-config/ha/extra-listen/port (port-number)  

/ncs-config/ha/tick-timeout (xs:duration) \[PT20S\]  
> Defines the timeout between keepalive ticks sent between HA nodes. The
> special value 'PT0' means that no keepalive ticks will ever be sent.

/ncs-config/scripts  
> It is possible to add scripts to control various things in NCS, such
> as post-commit callbacks. New CLI commands can also be added. The
> scripts must be stored under /ncs-config/scripts/dir where there is a
> sub-directory for each sript category. For some script categories it
> suffices to just add a script in the correct the sub-directory in
> order to enable the script. For others some configuration needs to be
> done.

/ncs-config/scripts/dir (string)  
> This parameter may be given multiple times.
>
> Directory path to the location of plug-and-play scripts. The scripts
> directory must have the following sub-directories:
>
> <div class="informalexample">
>
>       scripts/command/
>              post-commit/
>
> </div>

/ncs-config/java-vm  
> Configuration parameters to control how and if NCS shall start (and
> restart) the Java Virtual Machine.

/ncs-config/java-vm/auto-start (boolean) \[true\]  
> If 'true', NCS automatically starts the Java VM, using the
> 'start-command'.

/ncs-config/java-vm/auto-restart (boolean) \[true\]  
> Restart the Java VM if it terminates.
>
> Only applicable if auto-start is 'true'.

/ncs-config/java-vm/start-command (string)  
> The command which NCS will run to start the Java VM, or the string
> DEFAULT. If this parameter is not set, the ncs-start-java-vm script in
> the NCS installation directory will be used as the start command. The
> string DEFAULT is supported for backward compatibility reasons and is
> equivalent to leaving this parameter unset.

/ncs-config/java-vm/run-in-terminal  
> Enable this feature to run the Java VM inside a terminal, such as
> xterm or gnome-terminal.
>
> This can be very convenient during development; to restart the Java
> VM, just kill the terminal.
>
> Only applicable if auto-start is 'true'.

/ncs-config/java-vm/run-in-terminal/enabled (boolean) \[false\]  

/ncs-config/java-vm/run-in-terminal/terminal-command (string) \[xterm -title ncs-java-vm -e\]  
> The command which NCS will run to start the terminal, or the string
> DEFAULT. The string DEFAULT is supported for backward compatibility
> reasons and is equivalent to leaving this parameter unset.

/ncs-config/java-vm/stdout-capture/enabled (boolean)  
> Enable stdout and stderr capture

/ncs-config/java-vm/stdout-capture/file (string)  
> The prefix used for the Java VM log file, or the string DEFAULT.
> Setting a value here overrides any setting for
> /java-vm/stdout-capture/file in the tailf-ncs-java-vm.yang submodule.
> The string DEFAULT means that the default as specified in
> tailf-ncs-java-vm.yang should be used.

/ncs-config/java-vm/restart-on-error/enabled (boolean) \[false\]  
> If true, catching 'count' number of exceptions from a package within
> 'duration' seconds will result in the java-vm being restarted. If
> false, the 'count' and 'duration' settings below do not have any
> effect. Exceptions from a package will lead to only that package being
> redeployed.

/ncs-config/java-vm/restart-on-error/count (uint16) \[3\]  

/ncs-config/java-vm/restart-on-error/duration (xs:duration) \[PT60S\]  

/ncs-config/python-vm  
> Configuration parameters to control how and if NCS shall start (and
> restart) the Python Virtual Machine.

/ncs-config/python-vm/auto-start (boolean) \[true\]  
> If 'true', NCS automatically starts the Python VM, using the
> 'start-command'.

/ncs-config/python-vm/auto-restart (boolean) \[true\]  
> Restart the Python VM if it terminates.
>
> Only applicable if auto-start is 'true'.

/ncs-config/python-vm/start-command (string)  
> The command which NCS will run to start the Python VM, or the string
> DEFAULT. If this parameter is not set, the ncs-start-python-vm script
> in the NCS installation directory will be used as the start command.
> The string DEFAULT is supported for backward compatibility reasons and
> is equivalent to leaving this parameter unset.

/ncs-config/python-vm/run-in-terminal/enabled (boolean) \[false\]  

/ncs-config/python-vm/run-in-terminal/terminal-command (string) \[xterm -title ncs-python-vm -e\]  
> The command which NCS will run to start the terminal, or the string
> DEFAULT. The string DEFAULT is supported for backward compatibility
> reasons and is equivalent to leaving this parameter unset.

/ncs-config/python-vm/logging/log-file-prefix (string)  
> The prefix used for the Python VM log file, or the string DEFAULT.
> Setting a value here overrides any setting for
> /python-vm/logging/log-file-prefix in the tailf-ncs-python-vm.yang
> submodule. The string DEFAULT means that the default as specified in
> tailf-ncs-python-vm.yang should be used.

/ncs-config/python-vm/start-timeout (xs:duration) \[PT30S\]  
> Timeout for each Python VM to start and initialize registered classes
> after it has been started by NCS.

/ncs-config/smart-license  
> This section provides the possibility to override parameters in the
> tailf-ncs-smart-license.yang submodule, thus preventing setting of
> those parameters via northbound interfaces from having any effect,
> even if the NACM access rules allow it.
>
> Refer to tailf-ncs-smart-license.yang for a detailed description of
> the parameters.

/ncs-config/smart-license/smart-agent/java-executable (string)  
> The Java VM executable that NCS will use for smart licensing, or the
> string DEFAULT. Setting a value here overrides any setting for
> /smart-license/smart-agent/java-executable in the
> tailf-ncs-smart-license.yang submodule. The string DEFAULT means that
> the default as specified in tailf-ncs-smart-license.yang should be
> used.

/ncs-config/smart-license/smart-agent/java-options (string)  
> Options which NCS will use when starting the Java VM, or the string
> DEFAULT. Setting a value here overrides any setting for
> /smart-license/smart-agent/java-options in the
> tailf-ncs-smart-license.yang submodule. The string DEFAULT means that
> the default as specified in tailf-ncs-smart-license.yang should be
> used.

/ncs-config/smart-license/smart-agent/production-url (uri \| string)  
> URL that NCS will use when connecting to the Cisco licensing cloud or
> the string DEFAULT. Setting a value here overrides any setting for
> /smart-license/smart-agent/production-url in the
> tailf-ncs-smart-license.yang submodule. The string DEFAULT means that
> the default as specified in tailf-ncs-smart-license.yang should be
> used.

/ncs-config/smart-license/smart-agent/alpha-url (uri \| string)  
> URL that NCS will use when connecting to the Alpha licensing cloud or
> the string DEFAULT. Setting a value here overrides any setting for
> /smart-license/smart-agent/alpha-url in the
> tailf-ncs-smart-license.yang submodule. The string DEFAULT means that
> the default as specified in tailf-ncs-smart-license.yang should be
> used.

/ncs-config/smart-license/smart-agent/override-url/url (uri \| string)  
> URL that NCS will use when connecting to the Cisco licensing cloud or
> the string DEFAULT. Setting a value here overrides any setting for
> /smart-license/smart-agent/override-url in the
> tailf-ncs-smart-license.yang submodule. The string DEFAULT means that
> the default as specified in tailf-ncs-smart-license.yang should be
> used.

/ncs-config/smart-license/smart-agent/proxy/url (uri \| string)  
> Proxy URL for the smart licensing agent, or the string DEFAULT.
> Setting a value here overrides any setting for
> /smart-license/smart-agent/proxy/url in the
> tailf-ncs-smart-license.yang submodule. The string DEFAULT effectively
> disables the proxy URL, since there is no default specified in
> tailf-ncs-smart-license.yang.

/ncs-config/disable-schema-uri-for-agents (netconf \| rest)  
> This parameter may be given multiple times.
>
> disable-schema-uri-for-agents is a leaf-list of northbound agents that
> schema leaf is not wanted in the ietf-yang-library:modules-state
> resource response.

### Yang Types

#### bsd-facility-type

The facility argument is used to specify what type of program is logging
the message. This lets the syslog configuration file specify that
messages from different facilities will be handled differently

#### fq-domain-name-with-optional-node-id

Fully qualified domain name. Similar to inet:domain-name but requires at
least two domain parts and allows for an optional node-id part.

#### ip-address-with-optional-node-id

Similar to inet:ip-address with an optional node-id part.

### See Also

`ncs(1)` - command to start and control the NCS daemon

---

## `tailf_yang_cli_extensions`

`tailf_yang_cli extensions` - Tail-f YANG CLI extensions

### Synopsis

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

### Description

This manpage describes all the Tail-f CLI extension statements.

The YANG source file `$NCS_DIR/src/ncs/yang/tailf-cli-extensions.yang`
gives the exact YANG syntax for all Tail-f YANG CLI extension
statements - using the YANG language itself.

Most of the concepts implemented by the extensions listed below are
described in the User Guide.

### Yang Statements

#### tailf:cli-add-mode

Creates a mode of the container.

Can be used in config nodes only.

Used in I- and C-style CLIs.

The *cli-add-mode* statement can be used in: *container* and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

#### tailf:cli-allow-join-with-key

Indicates that the list name may be written together with the first key,
without requiring a whitespace in between, ie allowing both interface
ethernet1/1 and interface ethernet 1/1

Used in I- and C-style CLIs.

The *cli-allow-join-with-key* statement can be used in: *list* and
*refine*.

The following substatements can be used:

*tailf:cli-display-joined* Specifies that the joined version should be
used when displaying the configuration in C- and I- mode.

#### tailf:cli-allow-join-with-value

Indicates that the leaf name may be written together with the value,
without requiring a whitespace in between, ie allowing both interface
ethernet1/1 and interface ethernet 1/1

Used in I- and C-style CLIs.

The *cli-allow-join-with-value* statement can be used in: *leaf* and
*refine*.

The following substatements can be used:

*tailf:cli-display-joined* Specifies that the joined version should be
used when displaying the configuration in C- and I- mode.

#### tailf:cli-allow-key-abbreviation

Key values can be abbreviated.

In the J-style CLI this is relevant when using the commands 'delete' and
'edit'.

In the I- and C-style CLIs this is relevant when using the commands
'no', 'show configuration' and for commands to enter submodes.

See also /confdConfig/cli/allowAbbrevKeys in confd.conf(5).

The *cli-allow-key-abbreviation* statement can be used in: *list* and
*refine*.

#### tailf:cli-allow-range

Means that the non-integer key should allow range expressions and
wildcard usage.

Can be used in key leafs only.

Used in J-, I- and C-style CLIs.

The *cli-allow-range* statement can be used in: *leaf* and *refine*.

#### tailf:cli-allow-wildcard

Means that the list allows wildcard expressions in the 'show' pattern.

See also /confdConfig/cli/allowWildcard in confd.conf(5).

Used in J-, I- and C-style CLIs.

The *cli-allow-wildcard* statement can be used in: *list* and *refine*.

#### tailf:cli-autowizard

Specifies that the autowizard should include this leaf even if the leaf
is optional.

One use case is when implementing pre-configuration of devices. A config
false node can be defined for showing if the configuration is active or
not (preconfigured).

Used in J-, I- and C-style CLIs.

The *cli-autowizard* statement can be used in: *leaf* and *refine*.

#### tailf:cli-boolean-no

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

#### tailf:cli-break-sequence-commands

Specifies that previous cli-sequence-commands declaration should stop at
this point. This also means that the current node is not part of the
sequence. Only applicable when a cli-sequence-commands declaration has
been used in the parent container.

Used in I- and C-style CLIs.

The *cli-break-sequence-commands* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

#### tailf:cli-case-insensitive

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

#### tailf:cli-case-sensitive

Specifies that this node is case-sensitive. If applied to a container or
a list, any nodes below will also be case-sensitive.

This negates the cli-case-insensitive extension (see below).

Note that this will override any case-sensitivity settings configured in
confd.conf

The *cli-case-sensitive* statement can be used in: *container*, *list*,
and *leaf*.

#### tailf:cli-column-align *value*

Specifies the alignment of the data in the column in the auto-rendered
tables.

Used in J-, I- and C-style CLIs.

The *cli-column-align* statement can be used in: *leaf*, *leaf-list*,
and *refine*.

#### tailf:cli-column-stats

Display leafs in the container as columns, i.e., do not repeat the name
of the container on each line, but instead indent each leaf under the
container.

Used in I- and C-style CLIs.

The *cli-column-stats* statement can be used in: *container* and
*refine*.

#### tailf:cli-column-width *value*

Set a fixed width for the column in the auto-rendered tables.

Used in J-, I- and C-style CLIs.

The *cli-column-width* statement can be used in: *leaf*, *leaf-list*,
and *refine*.

#### tailf:cli-compact-stats

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

#### tailf:cli-compact-syntax

Instructs the CLI engine to use the compact representation for this node
in the 'show running-configuration' command. The compact representation
means that all leaf elements are shown on a single line.

Cannot be used in conjunction with tailf:cli-boolean-no.

Used in I- and C-style CLIs.

The *cli-compact-syntax* statement can be used in: *list*, *container*,
and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

#### tailf:cli-completion-actionpoint *value*

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

#### tailf:cli-configure-mode

An action or rpc with this attribute will be available in configure
mode, but not in operational mode.

The default is that the action or rpc is available in both configure and
operational mode.

Used in J-, I- and C-style CLIs.

The *cli-configure-mode* statement can be used in: *tailf:action*,
*rpc*, and *action*.

#### tailf:cli-custom-error *text*

This statement specifies a custom error message to be displayed when the
user enters an invalid value.

The *cli-custom-error* statement can be used in: *leaf* and *refine*.

#### tailf:cli-custom-range

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

#### tailf:cli-custom-range-actionpoint *value*

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

#### tailf:cli-custom-range-enumerator *value*

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

#### tailf:cli-delayed-auto-commit

Enables transactions while in a specific submode (or submode of that
mode). The modifications performed in that mode will not take effect
until the user exits that submode.

Can be used in config nodes only. If used in a container, the container
must also have a tailf:cli-add-mode statement, and if used in a list,
the list must not also have a tailf:cli-suppress-mode statement.

Used in I- and C-style CLIs.

The *cli-delayed-auto-commit* statement can be used in: *container*,
*list*, and *refine*.

#### tailf:cli-delete-container-on-delete

Specifies that the parent container should be deleted when . this leaf
is deleted.

The *cli-delete-container-on-delete* statement can be used in: *leaf*
and *refine*.

#### tailf:cli-delete-when-empty

Instructs the CLI engine to delete the list when the last list instance
is deleted'. Requires that cli-suppress-mode is set.

The behavior is recursive. If all optional leafs in a list instance are
deleted the list instance itself is deleted. If that list instance
happens to be the last list instance in a list it is also deleted. And
so on. Used in I- and C-style CLIs.

The *cli-delete-when-empty* statement can be used in: *list* and
*container*.

#### tailf:cli-diff-after *path*

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

#### tailf:cli-diff-before *path*

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

#### tailf:cli-diff-create-after *path*

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

#### tailf:cli-diff-create-before *path*

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

#### tailf:cli-diff-delete-after *path*

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

#### tailf:cli-diff-delete-before *path*

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

#### tailf:cli-diff-dependency *path*

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

#### tailf:cli-diff-modify-after *path*

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

#### tailf:cli-diff-modify-before *path*

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

#### tailf:cli-diff-set-after *path*

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

#### tailf:cli-diff-set-before *path*

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

#### tailf:cli-disabled-info *value*

Specifies an info string that will be used as a descriptive text for the
value 'disable' (false) of boolean-typed leafs when the confd.conf(5)
setting /confdConfig/cli/useShortEnabled is set to 'true'.

Used in J-, I- and C-style CLIs.

The *cli-disabled-info* statement can be used in: *leaf* and *refine*.

#### tailf:cli-disallow-value *value*

Specifies that a pattern for invalid values.

Used in I- and C-style CLIs.

The *cli-disallow-value* statement can be used in: *leaf*, *leaf-list*,
and *refine*.

#### tailf:cli-display-empty-config

Specifies that the node will be included when doing a 'show stats', even
if it is a non-config node, provided that the list contains at least one
non-config node.

Used in J-style CLI.

The *cli-display-empty-config* statement can be used in: *list* and
*refine*.

#### tailf:cli-display-separated

Tells CLI engine to display this container as a separate line item even
when it has children. Only applies to presence containers.

Applicable for optional containers in the C- and I- style CLIs.

The *cli-display-separated* statement can be used in: *container* and
*refine*.

#### tailf:cli-drop-node-name

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

#### tailf:cli-embed-no-on-delete

Embed no in front of the element name instead of at the beginning of the
line.

Applies to C-style

The *cli-embed-no-on-delete* statement can be used in: *leaf*,
*container*, *list*, *leaf-list*, and *refine*.

#### tailf:cli-enforce-table

Forces the generation of a table for a list element node regardless of
whether the table will be too wide or not. This applies to the tables
generated by the auto-rendered show commands for non-config data.

Used in I- and C-style CLIs.

The *cli-enforce-table* statement can be used in: *list* and *refine*.

#### tailf:cli-exit-command *value*

Tells the CLI to add an explicit exit-from-submode command. The
tailf:info substatement can be used for adding a custom info text for
the command.

Used in I- and C-style CLIs.

The *cli-exit-command* statement can be used in: *list*, *container*,
and *refine*.

The following substatements can be used:

*tailf:info*

#### tailf:cli-explicit-exit

Tells the CLI to add an explicit exit command when displaying the
configuration. It will not be added if cli-exit-command is defined as
well. The annotation is inherited by all sub-modes.

Used in I- and C-style CLIs.

The *cli-explicit-exit* statement can be used in: *list*, *container*,
and *refine*.

#### tailf:cli-expose-key-name

Force the user to enter the name of the key and display the key name
when displaying the running-configuration.

Used in J-, I- and C-style CLIs.

The *cli-expose-key-name* statement can be used in: *leaf* and *refine*.

#### tailf:cli-expose-ns-prefix

When used force the CLI to display namespace prefix of all children.

The *cli-expose-ns-prefix* statement can be used in: *container*,
*list*, and *refine*.

#### tailf:cli-flat-list-syntax

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

#### tailf:cli-flatten-container

Allows the CLI to exit the container and continue to input from the
parent container when all leaves in the current container has been set.

Can be used in config nodes only.

Used in I- and C-style CLIs.

The *cli-flatten-container* statement can be used in: *container*,
*list*, and *refine*.

#### tailf:cli-full-command

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

#### tailf:cli-full-no

Specifies that an auto-rendered 'no'-command should be considered
complete, ie, no additional leaves or containers can be entered on the
same command line.

Used in I- and C-style CLIs.

The *cli-full-no* statement can be used in: *leaf*, *leaf-list*, *list*,
*container*, and *refine*.

#### tailf:cli-full-show-path

Specifies that a path to the show command is considered complete, i.e.,
no more elements can be added to the path. It can also be used to
specify a maximum number of keys to be given for lists.

Used in J-, I- and C-style CLIs.

The *cli-full-show-path* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

The following substatements can be used:

*tailf:cli-max-keys* Specifies the maximum number of allowed keys for
the show command.

#### tailf:cli-hide-in-submode

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

#### tailf:cli-ignore-modified

Tells the cdb_get_modifications_cli system call to not generate a CLI
string when this node is modified. A string will instead be generated
for any modified children, if such nodes exists.

Applies to C-style and I-style

The *cli-ignore-modified* statement can be used in: *container*, *list*,
*leaf*, *leaf-list*, and *refine*.

#### tailf:cli-incomplete-command

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

#### tailf:cli-incomplete-no

Specifies that an auto-rendered 'no'-command should not be considered
complete, ie, additional leaves or containers must be entered on the
same command line.

Used in I- and C-style CLIs.

The *cli-incomplete-no* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

#### tailf:cli-incomplete-show-path

Specifies that a path to the show command is considered incomplete,
i.e., it needs more elements added to the path. It can also be used to
specify a minimum number of keys to be given for lists.

Used in J-, I- and C-style CLIs.

The *cli-incomplete-show-path* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

The following substatements can be used:

*tailf:cli-min-keys* Specifies the minimum number of required keys for
the show command.

#### tailf:cli-instance-info-leafs *value*

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

#### tailf:cli-key-format *value*

The format string is used when parsing a key value and when generating a
key value for an existing configuration. The key items are numbered from
1-N and the format string should indicate how they are related by using
\$(X) (where X is the key number). For example:

tailf:cli-key-format '\$(1)-\$(2)' means that the first key item is
concatenated with the second key item by a '-'.

Used in J-, I- and C-style CLIs.

The *cli-key-format* statement can be used in: *list* and *refine*.

#### tailf:cli-list-syntax

Specifies that each entry in a leaf-list should be displayed as a
separate element.

Used in J-, I- and C-style CLIs.

The *cli-list-syntax* statement can be used in: *leaf-list* and
*refine*.

The following substatements can be used:

*tailf:cli-multi-word* Specifies that a multi-word value may be entered
without quotes.

#### tailf:cli-min-column-width *value*

Set a minimum width for the column in the auto-rendered tables.

Used in J-, I- and C-style CLIs.

The *cli-min-column-width* statement can be used in: *leaf*,
*leaf-list*, and *refine*.

#### tailf:cli-mode-name *value*

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

#### tailf:cli-mode-name-actionpoint *value*

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

#### tailf:cli-mount-point *value*

By default actions are mounted under the 'request' command in the
J-style CLI and at the top-level in the I- and C-style CLIs. This
annotation allows the action to be mounted under other top level
commands

The *cli-mount-point* statement can be used in: *tailf:action*, *rpc*,
and *action*.

#### tailf:cli-multi-line-prompt

Tells the CLI to automatically enter multi-line mode when prompting the
user for a value to this leaf.

Used in J-, I- and C-style CLIs.

The *cli-multi-line-prompt* statement can be used in: *leaf* and
*refine*.

#### tailf:cli-multi-value

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

#### tailf:cli-multi-word-key

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

#### tailf:cli-no-key-completion

Specifies that the CLI engine should not perform completion for key
leafs in the list. This is to avoid querying the data provider for all
existing keys.

Used in J-, I- and C-style CLIs.

The *cli-no-key-completion* statement can be used in: *list* and
*refine*.

#### tailf:cli-no-keyword

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

#### tailf:cli-no-match-completion

Specifies that the CLI engine should not provide match completion for
the key leafs in the list.

Used in J-, I- and C-style CLIs.

The *cli-no-match-completion* statement can be used in: *list* and
*refine*.

#### tailf:cli-no-name-on-delete

When displaying the deleted version of this element do not include the
name.

Applies to C-style

The *cli-no-name-on-delete* statement can be used in: *leaf*,
*container*, *list*, *leaf-list*, and *refine*.

#### tailf:cli-no-value-on-delete

When displaying the deleted version of this leaf do not include the old
value.

Applies to C-style

The *cli-no-value-on-delete* statement can be used in: *leaf*,
*leaf-list*, and *refine*.

#### tailf:cli-only-in-autowizard

Force leaf values to be entered in the autowizard. This is intended to
prevent users from entering passwords and other sensitive information in
plain text.

Used in J-, I- and C-style CLIs.

The *cli-only-in-autowizard* statement can be used in: *leaf*.

#### tailf:cli-oper-info *text*

This statement works exactly as tailf:info, with the exception that it
is used when displaying the element info in the context of stats.

Both tailf:info and tailf:cli-oper-info can be present at the same time.

The *cli-oper-info* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, *rpc*, *action*, *identity*, *tailf:action*, and
*refine*.

#### tailf:cli-operational-mode

An action or rpc with this attribute will be available in operational
mode, but not in configure mode.

The default is that the action or rpc is available in both configure and
operational mode.

Used in J-, I- and C-style CLIs.

The *cli-operational-mode* statement can be used in: *tailf:action*,
*rpc*, and *action*.

#### tailf:cli-optional-in-sequence

Specifies that this element is optional in the sequence. If it is set it
must be set in the right sequence but may be skipped.

Used in I- and C-style CLIs.

The *cli-optional-in-sequence* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

#### tailf:cli-prefix-key

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

#### tailf:cli-preformatted

Suppresses quoting of non-config elements when displaying them. Newlines
will be preserved in strings etc.

Used in J-, I- and C-style CLIs.

The *cli-preformatted* statement can be used in: *leaf* and *refine*.

#### tailf:cli-range-delimiters *value*

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

#### tailf:cli-range-list-syntax

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

#### tailf:cli-recursive-delete

When generating configuration diffs delete all contents of a container
or list before deleting the node.

Applies to C-style

The *cli-recursive-delete* statement can be used in: *container*,
*list*, and *refine*.

#### tailf:cli-remove-before-change

Instructs the CLI engine to generate a no-command for the internal data
of an instance before modifying it. If an internal leaf has the
tailf:cli-hide-in-submode extension the whole instance will be removed
instead of each internal leaf. It only applies when generating diffs,
e.g. 'show configuration' in C-style.

The *cli-remove-before-change* statement can be used in: *leaf-list*,
*list*, *leaf*, and *refine*.

#### tailf:cli-replace-all

Specifies that the new leaf-list value(s) should replace the old, as
opposed to be added to the old leaf-list.

The *cli-replace-all* statement can be used in: *leaf-list*,
*tailf:cli-flat-list-syntax*, and *refine*.

#### tailf:cli-reset-container

Specifies that all sibling leaves in the container should be reset when
this element is set.

When used on a container its content is cleared when set.

The *cli-reset-container* statement can be used in: *leaf*, *list*,
*container*, and *refine*.

#### tailf:cli-run-template *value*

Specifies a template string to be used by the 'show running-config'
command in operational mode. It is primarily intended for displaying
config data but non-config data may be included in the template as well.

Care has to be taken to not generate output that cannot be understood by
the parser.

See the definition of cli-template-string for more info.

Used in I- and C-style CLIs.

The *cli-run-template* statement can be used in: *leaf*, *leaf-list*,
and *refine*.

#### tailf:cli-run-template-enter *value*

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

#### tailf:cli-run-template-footer *value*

Specifies a template string to be printed after all list entries are
printed.

Care has to be taken to not generate output that cannot be understood by
the parser.

See the definition of cli-template-string for more info.

Used in I- and C-style CLIs.

The *cli-run-template-footer* statement can be used in: *list* and
*refine*.

#### tailf:cli-run-template-legend *value*

Specifies a template string to be printed before all list entries are
printed.

Care has to be taken to not generate output that cannot be understood by
the parser.

See the definition of cli-template-string for more info.

Used in I- and C-style CLIs.

The *cli-run-template-legend* statement can be used in: *list* and
*refine*.

#### tailf:cli-sequence-commands

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

#### tailf:cli-short-no

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

#### tailf:cli-show-config

Specifies that the node will be included when doing a 'show
running-configuration', even if it is a non-config node.

Used in I- and C-style CLIs.

The *cli-show-config* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

#### tailf:cli-show-long-obu-diffs

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

#### tailf:cli-show-no

Specifies that an optional leaf node or presence container should be
displayed as 'no \<name\>' when it does not exist. For example, if a
leaf 'shutdown' has this property and does not exist, 'no shutdown' is
displayed.

Used in I- and C-style CLIs.

The *cli-show-no* statement can be used in: *leaf*, *list*, *leaf-list*,
*refine*, and *container*.

The following substatements can be used:

*tailf:cli-suppress-warning*

#### tailf:cli-show-obu-comments

Enforces the CLI engine to generate 'insert' comments when displaying
configuration changes of ordered-by user lists. Should not be used
together with tailf:cli-show-long-obu-diffs

The *cli-show-obu-comments* statement can be used in: *list* and
*refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

#### tailf:cli-show-order-tag *value*

Specifies a custom display order for nodes with the
tailf:cli-show-order-tag attribute. Nodes will be displayed in the order
indicated by a cli-show-order-taglist attribute in a parent node.

The scope of a tag reaches until a new taglist is encountered.

Used in I- and C-style CLIs.

The *cli-show-order-tag* statement can be used in: *container*, *list*,
*leaf*, *leaf-list*, and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

#### tailf:cli-show-order-taglist *value*

Specifies a custom display order for nodes with the
tailf:cli-show-order-tag attribute. Nodes will be displayed in the order
indicated in the list. Nodes without a tag will be displayed after all
nodes with a tag have been displayed.

The scope of a taglist is until a new taglist is encountered.

Used in I- and C-style CLIs.

The *cli-show-order-taglist* statement can be used in: *container*,
*list*, and *refine*.

#### tailf:cli-show-template *value*

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

#### tailf:cli-show-template-enter *value*

Specifies a template string to be printed before each list entry is
printed.

See the definition of cli-template-string for more info.

Used in J-, I- and C-style CLIs.

The *cli-show-template-enter* statement can be used in: *list* and
*refine*.

#### tailf:cli-show-template-footer *value*

Specifies a template string to be printed after all list entries are
printed.

See the definition of cli-template-string for more info.

Used in J-, I- and C-style CLIs.

The *cli-show-template-footer* statement can be used in: *list* and
*refine*.

#### tailf:cli-show-template-legend *value*

Specifies a template string to be printed before all list entries are
printed.

See the definition of cli-template-string for more info.

Used in J-, I- and C-style CLIs.

The *cli-show-template-legend* statement can be used in: *list* and
*refine*.

#### tailf:cli-show-with-default

This leaf will be displayed even when it has its default value. Note
that this will somewhat result in a slightly different behaviour when
you save a config and then load it again. With this setting in place a
leaf that has not been configured will be configured after the load.

Used in I- and C-style CLIs.

The *cli-show-with-default* statement can be used in: *leaf* and
*refine*.

#### tailf:cli-strict-leafref

Specifies that the leaf should only be allowed to be assigned references
to existing instances when the command is executed. Without this
annotation the requirement is that the instance exists on commit time.

Used in I- and C-style CLIs.

The *cli-strict-leafref* statement can be used in: *leaf*, *leaf-list*,
and *refine*.

#### tailf:cli-suppress-error-message-value

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

#### tailf:cli-suppress-key-abbreviation

Key values cannot be abbreviated. The user must always give complete
values for keys.

In the J-style CLI this is relevant when using the commands 'delete' and
'edit'.

In the I- and C-style CLIs this is relevant when using the commands
'no', 'show configuration' and for commands to enter submodes.

See also /confdConfig/cli/allowAbbrevKeys in confd.conf(5).

The *cli-suppress-key-abbreviation* statement can be used in: *list* and
*refine*.

#### tailf:cli-suppress-key-sort

Instructs the CLI engine to not sort the keys in alphabetical order when
presenting them to the user during TAB completion.

Used in J-, I- and C-style CLIs.

The *cli-suppress-key-sort* statement can be used in: *list* and
*refine*.

#### tailf:cli-suppress-leafref-in-diff

Specifies that the leafref should not be considered when generating
configuration diff

The *cli-suppress-leafref-in-diff* statement can be used in: *leaf*,
*leaf-list*, and *refine*.

#### tailf:cli-suppress-list-no

Specifies that the CLI should not accept deletion of the entire list or
leaf-list. Only specific instances should be deletable not the entire
list in one command. ie, 'no foo \<instance\>' should be allowed but not
'no foo'.

Used in I- and C-style CLIs.

The *cli-suppress-list-no* statement can be used in: *leaf-list*,
*list*, and *refine*.

#### tailf:cli-suppress-mode

Instructs the CLI engine to not make a mode of the list node.

Can be used in config nodes only.

Used in I- and C-style CLIs.

The *cli-suppress-mode* statement can be used in: *list* and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

#### tailf:cli-suppress-no

Specifies that the CLI should not auto-render 'no' commands for this
element. An element with this annotation will not appear in the
completion list to the 'no' command.

Used in I- and C-style CLIs.

The *cli-suppress-no* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

#### tailf:cli-suppress-quotes

Specifies that configuration data for a leaf should never be wrapped
with quotes. All internal data will be escaped to make sure it can be
presented correctly.

Can't be used for keys.

Used in J-, I- and C-style CLIs.

The *cli-suppress-quotes* statement can be used in: *leaf*.

#### tailf:cli-suppress-range

Means that the key should not allow range expressions.

Can be used in key leafs only.

Used in J-, I- and C-style CLIs.

The *cli-suppress-range* statement can be used in: *leaf* and *refine*.

The following substatements can be used:

*tailf:cli-suppress-warning*

#### tailf:cli-suppress-shortenabled

Suppresses the confd.conf(5) setting /confdConfig/cli/useShortEnabled.

Used in J-, I- and C-style CLIs.

The *cli-suppress-shortenabled* statement can be used in: *leaf* and
*refine*.

#### tailf:cli-suppress-show-conf-path

Specifies that the show running-config command cannot be invoked with
the path, ie the path is suppressed when auto-rendering show running-
config commands for config='true' data.

Used in J-, I- and C-style CLIs.

The *cli-suppress-show-conf-path* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

#### tailf:cli-suppress-show-match

Specifies that a specific completion match (i.e., a filter match that
appear at list nodes as an alternative to specifying a single instance)
to the show command should not be available.

Used in J-, I- and C-style CLIs.

The *cli-suppress-show-match* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

#### tailf:cli-suppress-show-path

Specifies that the show command cannot be invoked with the path, ie the
path is suppressed when auto-rendering show commands for config='false'
data.

Used in J-, I- and C-style CLIs.

The *cli-suppress-show-path* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

#### tailf:cli-suppress-silent-no *value*

Specifies that the confd.cnof directive cSilentNo should be suppressed
for a leaf and that a custom error message should be displayed when the
user attempts to delete a non-existing element.

Used in I- and C-style CLIs.

The *cli-suppress-silent-no* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

#### tailf:cli-suppress-table

Instructs the CLI engine to not print the list as a table in the 'show'
command.

Can be used in non-config nodes only.

Used in I- and C-style CLIs.

The *cli-suppress-table* statement can be used in: *list* and *refine*.

#### tailf:cli-suppress-validation-warning-prompt

Instructs the CLI engine to not prompt the user whether to proceed or
not if a warning is generated for this node.

Used in I- and C-style CLIs.

The *cli-suppress-validation-warning-prompt* statement can be used in:
*list*, *leaf*, *container*, *leaf-list*, and *refine*.

#### tailf:cli-suppress-warning *value*

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

#### tailf:cli-suppress-wildcard

Means that the list does not allow wildcard expressions in the 'show'
pattern.

See also /confdConfig/cli/allowWildcard in confd.conf(5).

Used in J-, I- and C-style CLIs.

The *cli-suppress-wildcard* statement can be used in: *list* and
*refine*.

#### tailf:cli-table-footer *value*

Specifies a template string to be printed after all list entries are
printed.

Used in J-, I- and C-style CLIs.

The *cli-table-footer* statement can be used in: *list* and *refine*.

#### tailf:cli-table-legend *value*

Specifies a template string to be printed before all list entries are
printed.

Used in J-, I- and C-style CLIs.

The *cli-table-legend* statement can be used in: *list* and *refine*.

#### tailf:cli-trim-default

Do not display value if it is same as default.

Used in I- and C-style CLIs.

The *cli-trim-default* statement can be used in: *leaf* and *refine*.

#### tailf:cli-value-display-template *value*

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

### Yang Types

#### cli-template-string

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

### See Also

The User Guide  

`ncsc(1)`  
> NCS Yang compiler

`tailf_yang_extensions(5)`  
> Tail-f YANG extensions

---

## `tailf_yang_extensions`

`tailf_yang_extensions` - Tail-f YANG extensions

### Synopsis

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

### Description

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

### Yang Statements

#### tailf:abstract

Declares the identity as abstract, which means that it is intended to be
used for derivation. It is an error if a leaf of type identityref is set
to an identity that is declared as abstract.

The *abstract* statement can be used in: *identity*.

#### tailf:action *name*

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

#### tailf:actionpoint *name*

Identifies the callback in a data provider that implements the action.
See confd_lib_dp(3) for details on the API.

The *actionpoint* statement can be used in: *rpc*, *action*,
*tailf:action*, and *refine*.

The following substatements can be used:

*tailf:opaque* Defines an opaque string which is passed to the callback
function in the context. The maximum length of the string is 255
characters.

*tailf:internal* For internal ConfD / NCS use only.

#### tailf:alt-name *name*

This property is used to specify an alternative name for the node in the
CLI. It is used instead of the node name in the CLI, both for input and
output.

The *alt-name* statement can be used in: *rpc*, *action*, *leaf*,
*leaf-list*, *list*, *container*, and *refine*.

#### tailf:annotate *target*

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

#### tailf:annotate-module *module-name*

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

#### tailf:callpoint *id*

Identifies a callback in a data provider. A data provider implements
access to external data, either configuration data in a database or
operational data. By default ConfD/NCS uses the embedded database (CDB)
to store all data. However, some or all of the configuration data may be
stored in an external source. In order for ConfD/NCS to be able to
manipulate external data, a data provider registers itself using the
callpoint id as described in confd_lib_dp(3).

A callpoint is inherited to all child nodes unless another 'callpoint'
or an 'cdb-oper' is defined.

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

#### tailf:cdb-oper

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

#### tailf:code-name *name*

Used to give another name to the enum or node name in generated header
files. This statement is typically used to avoid name conflicts if there
is a data node with the same name as the enumeration, if there are
multiple enumerations in different types with the same name but
different values, or if there are multiple node names that are mapped to
the same name in the header file.

The *code-name* statement can be used in: *enum*, *bit*, *leaf*,
*leaf-list*, *list*, *container*, *rpc*, *action*, *identity*,
*notification*, and *tailf:action*.

#### tailf:confirm-text *text*

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

#### tailf:default-ref *path*

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

#### tailf:dependency *path*

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

#### tailf:display-column-name *name*

This property is used to specify an alternative column name for the leaf
in the CLI. It is used when displaying the leaf in a table in the CLI.

The *display-column-name* statement can be used in: *leaf*, *leaf-list*,
and *refine*.

#### tailf:display-groups *value*

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

#### tailf:display-hint *hint*

This statement can be used to add a display-hint to a leaf or typedef of
type binary. The display-hint is used in the CLI and WebUI instead of
displaying the binary as a base64-encoded string. It is also used for
input.

The value of a 'display-hint' is defined in RFC 2579.

For example, with the display-hint value '1x:', the value is printed and
inputted as a colon-separated hex list.

The *display-hint* statement can be used in: *leaf* and *typedef*.

#### tailf:display-status-name *name*

This property is used to specify an alternative name for the element in
the CLI. It is used when displaying status information in the C- and
I-style CLIs.

The *display-status-name* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

#### tailf:display-when *condition*

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

#### tailf:error-info

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

#### tailf:exec *cmd*

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

#### tailf:export *agent*

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

#### tailf:hidden *tag*

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

#### tailf:id *name*

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

#### tailf:id-value *value*

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

#### tailf:ignore-if-no-cdb-oper

Indicates that the fxs file will not be loaded if CDB oper is disabled,
rather than abort the startup, which is the default.

The *ignore-if-no-cdb-oper* statement can be used in: *module*.

#### tailf:indexed-view

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

#### tailf:info *text*

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

#### tailf:info-html *text*

This statement works exactly as 'tailf:info', with the exception that it
can contain HTML markup. The WebUI will display the string with the HTML
markup, but the CLI will remove all HTML markup before displaying the
string to the user. In most cases, using this statement avoids using
special descriptions in webspecs and clispecs.

If this statement is present, 'tailf:info' cannot be given at the same
time.

The *info-html* statement can be used in: *leaf*, *leaf-list*, *list*,
*container*, *rpc*, *action*, *identity*, *tailf:action*, and *refine*.

#### tailf:internal-dp

Mark any module as an internal data provider. Indicates that the module
will be skipped when check-callbacks is invoked.

The *internal-dp* statement can be used in: *module* and *submodule*.

#### tailf:java-class-name *name*

Used to give another name than the default name to generated Java
classes. This statement is typically used to avoid name conflicts in the
Java classes.

The *java-class-name* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

#### tailf:junos-val-as-xml-tag

Internal extension to handle non-YANG JUNOS data models. Use only for
key enumeration leafs.

The *junos-val-as-xml-tag* statement can be used in: *leaf*.

#### tailf:junos-val-with-prev-xml-tag

Internal extension to handle non-YANG JUNOS data models. Use only for
keys where previous key is marked with 'tailf:junos-val-as-xml-tag'.

The *junos-val-with-prev-xml-tag* statement can be used in: *leaf*.

#### tailf:key-default *value*

Must be used for key leafs only.

Specifies a value that the CLI and WebUI will use when a list entry is
created, and this key leaf is not given a value.

If one key leaf has a key-default value, all key leafs that follow this
key leaf must also have key-default values.

The *key-default* statement can be used in: *leaf*.

#### tailf:link *target*

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

#### tailf:lower-case

Use for config false leafs and leaf-lists only.

This extension serves as a hint to the system that the leaf's type has
the implicit pattern '\[^A-Z\]\*', i.e., all strings returned by the
data provider are lower case (in the 7-bit ASCII range).

The CLI uses this hint when it is run in case-insensitive mode to
optimize the lookup calls towards the data provider.

The *lower-case* statement can be used in: *leaf* and *leaf-list*.

#### tailf:meta-data *value*

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

#### tailf:mount-id *name*

Used to implement mounting of a set of modules.

Used by ncsc in the generated device modules.

When this statement is used, the module MUST not have any top-level data
nodes defined.

The *mount-id* statement can be used in: *module*, *submodule*, and
*tailf:mount-point*.

#### tailf:mount-point *name*

Indicates that other modules can be mounted here.

The *mount-point* statement can be used in: *container* and *list*.

The following substatements can be used:

*tailf:mount-id*

#### tailf:ncs-device-type *type*

Internal extension to tell NCS what type of device the data model is
used for.

The *ncs-device-type* statement can be used in: *container*, *list*,
*leaf*, *leaf-list*, *refine*, and *module*.

#### tailf:ned-data *path-expression*

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

#### tailf:ned-default-handling *mode*

This statement can only be used in NEDs for devices that have irregular
handling of defaults. It sets a special default handling mode for the
leaf, regardless of the device's native default handling mode.

The *ned-default-handling* statement can be used in: *leaf*.

#### tailf:ned-ignore-compare-config

Typically used for ignoring device encrypted leafs in the compare-config
output.

The *ned-ignore-compare-config* statement can be used in: *leaf*.

#### tailf:no-dependency

This optional statements can be used to explicitly say that a 'must'
expression or a validation function is evaluated at every commit. Use
this with care, since the overall performance of the system is impacted
if this statement is used.

The *no-dependency* statement can be used in: *must* and
*tailf:validate*.

#### tailf:no-leafref-check

This statement can be used to let 'leafref' type statements reference
non-existing leafs. While similar to the 'tailf:non-strict-leafref'
statement, this does not allow reference from config to non-config.

The *no-leafref-check* statement can be used in: *type*.

#### tailf:non-strict-leafref

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

#### tailf:operation *op*

Only evaluate the XPath filter when the operation matches.

#### tailf:override-auto-dependencies

This optional statement can be used to instruct the compiler to use the
provided tailf:dependency statements instead of the dependencies that
the compiler calculates from the expression.

Use with care, and only if you are sure that the provided dependencies
are correct.

The *override-auto-dependencies* statement can be used in: *must* and
*when*.

#### tailf:path-filters *value*

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

#### tailf:secondary-index *name*

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

#### tailf:snmp-delete-value *value*

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

#### tailf:snmp-exclude-object

Used when an SNMP MIB is generated from a YANG module, using the
--generate-oids option to confdc/ncsc.

If this statement is present, confdc/ncsc will exclude this object from
the resulting MIB.

The *snmp-exclude-object* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

#### tailf:snmp-lax-type-check *value*

Normally, the ConfD/NCS MIB compiler checks that the data type of an
SNMP object matches the data type of the corresponding YANG leaf. If
both objects are writable, the data types need to precisely match, but
if the SNMP object is read-only, or if snmp-lax-type-check is set to
'true', the compiler accepts the object if the SNMP type's value space
is a superset of the YANG type's value space.

If snmp-lax-type-check is true and the MIB object is writable, the SNMP
agent will reject values outside the YANG data type range in runtime.

The *snmp-lax-type-check* statement can be used in: *leaf*.

#### tailf:snmp-mib-module-name *name*

Used when the YANG module is mapped to an SNMP module.

Specifies the name of the SNMP MIB module where the SNMP objects are
defined.

This property is inherited by all child nodes.

The *snmp-mib-module-name* statement can be used in: *leaf*,
*leaf-list*, *list*, *container*, *module*, and *refine*.

#### tailf:snmp-name *name*

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

#### tailf:snmp-ned-accessible-column *leaf-name*

The name or subid number of an accessible column that is instantiated in
all table entries in a table. The column does not have to be writable.
The SNMP NED will use this column when it uses GET-NEXT to loop through
the list entries, and when doing existence tests.

If this column is not given, the SNMP NED uses the following algorithm:

1\. If there is a RowStatus column, it will be used. 2. If an INDEX leaf
is accessible, it will be used. 3. Otherwise, use the first accessible
column returned by the SNMP agent.

The *snmp-ned-accessible-column* statement can be used in: *list*.

#### tailf:snmp-ned-delete-before-create

This statement is used in a list to make the SNMP NED always send
deletes before creates. Normally, creates are sent before deletes.

The *snmp-ned-delete-before-create* statement can be used in: *list*.

#### tailf:snmp-ned-modification-dependent

This statement is used on all columns in a table that require the usage
of the column marked with tailf:snmp-ned-set-before-row-modification.

This statement can be used on any column in a table where one leaf is
marked with tailf:snmp-ned-set-before-row-modification, or a table that
AUGMENTS such a table, or a table with a foreign index in such a table.

The *snmp-ned-modification-dependent* statement can be used in: *leaf*.

#### tailf:snmp-ned-recreate-when-modified

This statement is used in a list to make the SNMP NED delete and
recreate the row when a column in the row is modified.

The *snmp-ned-recreate-when-modified* statement can be used in: *list*.

#### tailf:snmp-ned-set-before-row-modification *value*

If this statement is present on a leaf, it tells the SNMP NED that if a
column in the row is modified, and it is marked with
'tailf:snmp-ned-modification-dependent', then the column marked with
'tailf:snmp-ned-set-before-modification' needs to be set to \<value\>
before the other column is modified. After all such columns have been
modified, the column marked with
'tailf:snmp-ned-set-before-modification' is reset to its initial value.

The *snmp-ned-set-before-row-modification* statement can be used in:
*leaf*.

#### tailf:snmp-oid *oid*

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

#### tailf:snmp-row-status-column *value*

Used when an SNMP module is generated from the YANG module.

When the parent list node is mapped to an SNMP table, this statement
specifies the column number of the generated RowStatus column. If it is
not specified, the generated RowStatus column will be the last in the
table.

The *snmp-row-status-column* statement can be used in: *list* and
*refine*.

#### tailf:sort-order *how*

This statement can be used for 'ordered-by system' lists and leaf-lists
only. It indicates in which way the list entries are sorted.

The *sort-order* statement can be used in: *list*, *leaf-list*, and
*tailf:secondary-index*.

#### tailf:sort-priority *value*

This extension takes an integer parameter specifying the order and can
be placed on leafs, containers, lists and leaf-lists. When showing, or
getting configuration, leaf values will be returned in order of
increasing sort-priority.

The default sort-priority is 0.

The *sort-priority* statement can be used in: *leaf*, *leaf-list*,
*list*, *container*, and *refine*.

#### tailf:step *value*

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

#### tailf:structure *name*

Internal extension to define a data structure without any semantics
attached.

The *structure* statement can be used in: *module* and *submodule*.

#### tailf:suppress-echo *value*

If this statement is set to 'true', leafs of this type will not have
their values echoed when input in the webui or when the CLI prompts for
the value. The value will also not be included in the audit log in clear
text but will appear as \*\*\*.

The *suppress-echo* statement can be used in: *typedef*, *leaf*, and
*leaf-list*.

#### tailf:transaction *direction*

Which transaction that the result of the XPath filter will be applied
to, when set to 'both' it will apply to both the 'to' and the 'from'
transaction.

#### tailf:typepoint *id*

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

#### tailf:unique-selector *context-path*

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

#### tailf:validate *id*

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

#### tailf:value-length *value*

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

#### tailf:writable *value*

This extension makes operational data (i.e., config false data)
writable. Only valid for leafs.

The *writable* statement can be used in: *leaf*.

#### tailf:xpath-root *value*

Internal extension to 'chroot' XPath expressions

The *xpath-root* statement can be used in: *must*, *when*, *path*,
*tailf:display-when*, *tailf:cli-diff-dependency*,
*tailf:cli-diff-before*, *tailf:cli-diff-delete-before*,
*tailf:cli-diff-set-before*, *tailf:cli-diff-create-before*,
*tailf:cli-diff-modify-before*, *tailf:cli-diff-after*,
*tailf:cli-diff-delete-after*, *tailf:cli-diff-set-after*,
*tailf:cli-diff-create-after*, and *tailf:cli-diff-modify-after*.

### Yang Types

#### aes-256-cfb-128-encrypted-string

The aes-256-cfb-128-encrypted-string works exactly like
des3-cbc-encrypted-string but AES/256bits in CFB mode is used to encrypt
the string. The prefix for encrypted values is '\$9\$'.

#### aes-cfb-128-encrypted-string

The aes-cfb-128-encrypted-string works exactly like
des3-cbc-encrypted-string but AES/128bits in CFB mode is used to encrypt
the string. The prefix for encrypted values is '\$8\$'.

#### des3-cbc-encrypted-string

The des3-cbc-encrypted-string type automatically encrypts a value
adhering to this type using DES in CBC mode followed by a base64
conversion. If the value isn't encrypted already, that is.

This is best explained using an example. Suppose we have a leaf:

<div class="informalexample">

       leaf enc {
           type tailf:des3-cbc-encrypted-string;
       }

</div>

A valid configuration is:

\<enc\>\$0\$My plain text.\</enc\>

The '\$0\$' prefix signals that this is plain text. When a plain text
value is received by the server, the value is DES3/Base64 encrypted, and
the string '\$7\$' is prepended. The resulting string is stored in the
configuration data store.

When a value of this type is read, the encrypted value is always
returned. In the example above, the following value could be returned:

\<enc\>\$7\$Qxxsn8BVzxphCdflqRwZm6noKKmt0QoSWnRnhcXqocg=\</enc\>

If a value starting with '\$7\$' is received, the server knows that the
value is already encrypted, and stores it as is in the data store.

A value adhering to this type must have a '\$0\$' or a '\$7\$' prefix.

ConfD/NCS uses a configurable set of encryption keys to encrypt the
string. For details, see 'encryptedStrings' in the confd.conf(5) manual
page.

#### hex-list

DEPRECATED: Use yang:hex-string instead. There are no plans to remove
tailf:hex-list.

A list of colon-separated hexa-decimal octets e.g. '4F:4C:41:71'.

The statement tailf:value-length can be used to restrict the number of
octets. Note that using the 'length' restriction limits the number of
characters in the lexical representation.

#### ip-address-and-prefix-length

The ip-address-and-prefix-length type represents a combination of an IP
address and a prefix length and is IP version neutral. The format of the
textual representations implies the IP version.

#### ipv4-address-and-prefix-length

The ipv4-address-and-prefix-length type represents a combination of an
IPv4 address and a prefix length. The prefix length is given by the
number following the slash character and must be less than or equal to
32.

#### ipv6-address-and-prefix-length

The ipv6-address-and-prefix-length type represents a combination of an
IPv6 address and a prefix length. The prefix length is given by the
number following the slash character and must be less than or equal to
128.

#### md5-digest-string

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

#### node-instance-identifier

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

#### octet-list

A list of dot-separated octets e.g. '192.168.255.1.0'.

The statement tailf:value-length can be used to restrict the number of
octets. Note that using the 'length' restriction limits the number of
characters in the lexical representation.

#### sha-256-digest-string

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

#### sha-512-digest-string

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

#### size

A value that represents a number of bytes. An example could be
S1G8M7K956B; meaning 1GB + 8MB + 7KB + 956B = 1082138556 bytes. The
value must start with an S. Any byte magnifier can be left out, e.g.
S1K1B equals 1025 bytes. The order is significant though, i.e. S1B56G is
not a valid byte size.

In ConfD, a 'size' value is represented as an uint64.

### Xpath Functions

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

### See Also

`tailf_yang_cli_extensions(5)`  
> Tail-f YANG CLI extensions

The NSO User Guide  

`confdc(1)`  
> Confdc compiler
