---
description: View currently loaded packages.
---

# Listing Packages

NSO Packages contain data models and code for a specific function. It might be a NED for a specific device, a service application like MPLS VPN, a WebUI customization package, etc. Packages can be added, removed, and upgraded in run-time.

The currently loaded packages can be viewed with the following command:

{% code title="Show Currently Loaded Packages" %}
```cli
admin@ncs# show packages
packages package cisco-ios
 package-version 3.0
 description     "NED package for Cisco IOS"
 ncs-min-version [ 3.0.2 ]
 directory       ./state/packages-in-use/1/cisco-ios
 component upgrade-ned-id
  upgrade java-class-name com.tailf.packages.ned.ios.UpgradeNedId
 component cisco-ios
  ned cli ned-id  cisco-ios
  ned cli java-class-name com.tailf.packages.ned.ios.IOSNedCli
  ned device vendor Cisco
NAME      VALUE
---------------------
show-tag  interface

 build-info date "2015-01-29 23:40:12"
 build-info file ncs-3.4_HEAD-cisco-ios-3.0.tar.gz
 build-info arch linux.x86_64
 build-info java "compiled Java class data, version 50.0 (Java 1.6)"
 build-info package name cisco-ios
 build-info package version 3.0
 build-info package ref 3.0
 build-info package sha1 a8f1329
 build-info ncs version 3.4_HEAD
 build-info ncs sha1 81a1e4c
 build-info dev-support version 0.99
 build-info dev-support branch e4d3fa7
 build-info dev-support sha1 e4d3fa7
 oper-status up
```
{% endcode %}

Thus the above command shows that NSO currently has only one package loaded, the NED package for Cisco IOS. The output includes the name and version of the package, the minimum required NSO version, the Java components included, package build details, and finally the operational status of the package. The operational status is of particular importance - if it is anything other than `up`, it indicates that there was a problem with the loading or the initialization of the package. In this case, an item `error-info` may also be present, giving additional information about the problem. To show only the operational status for all loaded packages, this command can be used:

```cli
admin@ncs# show packages package * oper-status
packages package cisco-ios
 oper-status up
```
