# ncs-project-update Man Page

`ncs-project-update` - Command to update and maintain an NCS project

## Synopsis

`ncs-project update [OPTIONS] project-name`

## Description

Update and maintain an NCS project. This involves fetching packages as
defined in `project-meta-data.xml`, and/or update already fetched
packages.

For packages, specified to origin from a git repository, a number of git
commands will be performed to get it up to date. First a *git stash*
will be performed in order to protect from potential data loss of any
local changes made. Then a *git fetch* will be made to bring in the
latest commits from the origin (remote) git repository. Finally, the
local branch, tag or commit hash will be restored, with a *git reset*,
according to the specification in the `project-meta-data.xml` file.

Any package specified as *local* will be left unaffected.

Any package which, in its `package-meta-data.xml` file, has a required
dependency, will have that dependency resolved. First, if a
*packages-store* has been defined in the `project-meta-data.xml` file.
The dependent package will be search for in that location. If this
fails, an attempt to checkout the dependent package via git will be
attempted.

The *ncs-project update* command is intended to be called as soon as you
want to bring your project up to date. Each time called, the command
will recreate the `setup.mk` include file which is intended to be
included by the top Makefile. This file will contain make targets for
compiling the packages and to setup any netsim devices.

## Options

`-h, --help`  
> Print a short help text and exit.

`-v`  
> Print information messages about what is being done.

`-y`  
> Answer yes on every questions. Will cause overwriting to any earlier
> *setup.mk* files.

`--ncs-min-version`  

`--ncs-min-version-non-strict`  

`--use-bundle-packages`  
> Update using the packages defined in the bundle section.

## Examples

Bring a project up to date.

<div class="informalexample">

      $ ncs-project update -v
      ncs-project: installing packages...
      ncs-project: updating package alu-sr...
      ncs-project: cd /home/my/mpls-vpn-project/packages/alu-sr
      ncs-project: git stash   # (to save any local changes)
      ncs-project: git checkout -q "stable"
      ncs-project: git fetch
      ncs-project: git reset --hard origin/stable
      ncs-project: updating package alu-sr...done
      ncs-project: installing packages...ok
      ncs-project: resolving package dependencies...
      ncs-project: filtering missing pkgs for
         "/home/my/mpls-vpn-project/packages/ipaddress-allocator"
      ncs-project: missing packages:
      [{<<"resource-manager">>,undefined}]
      ncs-project: No version found for dependency: "resource-manager" ,
         trying git and the stable branch
      ncs-project: git clone "ssh://git@stash.tail-f.com/pkg/resource-manager.git"
         "/home/my/mpls-vpn-project/packages/resource-manager"
      ncs-project: git checkout -q "stable"
      ncs-project: filtering missing pkgs for
         "/home/my/mpls-vpn-project/packages/resource-manager"
      ncs-project: missing packages:
      [{<<"cisco-ios">>,<<"3.0.2">>}]
      ncs-project: unpacked tar file:
         "/store/releases/ncs-pkgs/cisco-ios/3.0.4/ncs-3.0.4-cisco-ios-3.0.2.tar.gz"
      ncs-project: resolving package dependencies...ok
          

</div>
