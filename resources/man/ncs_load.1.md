# ncs_load Man Page

`ncs_load` - Command line utility to load and save NSO configurations

## Synopsis

`ncs [-W] [-S] [common options] [filename]`

`ncs -l [-m | -r | -j | -n] [-D] [common options] [filename...]`

`ncs -h | -?`

Common options:

`[-d] [-t] [-F {x | p | o | j | c | i | t}] [-H | -U] [-a] [-e] [ [-u user] [-g group...] [-c context] | [-i]] [[-p keypath] | [-P XPath]] [-o] [-s] [-O] [-b] [-M]`

## Description

This command provides a convenient way of loading and saving all or
parts of the configuration in different formats. It can be used to
initialize or restore configurations as well as in CLI commands.

If you run `ncs_load` without any options it will print the current
configuration in XML format on stdout. The exit status will be zero on
success and non-zero otherwise.

## Common Options

`-d`  
> Debug flag. Add more to increase debug level. All debug output will be
> to stderr.

`-t`  
> Measure how long the requested command takes and print the result on
> stderr.

`-F` \<format\>  
> Selects the format of the configuration when loading and saving, can
> be one of following:
>
> x  
> > XML (default)
>
> p  
> > Pretty XML
>
> o  
> > JSON
>
> j  
> > J-style CLI
>
> c  
> > C-style CLI
>
> i  
> > I-style CLI
>
> t  
> > C-style CLI using turbo parser. Only applicable for load config

`-H`  
> Hide all hidden nodes. By default, no nodes are hidden unless
> `ncs_load` has attached to an existing transaction, in which case the
> hidden nodes are the same as in that transaction's session.

`-U`  
> Unhide all hidden nodes. By default, no nodes are hidden unless
> `ncs_load` has attached to an existing transaction, in which case the
> hidden nodes are the same as in that transaction's session.

`-u` \<user\>; `-g` \<group\> ...; `-c` \<context\>  
> Loading and saving the configuration is done in a user session, using
> these options it is possible to specify which user, groups (more than
> one `-g` can be used to add groups), and context that should be used
> when starting the user session. If only a user is supplied the user is
> assumed to belong to a single group with the same name as the user.
> This is significant in that AAA rules will be applied for the
> specified user / groups / context combination. The default is to use
> the `system` context, which implies that AAA rules will *not* be
> applied at all.
>
> <div class="note">
>
> If the environment variables `NCS_MAAPI_USID` and `NCS_MAAPI_THANDLE`
> are set (see the ENVIRONMENT section), or if the `-i` option is used,
> these options are silently ignored, since `ncs_load` will attach to an
> existing transaction.
>
> </div>

`-i`  
> Instead of starting a new user session and transaction, `ncs_load`
> will try to attach to the init session. This is only valid when NSO is
> in start phase 0, and will fail otherwise. It can be used to load a
> “factory default”file during startup, or loading a file during
> upgrade.

## Save Configuration

By default the complete current configuration will be output on stdout.
To save it in a file add the filename on the command line (the `-f`
option is deprecated). The file is opened by the `ncs_load` utility,
permissions and ownership will be determined by the user running
`ncs_load`. Output format is specified using the `-F` option.

When saving the configuration in XML format, the context of the user
session (see the `-c` option) will determine which namespaces with
export restriction (from `tailf:export`) that are included. If the
`system` context is used (this is the default), all namespaces are
saved, regardless of export restriction. When saving the configuration
in one of the CLI formats, the context used for this selection is always
`cli`.

A number of options are only applicable, or have a special meaning when
saving the configuration:

`-f` \<filename\>  
> Filename to save configuration to (option is deprecated, just give the
> filename on the command line).

`-W`  
> Include leaves which are unset (set to their default value) in the
> output. By default these leaves are not included in the output.

`-S`  
> Include the default value of a leaf as a comment (only works for CLI
> formats, not XML). (Corresponds to the `MAAPI_CONFIG_SHOW_DEFAULTS`
> flag).

`-p` \<keypath\>  
> Only include the configuration below \<keypath\> in the output.

`-P` \<XPath\>  
> Filter the configuration using the \<XPath\> expression. (Only works
> for the XML format.)

`-o`  
> Include operational data in the output. (Corresponds to the
> `MAAPI_CONFIG_WITH_OPER` flag).

`-O`  
> Include *only* operational data, and ancestors to operational data
> nodes, in the output. (Corresponds to the `MAAPI_CONFIG_OPER_ONLY`
> flag).

`-b`  
> Include only data stored in CDB in the output. (Corresponds to the
> `MAAPI_CONFIG_CDB_ONLY` flag).

`-M`  
> Include NCS service-meta-data attributes in the output. (Corresponds
> to the `MAAPI_CONFIG_WITH_SERVICE_META` flag).

## Load Configuration

When the `-l` option is present `ncs_load` will load all the files
listed on the command line . The file(s) are expected to be in XML
format unless otherwise specified using the `-F` flag. Note that it is
the NSO daemon that opens the file(s), it must have permission to do so.
However relative pathnames are assumed to be relative to the working
directory of the `ncs_load` command .

If neither of the `-m` and `-r` options are given when multiple files
are listed on the command line, `ncs_load` will silently treat the
second and subsequent files as if `-m` had been given, i.e. it will
merge in the contents of these files instead of deleting and replacing
the configuration for each file. Note, we almost always want the merge
behavior. If no file is given, or "-" is given as a filename, `ncs_load`
will stream standard input to NSO .

`-f` \<filename\>  
> The file to load (deprecated, just list the file after the options
> instead).

`-m`  
> Merge in the contents of \<filename\>, the (somewhat unfortunate)
> default is to delete and replace.

`-j`  
> Do not run FASTMAP, if FASTMAPPED service data is loaded, we sometimes
> do not want to run the mapper code. One example is a backup saved in
> XML format that contains both device data and also service data.

`-n`  
> Only load data to CDB inside NCS, do not attempt to perform any update
> operations towards the managed devices. This corresponds to the
> 'no-networking' flag to the commit command in the NCS CLI.

`-x`  
> Lax loading. Only applies to XML loading. Ignore unknown namespaces,
> attributes and elements.

`-r`  
> Replace the part of the configuration that is present in \<filename\>,
> the default is to delete and replace. (Corresponds to the
> `MAAPI_CONFIG_REPLACE` flag).

`-a`  
> When loading configuration in 'i' or 'c' format, do a commit operation
> after each line. Default and recommended is to only commit when all
> the configuration has been loaded. (Corresponds to the
> `MAAPI_CONFIG_AUTOCOMMIT` flag).

`-e`  
> When loading configuration do not abort when encountering errors
> (corresponds to the `MAAPI_CONFIG_CONTINUE_ON_ERROR` flag).

`-D`  
> Delete entire config before loading.

`-p` \<keypath\>  
> Delete everything below \<keypath\> before loading the file.

`-o`  
> Accept but ignore contents in the file which is operational data
> (without this flag it will be an error).

`-O`  
> Start a transaction to load *only* operational data, and ancestors to
> operational data nodes. Only supported for XML input.

## Examples

Reloading all xml files in the cdb directory

    ncs_load -D -m -l cdb/*.xml

Merging in the contents of `conf.cli`

    ncs_load -l -m -F j conf.cli

Print interface config and statistics data in cli format

    ncs_load -F i -o -p /sys:sys/ifc

Using xslt to format output

    ncs_load -F x -p /sys:sys/ifc | xsltproc fmtifc.xsl -

Using xmllint to pretty print the xml output

    ncs_load -F x | xmllint --format -

Saving config and operational data to `/tmp/conf.xml`

    ncs_load -F x -o > /tmp/conf.xml

Measure how long it takes to fetch config

    ncs_load -t > /dev/null
    elapsed time: 0.011 s

Output all instances in list /foo/table which has ix larger than 10

    ncs_load -F x -P "/foo/table[ix > 10]"

## Environment

`NCS_IPC_ADDR`  
> The address used to connect to the NSO daemon, overrides the compiled
> in default.

`NCS_IPC_PORT`  
> The port number to connect to the NSO daemon on, overrides the
> compiled in default.

`NCS_MAAPI_USID`; `NCS_MAAPI_THANDLE`  
> If set `ncs_load` will attach to an existing transaction in an
> existing user session instead of starting a new session.
>
> These environment variables are set by the NSO CLI when it invokes
> external commands, which means you can run `ncs_load` directly from
> the CLI. For example, the following addition to the
> \<operationalMode\> in a clispec file (see
> [clispec(5)](clispec.5.md))
>
> <div class="informalexample">
>
>     <cmd name="servers" mount="show">
>       <info/>
>       <help/>
>       <callback>
>         <exec>
>           <osCommand>ncs_load</osCommand>
>               <args>-F j -p /system/servers</args>
>         </exec>
>       </callback>
>     </cmd>
>
> </div>
>
> will add a `show servers` command which, when run will invoke
> `ncs_load -F j -p /system/servers`. This will output the configuration
> below /system/servers in curly braces format.
>
> Note that when these environment variables are set, it means that the
> configuration will be loaded into the current CLI transaction (which
> must be in configure mode, and have AAA permissions to actually modify
> the config). To load (or save) a file in a separate transaction, unset
> these two environment variables before invoking the `ncs_load`
> command.
