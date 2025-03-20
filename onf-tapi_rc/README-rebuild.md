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

The onf-tapi_rc NED is delivered without any YANG models in the package.

The models do need to be downloaded, followed by a rebuild and reload of the package before the NED can be fully operational.

This NED contains an optional built-in tool that makes downloading of the device models easy.

Alternatively, manual download is possible as described in chapter 4.

The NED package (i.e with no device models) must first be properly configured in a running NSO environment prior to usage of the downloader tool. The steps described in chapter 1.1 through 1.3 in the README.md must be done prior to this step.

## 1.2 Using the built-in tool for simple YANG download

The downloader tool is implemented as an NSO RPC which can be invoked for instance from the NSO CLI.

When the tool is executed the NED will automatically connect to the device for which the YANG models shall be downloaded. The device will be requested to return a list of supported models when the NED is probing it for capabilities.

This list of models will be the base used by the tool when downloading the models. During operation the tool will also scan each downloaded YANG file for additional dependencies through import/include found. The tool will try to download all such dependency YANG files as well.

  Since currently all TAPI devices tested with this NED do not support direct YANG model download from the device the models need to be fetched from elsewhere.

  By default the ONF TAPI repository on github is used as source for all YANG files.

### Simple Usage

  The downloader tool is pre-configured with three different profiles:

  ```
  onf-tapi-from-device : All ONF TAPI models downloaded directly from the device.
  onf-tapi-from-git    : All ONF TAPI models from the official TAPI github repository
                         The tool does by default download version 2.1.3 of the models.
  onf-tapi             : All ONF TAPI models. Source must be specified explicitly.
  ```

  Do as follows in the NSO CLI to download the files using the profile onf-tapi-from-git:

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules profile onf-tapi-from-git
  ```
  By default the tool will download version v2.1.3 of the TAPI models from the GitHub. This can easily be overridden with some additional arguments. Example below shows how to download version 2.4.0 from the github repository:
  ```
  # devices device dev-1 rpc rpc-get-modules get-modules profile onf-tapi-from-git remote { git { checkout v2.4.0 } }
  ```

  To use an archive file as download source:
  ```
  # devices device dev-1 rpc rpc-get-modules get-modules profile onf-tapi remote  archive <path to archive file> }
  ```
  To use a local directory as download source:
  ```
  # devices device dev-1 rpc rpc-get-modules get-modules profile onf-tapi remote { dir <path to directory> }
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

  Many TAPI enabled devices are not capable of showing the YANG models supported. This is actually a violation of the RESTCONF specification (RFC8040) and makes it impossible for the NED to automatically figure out what TAPI models that are supported.

  If the NED is going to be used with a device that lacks RESTCONF capability support, it is necessary to manually configure the TAPI models of interest.

  This is done through the capability inject NED setting.

  Try to connect to the device:
  ```
  # devices device dev-1 connect
  ```
  Try fetching a list of supported models from the device:
  ```
  # devices device dev-1 rpc rpc-list-modules list-modules
  ```
  A list of supported models shall now be displayed in the NSO CLI.

  If no list is displayed, it indicates the device is not able to show capabilities. Hence the models must be injected by the NED instead.

  There are two alternatives available for modei injection:

  **Alternative 1**
  Inject a TAPI version bundle:
  ```
  # config
  # devices device dev-1 ned-settings onf-tapi_rc general capabilities inject-tapi-version v2.1.3
  ```
  **Alternative 2**
   Inject individual TAPI YANG models:
  ```
   # config
   # devices device dev-1 ned-settings onf-tapi_rc general capabilities inject <name of YANG model 1>
   # devices device dev-1 ned-settings onf-tapi_rc general capabilities inject <name of YANG model 2>
   # commit
  ```

  Example:
  ```
  # devices device dev-1
   # ned-settings onf-tapi_rc general capabilities inject tapi-common
   # ned-settings onf-tapi_rc general capabilities inject tapi-connectivity
   # ned-settings onf-tapi_rc general capabilities inject tapi-dsr
   # ned-settings onf-tapi_rc general capabilities inject tapi-equipment
   # ned-settings onf-tapi_rc general capabilities inject tapi-eth
   # ned-settings onf-tapi_rc general capabilities inject tapi-notification
   # ned-settings onf-tapi_rc general capabilities inject tapi-oam
   # ned-settings onf-tapi_rc general capabilities inject tapi-odu
   # ned-settings onf-tapi_rc general capabilities inject tapi-path-computation
   # ned-settings onf-tapi_rc general capabilities inject tapi-photonic-media
   # ned-settings onf-tapi_rc general capabilities inject tapi-topology
   # ned-settings onf-tapi_rc general capabilities inject tapi-virtual-network
   # commit
  ```
  Any vendor specific YANG models related to TAPI shall also be added to the inject list if they are going to be used. This is done using injection of individual YANG models as shown above.


  Now, try listing the models supported by the device again:

  ```
  # devices device dev-1 rpc rpc-list-modules list-modules
  ```

  Optionally, limit the scope to only include some models, by specifying a simply regular expression for the argument 'module-include-regex':

  ```
  # devices device dev-1 rpc rpc-list-modules list-modules module-include-regex tapi-.*
  ```

  Now use the argument 'module-exclude-regex' to exclude some of the files matching the 'module-include-regex':

  ```
  # devices device dev-1 rpc rpc-list-modules list-modules module-exclude-regex tapi-computation
  ```

  When the 'list-modules' rpc returns only the models of interest you can use the same arguments for the 'get-modules' rpc.

  ```
  # devices device dev-1 rpc rpc-get-modules get-modules module-include-regex tapi-.* module-exclude-regex tapi-computation <additional arguments>
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
tailf-ned-onf-tapi_rc-meta.yang
tailf-ned-onf-tapi_rc-meta-custom.yang
tailf-ned-onf-tapi_rc-oper.yang
tailf-ned-onf-tapi_rc-stats.yang
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

The default NED-ID is: onf-tapi_rc-gen-2.0


## 5.1 Rebuild with a custom NED-ID

Do as follows to build each flavour of the onf-tapi_rc NED. Do it in iterations, one at the time:

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

      This will generate a NED-ID like: 'onf-tapi_rc-r21.6-gen-1.0'

      ```
      admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package ned-id major 21 minor 6
      ```

      This will generate a NED-ID like: 'onf-tapi_rc-gen-21.6'

      #### Alternative 2: Rebuild the NED using gnu make from a shell

      Add any combination of the additional make variables 'NED_ID_SUFFIX','NED_ID_MAJOR' and 'NED_ID_MINOR' to the command line.

      Two examples showing NED-ID adapted for "device version" 21.6:

      ```
      > make NED_ID_SUFFIX=-r21.6 clean all
      ```

      This will generate a NED-ID like: 'onf-tapi_rc-r21.6-gen-1.0'

      ```
      > make NED_ID_MAJOR=21 NED_ID_MINOR=6 clean all
      ```

      This will generate a NED-ID like: 'onf-tapi_rc-gen-21.6'

   4. Follow the instructions in chapter 1.4 to reload the NED package. The rebuilt NED package
      will now have the NED-ID: `onf-tapi_rc<NED_ID_SUFFIX>-gen-<NED_ID_MAJOR>.<NED_ID_MINOR>`

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

It copies all relevant elements from the "source" directory of rebuilt NED into a tar.gz archive file. The top dir of the archive will be named in accordance with the generated NED-ID, i.e. onf-tapi_rc<NED_ID_SUFFIX>-gen-<NED_ID_MAJOR>.<NED_ID_MINOR>.

Usage:

```
admin@ncs# devices device dev-1 rpc rpc-export-package export-package
result ok
exported to: /tmp/ncs-6.2.2-onf-tapi_rc-1.0.2-customized.tar.gz
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

Below is a description of the YANG recipes currently in use by the onf-tapi_rc NED.

## 6.1 General

The YANG fixes done by this NED can be divided into general fixes to the common TAPI models and fixes done to vendor specific augmentation / deviation files.
The later applies to vendor files from Ciena and Kratos.

## 6.2 Fixes listed by schema paths

Not applicable

### tapi-common.yang
```
Path: /container/presence
Fix: removed presence
```

### tapi-oam.yang
```
Path: /#maintenance-entity-ref/leaf/type
Fix: changed type to string
```

### tapi-topology.yang
```
Path: /typedef#protection-type/type
Fix: added extra enum NO_PROTECTION
```

### tapi-dsr.yang
```
Path: /
Fix: Added missing identity declarations
```

### tapi-ciena-connectivity-service-extensions.yang
```
Path: /#.tapi-common:context.tapi-connectivity:connectivity-context.tapi-connectivity:connectivity-service/#center-frequency/type
Fix: changed type to decimal64
```
```
Path: /#.tapi-common:context.tapi-connectivity:connectivity-context.tapi-connectivity:connectivity-service/#deployment-state/type
Fix: added extra enum PROVISIONED
```


## 6.4 Other fixes

Some Ciena specific augmentation / deviation YANG files for TAPI are fixed further, if they are available.
For the TAPI files used by Kratos have been modified in a way that makes then fail to compile.
Hence, some of the Kratos patches are reverted by the NED, if those files are available.


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

This chapter is intended for the more advanced user. It describes some additional tools and methods to be used for scope limiting, i.e to reduce the number of YANG models to include. Scope filtering can be done both in run time and at build time.

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

  The more models included the bigger the foot print used by NSO and NED. Furthermore, sync-from performance can decrease with the number of models. In particular this applies to devices not capable of returning all config in one get operation.

  In this case the NED needs to do one separate fetch for each top node in the schema. One top node does typically map to one model.



## 8.2 Doing build-time scope filtering

The process of doing scope filtering will be shown using an example. The target device is a generic TAPI device. This device supports 13 YANG models of the flavour TAPI.

The NED package is assumed to be freshly installed into a NSO installation, i.e no third party YANG models are not yet included.

The snippet below shows the use case in XML format that will be used throughout this example. It is about configuring one connectivity service using the TAPI models.

It will be referred to as */tmp/use-cases/example.xml* throughout the example.

```
<config xmlns="http://tail-f.com/ns/config/1.0">
  <devices xmlns="http://tail-f.com/ns/ncs">
    <device>
      <name>netsim-0</name>
      <config>
        <context xmlns="urn:onf:otcc:yang:tapi-common">
          <connectivity-context xmlns="urn:onf:otcc:yang:tapi-connectivity">
            <connectivity-service>
              <uuid>99000000-0000-0000-0000-000000000000</uuid>
              <end-point>
                <local-id>1</local-id>
                <layer-protocol-name>DSR</layer-protocol-name>
                <layer-protocol-qualifier xmlns:tapi-dsr="urn:onf:otcc:yang:tapi-dsr">tapi-dsr:DIGITAL_SIGNAL_TYPE_100_GigE</layer-protocol-qualifier>
                <service-interface-point>
                  <service-interface-point-uuid>00000010-0000-0000-0000-000000053727</service-interface-point-uuid>
                </service-interface-point>
              </end-point>
              <end-point>
                <local-id>2</local-id>
                <layer-protocol-name>DSR</layer-protocol-name>
                <layer-protocol-qualifier xmlns:tapi-dsr="urn:onf:otcc:yang:tapi-dsr">tapi-dsr:DIGITAL_SIGNAL_TYPE_100_GigE</layer-protocol-qualifier>
                <service-interface-point>
                  <service-interface-point-uuid>00000010-0000-0000-0000-000000047966</service-interface-point-uuid>
                </service-interface-point>
              </end-point>
              <service-layer>DSR</service-layer>
              <service-type>POINT_TO_POINT_CONNECTIVITY</service-type>
              <exclude-node>00000030-0000-0000-0000-000000039045</exclude-node>
            </connectivity-service>
          </connectivity-context>
        </context>
      </config>
    </device>
  </devices>
</config>
```

### Download the models

To start with the third party YANG models must be downloaded. We will download all models supported by the TAPI device.

Download the models using the built-in tool with the profile *onf-tapi-from-git*

```
admin@ncs# devices device dev-1 rpc rpc-get-modules get-modules profile onf-tapi-from-git
..
..
fetched and saved 13 yang module(s) to /var/nso-demo/packages/onf-tapi_rc/src/yang
```

### Rebuild and reload the NED package

In this example the NED will initially be rebuilt with all the downloaded models included.

Rebuild the NED package using the built-in tool:

```
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package
result ok
admin@ncs# packages reload
reload-result {
    package onf-tapi_rc-gen-2.0
    result true
}
```

Finish with a sync-from:

```
admin@ncs# devices device dev-1 sync-from
result true
```

Display the models currently used by this NED:

```
admin@ncs# show devices device netsim-0 module
NAME                         REVISION    FEATURE  DEVIATION
-------------------------------------------------------------
tailf-internal-rpcs          2023-12-15  -        -
tailf-ned-onf-tapi_rc-stats  -           -        -
tapi-common                  2020-04-23  -        -
tapi-connectivity            2020-06-16  -        -
tapi-dsr                     2020-04-23  -        -
tapi-equipment               2020-04-23  -        -
tapi-eth                     2020-04-23  -        -
tapi-notification            2020-06-16  -        -
tapi-oam                     2020-04-23  -        -
tapi-odu                     2020-04-23  -        -
tapi-path-computation        2020-04-23  -        -
tapi-photonic-media          2020-06-16  -        -
tapi-topology                2020-04-23  -        -
tapi-virtual-network         2020-06-16  -        -
```

### Rebuild the NED using a scope filter

Now rebuild the NED again with the scope to only include the TAPI models necessary for applying the use case */tmp/use-cases/example.xml*:

```
admin@ncs# devices device netsim-0 rpc rpc-rebuild-package rebuild-package filter { scope { dir /tmp/use-cases } }
result ok
```

In case you have multiple use cases, simply put them all as xml files in the directory pointed out for scope filtering (/tmp/use-cases) and rebuild.

Now reload the NED package again. It will initially fail. This is because NSO detects that some models previously installed, will now be deleted;

```
admin@ncs# packages reload
Error: The following modules will be deleted by upgrade:
onf-tapi_rc-gen-2.0: tailf-ned-onf-tapi_rc-id
onf-tapi_rc-gen-2.0: ietf-restconf-monitoring
onf-tapi_rc-gen-2.0: tapi-dsr
onf-tapi_rc-gen-2.0: tapi-equipment
onf-tapi_rc-gen-2.0: tapi-eth
onf-tapi_rc-gen-2.0: tapi-notification
onf-tapi_rc-gen-2.0: tapi-oam
onf-tapi_rc-gen-2.0: tapi-odu
onf-tapi_rc-gen-2.0: tapi-virtual-network
If this is intended, proceed with 'force' parameter.
admin@ncs#
```
Reload using the force flag
```
admin@ncs# packages reload force
```

Check the models used the NED again:
```
admin@ncs# show devices device dev-1 module
NAME                         REVISION    FEATURE  DEVIATION
-------------------------------------------------------------
tailf-internal-rpcs          2023-12-15  -        -
tailf-ned-onf-tapi_rc-stats  -           -        -
tapi-common                  2020-04-23  -        -
tapi-connectivity            2020-06-16  -        -
tapi-dsr                     2020-04-23  -        -
tapi-path-computation        2020-04-23  -        -
tapi-photonic-media          2020-06-16  -        -
tapi-topology                2020-04-23  -        -
```
Number of models has now decreased from 14 to 8.

Now try deploying the use case:
```
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# load merge use-case.xml
Loading.
1.69 KiB parsed in 0.00 sec (240.20 KiB/sec)
admin@ncs(config)# commit
Commit complete.
```

Use case was successfully deployed.

Now, do a compare-config

```
admin@ncs# devices device dev-1 compare-config
diff
 devices {
     device dev-1 {
         config {
             context {
                 connectivity-context {
                     connectivity-service 99000000-0000-0000-0000-000000000000 {
+                        restore-priority 200;
+                        hold-off-time 100;
                     }
                 }
             }
         }
     }
 }
```

It shows a diff. It is caused by the device doing automatic set of additional nodes when the config was deployed.
This is referred to as auto config and is a very common among TAPI devices.

If the auto configured nodes are not of interest for the use case, they can be filter out using a auto-config filter.

When rebuilding the NED with an auto-config filter, the nodes pointed out by the filter is simply removed from the schema. The NED build tools creates a deviation file containing the nodes of concern. The NED is then rebuilt with the deviation file included.

The NED build tools need two files to be able to analyse the state and generate a proper deviation file if it is possible. The *before.xml* and the *after.xml* files.

The *before.xml* is a snapshot of the running config when the use case has been deployed.
The *after.xml* is a snapshot of the running config after the first subsequent sync-from. This sync-from makes diffing nodes be synced in to NSO/CDB.


### Rebuild with both scope and auto-config filters

Rollback to deployed config and then re-deploy it again.

In this case it is a good idea to keep track of the commit id. For instance by using a label:

```
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# rollback configuration
admin@ncs(config)# commit
admin@ncs(config)# load merge /tmp/use-cases/example.xml
Loading.
10.01 KiB parsed in 0.03 sec (294.96 KiB/sec)
admin@ncs(config)# commit label MY_USE_CASE
Commit complete.
admin@ncs(config)# abort
```

Do as follows to generate the *before.xml* and store it in the directory */tmp/auto-config*:

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
    package onf-tapi_rc-gen-2.0
    result true
}
```

### Apply use case again and do compare-config

Apply the use case again:

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

## 6.3 Doing run-time scope filtering

This alternative scope filtering method works even when the NED package itself has all available models built-in.

The obvious drawback is that not much footprint reduction is achieved. However, the sync-from performance can increase significantly increase.

The method exploits the fact that the NED can be configured to filter the capability reported by the device before it is relayed to NSO.
Doing so will make only the reported models available in the device instance in NSO. This can for instance be only models necessary for a certain use case.

The following NED settings are used for controlling what models the NED shall report to NSO:
```
admin@ncs(config)# devices device dev-1 ned-settings onf-tapi_rc general capabilities regex-include ?
Possible completions:
  <pattern:string>
admin@ncs(config)# devices device dev-1 ned-settings onf-tapi_rc general capabilities regex-exclude ?
Possible completions:
  <pattern:string>
```

Both settings accept multiple entries. Each entry shall be a regular expression matching one or many module names.

Below shows a couple of examples.

#### Include only three specific modules:
```
admin@ncs(config)# devices device dev-1 ned-settings onf-tapi_rc general capabilities regex-include tapi-common
admin@ncs(config)# devices device dev-1 ned-settings onf-tapi_rc general capabilities regex-include tapi-connectivity
admin@ncs(config)# devices device dev-1 ned-settings onf-tapi_rc general capabilities regex-include tapi-dsr
admin@ncs(config)# commit
admin@ncs(config)# abort

!Verify settings
admin@ncs# show running-config devices device dev-1 ned-settings onf-tapi_rc general capabilities
devices device dev-1
 ned-settings onf-tapi_rc general capabilities regex-include tapi-common
 ned-settings onf-tapi_rc general capabilities regex-include tapi-connectivity
 ned-settings onf-tapi_rc general capabilities regex-include tapi-dsr

!Verify scope
admin@ncs# devices device dev-1 disconnect
admin@ncs# devices device dev-1 connect
admin@ncs# show devices device dev-1 module
NAME                              REVISION    FEATURE  DEVIATION
------------------------------------------------------------------
tapi-common                  2020-04-23  -        -
tapi-connectivity            2020-06-16  -        -
tapi-dsr                     2020-04-23  -        -
tailf-internal-rpcs          2024-01-08  -        -
tailf-ned-onf-tapi_rc-stats  -           -        -

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
# ./tools/turboy --silent --plugin=cdb-data --list-yang-files yang --yang-path=. --read=/tmp/running-config.xml
  tapi-common.yang
  tapi-connectivity.yang
  tapi-path-computation.yang
  tapi-photonic-media.yang
  tapi-topology.yang
  ..
  ..
```

In the NSO CLI, update the scope filtering NED settings accordingly:

```
admin@ncs# config
admin@ncs(config)# devices device dev-1 ned-settings onf-tapi_rc general capabilities regex-include "<some suitable pattern>"
```
# 9. Advanced: build methods using schema trimming

The scope filtering techniques described in the previous chapter do work by only including the YANG files with XML name spaces required to cover a certain scope. This works well for YANG bundles that are properly partitioned into many different name spaces, for example the TAPI models.

The standard scope filtering can however not be used to remove parts of the schema that reside inside a certain name space.

To remove such nodes it is recommended to use an alternative method called *schema trimming* to reduce the schema.

The schema trimming technique works by using the YANG *deviate* statement to remove any part of the schema and resolve any dependencies to the removed parts.  This can be anything from a certain leaf up to a subtree. This method works regardless of any name spaces.

Schema trimming will just like scope filtering reduce the memory footprint when the models have been loaded into NSO. It usually does not have any impact on the compile time, since all models are being processed before the schema trimming takes place.

## 9.1 Using the NED rebuild tool with schema trimming

The built-in NED rebuild tool has full support for doing schema trimming in an automatic way. The tool analyses the YANG models and creates a temporary YANG file containing *deviate* directives to remove all the nodes that shall be trimmed.

Furthermore the tool scans through the whole schema to find references to the nodes to be removed.  This typically means nodes of type *leafref* referring to a node to be deleted or to one of its subsides.  Any reference found will result in a new *deviate* directive where the *leafref* type is replaced by instead inlining the referred type.

### Example

This example presumes the NED package has already been rebuilt and reloaded with the full TAPI schema.

Now assume you want to trim the following schema sub trees, since they will not be used in your use case:

```
/tapi-common:context/tapi-equipment:physical-context
/tapi-common:context/tapi-oam:oam-context
/tapi-common:context/tapi-virtual-network:virtual-network-context
```

Enter the NSO CLI

```
$ ncs_cli -C -u admin
```

 Check that the nodes to be trimmed are defined, i.e accessible through the CLI:

```
admin@ncs# show running-config devices device dev-1 config context physical-context
% No entries found.
admin@ncs# show running-config devices device dev-1 config context oam-context
% No entries found.
admin@ncs# show running-config devices device dev-1 config context virtual-network-context
% No entries found.
admin@ncs#
```

Now rebuild the NED package using a schema trimming filter:

```
$ ncs_cli -C -u admin
admin@ncs# devices device dev-1 rpc rpc-rebuild-package rebuild-package filter { trim-schema { nodes [ /tapi-common:context/tapi-equipment:physical-context /tapi-common:context/tapi-oam:oam-context /tapi-common:context/tapi-virtual-network:virtual-network-context ] } }
result ok
admin@ncs#
```

Reload the NED package:

```
admin@ncs# packages reload
reload-result {
    package onf-tapi_rc-gen-2.0
    result true
}
admin@ncs#
```

Finally verify that the nodes have been properly trimmed from the schema. I.e use the same tab completion trick as before:

```
admin@ncs# show running-config devices device dev-1 config context physical-context
-------------------------------------------------------------------------------^
syntax error: element does not exist
admin@ncs# show running-config devices device dev-1 config config context oam-context
-------------------------------------------------------------------------------^
syntax error: element does not exist
admin@ncs# show running-config devices device dev-1 config config context virtual-network-context
-------------------------------------------------------------------------------^
syntax error: element does not exist
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
  import tapi-connectivity {
    prefix tapi-connectivity;
  }
  import tapi-oam {
    prefix tapi-oam;
  }
  import tapi-common {
    prefix tapi-common;
  }
  import tapi-topology {
    prefix tapi-topology;
  }
  import tapi-equipment {
    prefix tapi-equipment;
  }
  import tapi-virtual-network {
    prefix tapi-virtual-network;
  }
  revision 2024-07-11 {
    description "Automatic deviations generated from exclude filter";
  }
  deviation /tapi-common:context/tapi-equipment:physical-context {
    deviate not-supported;
  }
  deviation /tapi-common:context/tapi-oam:oam-context {
    deviate not-supported;
  }
  deviation /tapi-common:context/tapi-virtual-network:virtual-network-context {
    deviate not-supported;
  }
  deviation /tapi-equipment:get-physical-span-list/tapi-equipment:output/tapi-equipment:physical-span/tapi-equipment:abstract-strand/tapi-equipment:adjacent-strand/tapi-equipment:abstract-strand-local-id {
    deviate replace {
      type string;
    }
  }
  deviation /tapi-equipment:get-physical-span/tapi-equipment:output/tapi-equipment:physical-span/tapi-equipment:abstract-strand/tapi-equipment:adjacent-strand/tapi-equipment:abstract-strand-local-id {
    deviate replace {
      type string;
    }
  }
  deviation /tapi-equipment:get-device-list/tapi-equipment:output/tapi-equipment:device/tapi-equipment:equipment/tapi-equipment:contained-holder/tapi-equipment:occupying-fru/tapi-equipment:device-uuid {
    deviate replace {
      type string;
    }
  }
  deviation /tapi-equipment:get-physical-span/tapi-equipment:output/tapi-equipment:physical-span/tapi-equipment:abstract-strand/tapi-equipment:adjacent-strand/tapi-equipment:physical-span-uuid {
    deviate replace {
      type string;
    }
  }
..
..
..
```
