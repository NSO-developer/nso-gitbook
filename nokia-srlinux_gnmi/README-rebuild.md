# Table of contents
-------------------
```
  1. General
    1.1 Overview
    1.2 Using the built-in tool for YANG download
    1.3 Rebuild the NED with the downloaded YANG models
    1.4 Reload the NED package in NSO
  2. Removing all downloaded YANG models
  3. Using the built-in downloader tool for a custom download
    3.1 Creating a custom download
  4. Alternative download methods
    4.1 Copy the files into the NED source directory
  5. Rebuilding the NED using a custom NED-ID
    5.1 Rebuild with a custom NED-ID
    5.2 Exporting the rebuilt NED package
  6. YANG fixes applied when rebuilding the NED
    6.1 General
    6.2 Fixes listed by schema paths
    6.3 Fixes listed by YANG file paths
    6.4 Other fixes
  7. Advanced: repairing YANG modules
    7.1 Different kinds of YANG related issues
    7.2 Compile-time issues
    7.3 Run-time issues
  8. Advanced: build methods using scope filtering
    8.1 Rules of thumb when selecting the scope
    8.2 Doing build-time scope filtering
    8.3 Doing run-time scope filtering
    8.4 Alternative methods
  9. Advanced: build methods using schema trimming
    9.1 Using the NED rebuild tool with schema trimming
```


# 1. General
------------

## 1.1 Overview

The nokia-srlinux_gnmi NED is delivered without any YANG models in the package.

The models do need to be downloaded, followed by a rebuild and reload of the package before the NED can be fully operational.

This NED contains an optional built-in tool that makes downloading of the device models easy.

Alternatively, manual download is possible as described in chapter 4.

The NED package (i.e with no device models) must first be properly configured in a running NSO environment prior to usage of the downloader tool. The steps described in chapter 1.1 through 1.3 in the README.md must be done prior to this step.

## 1.2 Using the built-in tool for simple YANG download

The downloader tool is implemented as an NSO RPC which can be invoked for instance from the NSO CLI.

When the tool is executed the NED will automatically connect to the device for which the YANG models shall be downloaded. The device will be requested to return a list of supported models when the NED is probing it for capabilities.

This list of models will be the base used by the tool when downloading the models. During operation the tool will also scan each downloaded YANG file for additional dependencies through import/include found. The tool will try to download all such dependency YANG files as well.

  The gNMI protocol itself does not provide any method to do direct YANG model download from the device.

  However, newer versions of Nokia SRLinux do provide a very good alternative.

  The gNOI file transfer is supported on newer versions. It can be used by the NED to download the YANG from the device. A pre-requsite is of course that the device itself contains the YANG model files.

  This can be checked through for example the NSO CLI or by using a gNOI client tool like *gnoic*.

  The default location is */opt/srlinux/models*. If the files are located elsewhere, the new path needs to be configured in the NED to enable gNOI file transfer. See README-ned-settings.md for further info.

  If gNOI file transfer cannot be used, the fallback alternative is to fetch the files from the public Nokia SRLinux repository on github.

### Simple Usage

  The downloader tool is pre-configured with two profiles:

  ```
  srlinux-all-from-git    : Downloads the Nokia SRLinux YANG models from the Nokia SRLinux github repo. 
                            The files starting with "srl_nokia-tools" are excluded. 
                            By default, version v23.10.1 of the models is downloaded.
  srlinux-all-from-device : Downloads the native YANG files directly from the Nokia SRLinux device itself. 
                            This only works on newe versions of Nokia SRLinux with support for gNOI. 
                            The operation is using the gNOI file get RPC internally to fetch the files.
  ```

  Do as follows in the NSO CLI to download the files using the 'srlinux-all' profiles.

  To download from the device itself:

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules profile srlinux-all-from-device
  ```

  To download from git:

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules profile srlinux-all-from-git
  ```

  To override the default version to download, do as follows:

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules profile srlinux-all remote { git { checkout <selected version> } }
  ```

  To use an archive file as download source:

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules profile srlinux-all remote { archive <path to archive file> }
  ```

  For more advanced options using the downloader tool, see chapter 3.

  Chapter 5.2 in README.md describes more details about the downloader tool, including all available command line arguments.

For more advanced options using the downloader tool, see chapter 3.

Chapter 5('rpc get-modules') in README.md describes more details about the downloader tool, including all available command line arguments.

## 1.3 Rebuild the NED with the downloaded YANG models
The NED must be rebuilt when the device models have been downloaded and stored properly.

Very often there are known issues related to building the device YANG models. Such issues
typically cause compiler errors or unwanted runtime errors/behaviours in NSO.

The NED is configured to take care of all currently known build/runtime issues. It will automatically
patch the problematic files such that they do build properly for NSO. This is done using a set of YANG
build recipes bundled with the NED package.

Note that the work with adapting the YANG build recipes is an ongoing process. If new issues are found
the Cisco NSO NED team will update the recipes accordingly and then release a new version of the NED.

It is strongly recommended that end users report new YANG build issues found back to the Cisco NSO NED team
through a support request

The NED provides two alternatives for rebuilding. It can be done either through NSO using a built-in tool, or by invoking gnu make in an external shell.

### Rebuild using the built-in tool

The built-in rpc *rebuild-package* does rebuild the NED package by automatically invoking gnu make in the source directory of the package installation root.

```
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package
```

<u>Note:</u> this rpc can take a long time to finish. This is because compiling YANG models is a very time consuming task.

Additional arguments:

```
verbose : Print the full output returned from gnu make. By default the output is only printed upon errors.
profile : Apply a certain build profile when rebuilding.
ned-id  : Parameters relevant for customizing the NED ID. See chapter 5 for further info.
```

### Rebuild using a separate shell

The NED must be rebuilt from inside the NED package installation root (i.e $NED_ROOT_DIR configured in chapter 1.1 in README.md).

To rebuild the NED do as follows:

```
> cd $NED_ROOT_DIR/src
> make clean all
```


## 1.4 Reload the NED package in NSO
When the NED has been successfully rebuilt with the device models it is necessary to reload the package
into NSO.

### Reloading

Use the following NSO CLI command:

```
admin@ncs# packages reload
```

Note, if the NED packages has been rebuilt with a new NED-ID as described in chapter 5 it will
be necessary to add 'force' to the reload command:

```
admin@ncs# packages reload force
```



# 2. Removing all downloaded YANG models

If a new set of YANG models is going to be downloaded for an already installed and reloaded NED it is highly recommended to first remove all old device YANG models from the previous download.


## 2.1 Clean the NED source directory

Use the following make target to remove all previously downloaded YANG.

### Clean using the built-in tool

```
admin@ncs# devices device dev-1 rpc rpc-clean-package clean-package
```

### Clean using a separate shell

```
> cd $NED_ROOT_DIR/src
> make distclean
```



# 3. Using the built-in downloader tool for a custom download

Using a pre-configured download profile is the easiest way for downloading the device YANG models.

In case this is not a suitable approach, the downloader tool has a number of additional arguments that allows
for doing a custom download. For instance by limiting the scope for downloading the YANG models.

## 3.1 Creating a custom download

Use the 'module-include-regex' and 'module-exclude-regex' to customize the download scope.
Both arguments shall be specified as regular expressions.

The easiest way to get the arguments right is by using the RPC named 'list-modules'

  Example:

  Start with fetching a full list of the YANG models supported by the device:

  ```
  # devices device dev-1 rpc rpc-list-modules list-modules
  ```

  Limit the scope to only include some models, by specifying a simply regular expression for the argument 'module-include-regex':

  ```
  # devices device dev-1 rpc rpc-list-modules list-modules module-include-regex srl_nokia-.*
  ```

  Now use the argument 'module-exclude-regex' to exclude some of the files matching the 'module-include-regex':

  ```
  # devices device dev-1 rpc rpc-list-modules list-modules module-exclude-regex srl_nokia-tools-.*
  ```

  When the 'list-modules' rpc returns only the models of interest you can use the same arguments for the 'get-modules' rpc.

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules module-include-regex srl_nokia-.* module-exclude-regex srl_nokia-tools-.* <additional arguments>
  ```

See chapter 5 in README.md for more details about the RPC commands get-modules and list-modules.



# 4. Alternative download methods

The device models can of course also be downloaded manually. To use this option the NED package
must first be unpacked. The steps described in README.md chapter 1.1 must be done first. It is preferred to do
the chapter 1.2 and 1.3 steps in README.md as well.


## 4.1 Copy the files into the NED source directory

When the YANG models have been downloaded manually, all the files need to be copied into the source
directory of the NED installation:

```
> cp <path to directory with the YANG files>/*.yang  $NED_ROOT_DIR/src/yang
```

Note, YANG files with names like `<module name>@<date revision>.yang` need to be renamed to <module name>.yang.
This is because of a limitation in the current NED make system.

This manual procedure is equivalent to using the downloader tool with a path to local directory
as remote source. See chapter 5('rpc get-modules') in README.md for more info.

Please do not remove any of the the yang files used internally by the NED in the $NED_ROOT_DIR/src/yang

This applies to the  following files:

```
tailf-internal-rpcs.yang
tailf-internal-rpcs-custom.yang
tailf-ned-nokia-srlinux_gnmi-meta.yang
tailf-ned-nokia-srlinux_gnmi-meta-custom.yang
tailf-ned-nokia-srlinux_gnmi-oper.yang
tailf-ned-nokia-srlinux_gnmi-stats.yang
```

The best way to clean the source directory is to follow the steps in chapter 5.

# 5. Rebuilding the NED using a custom NED-ID

A common use case is to have many different versions of the same device in the network controlled
by NSO. Each device will then have its unique set of YANG files which this NED has to be rebuilt for.

To setup NSO for this kind of scenario, each built flavour of the built NED must have its own unique NED-ID.

This will make NSO allow multiple versions of the same NED package to co-exist.

Rebuilding with a custom NED-ID can be done in the alternative ways:

1. Through the built-in rpc, using the following additional arguments:
   - suffix
   - major
   - minor
2. Through gmake in a separate shell, using the following additional make variables:
   - NED_ID_SUFFIX
   - NED_ID_MAJOR
   - NED_ID_MINOR

The default NED-ID is: nokia-srlinux_gnmi-gen-1.2


## 5.1 Rebuild with a custom NED-ID

Do as follows to build each flavour of the nokia-srlinux_gnmi NED. Do it in iterations, one at the time:

   1. Follow the instructions in chapter 1.1 to 1.3 in README.md to unpack the NED and install a device instance
      using it. Make sure a unique location is selected and update the environment variable $NED_ROOT_DIR
      accordingly and configure a device instance.

   2. Follow the instructions in chapter 1.2 to download the YANG models matching the configured
      device.

   3. Follow the instructions in chapter 1.3 to rebuild the NED.

      #### Alternative 1: Use the built-in rpc to rebuild with custom NED-ID

      Use any combination of the additional *ned-id* arguments *major, minor* and *suffix*

      Two examples showing NED-ID adapted for "device version" 21.6:

      ```
      admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package ned-id suffix -21.6
      ```

      This will generate a NED-ID like: 'nokia-srlinux_gnmi-r21.6-gen-1.0'

      ```
      admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package ned-id major 21 minor 6
      ```

      This will generate a NED-ID like: 'nokia-srlinux_gnmi-gen-21.6'

      #### Alternative 2: Rebuild the NED using gnu make from a shell

      Add any combination of the additional make variables 'NED_ID_SUFFIX','NED_ID_MAJOR' and 'NED_ID_MINOR' to the command line.

      Two examples showing NED-ID adapted for "device version" 21.6:

      ```
      > make NED_ID_SUFFIX=-r21.6 clean all
      ```

      This will generate a NED-ID like: 'nokia-srlinux_gnmi-r21.6-gen-1.0'

      ```
      > make NED_ID_MAJOR=21 NED_ID_MINOR=6 clean all
      ```

      This will generate a NED-ID like: 'nokia-srlinux_gnmi-gen-21.6'

   4. Follow the instructions in chapter 1.4 to reload the NED package. The rebuilt NED package
      will now have the NED-ID: `nokia-srlinux_gnmi<NED_ID_SUFFIX>-gen-<NED_ID_MAJOR>.<NED_ID_MINOR>`

      This is detected by NSO and will have the following side effects:

      - The default NED-ID will no longer exist after the packages has been reloaded
         in NSO. Hence, any devices configured with the default NED-ID can no longer exist either.

      - It is recommended to delete all device instances using the default NED-ID before
         reloading the packages in NSO.

      - It is necessary to use 'packages reload force' when reloading the packages in NSO.

   5. Reconfigure the device instance from step #1 in this list. Now use the new NED-ID

   6. Verify functionality by executing a 'sync-from' on the configured device instance.



## 5.2 Exporting the rebuilt NED package

When the NED has been rebuilt with a new NED-ID, it typically needs to be exported as a separate NED package. This new package will then be a ready to use NED containing the raw as well as the customized and compiled versions of the third party YANG models. This package can then be loaded into a new NSO instance etc just like any other NED.

The NED has a built-in tool to make the export procedure easy.  It is implemented as an additional rpc which can be invoked through the NSO CLI or any other northbound NSO interface.

It copies all relevant elements from the "source" directory of rebuilt NED into a tar.gz archive file. The top dir of the archive will be named in accordance with the generated NED-ID, i.e. nokia-srlinux_gnmi<NED_ID_SUFFIX>-gen-<NED_ID_MAJOR>.<NED_ID_MINOR>.

Usage:

```
admin@ncs# devices device dev-1 rpc rpc-export-package export-package
result ok
exported to: /tmp/ncs-6.2.2-nokia-srlinux_gnmi-1.0.2-customized.tar.gz
```

Additional arguments:

```
destination : Destination directory for the exported tar.gz archive file. Default: /tmp
suffix      : Specify a suffix to be appended to the name of the archive file. Default: -customized
```


# 6. YANG fixes applied when rebuilding the NED

Third party YANG files often have errors that can cause problems during compilation and/or at runtime.

Common examples of such are besides pure YANG bugs, also specific NSO incompatible YANG constructs or that the device does not obey the models properly.

The NED build system is instrumented with a set of tools that is able to automatically apply various kinds of fixes to the third party YANG files. These fixes, referred to as YANG recipes, ensure that the YANG files will compile properly when the NED package is being rebuilt. This of course only refers to the YANG file versions that have so far been verified by the Cisco NED team. New build time issues can still occur if the NED is rebuilt with unverified YANG file versions.

**It is encouraged to contact the Cisco NED team on any such issue by opening a support ticket**. See chapter 8 in the README.md for further information.

Below is a description of the YANG recipes currently in use by the nokia-srlinux_gnmi NED.

## 6.1 General

The Nokia SRLinux models are extensively instrumented with the YANG statement *if-feature*. It is intended for adapting the schema based on the SRLinux device type it is used with.

NSO is currently not able to handle the *if-feature* statement properly. Hence, many of these statements are trimmed with YANG recipes when the NED is being rebuilt.

Furthermore the SRLinux models seem to be more strict than the devices using them. Because of this, many *must* expressions are also trimmed when the NED is being rebuilt.

When rebuilding the NED through built-in rebuild tool, there is an additional non default build profile available that trims <u>all</u> *if-feature* statements from <u>all</u> SRLinux YANG files.

Do as follows to rebuild the NED with the *trim-all-if-feature* build profile
```
$ ncs_cli -C -u admin
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package profile trim-all-if-feature
result ok
admin@ncs#
```
## 6.2 Fixes listed by schema paths

Not applicable

## 6.3 Fixes listed by YANG file paths

### srl_nokia-ip-route-tables.yang

```
Path: /#ip-tables-top/#ipv4-unicast/list/key
Fix: Wrong keys specified in the list.
```

### srl_nokia-network-instance.yang

```
Path: /grouping/list/#mpls-forwarding/leaf
Fix: Missing default value injected
```

### srl_nokia-qos.yang

```
Path: /#subinterface-qos/container/#input/container/#dscp-policy
Fix: Missing default value injected
```
```
Path: /#subinterface-qos/container/#input/container/#dot1p-policy
Fix: Missing default value injected
```
```
Path: /#subinterface-qos/container/#input/container/#default-forwarding-class
Fix: Missing default value injected
```
```
Path: /#subinterface-qos/container/#input/container/#default-drop-probability
Fix: Missing default value injected
```
```
Path: /#interface-qos/container
Fix: Removed presence
```
```
Path: /#forwarding-classes-config/container/list/container/#queue
Fix: Removed mandatory
```
```
Path: /#queue-names-config/container/list/#interface-pool
Fix: Removed mandatory
```
```
Path: /#forwarding-classes-config/container/list/#forwarding-class-index
Fix: Removed mandatory
```
```
Path: /#subinterface-qos/container/#input/container/#dscp-policy/type
Fix: Changed type to string
```
```
Path: /#subinterface-qos/container/#input/container/#dot1p-policy/type
Fix: Changed type to string
```
```
Path: /#queue-names-config/container/list/#interface-pool
Fix: Removed mandatory
```

### srl_nokia-acl.yang

```
Path: /#cpm-filter-entry-action-config/container/choice/#accept/container/#policer/type
Fix: Changed type to string
```

### srl_nokia-if-ip.yang

```
Path: /#ipv4-top/container/#admin-state
Fix: Removed must statement
```
```
Path: /#ipv6-top/container/#admin-state
Fix: Removed must statement
```

### srl_nokia-aaa.yang

```
Path: /#aaa-authentication-user-config/#username
Fix: Removed must statement
```
```
Path: /#aaa-servergroup-common-config/#priv-lvl-authorization
Fix: Removed must statement
```

## 6.4 Other fixes

When using the *trim-all-if-feature* build profile, <u>all</u> *if-feature* statements will be trimmed from <u>all</u> YANG files.

### srl_nokia-network-instance.yang

Removed all *must* statements.

### srl_nokia-qos.yang

Removed all *must* statements.

Removed all *if-feature* statements.

### srl_nokia-acl.yang

Removed all *must* statements.

### srl_nokia-acl-qos.yang

Removed all *if-feature* statements.

### srl_nokia-platform-tcam.yang

Removed all *if-feature* statements.

### srl_nokia-interfaces.yang

Removed all *must* statements.

### srl_nokia-mpls-route-tables.yang

Fixed duplicate import issue.

### srl_nokia-interfaces-bridge-table-statistics.yang

Fixed bad prefix declaration.


# 7. Advanced: repairing YANG modules

-------------------------------------

Many third party YANG models are plagued with issues preventing them from being compiled and/or used with NSO. They simply need to be repaired.

This NED package has been verified to work with device models and YANG model revisions listed in the README.md. Any issues that were discovered
in the listed revisions have been fixed, and the fixes are already included in the package.

However, there is always a risk that new problems related to the YANG models will emerge. For example, if the NED is used together with YANG models that have not been verified by the Cisco NED team. Another example could be if the NED is used in a new use case that has not previously been verified.

If this happens, new YANG repair might be necessary.

**<u>It is encouraged to contact the Cisco NED team for help in any such matter.</u>**

Create a support case with a description of the issue and the use case.  Follow the instructions in the README.md.

There is of course also a do it yourself option. This is mainly for the advanced user though. Good knowledge about the YANG modelling language is required. The NED is bundled with a set of tools to help automating YANG repair. This chapter is intended to give an overview of how to use them.



## 7.1 Different kinds of YANG related issues

When preparing the YANG modules for use with NSO, we can classify the kind issues found in the YANG modules as either to be of compile-time, or run-time character.

With compile-time we mean an issue which needs to be fixed to be able to at all compile and load the YANG into NSO, whereas a run-time issue is anything that needs to be addressed after the YANG is successfully compiled (e.g. invalid constraints which are not met by actual device).



## 7.2 Compile-time issues

---------------------------

The first step before using the YANG modules in NSO is to make sure they can be compiled properly. For convenience, most standard issues found in YANG are by default automatically patched when compiling the package, in which case the resulting files will be found in *src/tmp-yang* (NOTE: the original YANG-files in src/yang are not modified).

This is controlled by the make variable AUTOPATCH_YANG_NED. Usually it is enabled already in the NED make file *$NED_ROOT_DIR/src/Makefile*, like below:

```
AUTOPATCH_YANG_NED ?= yes
```

The auto patcher feature does only fix the most standard issues.

If the YANG compilation still fails, like in the example below, further actions are necessary:

```
> cd $NED_ROOT_DIR/src
> make clean all
augmented/openconfig-network-instance@2022-07-04.yang:2876: error: the node 'protocol' from module 'openconfig-network-instance' (in node 'config' in module 'openconfig-network-instance' from 'openconfig-network-instance') is not found
augmented/openconfig-rib-bgp-attributes.yang:2284: error: the node 'endpoint' from module 'openconfig-network-instance' (in node 'state' in module 'openconfig-network-instance' from 'openconfig-network-instance') is not found
augmented/openconfig-rib-bgp-attributes.yang:2309: error: the node 'instance-id' from module 'openconfig-network-instance' (in node 'state' in module 'openconfig-network-instance' from 'openconfig-network-instance') is not found
```



<u>Always try to avoid modifying the original files in *src/yang*.</u> Instead use the available tools to do the patching at compile-time, with the results ending up in *src/tmp-yang* where the make process always places the actual files currently in use.

The NED is bundled with three different YANG pre-processor tools that can be used to patch the YANG files at compile-time:

- schypp

- jypp

- ypp



### 7.2.1 The schypp tool

This is the schema aware YANG pre-processor tool. It is automatically invoked at compile-time and reads directives from the file *$NED_ROOT_DIR/src/customize-schema.schypp*.

Each line in this file contains one directive, starting with one of the keywords add, remove, replace, or inline-type. This keyword is followed by the globally unique schema-path for the node to 'operate' on. No line breaks allowed.

If prefix is needed for a non-unique name in the path, the prefix must be the same as declared by the module. Depending on the type of operation the schema-path shall be followed by '::' (i.e. two colons) followed by further arguments as needed. The details for each type is described below.

The following directives are supported:

- inline-type
- add
- delete
- replace



#### The inline-type

This is applicable for leafs of type leafref. The tool looks up the type of the referred leaf and inlines the same type on the referee.

Very useful for all kinds of YANG issues related to leafrefs etc.

Syntax:

```
inline-type <schema-path>
```

Example:

```
inline-type /oc-netinst:network-instances/network-instance/protocols/protocol/name
```



#### The add

For adding YANG statements to the schema.

Syntax:

```
add <schema-path>::<YANG-stmt(s)|@filename>
```

Example:

```
add /configuration/protocols/l2circuit/neighbor::uses apply-advanced;
add /configuration/protocols/l2circuit/neighbor/interface::{ min-elements 1; max-elements 10; }
add /configuration/protocols/l2circuit/neighbor::@file-with-YANG-snippet
```



#### The remove

For removing YANG statement from the schema.

Syntax:

```
remove <schema-path>::<stmt-match>
```

Example:

```
remove /configuration/routing-instances/instance/protocols/vpls/mesh-group/neighbor/vpls-id-list::ordered-by
remove /oc-acl:acl/acl-sets/acl-set/acl-entries/acl-entry/actions/config/forwarding-action::mandatory
```



#### The replace

For replacing YANG statements in the schema. In this case the matching statement (must be unique match) is replaced by the
given statement(s), same rules for stmt-match and YANG-stmt(s) as for
add/remove.

```
replace <schema-path>::<stmt-match>::<YANG-stmt(s)>
```



### 7.2.2 The jypp tool

This tool is implemented in Java. Hence its name. Everything you can do with the schypp tool can also be done with this tool. The big difference is that it is YANG model aware instead of schema aware. It needs a "path" in the YANG model file to the node/area to operate on.

To find out the path, do as follows:

1. Find out the name of the file that contains the declaration of the node to operate on.
2. Open the file and search for the node to operate on.
3. Run the jypp tool from a shell like below:

```
> cd $NED_ROOT_DIR/src
> ./tools/jypp --print-path=<file number> tmp-yang/<name of model>.yang
```

Example:

The range for MPLS label values, specified in the file openconfig-mpls-types.yang line 278, needs to be modified.

```
typedef mpls-label {
   type union {
     type uint32 {
       range 13..1048575;
     }
 ..
 ..
```

Run the tool to find out the YANG path to it:

```
> ./tools/jypp --print-path=280 tmp-yang/openconfig-mpls-types.yang
openconfig-mpls-types.yang:280 /#mpls-label/type/#uint32/range
```

The path is: /#mpls-label/type/#uint32/range



With a correct path following operations are supported by the jypp tool:

- --add-stmt
- --remove-stmt
- -- remove-all
- --replace-stmt

#### The --add-stmt

Add extra statement to the node identified by the YANG path

Syntax:

```
> ./tools/jypp --add-stmt=<YANG path>::<statement to add> <file to modify>
```

Example:

```
> ./tools/jypp --add-stmt=/#mpls-label/type/#uint32::description "This is an addition"; tmp-yang/openconfig-mpls-types.yang
```

#### The --remove-stmt

Remove a statement identified by the YANG path.

Syntax:

```
> ./tools/jypp --remove-stmt=<YANG path> <file to modify>
```

Example:

```
> ./tools/jypp --remove-stmt=/#mpls-label/type/#uint32 tmp-yang/openconfig-mpls-types.yang
```

#### The --replace-stmt

Replace a statement on the node identified by the YANG path.

Syntax:

```
> ./tools/jypp --replace-stmt=<YANG path>::<statement to replace> <file to modify>
```

Example:

```
> ./tools/jypp --replace-stmt==/#mpls-label/type/#uint32/range::"range 13..1048575;" tmp-yang/openconfig-mpls-types.yang
```



Test executing the new jypp rules from a shell and verify that the corresponding files in *tmp-yang* have been modified accordingly. When you have a set of jypp rules that works, it is time to install them into the make machinery. This ensures that they are automatically applied every time the NED package is re-built.

Open the file *$NED_ROOT_DIR/src/ned-custom.mk*. Scroll to the make target *do-profile-defaul*t and add the new jypp rules to it.

Example:

```
do-profile-default:
   ./tools/jypp --replace-stmt=/#mpls-label/type/#uint32/range::"range 13..1048575;" \
   'tmp-yang/openconfig-mpls-types.yang' &> /dev/null || true
.PHONY: do-profile-default
```



### 7.2.3 The ypp tool

This is the oldest of the three YANG pre-processor tools. It is a pattern match oriented text processing utility. The patterns are made of regular expressions. The ypp tool is basically like an advanced *sed*. Everything you can do with schypp and jypp can also be done with ypp. In most cases schypp and jypp are superior and more easy to use. However, sometimes the ypp tool is the only possible option.

Syntax:

```
./tools/ypp --from=<regular expression> --to=<replacement containing text and/or matched groups> <file>
```

Example:

```
./tools/ypp --from="(list\s+route\s+[^;]+)(route-type)([^;]+;)" --to="\g<1>\g<3>" 'tmp-yang/srl-ip-route-tables.yang'
./tools/ypp --from="(leaf\s+(dot1p-policy)\s+{[^}]+)(type\s+leafref[^}]+})" --to="\g<1>type string;" 'tmp-yang/srl-qos.yang'
```

Test executing the new ypp rules from a shell and verify that the corresponding files in *tmp-yang* have been modified accordingly. When you have a set of ypp rules that works, it is time to install them into the make machinery. This ensures that they are automatically applied every time the NED package is re-built.

Open the file *$NED_ROOT_DIR/src/ned-custom.mk*. Scroll to the make target *do-profile-defaul*t and add the new jypp rules to it.

Example:

```
do-profile-default:
   ./tools/ypp --from="(list\s+route\s+[^;]+)(route-type)([^;]+;)" --to="\g<1>\g<3>" 'tmp-yang/srl-ip-route-tables.yang'
.PHONY: do-profile-default
```



### 7.2.4 Verify the YANG repair

There is a separate make target to only do the 'pre-processing' of the YANG modules, i.e. automatic patching and application of 'local' schema customizations, it is run like this:

```
> cd $NED_ROOT_DIR/src
> make prepare-yang
```

When run, one can immediately see the resulting YANG modules in the directory *src/tmp-yang*  (i.e. this is what will be used by the NED at run-time).

## 7.3 Run-time issues

----------------------

After all YANG modules can be compiled and loaded into NSO, there might still be issues which are only discovered at run-time. These might be constraints that are present in the YANG module but which are not strictly met by the device, such as integer value ranges or leafref targets. These kind of issues need to be investigated with real config from the device, hence a NED instance needs to be able to connect to device and do a full sync-from.

For example, if the device returns config containing a leaf of type leafref whose target is missing, when doing a full sync-from, NSO might say something like:

```
admin@ncs# devices device dev-1 sync-from
result false
info illegal reference devices device dev-1 config components component 0/0 subcomponents subcomponent 0/0-Virtual-Motherboard name
```

This indicates that the device is not fully compliant with the YANG models it is using. Hence, the YANG needs further repair.

Use the same toolkit as described in 6.2 to fix run-time issues.

The issue described above can for example be repaired with an additional schypp statement:

```
inline-type /components/component/subcomponents/subcomponent/name
```

# 8. Advanced: build methods using scope filtering

This chapter is intended for the advanced user. It describes some additional tools and methods to be used for scope limiting, i.e to reduce the number of YANG models to include. Scope filtering can be done both in run time and at build time.

In most cases it is preferred to do at build time, for the following reasons:

- Build time will be shortened when the number of YANG models is limited
- NSO footprint is reduced

## 8.1 Rules of thumb when selecting the scope

When selecting what third party YANG models to include in the NED package the following recommendations should be considered:

- Avoid mixing model "flavours", for example openconfig models with native models.

  Many devices can be configured through both native models as well as standard models such as openconfig. They are however often overlapping, i.e operating on the same configuration in the device.

  This means that a if node A is configured through the native models, it usually results in the corresponding node B in the openconfig models can be read back with the value set through A.

  The NSO has no awareness for this. It regards node A and B as separate individual nodes.

  If the models for both nodes are included in the NED package and then node A is deployed through NSO the result will be that NSO is immediately out of sync with the device. A compare-config will show a diff telling the node B is also set.

  This problem is referred to as aliasing. It is almost guaranteed to happen if model flavours are mixed.

- Avoid including models that will never be used.

  The more models included the bigger the foot print used by NSO and NED. Furthermore, sync-from performance can decrease with the number of models. In particular this applies to devices not capable of returning all config in one get operation. The Nokia SRLinux is however not affected by this limitation (not later versions at least).

  In this case the NED needs to do one separate fetch for each top node in the schema. One top node does typically map to one model.



## 8.2 Doing build-time scope filtering

The process of doing scope filtering will be shown using an example. The target device is a Nokia SRLinux device running version . This device supports about 184 YANG models of the flavours native and openconfig.

The NED package is assumed to be freshly installed into a NSO installation, i.e no third party YANG models are not yet included.

The snippet below shows the use case in XML format that will be used throughout this example. It is a super simple config, setting up a sub interface and assigning an address to it. It is good enough to illustrate the concept of build time filtering.

It will be referred to as */tmp/use-cases/example.xml* throughout the example.

```
<config xmlns="http://tail-f.com/ns/config/1.0">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>dev-1</name>
      <config>
        <interface xmlns="urn:srl_nokia/interfaces">
          <name>ethernet-1/5</name>
          <subinterface>
            <index>1</index>
            <admin-state>enable</admin-state>
            <ipv4>
              <address>
                <ip-prefix>1.2.3.1/24</ip-prefix>
                <primary/>
              </address>
            </ipv4>
          </subinterface>
        </interface>
      </config>
    </device>
  </devices>
</config>
```

### Download the models

To start with the third party YANG models must be downloaded. We will download all models supported by the Nokia SRLinux device.

Download the models using the built-in tool with the profile *all*

```
admin@ncs# devices device dev-1 rpc rpc-get-modules get-modules profile srlinux-all-from-device
..
..
fetched and saved 184 yang module(s) to /Users/jrendel/work/ned/nokia-srlinux_gnmi/test/drned/drned-ncs/packages/nokia-srlinux_gnmi/src/yang
```

### Rebuild and reload the NED package using a limited scope

In this example the NED will be rebuilt with only the models relevant for the use case. This will limit the scope from 184 YANG models to just 7 models.

Rebuild the NED package using the built-in tool:

```
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { scope { dir /tmp/use-cases } }
result ok
admin@ncs# packages reload
reload-result {
    package nokia-srlinux_gnmi-gen-1.1
    result true
}
```

Finish with a sync-from:

```
admin@ncs# devices device dev-1 sync-from
result true
```

Verify the limited scope by listing supported models:

```
admin@ncs# show devices device dev-1 module
NAME                                  REVISION    FEATURE  DEVIATION
----------------------------------------------------------------------
srl_nokia-if-ip                       2023-07-31  -        -
srl_nokia-if-mpls                     2021-06-30  -        -
srl_nokia-interfaces                  2023-10-31  -        -
srl_nokia-interfaces-bridge-table     2021-06-30  -        -
srl_nokia-platform                    2023-10-31  -        -
srl_nokia-platform-lc                 2023-07-31  -        -
srl_nokia-platform-pipeline-counters  2022-11-30  -        -
tailf-internal-rpcs                   2023-12-20  -        -
tailf-ned-nokia-srlinux_gnmi-stats    2024-01-16  -        -
```



### Apply use case and do compare-config, first try

Now do apply the use case */tmp/use-cases/example.xml*.

It is a good idea to keep track of the commit id. For instance by using a label:

```
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# load merge /tmp/use-cases/example.xml
Loading.
10.01 KiB parsed in 0.03 sec (294.96 KiB/sec)
admin@ncs(config)# commit label MY_USE_CASE
Commit complete.
admin@ncs(config)# abort
```

Do a compare-config:

```
admin@ncs(config)# devices device dev-1 compare-config
diff
 devices {
     device dev-1 {
         config {
             interface ethernet-1/5 {
                 subinterface 1 {
+                    type routed;
+                    ip-mtu 1500;
                 }
             }
         }
     }
 }
```

There is a diff showing.  Analysing the diff further shows that the device has set some additional nodes. This is very common and is referred to as *auto-config*.

The auto-config diff consists of nodes that are within the configured scope. Hence it is not possible limit the scope further.

In many cases this kind of problem can be solved, simply by adding the additional nodes to the use case. By doing so the nodes will be set in NSO as well and the result will be that NSO is in sync with the device.

When adjusting the use case for this it is important to verify that the extra config can be both deployed and deleted again.

If it is not possible to adjust the use case, there is one more option to try: rebuild the NED package with an *auto-config* filter.

To do this, the use case shall be kept deployed on the device. I.e do not do a rollback of it yet.

### Prepare an auto-config filter

When rebuilding the NED with an auto-config filter, the nodes pointed out by the filter are simply removed from the schema. The NED build tools creates a deviation file containing the nodes of concern. The NED is then rebuilt with the deviation file included.

The NED build tools need two files to be able to analyse the state and generate a proper deviation file if it is possible. The *before.xml* and the *after.xml* files.

The *before.xml* is a snapshot of the running config when the use case has been deployed.

Do as follows to generate the *before.xml* (assuming the use case is deployed already) and store it in the directory */tmp/auto-config*:

```
admin@ncs# show running-config devices device dev-1 config | display xml | save /tmp/auto-config/before.xml
admin@ncs#
```

The *after.xml* is a snapshot of the running config after the first subsequent sync-from. This sync-from makes diffing nodes be synced in to NSO/CDB.

```
admin@ncs# devices device dev-1 sync-from
result true
admin@ncs# show running-config devices device dev-1 config | display xml | save /tmp/auto-config/after.xml
admin@ncs#
```

Now restore the device to a clean state, i.e remove config related to the use case. This is when the commit label can be useful

```
admin@ncs(config)# rollback configuration 100<TAB>
Possible completions:
  10001   2024-01-17 15:10:42 by system via system
  ..
  ..
  10021   2024-01-18 10:10:01 by admin via cli label MY_USE_CASE
  10022   2024-01-18 10:50:49 by admin via cli
  <cr>    latest
admin@ncs(config)# rollback configuration 10021
admin@ncs(config)# commit
Commit complete.
admin@ncs(config)# abort
```

Note: it is not always possible to create a proper auto-config filter. For instance if there is an overlap between the nodes to be removed and the nodes to be deployed by the use case. Hence, auto-config filter should always be seen as a best effort approach.

### Rebuild with both scope filter and auto-config filter

Rebuild the NED with both a scope filter and an auto-config filter:

```
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { scope { dir /tmp/use-cases } auto-config { dir /tmp/auto-config }}
result ok
```

Finally, reload the NED package again:

```
admin@ncs# packages reload

>>> System upgrade is starting.
>>> Sessions in configure mode must exit to operational mode.
>>> No configuration changes can be performed until upgrade has completed.
>>> System upgrade has completed successfully.
reload-result {
    package nokia-srlinux_gnmi-gen-1.1
    result true
}
```

### Apply use case and do compare-config, second try

Apply the use case for the third time:

```
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# load merge /tmp/use-cases/example.xml
Loading.
10.01 KiB parsed in 0.03 sec (294.96 KiB/sec)
admin@ncs(config)# commit label MY_USE_CASE
Commit complete.
admin@ncs(config)# abort
```

Then do a compare-config again:

```
admin@ncs# devices device dev-1 compare-config
admin@ncs#
```

No diff is shown anymore. This indicates that NSO now is fully in sync with the device after deploying the use case.



## 8.3 Doing run-time scope filtering

This alternative scope filtering method works even when the NED package itself has all available models built-in.

The obvious drawback is that not much footprint reduction is achieved. However, the sync-from performance can increase significantly increase.

The method depends on the fact that the NED can be configured to filter the capability reported by the device before it is relayed to NSO. Doing so will make only the reported models available in the device instance in NSO. This can for instance be only models necessary for a certain use case.

The following NED settings are used for controlling what models the NED shall report to NSO:
```
admin@ncs(config)# devices device dev-1 ned-settings nokia-srlinux_gnmi general capabilities regex-include ?
Possible completions:
  <pattern:string>
admin@ncs(config)# devices device dev-1 ned-settings nokia-srlinux_gnmi general capabilities regex-exclude ?
Possible completions:
  <pattern:string>
```

Both settings accept multiple entries. Each entry shall be a regular expression matching one or many module names.

Below shows a couple of examples.

#### Include only models relevant for the use case:
```
!Count number of supported models before scope filtering
admin@ncs# show devices device dev-1 module | count
Count: 177 lines

admin@ncs# config
admin@ncs(config)# devices device dev-1 ned-settings nokia-srlinux_gnmi general capabilities regex-include "srl_nokia-interfaces-.*"
admin@ncs(config)# commit
admin@ncs(config)# abort

!Count number of supported models after scope filtering
admin@ncs# devices device dev-1 disconnect
admin@ncs# devices device dev-1 connect
admin@ncs# show devices device dev-1 module | count
Count: 25 lines
```
#### Include only two specific modules:
```
admin@ncs(config)# devices device dev-1 ned-settings nokia-srlinux_gnmi general capabilities regex-include srl_nokia-interfaces
admin@ncs(config)# devices device dev-1 ned-settings nokia-srlinux_gnmi general capabilities regex-include srl_nokia-network-instance
admin@ncs(config)# commit
admin@ncs(config)# abort

!Verify settings
admin@ncs# show running-config devices device dev-1 ned-settings nokia-srlinux_gnmi general capabilities
devices device dev-1
 ned-settings nokia-srlinux_gnmi general capabilities regex-include srl_nokia-interfaces
 ned-settings nokia-srlinux_gnmi general capabilities regex-include srl_nokia-network-instance

!Verify scope
admin@ncs# devices device dev-1 disconnect
admin@ncs# devices device dev-1 connect
admin@ncs# show devices device dev-1 module
NAME                                REVISION    FEATURE  DEVIATION
--------------------------------------------------------------------
srl_nokia-interfaces                2023-10-31  -        -
srl_nokia-network-instance          2023-10-31  -        -
tailf-internal-rpcs                 2023-12-20  -        -
tailf-ned-nokia-srlinux_gnmi-stats  2024-01-16  -        -

admin@ncs#
```

### Tool for determining the scope

The NED package is bundled with the *turboy* tool which can be used to list the YANG modules to include to match a certain scope. The tool takes one or several xml files as input. It analyses the input and then generates a list of the YANG modules involved.

Below shows a couple of examples on how to use the tool

#### Limit the scope to the running config on the device

In the NSO CLI, save the running config to a file in xml format:

```
admin@ncs# show running-config devices device dev-1 config | display xml | save overwrite /tmp/running-config.xml
```

In a separate unix shell, execute the tool with the xml file as in parameter:

```
# cd $NED_ROOT_DIR/src
# ./tools/turboy --silent --plugin=cdb-data --list-yang-files yang --yang-path=. --read=/tmp/running-  ietf-yang-types.yang
  srl_nokia-bridge-table-mac-duplication.yang
  srl_nokia-bridge-table-mac-learning.yang
  srl_nokia-bridge-table-mac-limit.yang
  srl_nokia-bridge-table-shg.yang
  srl_nokia-bridge-table.yang
  srl_nokia-common.yang
  srl_nokia-connection-point.yang
  srl_nokia-extensions.yang
  srl_nokia-features.yang
  srl_nokia-icmp.yang
  srl_nokia-if-ip.yang
  srl_nokia-if-mpls.yang
  srl_nokia-interfaces-bridge-table.yang
  srl_nokia-interfaces-ip-dhcp.yang
  srl_nokia-interfaces-l2cp.yang
  srl_nokia-interfaces-lag.yang
  srl_nokia-interfaces-nbr.yang
  srl_nokia-interfaces-vlans.yang
  srl_nokia-interfaces.yang
  srl_nokia-lacp.yang
  srl_nokia-lldp-types.yang
  srl_nokia-lldp.yang
  srl_nokia-network-instance.yang
  srl_nokia-openconfig.yang
  srl_nokia-ospf-types.yang
  srl_nokia-platform-lc.yang
  srl_nokia-platform-pipeline-counters.yang
  srl_nokia-platform.yang
  srl_nokia-policy-types.yang
  srl_nokia-qos-policers.yang
  srl_nokia-qos.yang
  srl_nokia-routing-policy.yang
  srl_nokia-system.yang
```

In the NSO CLI, update the scope filtering NED settings accordingly:

```
admin@ncs# config
admin@ncs(config)# devices device dev-1 ned-settings nokia-srlinux_gnmi general capabilities regex-include "<a suitable pattern>"
```



#### Limit the scope to a specific use case

Save the config that is going to be deployed in the use case as a file in xml format.

In this example the file is stored in : */tmp/use-case/example.xml*

In a separate unix shell, execute the tool with the xml file as a parameter:

```
# cd $NED_ROOT_DIR/src
# ./tools/turboy --silent --plugin=cdb-data --list-yang-files yang --yang-path=. --read=/tmp/use-case/example.xml
  srl_nokia-common.yang
  srl_nokia-extensions.yang
  srl_nokia-features.yang
  srl_nokia-if-ip.yang
  srl_nokia-if-mpls.yang
  srl_nokia-interfaces-bridge-table.yang
  srl_nokia-interfaces.yang
  srl_nokia-platform-lc.yang
  srl_nokia-platform-pipeline-counters.yang
  srl_nokia-platform.yang

```

In the NSO CLI, update the scope filtering NED settings accordingly:

```
admin@ncs# config
admin@ncs(config)# devices device dev-1 ned-settings nokia-srlinux_gnmi general capabilities regex-include "<a suitable pattern>"
```
# 9. Advanced: build methods using schema trimming

The scope filtering techniques described in the previous chapter do work by only including the YANG files with XML name spaces required to cover a certain scope. This works well for YANG bundles that are properly partitioned into many different name spaces, for example the Nokia SRLinux YANG models.

Scope filtering can however not be used to remove only parts of the schema that reside in a certain name space.

To do that you can use an alternative method called *schema trimming*.

The schema trimming technique works by using the YANG *deviate* statement to remove any part of the schema and resolve any dependencies to the removed parts.  This can be anything from a certain leaf up to a subtree. This method works regardless of any name spaces.

Schema trimming will just like scope filtering reduce the memory footprint when the models have been loaded into NSO. It usually does not have any impact on the compile time, since all models are being processed before the schema trimming takes place.

## 9.1 Using the NED rebuild tool with schema trimming

The built-in NED rebuild tool has full support for doing schema trimming in an automatic way. The tool analyses the YANG models and creates a temporary YANG file containing *deviate* directives to remove all the nodes that shall be trimmed.

Furthermore the tool scans through the whole schema to find references to the nodes to be removed.  This typically means nodes of type *leafref* referring to a node to be deleted or to one of its subsides.  Any reference found will result in a new *deviate* directive where the *leafref* type is replaced by instead inlining the referred type.

### Example

Note: we will use the additional build-time profile *trim-all-if-feature* throughout the example. The reason for this is that the NSO YANG compiler does have issues related to the YANG *if-feature* statement. Since the Nokia SRLinux YANG models are extensively instrumented with *if-feature* statements it can cause unpredictable build time issues when trimming nodes from the schema.

The example presumes the NED package has already been rebuilt and reloaded with the full Nokia SRLinux schema.

Now assume you want to trim the following schema sub trees, since they will not be used in your use case:

```
/srl_nokia-acl:acl/policers/policer
/srl_nokia-qos:qos/forwarding-classes
```

Enter the NSO CLI

```
$ ncs_cli -C -u admin
```

 Check that the nodes to be trimmed are defined, i.e accessible through the CLI:

```
admin@ncs# show running-config devices device dev-1 config acl policers policer
% No entries found.
admin@ncs# show running-config devices device dev-1 config qos forwarding-classes
% No entries found.
```

Now rebuild the NED package using a schema trimming filter (and build profile *trim-all-if-feature*):

```
$ ncs_cli -C -u admin
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { trim-schema { nodes [ /srl_nokia-acl:acl/policers/policer /srl_nokia-qos:qos/forwarding-classes ] } } profile trim-all-if-feature
result ok
admin@ncs#
```

Reload the NED package:

```
admin@ncs# packages reload
reload-result {
    package nokia-srlinux_gnmi-gen-1.2
    result true
}
admin@ncs#
```

Finally verify that the nodes have been properly trimmed from the schema. I.e use the same tab completion trick as before:

```
admin@ncs# show running-config devices device dev-1 config acl policers policer
                                                                                  ^
% Invalid input detected at '^' marker.
admin@ncs# show running-config devices device dev-1 config qos forwarding-class                                                                                              ^
% Invalid input detected at '^' marker.
```

Let's take a look under the hood to see how the schema trimming was accomplished

Exit the NSO CLI and check for a file named *nedcom-trim-deviations.yang* in the build environment of the NED package:

```
admin@ncs# exit
# cd $NED_ROOT_DIR/src
# cat tmp-yang/config/nedcom-trim-deviations.yang
```

This will display the file containing the *deviate* directives:

```
module nedcom-trim-deviations {
  yang-version 1.1;
  namespace urn:tail-f.com:nedcom-trim-deviations;
  prefix nedcom-trim-deviations;
  import srl_nokia-oam-pm-ip {
    prefix srl_nokia-oam-pm-ip;
  }
  import srl_nokia-acl-policers {
    prefix srl_nokia-acl-policers;
  }
  import srl_nokia-acl-qos {
    prefix srl_nokia-acl-qos;
  }
  import srl_nokia-qos {
    prefix srl_nokia-qos;
  }
  import srl_nokia-oam {
    prefix srl_nokia-oam;
  }
  import srl_nokia-link-measurement {
    prefix srl_nokia-link-measurement;
  }
  import srl_nokia-acl {
    prefix srl_nokia-acl;
  }
  revision 2024-07-04 {
    description "Automatic deviations generated from exclude filter";
  }
  deviation /srl_nokia-acl:acl/srl_nokia-acl:policers/srl_nokia-acl:policer {
    deviate not-supported;
  }
  deviation /srl_nokia-qos:qos/srl_nokia-qos:forwarding-classes {
    deviate not-supported;
  }
  deviation /srl_nokia-acl:acl/srl_nokia-acl:acl-filter/srl_nokia-acl:entry/srl_nokia-acl:action/srl_nokia-acl:action/srl_nokia-acl:accept/srl_nokia-acl:accept/srl_nokia-acl:rate-limit/srl_nokia-acl:policer {
    deviate replace {
      type string {
        pattern "[A-Za-z0-9!@#$%^&()|+=`~.,'/_:;?-][A-Za-z0-9 !@#$%^&()|+=`~.,'/_:;?-]*";
      }
    }
  }
  deviation /srl_nokia-oam:oam/srl_nokia-link-measurement:link-measurement/srl_nokia-link-measurement:measurement-template/srl_nokia-link-measurement:stamp/srl_nokia-link-measurement:forwarding-class {
    deviate replace {
      type string {
        pattern "[A-Za-z0-9!@#$%^&()|+=`~.,'/_:;?-][A-Za-z0-9 !@#$%^&()|+=`~.,'/_:;?-]*";
      }
    }
  }
  deviation /srl_nokia-oam:oam/srl_nokia-oam:performance-monitoring/srl_nokia-oam-pm-ip:ip/srl_nokia-oam-pm-ip:session/srl_nokia-oam-pm-ip:forwarding-class {
    deviate replace {
      type string {
        pattern "[A-Za-z0-9!@#$%^&()|+=`~.,'/_:;?-][A-Za-z0-9 !@#$%^&()|+=`~.,'/_:;?-]*";
      }
    }
  }
..
..
..
```
