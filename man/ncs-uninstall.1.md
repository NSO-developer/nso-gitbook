# ncs-uninstall Man Page

`ncs-uninstall` - Command to remove NCS installation

## Synopsis

`ncs-uninstall --ncs-version [Version] [--install-dir InstallDir] [--non-interactive]`

`ncs-uninstall --all [--install-dir InstallDir] [--non-interactive]`

## Description

The `ncs-uninstall` command can be used to remove part or all of an NCS
"system installation", i.e. one that was done with the
`--system-install` option to the NCS installer (see
[ncs-installer(1)](ncs-installer.1.md)).

## Options

`--ncs-version [ Version ]`  
> Removes the installation of static files for NCS version \<Version\>.
> I.e. the directory tree rooted at `InstallDir/ncs-Version` will be
> removed. The \<Version\> argument may also be given as the filename or
> pathname of the installation directory, or, unless `--non-interactive`
> is given, omitted completely in which case the command will offer
> selection from the installed versions.

`--all`  
> Completely removes the NCS installation. I.e. the whole directory tree
> rooted at \<InstallDir\>, as well as the directories for config files
> (option `--config-dir` to the installer), run-time state files (option
> `--run-dir` to the installer), and log files (option `--log-dir` to
> the installer), and also the init script and user profile scripts.

`[ --install-dir InstallDir ]`  
> Specifies the directory for installation of NCS static files, like the
> `--install-dir` option to the installer. If this option is omitted,
> `/opt/ncs` will be used for \<InstallDir\>.

`[ --non-interactive ]`  
> If this option is used, removal will proceed without asking for
> confirmation.
