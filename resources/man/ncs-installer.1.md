# ncs-installer Man Page

`ncs-installer` - NCS installation script

## Synopsis

`ncs-VSN.OS.ARCH.installer.bin [--local-install] LocalInstallDir`

`ncs-VSN.OS.ARCH.installer.bin --system-install [--install-dir InstallDir] [--config-dir ConfigDir] [--run-dir RunDir] [--log-dir LogDir] [--run-as-user User] [--keep-ncs-setup] [--non-interactive] [--ignore-init-scripts] [--ignore-systemd-script]`

## Description

The NCS installation script can be invoked to do either a simple "local
installation", which is convenient for test and development purposes, or
a "system installation", suitable for deployment.

## Local Installation

`[ --local-install ] LocalInstallDir`  
> When the NCS installation script is invoked with this option, or is
> given only the \<LocalInstallDir\> argument, NCS will be installed in
> the \<LocalInstallDir\> directory only.

## System Installation

`--system-install`  
> When the NCS installation script is invoked with this option, it will
> do a system installation that uses several different directories, in
> accordance with Unix/Linux application installation standards. The
> first time a system installation is done, the following actions are
> taken:
>
> - The directories described below are created and populated.
>
> - An init script for start of NCS at system boot is installed.
>
> - User profile scripts that set up `$PATH` and other environment
>   variables appropriately for NCS users are installed.
>
> - A symbolic link that makes the installed version the currently
>   active one is created (see the `--install-dir` option).

`[ --install-dir InstallDir ]`  
> This is the directory where static files, primarily the code and
> libraries for the NCS daemon, are installed. The actual directory used
> for a given invocation of the installation script is
> `InstallDir/ncs-VSN`, allowing for coexistence of multiple installed
> versions. The currently active version is identified by a symbolic
> link `InstallDir/current` pointing to one of the `ncs-VSN`
> directories. If the `--install-dir` option is omitted, `/opt/ncs` will
> be used for \<InstallDir\>.

`[ --config-dir ConfigDir ]`  
> This directory is used for config files, e.g. `ncs.conf`. If the
> `--config-dir` option is omitted, `/etc/ncs` will be used for
> \<ConfigDir\>.

`[ --run-dir RunDir ]`  
> This directory is used for run-time state files, such as the CDB data
> base and currently used packages. If the `--run-dir` option is
> omitted, `/var/opt/ncs` will be used for \<RunDir\>.

`[ --log-dir LogDir ]`  
> This directory is used for the different log files written by NCS. If
> the `--log-dir` option is omitted, `/var/log/ncs` will be used for
> \<LogDir\>.

`[ --run-as-user User ]`  
> By default, the system installation will run NCS as the `root` user.
> If a different user is given via this option, NCS will instead be run
> as that user. The user will be created if it does not already exist.
> This mode is only supported on Linux systems that have the `setcap`
> command, since it is needed to give NCS components the required
> capabilities for some aspects of the NCS functionality.
>
> When the option is used, the following executable files (assuming that
> the default `/opt/ncs` is used for `--install-dir`) will be installed
> with elevated privileges:
>
> `/opt/ncs/current/lib/ncs/lib/core/pam/priv/epam`  
> > Setuid to root. This is typically needed for PAM authentication to
> > work with a local password file. If PAM authentication is not used,
> > or if the local PAM configuration does not require root privileges,
> > the setuid-root privilege can be removed by using `chmod u-s`.
>
> `/opt/ncs/current/lib/ncs/erts/bin/ncs` `/opt/ncs/current/lib/ncs/erts/bin/ncs.smp`  
> > Capability `cap_net_bind_service`. One of these files (normally
> > `ncs.smp`) will be used as the NCS daemon. The files have execute
> > access restricted to the user given via `--run-as-user`. The
> > capability is needed to allow the daemon to bind to ports below 1024
> > for northbound access, e.g. port 443 for HTTPS or port 830 for
> > NETCONF over SSH. If this functionality is not needed, the
> > capability can be removed by using `setcap -r`.
>
> `/opt/ncs/current/lib/ncs/bin/ip`  
> > Capability `cap_net_admin`. This is a copy of the OS `ip(8)`
> > command, with execute access restricted to the user given via
> > `--run-as-user`. The program is not used by the core NCS daemon, but
> > provided for packages that need to configure IP addresses on
> > interfaces (such as the `tailf-hcc` package). If no such packages
> > are used, the file can be removed.
>
> `/opt/ncs/current/lib/ncs/bin/arping`  
> > Capability `cap_net_raw`. This is a copy of the OS `arping(8)`
> > command, with execute access restricted to the user given via
> > `--run-as-user`. The program is not used by the core NCS daemon, but
> > provided for packages that need to send gratuitous ARP requests
> > (such as the `tailf-hcc` package). If no such packages are used, the
> > file can be removed.
>
> > [!NOTE]
> > When the `--run-as-user` option is used, all OS commands executed by
> > NCS will also run as the given user, rather than as the user
> > specified for custom CLI commands (e.g. through clispec
> > definitions).

`[ --keep-ncs-setup ]`  
> The `ncs-setup` command is not usable in a "system installation", and
> is therefore by default excluded from such an installation to avoid
> confusion. This option instructs the installation script to include
> `ncs-setup` in the installation despite this.

`[ --non-interactive ]`  
> If this option is given, the installation script will proceed with
> potentially disruptive changes (e.g. modifying or removing existing
> files) without asking for confirmation.

`[ --ignore-init-scripts ]`  
> If given this option, the installation script will not install systemd
> or SysV scripts. This can be useful when running in, for example, a
> containerized environment where init scripts are typically not used.

`[ --ignore-systemd-script ]`  
> If given this option, the installation script will not install systemd
> script. The script installs SysV scripts instead.
