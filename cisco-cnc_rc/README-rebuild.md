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
```


# 1. General
------------

## 1.1 Overview

The cisco-cnc_rc NED is delivered without any YANG models in the package.

The models do need to be downloaded, followed by a rebuild and reload of the package before the NED can be fully operational.

This NED contains an optional built-in tool that makes downloading of the device models easy.

Alternatively, manual download is possible as described in chapter 4.

The NED package (i.e with no device models) must first be properly configured in a running NSO environment prior to usage of the downloader tool. The steps described in chapter 1.1 through 1.3 in the README.md must be done prior to this step.

## 1.2 Using the built-in tool for simple YANG download

The downloader tool is implemented as an NSO RPC which can be invoked for instance from the NSO CLI.

When the tool is executed the NED will automatically connect to the device for which the YANG models shall be downloaded. The device will be requested to return a list of supported models when the NED is probing it for capabilities.

This list of models will be the base used by the tool when downloading the models. During operation the tool will also scan each downloaded YANG file for additional dependencies through import/include found. The tool will try to download all such dependency YANG files as well.

  This NED will by default download the YANG models directly from the CNC device it is connected to. This is done using the RESTCONF protocol.

### Simple Usage

  The downloader tool is pre-configured with 2 different profiles:

  ```
  l2-l3-vpn                    : Downloading the ietf-l2-vpn-ntw + ietf-l3-vpn-ntw together
                                 with deviations and dependencies.
  l2-l3-vpn-without-deviations : Downloading the ietf-l2-vpn-ntw + ietf-l3-vpn-ntw together
                                 with dependencies but without any deviations
  ```

  Do as follows in the NSO CLI to download the files using the profile l2-l3-vp:

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules profile l2-l3-vpn
  ```

  To override the default version to download, do as follows:

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules profile l2-l3-vpn remote { git { checkout <selected version> } }
  ```

  To use an archive file as download source:

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules profile l2-l3-vpn remote { archive <path to archive file> }
  ```

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
  # devices device dev-1 rpc rpc-list-modules list-modules module-include-regex (ietf-l(2|3)vpn-ntw(-deviations)?|tailf-ncs-plan)
  ```

  Now use the argument 'module-exclude-regex' to exclude some of the files matching the 'module-include-regex':

  ```
  # devices device dev-1 rpc rpc-list-modules list-modules module-exclude-regex ((tailf-(ncs|common|customers|kicker))|lsa-utils|custom-template-hook|resource-allocator|id-allocator|ietf-netconf-acm|ietf-subscribed-notifications)
  ```

  When the 'list-modules' rpc returns only the models of interest you can use the same arguments for the 'get-modules' rpc.

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules module-include-regex (ietf-l(2|3)vpn-ntw(-deviations)?|tailf-ncs-plan) module-exclude-regex ((tailf-(ncs|common|customers|kicker))|lsa-utils|custom-template-hook|resource-allocator|id-allocator|ietf-netconf-acm|ietf-subscribed-notifications) <additional arguments>
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
tailf-ned-cisco-cnc_rc-meta.yang
tailf-ned-cisco-cnc_rc-meta-custom.yang
tailf-ned-cisco-cnc_rc-oper.yang
tailf-ned-cisco-cnc_rc-stats.yang
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

The default NED-ID is: cisco-cnc_rc-gen-1.0


## 5.1 Rebuild with a custom NED-ID

Do as follows to build each flavour of the cisco-cnc_rc NED. Do it in iterations, one at the time:

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

      This will generate a NED-ID like: 'cisco-cnc_rc-r21.6-gen-1.0'

      ```
      admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package ned-id major 21 minor 6
      ```

      This will generate a NED-ID like: 'cisco-cnc_rc-gen-21.6'

      #### Alternative 2: Rebuild the NED using gnu make from a shell

      Add any combination of the additional make variables 'NED_ID_SUFFIX','NED_ID_MAJOR' and 'NED_ID_MINOR' to the command line.

      Two examples showing NED-ID adapted for "device version" 21.6:

      ```
      > make NED_ID_SUFFIX=-r21.6 clean all
      ```

      This will generate a NED-ID like: 'cisco-cnc_rc-r21.6-gen-1.0'

      ```
      > make NED_ID_MAJOR=21 NED_ID_MINOR=6 clean all
      ```

      This will generate a NED-ID like: 'cisco-cnc_rc-gen-21.6'

   4. Follow the instructions in chapter 1.4 to reload the NED package. The rebuilt NED package
      will now have the NED-ID: `cisco-cnc_rc<NED_ID_SUFFIX>-gen-<NED_ID_MAJOR>.<NED_ID_MINOR>`

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

It copies all relevant elements from the "source" directory of rebuilt NED into a tar.gz archive file. The top dir of the archive will be named in accordance with the generated NED-ID, i.e. cisco-cnc_rc<NED_ID_SUFFIX>-gen-<NED_ID_MAJOR>.<NED_ID_MINOR>.

Usage:

```
admin@ncs# devices device dev-1 rpc rpc-export-package export-package
result ok
exported to: /tmp/ncs-6.2.2-cisco-cnc_rc-1.0.2-customized.tar.gz
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

Below is a description of the YANG recipes currently in use by the cisco-cnc_rc NED.

## 6.1 General

The YANG fixes done by this NED are all related to making the *ietf-l2-vpn-ntw* and *ietf-l3-vpn-ntw* buildable as device models. These models are originally service models which means they contains a lot of service annotation etc. All such annotations have to be trimmed from the models before they can be build as device models and used by this NED.

## 6.2 Fixes listed by schema paths

Not applicable

## 6.3 Fixes listed by YANG file paths

### cisco-l2vpn-ntw.yang
```
Path: /augment#.l2vpn-ntw:l2vpn-ntw.l2vpn-ntw:vpn-services.l2vpn-ntw:vpn-service.l2vpn-ntw:vpn-nodes.l2vpn-ntw:vpn-node.l2vpn-ntw:signaling-option.l2vpn-ntw:signaling-option.l2vpn-ntw:bgp.l2vpn-ntw:bgp-type.l2vpn-ntw:evpn-bgp.l2vpn-ntw:evpn-policie
Fix: removed
```
```
Path: /augment#.l2vpn-ntw:l2vpn-ntw.l2vpn-ntw:vpn-services.l2vpn-ntw:vpn-service.l2vpn-ntw:vpn-nodes.l2vpn-ntw:vpn-node
Fix: removed
```
```
Path: /augment#.l2vpn-ntw:l2vpn-ntw.l2vpn-ntw:vpn-services/list/uses
Fix: removed
```
```
Path: /augment#.l2vpn-ntw:l2vpn-ntw/#id-pools
Fix: removed
```
```
Path: /augment#.l2vpn-ntw:l2vpn-ntw.l2vpn-ntw:vpn-services.l2vpn-ntw:vpn-service/container/#spoke-rt-choice/mandatory
Fix: removed
```

### cisco-tsdn-core-fp-common.yang
```
Path: /#interface-mapping
Fix: removed
```
```
Path: /#status-code-plan-augmentation/list
Fix: removed
```
```
Path: /#commit-queue-recovery-data/#trigger-device-poller/input/leaf/tailf:non-strict-leafref/path
Fix: removed
```

### ietf-l2vpn-ntw-deviations.yang
```
Path: /#.l2vpn-ntw:l2vpn-ntw.l2vpn-ntw:vpn-services.l2vpn-ntw:vpn-service.l2vpn-ntw:vpn-nodes.l2vpn-ntw:vpn-node.l2vpn-ntw:vpn-node-id
Fix: removed
```
```
Path: /#.l2vpn-ntw:l2vpn-ntw.l2vpn-ntw:vpn-services.l2vpn-ntw:vpn-service.l2vpn-ntw:vpn-nodes.l2vpn-ntw:vpn-node.l2vpn-ntw:signaling-option.l2vpn-ntw:signaling-option.l2vpn-ntw:bgp.l2vpn-ntw:bgp-type.l2vpn-ntw:evpn-bgp.l2vpn-ntw:evpn-policies.cisco-l2vpn-ntw:vpn-policies.cisco-l2vpn-ntw:export-polic
Fix: removed
```
```
Path: /#.l2vpn-ntw:l2vpn-ntw.l2vpn-ntw:vpn-services.l2vpn-ntw:vpn-service.l2vpn-ntw:vpn-nodes.l2vpn-ntw:vpn-node.l2vpn-ntw:signaling-option.l2vpn-ntw:signaling-option.l2vpn-ntw:bgp.l2vpn-ntw:bgp-type.l2vpn-ntw:evpn-bgp.l2vpn-ntw:evpn-policies.cisco-l2vpn-ntw:vpn-target.cisco-l2vpn-ntw:route-targets.cisco-l2vpn-ntw:route-target
Fix: removed
```
```
Path: /#.l2vpn-ntw:l2vpn-ntw.l2vpn-ntw:vpn-services.l2vpn-ntw:vpn-service.l2vpn-ntw:vpn-nodes.l2vpn-ntw:vpn-node.l2vpn-ntw:signaling-option.l2vpn-ntw:signaling-option.l2vpn-ntw:bgp.l2vpn-ntw:bgp-type.l2vpn-ntw:evpn-bgp.l2vpn-ntw:evpn-policies.cisco-l2vpn-ntw:vpn-policies.cisco-l2vpn-ntw:import-policy
Fix: removed
```

### ietf-l3vpn-ntw-deviations.yang
```
Path: /#.l3nm:l3vpn-ntw.l3nm:vpn-services.l3nm:vpn-service.l3nm:vpn-nodes.l3nm:vpn-node.l3nm:vpn-node-id
Fix: removed
```

### ietf-subscribed-notifications.yang
```
Path: /#kill-subscription/nacm:default-deny-all
Fix: removed
```

## 6.4 Other fixes

All service related annotations are trimmed from the following YANG files:
```
ietf-l2vpn-ntw.yang
ietf-l3vpn-ntw.yang
cisco-l2vpn-ntw.yang
cisco-tsdn-core-fp-common.yang
cisco-l2vpn-routing-policy.yang
cisco-l3vpn-routing-policy.yang
cisco-mvpn.yang
ietf-l2vpn-ntw-deviations.yang
ietf-l3vpn-ntw-deviations.yang
ietf-vpn-common.yang
ietf-subscribed-notifications.yang
```

A notification YANG file is auto generated when the NED is being rebuilt. The contents of this YANG file is based on *tailf-ncs-plan.yang*.


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
