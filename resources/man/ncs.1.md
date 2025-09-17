# ncs Man Page

`ncs` - command to start and control the NCS daemon

## Synopsis

`ncs [--conf ConfFile] [--cd Dir] [--addloadpath Dir] [--nolog ] [--smp Nr] [--foreground [-v | --verbose] [--stop-on-eof]] [--with-package-reload ] [--ignore-initial-validation ] [--full-upgrade-validation ] [--disable-compaction-on-start ] [--start-phase0 ] [--epoll {true | false}]`

`ncs {--wait-phase0[TryTime] | --start-phase1 | --start-phase2 | --wait-started[TryTime] | --reload | --areload | --status | --check-callbacks [Namespace | Path] | --loadfile File | --rollback Nr | --debug-dump File [Options...] | --cli-j-dump File | --loadxmlfiles File | --mergexmlfiles File | --stop } [--timeout MaxTime]`

`ncs {--version | --cdb-debug-dump Directory [Options...] | --cdb-compact Directory}`

## Description

Use this command to start and control the NCS daemon.

## Starting Ncs

These options are relevant when starting the NCS daemon.

`-c`, `--conf` ConfFile  
> ConfFile is the path to a ncs.conf file. If the `-c File` argument is
> not given to `ncs`, first `$PWD` is searched for a file called
> `ncs.conf`, if not found `$NCS_DIR/etc/ncs/ncs.conf` is chosen.

`--cd` Dir  
> Change working directory

`--addloadpath` Dir  
> Add Dir to the set of directories NCS uses to load fxs, clispec, NCS
> packages and SNMP bin files.

`--nolog`  
> Do not log initial startup messages to syslog.

`--smp` Nr  
> Number of threads to run for Symmetric Multiprocessing (SMP). The
> default is to enable SMP support, with as many threads as the system
> has logical processors, if more than one logical processor is
> detected. Giving a value of 1 will disable SMP support, while a value
> bigger than 1 will enable SMP support, where NCS will at any given
> time use at most as many logical processors as the number of threads.

`--foreground [ -v | --verbose ] [ --stop-on-eof ]`  
> Do not start as a daemon. Can be used to start NCS from a process
> manager. In combination with -v or --verbose, all log messages are
> printed to stdout. Useful during development. In combination with
> --stop-on-eof, NCS will stop if it receives EOF (ctrl-d) on standard
> input. Note that to stop NCS when run in foreground, send EOF (if
> --stop-on-eof was used) or use ncs --stop. Do not terminate with
> ctrl-c, since NCS in that case won't have the chance to close the
> database files.

`--with-package-reload`  
> When NCS starts, if the private package directory tree already exists,
> NCS will load the packages from this directory tree and not search the
> load-path for packages. If the --with-package-reload option is given
> when starting NCS, the load-path will be searched and the packages
> found there copied to the private package directory tree, replacing
> the previous contents, before loading. This should always be used when
> upgrading to a new version of NCS in an existing directory structure,
> to make sure that new packages are loaded together with the other
> parts of the new system.
>
> When NCS is started from the /etc/init.d scripts, that get generated
> by the --system-install option to the NCS installer, the environment
> variable NCS_RELOAD_PACKAGES can be set to 'true' to attempt a package
> reload.

`--with-package-reload-force`  
> When reloading packages NCS will give a warning when the upgrade looks
> "suspicious", i.e. may break some functionality. This is not a strict
> upgrade validation, but only intended as a hint to NSO administrator
> early in the upgrade process that something might be wrong. Please
> refer to Loading Packages section in NSO Administration Guide for more
> information.
>
> If all changes indicated by the warnings are intended, this option
> allows to override warnings and proceed with the upgrade. This option
> is equivalent to setting NCS_RELOAD_PACKAGES environment variable to
> 'force'.

`--ignore-initial-validation`  
> When CDB starts on an empty database, or when upgrading, it starts a
> transaction to load the initial configuration or perform the upgrade.
> This option makes NCS skip any validation callpoints when committing
> these initial transaction. (The preferred alternative is to use
> start-phases and register the validation callpoints in phase 0, see
> the user guide).

`--full-upgrade-validation`  
> Perform a full validation of the entire database if the data models
> have been upgraded. This is useful in order to trigger external
> validation to run even if the database content has not been modified.

`--disable-compaction-on-start`  
> Do not compact CDB files when starting the NCS daemon.

`--start-phase0`  
> Start the daemon, but only start internal subsystems and CDB. Phase 0
> is used when a controlled upgrade is done.

`--epoll { true | false }`  
> Determines whether NCS should use an enhanced poll() function (e.g.
> Linux epoll(7)). This can improve performance when NCS has a high
> number of connections, but there may be issues with the implementation
> in some OS/kernel versions. The default is true.

## Communicating With Ncs

When the NCS daemon has been started, these options are used to
communicate with the running daemon.

By default these options will perform their function by connecting to a
running NCS daemon over the default IPC socket. If the daemon is not
listening on its standard port/path, set the environment variables
`NCS_IPC_ADDR`/`NCS_IPC_PORT` or `NCS_IPC_PATH` accordingly. The used
values should match those specified in either the
/ncs-config/ncs-ipc-address or /ncs-config/ncs-local-ipc of the
[ncs.conf(5)](ncs.conf.5.md) (if both sets are provided,
`NCS_IPC_PATH` takes precedence). See the section on IPC in the Admin
Guide for details.

`--wait-phase0 [ TryTime ]`  
> This call hangs until NCS has initialized start phase0. After this
> call has returned, it is safe to register validation callbacks,
> upgrade CDB etc. This function is useful when NCS has been started
> with --foreground and --start-phase0. It will keep trying the initial
> connection to NCS for at most TryTime seconds (default 5).

`--start-phase1`  
> Do not start the subsystems that listen to the management IP address.
> Must be called after the daemon was started with --start-phase0.

`--start-phase2`  
> Must be called after the management interface has been brought up, if
> --start-phase1 has been used. Starts the subsystems that listens to
> the management IP address.

`--wait-started [ TryTime ]`  
> This call hangs until NCS is completely started. This function is
> useful when NCS has been started with --foreground. It will keep
> trying the initial connection to NCS for at most TryTime seconds
> (default 5).

`--reload`  
> Reload the NCS daemon configuration. All log files are closed and
> reopened, which means that `ncs --reload` can be used from e.g.
> logrotate(8), but it is more efficient to use `ncs_cmd -c reopen_logs`
> for this purpose. Note: If we update a .fxs file it is not enough to
> do a reload; the "packages reload" action must be invoked, or the
> daemon must be restarted with the `--with-package-reload` option.

`--areload`  
> Asynchronously reload the NCS daemon configuration. This can be used
> in scripts executed by the NCS daemon.

`--stop`  
> Stop the NCS daemon.

`--status`  
> Prints status information about the NCS daemon on stdout. Among the
> things listed are: loaded namespaces, current user sessions,
> callpoints (and whether they are registered or not), CDB status, and
> the current start-phase. Start phases are reported as "status:" and
> can be one of starting (which is pre-phase0), phase0, phase1, started
> (i.e. phase2), or stopping (which means that NCS is about to
> shutdown).

`--debug-dump File [Options...]`  
> Dump debug information from an already running NCS daemon into a
> \<File\>. The file only makes sense to NCS developers. It is often a
> good idea to include a debug dump in NCS trouble reports.
>
> Additional options are supported as following
>
> `--collect-timeout Seconds`  
> > Extend the timeout when collecting information to build the debug
> > dump. The default timeout is 10 seconds.
>
> `--compress`  
> > Compress the debug dump to \<File.gz\>

`--cli-j-dump File`  
> Dump cli structure information from the NCS daemon into a file.

`--check-callbacks [Namespace | Path]`  
> Walks through the entire data tree (config and stat), or only the
> Namespace or Path, and verifies that all read-callbacks are
> implemented for all elements, and verifies their return values.

`--loadfile File`  
> Load configuration in curly bracket format from File.

`--rollback Nr`  
> Rollback configuration to saved configuration number Nr.

`--loadxmlfiles File ...`  
> Load configuration in XML format from Files. The configuration is
> completely replaced by the contents in Files.

`--mergexmlfiles File ...`  
> Load configuration in XML format from Files. The configuration is
> merged with the contents in Files. The XML may use the 'operation'
> attribute, in the same way as it is used in a NETCONF \<edit-config\>
> operation.

`--timeout MaxTime`  
> Specify the maximum time to wait for the NCS daemon to complete the
> command, in seconds. If this option is not given, no timeout is used..

## Standalone Options

`--cdb-debug-dump Directory [Options...] [Subtrees...]`  
> Print debug information about the CDB files in \<Directory\> to
> stdout. This is a completely stand-alone feature and the only thing
> needed is the .cdb files (no running NCS daemon or .fxs files etc).
>
> Additional options may be provided to alter the output format and
> content.
>
> Specify subtrees to prevent printing the entire database.
>
> `file_debug`  
> > Dump raw file contents with keypaths.
>
> `file_debug_hkp`  
> > Dump raw file contents with hashed keypaths.
>
> `ns_debug`  
> > Dump fxs headers and namespace list.
>
> `schema_debug`  
> > Dump extensive schema information.
>
> `validate_utf8`  
> > Only emit paths and content with invalid UTF-8.
>
> `xml`  
> > Dump file contents as XML files, without output to stdout. The files
> > will be named A.xml, O.xml and S.xml if data is available.
>
> `help`  
> > Print help text.
>
> The output may also be filtered by file type using the *skip_conf*,
> *skip_oper* and *skip_snap* options to filter out configuration,
> operational and snapshot databases respectively.

`--cdb-compact Directory`  
> Compact CDB files in \<Directory\>. This is a completely stand-alone
> feature and the only thing needed is the .cdb files (no running NCS
> daemon or .fxs files etc).

`--version`  
> Reports the ncs version without interacting with the daemon.

`--timeout MaxTime`  
> See above

## Environment

When NCS is started from the /etc/init.d scripts, that get generated by
the --system-install option to the NCS installer, the environment
variable NCS_RELOAD_PACKAGES can be set to 'true' to attempt a package
reload.

The environment variables `NCS_IPC_PORT`, `NCS_IPC_ADDR` and
`NCS_IPC_PATH` control how to connect to a running NCS daemon. These
variables generally have no effect when starting the daemon, since the
values are read from the configuration file
[ncs.conf(5)](ncs.conf.5.md). The exception is `NCS_IPC_PATH`, which
overrides the configuration file if set, enabling the Unix domain socket
at the specified path.

## Diagnostics

If NCS starts, the exit status is 0. If not it is a positive integer.
The different meanings of the different exit codes are documented in the
"NCS System Management" chapter in the user guide. When failing to
start, the reason is stated in the NCS daemon log. The location of the
daemon log is specified in the ConfFile as described in
[ncs.conf(5)](ncs.conf.5.md).

## See Also

`ncs.conf(5)` - NCS daemon configuration file format
