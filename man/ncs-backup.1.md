# ncs-backup Man Page

`ncs-backup` - Command to backup and restore NCS data

## Synopsis

`ncs-backup [--install-dir InstallDir] [--no-compress]`

`ncs-backup --restore [Backup] [--install-dir InstallDir] [--non-interactive]`

## Description

The `ncs-backup` command can be used to backup and restore NCS CDB,
state data, and config files for an NCS installation. It supports both
"system installation", i.e. one that was done with the
`--system-install` option to the NCS installer (see
[ncs-installer(1)](ncs-installer.1.md)), and "local installation" that
was probably set up using the [ncs-setup(1)](ncs-setup.1.md) command.
Note that it is not supported to restore a backup from a "local
installation" to a "system installation", and vice versa.

Unless the `--restore` option is used, the command creates a backup. The
backup is stored in the `RunDir/backups` directory, named with the NCS
version and current date and time. In case a "local install" backup is
created, its name will also include "\_local". The `ncs-backup` command
will determine whether an NCS installation is "system" or "local" by
itself based on the directory structure.

## Options

`--restore [ Backup ]`  
> Restore a previously created backup. For backups of "system
> installations", the \<Backup\> argument is either the name of a file
> in the `RunDir/backups` directory or the full path to a backup file.
> If the argument is omitted, unless the `--non-interactive` option is
> given, the command will offer selection from available backups.
>
> For backups of "local installations", the \<Backup\> argument must be
> a path to a backup file. Also, "local installation" restoration must
> target an empty directory as `--install-dir`.

`[ --install-dir InstallDir ]`  
> Specifies the directory for installation of NCS static files, like the
> `--install-dir` option to the installer. In the case of "system
> installations", if this option is omitted, `/opt/ncs` will be used for
> \<InstallDir\>.
>
> In the case of "local installations", the `--install-dir` option
> should point to the directory containing an 'ncs.conf' file. If no
> 'ncs.conf' file is found, the default 'ncs.conf' of the NCS
> installation will be used.
>
> If you are restoring a backup of a "local installation",
> `--install-dir` needs to point to an empty directory.

`[ --non-interactive ]`  
> If this option is used, restore will proceed without asking for
> confirmation.

`[ --no-compress ]`  
> If this option is used, the backup will not be compressed (default is
> compressed). The restore will uncompress if the backup is compressed,
> regardless of this option.
