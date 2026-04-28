# ncs-setup Man Page

`ncs-setup` - Command to create an initial NCS setup

## Synopsis

`ncs-setup --dest Directory [--netsim-dir Directory] --force-generic [--package Dir|Name...] [--generate-ssh-keys] [--use-copy] [--no-netsim]`

`ncs-setup --eclipse-setup [--dest Directory]`

`ncs-setup --reset [--dest Directory]`

## Description

The `ncs-setup` command is used to create an initial execution
environment for a "local install" of NCS. It does so by generating a set
of files and directories together with an ncs.conf file. The files and
directories are created in the --dest Directory, and NCS can be launched
in that self-contained directory. For production, it is recommended to
instead use a "system install" - see the
[ncs-installer(1)](ncs-installer.1.md).

Without any options an NCS setup without any default packages is
created. Using the `--netsim-dir` and `--package` options, initial
environments for using NCS towards simulated devices, real devices, or a
combination thereof can be created.

<div class="note">

This command is not included by default in a "system install" of NCS
(see [ncs-installer(1)](ncs-installer.1.md)), since it is not usable
in such an installation. The (single) execution environment is created
by the NCS installer when it is invoked with the `--system-install`
option.

</div>

## Options

`--dest` Directory  
> ncs-setup generates files and directories, all files are written into
> the --dest directory. The directory is created if non existent.

`--netsim-dir` Directory  
> If you have an existing ncs-netsim simulation environment, that
> environment consists of a set of devices. These devices may be
> NETCONF, CLI or SNMP devices and the ncs-netsim tool can be used to
> create, control and manipulate that simulation network.
>
> A common developer use case with ncs-setup is that we wish to use NCS
> to control a simulated network. The option --netsim-dir sets up NCS to
> manage all the devices in that simulated network. All hosts in the
> simulated network are assumed to run on the same host as ncs.
> ncs-setup will generate an XML initialization file for all devices in
> the simulated network.

`--force-generic`  
> Generic devices used in a simulated netsim network will normally be
> run as netconf devices. Use this option if the generic devices should
> be forced to be run as generic devices.

`--package` Directory \| Name  
> When you want to create an execution environment where NCS is used to
> control real, actual managed devices we can use the --package option.
> The option can be given more than once to add more packages at the
> same time.
>
> The main purpose of this option is to creates symbolic links in
> ./packages to the NED (or other) package(s) indicated to the command.
> This makes sure that NCS finds the packages when it starts.
>
> For all NED packages that ship together with NCS, i.e packages that
> are found under \$NCS_DIR/packages/neds we can just provide the name
> of the NED. We can also give the path to a NED package.
>
> <div class="note">
>
> The script also accepts the alias `--ned-package` (to be backwards
> compatible). Both options do the same thing, create links to your
> package regardless of what kind of package it is.
>
> </div>
>
> To setup NCS to manage Juniper and Cisco routers we execute:
>
> <div class="informalexample">
>
>        $ ncs-setup --package juniper --package ios
>               
>
> </div>
>
> If we have developed our own NED package to control our own ACME
> router, we can do:
>
> <div class="informalexample">
>
>        $ ncs-setup --package /path/to/acme-package
>               
>
> </div>

`--generate-ssh-keys`  
> This option generates fresh ssh keys. By default the keys in
> `${NCS_DIR}/etc/ncs/ssh` are used. This is useful so that the ssh keys
> don't change when a new NCS release is installed. Each NCS release
> comes with newly generated SSH keys.

`--use-copy`  
> By default, ncs-setup will create relative symbolic links in the
> ./packages directory. This option copies the packages instead.

`--no-netsim`  
> By default, ncs-setup searches upward in the directory hierarchy for a
> netsim directory. The chosen netsim directory will be used to populate
> the initial CDB data for the managed devices. This option disables
> this behavior.

Once the initial execution environment is set up, these two options can
be used to assist setting up an Eclipse environment or cleaning up an
existing environment.

`--eclipse-setup`  
> When developing the Java code for an NCS application, this command can
> be used to setup eclipse .project and .classpath appropriately. The
> .classpath will also contain that source path to all of the NCS Java
> libraries.

`--reset`  
> This option resets all data in NCS to "factory defaults" assuming that
> the layout of the NCS execution environment is created by `ncs-setup`.
> All CDB database files and all log files are removed. The daemon is
> also stopped

## Simulation Example

If we have a NETCONF device (which has a set of YANG files and we wish
to create a simulation environment for those devices we may combine the
three tools 'ncs-make-package', 'ncs-netsim' and 'ncs-setup' to achieve
this. Assume all the yang files for the device resides in
`/path/to/yang` we need to

- Create a package for the YANG files.

  <div class="informalexample">

        $ ncs-make-package   --netconf-ned /path/to/yang acme
                  

  </div>

  This creates a package in ./acme

- Setup a network simulation environment. We choose to create a
  simulation network with 5 routers named r0 to r4 with the ncs-netsim
  tool.

  <div class="informalexample">

        $ ncs-netsim create-network ./acme 5 r
                  

  </div>

  The network simulation environment will be created in ./netsim

- Finally create a directory where we execute NCS

  <div class="informalexample">

      $ ncs-setup --netsim-dir netsim --dest ./acme_nms \
                  --generate-ssh-keys
      $ cd ./acme_nms; ncs-setup --eclipse-setup
                

  </div>

This results in a simulation environment that looks like:

<div class="informalexample">

               ------
               | NCS |
               -------
                  |
                  |
                  |
     ------------------------------------
       |      |      |       |      |
       |      |      |       |      |
     ----    ----   ----    ----   ----
     |r0 |   |r1|   |r2|    |r3|   |r4|
     ----    ----   ----    ----   ----

        

</div>

with NCS managing 5 simulated NETCONF routers, all running ConfD on
localhost (on different ports) and all running the YANG models from
`/path/to/yang`
