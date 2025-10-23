# ncsc Man Page

`ncsc` - NCS YANG compiler

## Synopsis

`ncsc -c [-a | --annotate YangAnnotationFile] [--deviation DeviationFile] [--skip-deviation-fxs] [-o FxsFile] [--verbose] [--fail-on-warnings] [-E | --error ErrorCode...] [-W | --warning ErrorCode...] [--allow-interop-issues] [-w | --no-warning ErrorCode...] [--strict-yang] [--no-yang-source] [--include-doc] [--use-description [always]] [[--no-features] | [-F | --feature Features...]] [-C | --conformance [modulename:]implement | [modulename:]import...] [--datastore operational] [--ignore-unknown-features] [--max-status current | deprecated | obsolete] [-p | --prefix Prefix] [--yangpath YangDir] [--export Agent [-f FxsFileOrDir...]...] -- YangFile`

`ncsc --strip-yang-source FxsFile`

`ncsc --list-errors`

`ncsc --list-builtins`

`ncsc -c [-o CclFile] ClispecFile`

`ncsc -c [-o BinFile] [-I Dir] MibFile`

`ncsc -c [-o BinFile] [--read-only] [--verbose] [-I Dir] [--include-file BinFile] [--fail-on-warnings] [--warn-on-type-errors ] [--warn-on-access-mismatch ] [--mib-annotation MibA] [-f FxsFileOrDir...] -- MibFile FxsFile`

`ncsc --ncs-compile-bundle Directory [--yangpath YangDir] [--fail-on-warnings] [--ncs-skip-template] [--ncs-skip-statistics] [--ncs-skip-config] [--lax-revsion-merge] [--ncs-depend-package PackDir] [--ncs-apply-deviations] [--ncs-no-apply-deviations] [--allow-interop-issues] --ncs-device-type netconf | snmp-ned | generic-ned | cli-ned --ncs-ned-id ModName:IdentityName --ncs-device-dir Directory`

`ncsc --ncs-compile-mib-bundle Directory [--fail-on-warnings] [--ncs-skip-template] [--ncs-skip-statistics] [--ncs-skip-config] --ncs-device-type netconf | snmp-ned | generic-ned | cli-ned --ncs-device-dir Directory`

`ncsc --ncs-compile-module YangFile [--yangpath YangDir] [--fail-on-warnings] [--ncs-skip-template] [--ncs-skip-statistics] [--ncs-skip-config] [--ncs-keep-callpoints] [--lax-revision-merge] [--ncs-depend-package PackDir] [--allow-interop-issues] --ncs-device-type netconf | snmp-ned | generic-ned | cli-ned --ncs-ned-id ModName:IdentityName --ncs-device-dir Directory`

`ncsc --emit-java JFile [--print-java-filename ] [--java-disable-prefix ] [--java-package Package] [--exclude-enums ] [--fail-on-warnings ] [-f FxsFileOrDir...] [--builtin ] FxsFile`

`ncsc --emit-python PyFile [--print-python-filename ] [--no-init-py ] [--python-disable-prefix ] [--exclude-enums ] [--fail-on-warnings ] [-f FxsFileOrDir...] [--builtin ] FxsFile`

`ncsc --emit-mib MibFile [--join-names capitalize | hyphen] [--oid OID] [--top Name] [--tagpath Path] [--import Module Name] [--module Module] [--generate-oids ] [--generate-yang-annotation] [--skip-symlinks] [--top Top] [--fail-on-warnings ] [--no-comments ] [--read-only ] [--prefix Prefix] [--builtin ] -- FxsFile`

`ncsc --mib2yang-std [-p | --prefix Prefix] [-o YangFile] -- MibFile`

`ncsc --mib2yang-mods [--mib-annotation MibA] [--keep-readonly] [--namespace Uri] [--revision Date] [-o YangDeviationFile] -- MibFile`

`ncsc --mib2yang [--mib-annotation MibA] [--emit-doc] [--snmp-name] [--read-only] [-u Uri] [-p | --prefix Prefix] [-o YangFile] -- MibFile`

`ncsc --snmpuser EngineID User AuthType PrivType PassPhrase`

`ncsc --revision-merge [-o ResultFxs] [-v ] [-f FxsFileOrDir...] -- ListOfFxsFiles`

`ncsc --lax-revision-merge [-o ResultFxs] [-v ] [-f FxsFileOrDir...] -- ListOfFxsFiles`

`ncsc --get-info FxsFile`

`ncsc --get-uri FxsFile`

`ncsc --version`

## Description

During startup the NSO daemon loads .fxs files describing our
configuration data models. A .fxs file is the result of a compiled YANG
data model file. The daemon also loads clispec files describing
customizations to the auto-generated CLI. The clispec files are
described in [clispec(5)](clispec.5.md).

A yang file by convention uses .yang (or .yin) filename suffix. YANG
files are directly transformed into .fxs files by ncsc.

We can use any number of .fxs files when working with the NSO daemon.

The `--emit-java` option is used to generate a .java file from a .fxs
file. The java file is used in combination with the Java library for
Java based applications.

The `--emit-python` option is used to generate a .py file from a .fxs
file. The python file is used in combination with the Python library for
Python based applications.

The `--print-java-filename` option is used to print the resulting name
of the would be generated .java file.

The `--print-python-filename` option is used to print the resulting name
of the would be generated .py file.

The `--python-disable-prefix` option is used to prevent prepending the
YANG module prefix to each symbol in the generated .py file.

A clispec file by convention uses a .cli filename suffix. We use the
ncsc command to compile a clispec into a loadable format (with a .ccl
suffix).

A mib file by convention uses a .mib filename suffix. The ncsc command
is used for compiling the mib with one or more fxs files (containing OID
to YANG mappings) into a loadable format (with a .bin suffix). See the
NSO User Guide for more information about compiling the mib.

Take a look at the EXAMPLE section for a crash course.

## Options

### Common options

`-f`; `--fxsdep` \<FxsFileOrDir\>...  
> .fxs files (or directories containing .fxs files) to be used to
> resolve cross namespace dependencies.

`--yangpath` \<YangModuleDir\>  
> YangModuleDir is a directory containing other YANG modules and
> submodules. This flag must be used when we import or include other
> YANG modules or submodules that reside in another directory.

`-o`; `--output` \<File\>  
> Put the resulting file in the location given by File.

### Compile options

`-c`; `--compile` \<File\>  
> Compile a YANG file (.yang/.yin) to a .fxs file or a clispec (.cli
> file) to a .ccl file, or a MIB (.mib file) to a .bin file

`-a`; `--annotate` \<AnnotationFile\>  
> YANG users that are utilizing the tailf:annotate extension must use
> this flag to indicate the YANG annotation file(s).
>
> This parameter can be given multiple times.

`--deviation`\<DeviationFile\>  
> Indicates that deviations from the module in *DeviationFile* should be
> present in the fxs file.
>
> This parameter can be given multiple times.
>
> By default, the *DeviationFile* is emitted as an fxs file. To skip
> this, use `--skip-deviation-fxs`. If `--output` is used, the deviation
> fxs file will be created in the same path as the output file.

`--skip-deviation-fxs`  
> Skips emitting the deviation files as fxs files.

`-F`\<features\>; `--feature`\<features\>  
> Indicates that support for the YANG *features* should be present in
> the fxs file. \<features\> is a string on the form
> \<modulename\>:\[\<feature\>(,\<feature\>)\*\]
>
> This option is used to prune the data model by removing all nodes in
> all modules that are defined with an "if-feature" that is not listed
> as \<feature\>. Therefore, if this option is given, all features in
> all modules that are supported must be listed explicitly.
>
> If this option is not given, nothing is pruned, i.e., it works as if
> all features were explicitly listed.
>
> This option can be given multiple times.
>
> If the module uses a feature defined in an imported YANG module, it
> must be given as \<modulename:feature\>.

`--no-yang-source`  
> By default, the YANG module and submodules source is included in the
> fxs file, so that a NETCONF or RESTCONF client can download the module
> from the server.
>
> If this option is given, the YANG source is not included.

`--no-features`  
> Indicates that no YANG features from the given module are supported.

`--ignore-unknown-features`  
> Instructs the compiler to not give an error if an unknown feature is
> specified with `--feature`.

`--max-status current | deprecated | obsolete`  
> Only include definitions with status greater than or equal to the
> given status. For example, to compile a module without support for all
> obsolete definitions, give `--max-status deprecated`.
>
> To include support for some deprecated or obsolete nodes, but not all,
> a deviation module is needed which removes support for the unwanted
> nodes.

`-C`\<conformance\>; `--conformance`\<conformance\>  
> Indicates that the YANG module either is implemented (default) or just
> compiled for import purposes. *conformance* is a string on the form
> \<\[modulename:\]\>\<implement\|import\>
>
> If a module is compiled for import, it will be advertised as such in
> the YANG library data.

`--datastore`\<operational\>  
> Indicates that the YANG module is present only in the operational
> state datastore.

`-p`; `--prefix` \<Prefix\>  
> NCS needs to have a unique prefix for each loaded YANG module, which
> is used e.g. in the CLI and in the APIs. By default the prefix defined
> in the YANG module is used, but this prefix is not required to be
> unique across modules. This option can be used to specify an alternate
> prefix in case of conflicts. The special value 'module-name' means
> that the module name will be used for this prefix.

`--include-doc`  
> Normally, 'description' statements are ignored by ncsc. If this option
> is present, description text is included in the .fxs file, and will be
> available as help text in the Web UI. In the CLI the description text
> will be used as information text if no 'tailf:info' statement is
> present.

`--use-description [always]`  
> Normally, 'description' statements are ignored by ncsc. Instead the
> 'tailf:info' statement is used as information text in the CLI and Web
> UI. When this option is specified, text in 'description' statements is
> used if no 'tailf:info' statement is present. If the option *always*
> is given, 'description' is used even if 'tailf:info' is present.

`--export` \<Agent\> ...  
> Makes the namespace visible to Agent. Agent is either "none", "all",
> "netconf", "snmp", "cli", "webui", "rest" or a free-text string. This
> option overrides any `tailf:export` statements in the module. The
> option "all" makes it visible to all agents. Use "none" to make it
> invisible to all agents.

`--fail-on-warnings`  
> Make compilation fail on warnings.

`-W` \<ErrorCode\>  
> Treat \<ErrorCode\> as a warning, even if `--fail-on-warnings` is
> given. \<ErrorCode\> must be a warning or a minor error.
>
> Use `--list-errors` to get a listing of all errors and warnings.
>
> The following example treats all warnings except the warning for
> dependency mismatch as errors:
>
> <div class="informalexample">
>
>     $ ncsc -c --fail-on-warnings -W TAILF_DEPENDENCY_MISMATCH
>
> </div>

`-w` \<ErrorCode\>  
> Do not report the warning \<ErrorCode\>, even if `--fail-on-warnings`
> is given. \<ErrorCode\> must be a warning.
>
> Use `--list-errors` to get a listing of all errors and warnings.
>
> The following example ignores the warning TAILF_DEPENDENCY_MISMATCH:
>
> <div class="informalexample">
>
>     $ ncsc -c -w TAILF_DEPENDENCY_MISMATCH
>
> </div>

`-E` \<ErrorCode\>  
> Treat the warning \<ErrorCode\> as an error.
>
> Use `--list-errors` to get a listing of all errors and warnings.
>
> The following example treats only the warning for unused import as an
> error:
>
> <div class="informalexample">
>
>     $ ncsc -c -E UNUSED_IMPORT
>
> </div>

`--allow-interop-issues`  
> Report YANG_ERR_XPATH_REF_BAD_CONFIG as a warning instead of an error.
> Be advised that this violates RFC7950 section 6.4.1; a constraint on a
> config true node contains an XPath expression may not refer to a
> config false node.

`--strict-yang`  
> Force strict YANG compliance. Currently this checks that the deref()
> function is not used in XPath expressions and leafrefs.

### Standard MIB to YANG options

`--mib2yang-std MibFile`  
> Generate a YANG file from the MIB module (.mib file), in accordance
> with the IETF standard, RFC-6643.
>
> If the MIB IMPORTs other MIBs, these MIBs must be available (as .mib
> files) to the compiler when a YANG module is generated. By default,
> all MIBs in the current directory and all builtin MIBs are available.
> Since the compiler uses the tool `smidump` to perform the conversion
> to YANG, the environment variable `SMIPATH` can be set to a
> colon-separated list of directories to search for MIB files.

`-p`; `--prefix` \<Prefix\>  
> Specify a prefix to use in the generated YANG module.
>
> An appendix to the RFC describes how the prefix is automatically
> generated, but such an automatically generated prefix is not always
> unique, and NSO requires unique prefixes in all loaded modules.

### Standard MIB to YANG modification options

`--mib2yang-mods MibFile`  
> Generate a combined YANG deviation/annotation file from the MIB module
> (.mib file), which can be used to compile the yang file generated by
> --mib2yang-std, to achieve a similar result as with the non-standard
> --mib2yang translation.

`--mib-annotation` \<MibA\>  
> Provide a MIB annotation file to control how to override the standard
> translation of specific MIB objects to YANG. See
> [mib_annotations(5)](mib_annotations.5.md).

`--revision Date`  
> Generate a revision statement with the provided Date as value in the
> deviation/annotation file.

`--namespace` \<Uri\>  
> Specify a uri to use as namespace in the generated
> deviation/annotation module.

`--keep-readonly`  
> Do not generate any deviations of the standard config (false)
> statements. Without this flag, config statements will be deviated to
> true on yang nodes corresponding to writable MIB objects.

### MIB to YANG options

`--mib2yang MibFile`  
> Generate a YANG file from the MIB module (.mib file).
>
> If the MIB IMPORTs other MIBs, these MIBs must be available (as .mib
> files) to the compiler when a YANG module is generated. By default,
> all MIBs in the current directory and all builtin MIBs are available.
> Since the compiler uses the tool `smidump` to perform the conversion
> to YANG, the environment variable `SMIPATH` can be set to a
> colon-separated list of directories to search for MIB files.

`-u`; `--uri` \<Uri\>  
> Specify a uri to use as namespace in the generated YANG module.

`-p`; `--prefix` \<Prefix\>  
> Specify a prefix to use in the generated YANG module.

`--mib-annotation` \<MibA\>  
> Provide a MIB annotation file to control how to translate specific MIB
> objects to YANG. See [mib_annotations(5)](mib_annotations.5.md).

`--snmp-name`  
> Generate the YANG statement "tailf:snmp-name" instead of
> "tailf:snmp-oid".

`--read-only`  
> Generate a YANG module where all nodes are "config false".

### MIB compiler options

`-c`; `--compile` \<MibFile\>  
> Compile a MIB module (.mib file) to a .bin file.
>
> If the MIB IMPORTs other MIBs, these MIBs must be available (as
> compiled .bin files) to the compiler. By default, all compiled MIBs in
> the current directory and all builtin MIBs are available. Use the
> parameters *--include-dir* or *--include-file* to specify where the
> compiler can find the compiled MIBs.

`--verbose`  
> Print extra debug info during compilation.

`--read-only`  
> Compile the MIB as read-only. All SET attempts over SNMP will be
> rejected.

`-I`; `--include-dir` \<Dir\>  
> Add the directory Dir to the list of directories to be searched for
> IMPORTed MIBs (.bin files).

`--include-file` \<File\>  
> Add File to the list of files of IMPORTed (compiled) MIB files. File
> must be a .bin file.

`--fail-on-warnings`  
> Make compilation fail on warnings.

`--warn-on-type-errors`  
> Warn rather than give error on type checks performed by the MIB
> compiler.

`--warn-on-access-mismatch`  
> Give a warning if an SNMP object has read only access to a config
> object.

`--mib-annotation` \<MibA\>  
> Provide a MIB annotation file to fine-tune how specific MIB objects
> should behave in the SNMP agent. See
> [mib_annotations(5)](mib_annotations.5.md).

### Emit SMIv2 MIB options

`--emit-mib` \<MibFile\>  
> Generates a MIB file for use with SNMP agents/managers. See the
> appropriate section in the SNMP agent chapter in the NSO User Guide
> for more information.

`--join-names capitalize`  
> Join element names without separator, but capitalizing, to get the MIB
> name. This is the default.

`--join-names hyphen`  
> Join element names with hyphens to get the MIB name.

`--join-names force-capitalize`  
> The characters '.' and '\_' can occur in YANG identifiers but not in
> SNMP identifiers; they are converted to hyphens, unless this option is
> given. In this case, such identifiers are capitalized (to
> lowerCamelCase).

`--oid` \<OID\>  
> Let *OID* be the top object's OID. If the first component of the OID
> is a name not defined in SNMPv2-SMI, the `--import` option is also
> needed in order to produce a valid MIB module, to import the name from
> the proper module. If this option is not given, a `tailf:snmp-oid`
> statement must be specified in the YANG header.

`--tagpath Path`  
> Generate the MIB only for a subtree of the module. The *Path* argument
> is an absolute schema node identifier, and it must refer to container
> nodes only.

`--import` \<Module\> \<Name\>  
> Add an IMPORT statement which imports *Name* from the MIB *Module*.

`--top` \<Name\>  
> Let *Name* be the name of the top object.

`--module` \<Name\>  
> Let *Name* be the module name. If a `tailf:snmp-mib-module-name`
> statement is in the YANG header, the two names must be equal.

`--generate-oids`  
> Translate all data nodes into MIB objects, and generate OIDs for data
> nodes without `tailf:snmp-oid` statements.

`--generate-yang-annotation`  
> Generate a YANG annotation file containing the `tailf:snmp-oid`,
> `tailf:snmp-mib-module-name` and `tailf:snmp-row-status-column`
> statements for the nodes. Implies `--skip-symlinks`.

`--skip-symlinks`  
> Do not generate MIB objects for data nodes modeled through symlinks.

`--fail-on-warnings`  
> If this option is used all warnings are treated as errors and ncsc
> will fail its execution.

`--no-comments`  
> If this option is used no additional comments will be generated in the
> MIB.

`--read-only`  
> If this option is used all objects in the MIB will be read only.

`--prefix` \<String\>  
> Prefix all MIB object names with *String*.

`--builtin`  
> If a MIB is to be emitted from a builtin YANG module, this option must
> be given to ncsc. This will result in the MIB being emitted from the
> system builtin .fxs files. It is not possible to change builtin models
> since they are system internal. Therefore, compiling a modified
> version of a builtin YANG module, and then using that resulting .fxs
> file to emit .hrl files is not allowed.
>
> Use `--list-builtins` to get a listing of all system builtin YANG
> modules.

### Emit SNMP user options

`--snmpuser` \<EngineID\> \<User\> \<AuthType\> \<PrivType\> \<PassPhrase\>  
> Generates a user entry with localized keys for the specified engine
> identifier. The output is an usmUserEntry in XML format that can be
> used in an initiation file for the
> SNMP-USER-BASED-SM-MIB::usmUserTable. In short this command provides
> key generation for users in SNMP v3. This option takes five arguments:
> The EngineID is either a string or a colon separated hexlist, or a dot
> separated octet list. The User argument is a string specifying the
> user name. The AuthType argument is one of md5, sha, sha224, sha256,
> sha384, sha512 or none. The PrivType argument is one of des, aes,
> aes192, aes256, aes192c, aes256c or none. Note that the difference
> between aes192/aes256 and aes192c/aes256c is the method for localizing
> the key; where the latter is the method used by many Cisco routers,
> see:
> https://datatracker.ietf.org/doc/html/draft-reeder-snmpv3-usm-3desede-00,
> and the former is defined in:
> https://datatracker.ietf.org/doc/html/draft-blumenthal-aes-usm-04. The
> PassPhrase argument is a string.

### Emit Java options

`--emit-java` \<JFile\>  
> Generate a .java ConfNamespace file from a .fxs file to be used when
> working with the Java library. The file is useful, but not necessary
> when working with the NAVU library. JFile could either be a file or a
> directory. If JFile is a directory the resulting .java file will be
> created in that directory with a name based on the module name in the
> YANG module. If JFile is not a directory that file is created. Use
> *--print-java-filename* to get the resulting file name.

`--print-java-filename`  
> Only print the resulting java file name. Due to restrictions of
> identifiers in Java the name of the Class and thus the name of the
> file might get changed if non Java characters are used in the name of
> the file or in the name of the module. If this option is used no file
> is emitted the name of the file which would be created is just printed
> on stdout.

`--java-package` \<Package\>  
> If this option is used the generated java file will have the given
> package declaration at the top.

`--exclude-enums`  
> If this option is used, definitions for enums are omitted from the
> generated java file. This can in some cases be useful to avoid
> conflicts between enum symbols, or between enums and other symbols.

`--fail-on-warnings`  
> If this option is used all warnings are treated as errors and ncsc
> will fail its execution.

`-f`; `--fxsdep` \<FxsFileOrDir\>...  
> .fxs files (or directories containing .fxs files) to be used to
> resolve cross namespace dependencies.

`--builtin`  
> If a .java file is to be emitted from a builtin YANG module, this
> option must be given to ncsc. This will result in the .java file being
> emitted from the system builtin .fxs files. It is not possible to
> change builtin models since they are system internal. Therefore,
> compiling a modified version of a builtin YANG module, and then using
> that resulting .fxs file to emit .hrl files is not allowed.
>
> Use `--list-builtins` to get a listing of all system builtin YANG
> modules.

### NCS device module import options

These options are used to import device modules into NCS. The import is
done as a source code transformation of the yang modules (MIBs) that
define the managed device. By default, the imported modules (MIBs) will
be augmented three times. Once under `/devices/device/config`, once
under `/devices/template/config` and once under
`/devices/device/live-status`.

The `ncsc` commands to import device modules can take the following
options:

`--ncs-skip-template` This option makes the NCS bundle compilation skip
the layout of the template tree - thus making the NCS feature of
provisioning devices through the template tree unusable. The main reason
for using this option is to save memory if the data models are very
large.

`--ncs-skip-statistics` This option makes the NCS bundle compilation
skip the layout of the live tree. This option make sense for e.g NED
modules that are sometimes config only. It also makes sense for the
Junos module which doesn't have and "config false" data.

`--ncs-skip-config` This option makes the NCS bundle compilation skip
the layout of the config tree. This option make sense for some NED
modules that are typically status and commands only.

`--ncs-keep-callpoints` This option makes the NCS bundle compilation
keep callpoints when performing the ncs transformation from modules to
device modules, as long as the callpoints have either `tailf:set-hook`
or `tailf:transaction-hook` as sub statement.

`--ncs-device-dir Directory` This is the target directory where the
output of the *--ncs-compile-xxx* command is collected.

`--lax-revision-merge` When we have multiple revisions of the same
module, the `ncsc` command to import the module will fail if a YANG
module does not follow the YANG module upgrade rules. See RFC 6020. This
option makes `ncsc` ignore those strict rules. Use with extreme care,
the end result may be that NCS is incompatible with the managed devices.

`--ncs-depend-package PackageDir` When a package has references to a
YANG module in another package, use this flag when compiling the
package.

`--ncs-apply-deviations` This option has no effect, since deviations are
applied by default. It is only present for backward compatibility.

`--ncs-no-apply-deviations` This option will make `--ncs-compile-bundle`
ignore deviations that are defined in one module with a target in
another module.

`--ncs-device-type netconf | snmp-ned | generic-ned | cli-ned` All
imported device modules adhere to a specific device type.

`--ncs-ned-id ModName:IdentityName` The NED id for the package.
IdentityName is the name of an identity in the YANG module ModName.

`--ncs-compile-bundle` \<YangFileDirectory\>  
> To import a set of managed device YANG files into NCS, gather the
> required files in a directory and import by using this flag. Several
> invocations will populate the mandatory `--ncs-device-dir` directory
> with the compiler output. This command also handles revision
> management for NCS imported device modules. Invoke the command several
> times with different `YangFileDirectory` directories and the same
> `--ncs-device-dir` directory to accumulate the revision history of the
> modules in several different `YangFileDirectory` directories.
>
> Modules in the `YangFileDirectory` directory having annotations or
> deviations for other modules are identified, and such annotations and
> deviations are processed as follows:
>
> 1.  Annotations using `tailf:annotate` are ignored (this annotation
>     mechanism is incompatible with the source code transformation).
>
> 2.  Annotations using `tailf:annotate-module` are applied (but may,
>     depending on the type of annotation and the device type, be
>     ignored by the transformation).
>
> 3.  Deviations are applied unless the `--ncs-no-apply-deviations`
>     option is given.
>
> Typically when NCS needs to manage multiple revisions of the same
> module, the filenames of the YANG modules are on the form of
> `MOD@REVISION.yang`. The `--ncs-compile-bundle` as well as the
> `--ncs-compile-module` commands will rename the source YANG files and
> organize the result as per revision in the `--ncs-device-dir` output
> directory.
>
> The output structure could look like:
>
> <div class="informalexample">
>
>     ncsc-out
>     |----modules
>     |----|----fxs
>     |----|----|----interfaces.fxs
>     |----|----|----sys.fxs
>     |----|----revisions
>     |----|----|----interfaces
>     |----|----|----|----revision-merge
>     |----|----|----|----|----interfaces.fxs
>     |----|----|----|----2009-12-06
>     |----|----|----|----|----interfaces.fxs
>     |----|----|----|----|----interfaces.yang.orig
>     |----|----|----|----|----interfaces.yang
>     |----|----|----|----2006-11-05
>     |----|----|----|----|----interfaces.fxs
>     |----|----|----|----|----interfaces.yang.orig
>     |----|----|----|----|----interfaces.yang
>     |----|----|----sys
>     |----|----|----|----2010-03-26
>     |----|----|----|----|----sys.yang.orig
>     |----|----|----|----|----sys.yang
>     |----|----|----|----|----sys.fxs
>     |----|----yang
>     |----|----|----interfaces.yang
>     |----|----|----sys.yang
>                 
>
> </div>
>
> where we have the following paths:
>
> 1.  `modules/fxs` contains the FXS files that are revision compiled
>     and are ready to load into NCS.
>
> 2.  `modules/yang/$MODULE.yang` is the augmented YANG file of the
>     latest revision. NCS will run with latest revision of all YANG
>     files, and the revision compilation will annotate that tree with
>     information indication at which revision each YANG element was
>     introduced.
>
> 3.  `modules/revisions/$MODULE` contains the different revisions for
>     \$MODULE and also the merged compilation result.

<!-- -->

`--ncs-compile-mib-bundle` \<MibFileDirectory\>  
> To import a set of SNMP MIB modules for a managed device into NCS, put
> the required MIBs in a directory and import by using this flag. The
> MIB files MUST have the ".mib" extension. The compile also picks up
> any MIB annotation files present in this directory, with the extension
> ".miba". See [mib_annotations(5)](mib_annotations.5.md) .
>
> This command translates all MIB modules to YANG modules according to
> the standard translation algorithm defined in
> I.D-ietf-netmod-smi-yang, then it generates a YANG deviations module
> in order to handle writable configuration data. When all MIB modules
> have been translated to YANG, *--ncs-compile-bundle* is invoked.
>
> Each invocation of this command will populate the *--ncs-device-dir*
> with the compiler output. This command also handles revision
> management for NCS imported device modules. Invoke the command several
> times with different *MibFileDirectory* directories and the same
> *--ncs-device-dir* directory to accumulate the revision history of the
> modules in several different *MibFileDirectory* directories.

<!-- -->

`--ncs-compile-module` \<YangFile\>  
> This ncsc command imports a single device YANG file into the
> *--ncs-model-dir* structure. It's an alternative to
> *--ncs-compile-bundle*, however is just special case of a one-module
> bundle. From a Makefile perspective it may sometimes be easier to use
> this version of bundle compilation.

### Misc options

`--strip-yang-source` \<FxsFile\>  
> Removes included YANG source from the fxs file. This makes the file
> smaller, but it means that the YANG module and submodules cannot be
> downloaded from the server, unless they are present in the load path.

`--get-info` \<FxsFile\>  
> Various info about the file is printed on standard output, including
> the names of the source files used to produce this file, which ncsc
> version was used, and for fxs files, namespace URI, other namespaces
> the file depends on, namespace prefix, and mount point.

`--get-uri` \<FxsFile\>  
> Extract the namespace URI.

`--version`  
> Reports the ncsc version.

`--emulator-flags` \<Flags\>  
> Passes `Flags` unaltered to the Erlang emulator. This can be useful in
> rare cases for adjusting the ncsc runtime footprint. For instance,
> *--emulator-flags="+SDio 1"* will force the emulator to create only
> one dirty I/O scheduler thread. Use with care.

## Example

Assume we have the file `system.yang`:

<div class="informalexample">

    module system {
      namespace "http://example.com/ns/gargleblaster";
      prefix "gb";

      import ietf-inet-types {
        prefix inet;
      }
      container servers {
        list server {
          key name;
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
      }
    }

</div>

To compile this file we do:

<div class="informalexample">

    $ ncsc -c system.yang

</div>

If we intend to manipulate this data from our Java programs, we must
typically also invoke:

<div class="informalexample">

    $ ncsc --emit-java blaster.java system.fxs
        

</div>

Finally we show how to compile a clispec into a loadable format:

<div class="informalexample">

    $ ncsc -c mycli.cli
    $ ls mycli.ccl
    myccl.ccl

</div>

## Diagnostics

On success exit status is 0. On failure 1. Any error message is printed
to stderr.

## Yang 1.1

NCS supports YANG 1.1, as defined in RFC 7950, with the following
exceptions:

- Type `empty` in leaf-list is not supported.

- Type `leafref` in unions are not validated, and treated as a string
  internally.

- `anydata` is not supported.

- The new scoping rules for submodules are not implemented.
  Specifically, a submodule must still include other submodules in order
  to access definitions defined there.

- The new XPath functions `derived-from()` and `derived-from-or-self()`
  can only be used with literal strings in the second argument.

- Leafref paths without prefixes in top-level typedefs are handled as in
  YANG 1.

## See Also

The NCS User Guide  

`ncs(1)`  
> command to start and control the NCS daemon

`ncs.conf(5)`  
> NCS daemon configuration file format

`clispec(5)`  
> CLI specification file format

`mib_annotations(5)`  
> MIB annotations file format
