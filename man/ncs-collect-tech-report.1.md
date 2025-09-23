# ncs-collect-tech-report Man Page

`ncs-collect-tech-report` - Command to collect diagnostics from an NCS
installation.

## Synopsis

`ncs-collect-tech-report [--install-dir InstallDir] [--full] [--num-debug-dumps Integer]`

## Description

The `ncs-collect-tech-report` command can be used to collect diagnostics
from an NCS installation. The resulting diagnostics file contains
information that is useful to Cisco support to diagnose problems and
errors.

If the NCS daemon is running, runtime data from the running daemon will
be collected. If the NCS daemon is not running, only static files will
be collected.

## Options

`[ --install-dir InstallDir ]`  
> Specifies the directory for installation of NCS static files, like the
> `--install-dir` option to the installer. If this option is omitted,
> `/opt/ncs` will be used for \<InstallDir\>.

`[ --full ]`  
> This option is used to also include a full backup (as produced by
> [ncs-backup(1)](ncs-backup.1.md)) of the system. This helps Cisco
> support to reproduce issues locally.

`[ --num-debug-dumps Count ]`  
> This option is useful when a resource leak (memory/file descriptors)
> is suspected. It instructs the `ncs-collect-tech-report` script to run
> the command `ncs --debug-dump` multiple times.
