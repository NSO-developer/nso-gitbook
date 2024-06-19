---
description: Audit and verify your network for configuration compliance.
---

# Compliance Reporting

When the network configuration is broken, there is a need to gather information and verify the network. NSO has numerous functions to show different aspects of such a network configuration verification. However, to simplify this task, compliance reporting can assemble information using a selection of these NSO functions and present the resulting information in one report. This report aims to answer two fundamental questions:

* Who has done what?
* Is the network correctly configured?

What defines a correctly configured network? Where is the authoritative configuration kept? Naturally, NSO, with the configurations stored in CDB, is the authority. Checking the live devices against the NSO-stored device configuration is a fundamental part of compliance reporting. Compliance reporting can also be based on one or a number of stored templates which the live devices are compared against. The compliance reports can also be a combination of both approaches.

Compliance reporting can be configured to check the current situation, check historic events, or both. To assemble historic events, rollback files are used. Therefore this functionality must be enabled in NSO before report execution, otherwise, the history view cannot be presented.

The reports can be created in either plain text, HTML, or DocBook XML format. In addition, the data can also be exported to a SQLite database file. The DocBook XML format allows you to use the report in further post-processing, such as creating a PDF using Apache FOP and your own custom styling.

## Creating Compliance Report Definitions <a href="#d5e4797" id="d5e4797"></a>

It is possible to create several named compliance report definitions. Each named report defines the devices, services, and/or templates that should be part of the network configuration verification.

Let us walk through a simple compliance report definition. This example is based on the `examples.ncs/service-provider/mpls-vpn` example. For the details of the included services and devices in this example, see the `README` file.

First of all, the reports have a name which is key in the report list. Furthermore, the report has a `device-check` and a `service-check` container for specifying devices and services to check. The `compare-template` list allows for specifying templates to compare device configurations against.&#x20;

A report definition can specify all containers at the same time:

```
$ ncs_cli -u admin -C
admin connected from 127.0.0.1 using console on ncs
ncs# config
Entering configuration mode terminal
ncs(config)# compliance reports report gold-check
Possible completions:
  compare-template   Diff devices against templates
  device-check       Report on devices
  run                Run this compliance report
  service-check      Report on services out of sync
  <cr>
```

We will first use the `device-check` container to specify which devices to check. Devices can be defined in one of four different ways:

* `all-devices`: Check all defined devices.
* `device-group`_:_ Specified list of device groups.
* `device`: Specified list of devices.
* `select-devices`_:_ Specified by an XPath expression.

Furthermore, for a `device-check`, the behavior or the verification can be specified.&#x20;

The default behavior for device verification is the following:

* To request a `check-sync` action to verify that the device is currently in sync. This behavior is controlled by the leaf `current-out-of-sync` (default `true`).
* To scan the commit log (i.e. rollback files) for changes on the devices and report these. This behavior is controlled by the `leaf historic-changes` (default `true`).

```
ncs(config)# compliance reports report gold-check
ncs(config-report-gold-check)# device-check
Possible completions:
  all-devices            Report on all devices
  current-out-of-sync    Should current check-sync action be performed?
  device                 Report on specific devices
  device-group           Report on specific device groups
  historic-changes       Include commit log events from within the report
                         interval
  select-devices         Report on devices selected by an XPath expression
  <cr>
```

We will choose the default behavior and check all devices:

```
ncs(config-report-gold-check)# device-check all-devices
```

In our example, we also use the `service-check` container to specify which services to check. Services can be defined in one of 3 ways:

* `all-services`_:_ Check all defined services.
* `service`_:_ Specified list of services.
* `select-services`_:_ Specified by an XPath expression.

Also for the `service-check`, the verification behavior can be specified. The default behavior for service verification is the following:

* To request a `check-sync` action to verify that the service is currently in sync. This behavior is controlled by the leaf `current-out-of-sync` (default `true`).
* To scan the commit log (i.e. rollback files) for changes on the services and report these. This behavior is controlled by the leaf `historic-changes` (default `true`).

```
ncs(config-report-gold-check)# service-check
Possible completions:
  all-services           Report on all services
  current-out-of-sync    Should current check-sync action be performed?
  historic-changes       Include commit log events from within the report
                         interval
  select-services        Report on services selected by an XPath expression
  service                Report on specific services
  <cr>
```

In our report, we choose the default behavior and check the `l3vpn` service:

```
ncs(config-report-gold-check)# service-check select-services /l3vpn:vpn/l3vpn:l3vpn
ncs(config-report-gold-check)# commit
Commit complete.
ncs(config-report-gold-check)# show full-configuration
compliance reports report gold-check
 device-check all-devices
 service-check select-services /l3vpn:vpn/l3vpn:l3vpn
!
```

Our next example will illustrate how to add a device template to the compliance report. This template will be used to compare against part of the device configuration. First, we define the device template:

```
ncs(config-report-gold-check)# top
ncs(config)# devices template gold-conf config
ncs(config-config)# ios:snmp-server community {$COMMUNITY}
ncs(config-community-{$COMMUNITY})# commit
Commit complete.
ncs(config-community-{$COMMUNITY})# show full-configuration
devices template gold-conf
 config
  ios:snmp-server community {$COMMUNITY}
  !
 !
!
```

We will also need a device group which will be used later in the report definition. For the sake of simplicity, in this example, we will just choose some of the `ce` devices:

```
ncs(config-community-{$COMMUNITY})# top
ncs(config)# devices device-group mygrp device-name
(list): [ce0 ce1 ce2 ce3]
ncs(config-device-group-mygrp)# commit
Commit complete.
```

Now, we add the template to the already-defined report `gold-check`. An entry in the `compare-template` list contains the combination of a template and a device group which implies that the template will be applied to all devices in the device group and the difference (if any) will be reported as a compliance violation. Note, that no data will be changed on the device. Since the device template can contain variables, each `compare-template` also has a `variable` list.

In our example report, we use the `gold-conf` template and the `mygrp` group:

```
ncs(config-device-group-mygrp)# top
ncs(config)# compliance reports report gold-check
ncs(config-report-gold-check)# compare-template gold-conf mygrp
```

Since the `gold-conf` template uses variables, we will set the values for this variable in the report:

```
ncs(config-compare-template-gold-conf/mygrp)# variable COMMUNITY
ncs(config-variable-COMMUNITY)# value 'public'
ncs(config-variable-COMMUNITY)# show configuration
compliance reports report gold-check
 compare-template gold-conf mygrp
  variable COMMUNITY
   value 'public'
  !
 !
!
ncs(config-variable-COMMUNITY)# commit
Commit complete.
```

## Running Compliance Reports <a href="#d5e4911" id="d5e4911"></a>

Compliance reporting is a read-only operation. When running a compliance report, the result is stored in a file located in a sub-directory `compliance-reports` under the NSO `state` directory. NSO has operational data for managing this report storage which makes it possible to list existing reports.&#x20;

Here is an example of such a report listing:

```
ncs(config-variable-COMMUNITY)# top
ncs(config)# exit
ncs# show compliance report-results
compliance report-results report 1
 name              gold-check
 title             "GOLD NW 1"
 time              2015-02-04T18:48:57+00:00
 who               admin
 compliance-status violations
 location          http://.../report_1_admin_1_2015-2-4T18:48:57:0.xml
compliance report-results report 2
 name              gold-check
 title             "GOLD NW 2"
 time              2015-02-04T18:51:48+00:00
 who               admin
 compliance-status violations
 location          http://.../report_2_admin_1_2015-2-4T18:51:48:0.text
compliance report-results report 3
 name              gold-check
 title             "GOLD NW 3"
 time              2015-02-04T19:11:43+00:00
 who               admin
 compliance-status violations
 location          http://.../report_3_admin_1_2015-2-4T19:11:43:0.text
```

There is also a `remove` action to remove report results (and the corresponding file):

```
ncs# compliance report-results report 2..3 remove
ncs# show compliance report-results
compliance report-results report 1
 name              gold-check
 title             "GOLD NW 1"
 time              2015-02-04T18:48:57+00:00
 who               admin
 compliance-status violations
 location          http://.../report_1_admin_1_2015-2-4T18:48:57:0.xml
```

When running the report, there are a number of parameters that can be specified with the specific `run` action.

The parameters that are possible to specify for a report `run` action are:

* `title`_:_ The title in the resulting report
* `from`_:_ The date and time from which the report should start the information gathering. If not set, the oldest available information is implied.
* `to`_:_ The date and time when the information gathering should stop. If not set, the current date and time are implied. If set, no new check-syncs of devices and/or services will be attempted.
* `outformat`_:_ One of `xml`, `html`, `text`, or `sqlite`. If `xml` is specified, the report will formatted using the docbook schema.

We will request a report run with a `title` and formatted as `text`.

```
ncs# compliance reports report gold-check run \
> title "My First Report" outformat text
```

In the above command, the report was run without a `from` or a `to` argument. This implies that historical information gathering will be based on all available information. This includes information gathered from rollback files.

When a `from` argument is supplied to a compliance report run action, this implies that only historical information younger than the `from` date and time is checked.

```
ncs# compliance reports report gold-check run \
> title "First check" from 2015-02-04T00:00:00
```

When a `to` argument is supplied, this implies that historical information will be gathered for all logged information up to the date and time of the `to` argument.

```
ncs# compliance reports report gold-check run \
> title "Second check" to 2015-02-05T00:00:00
```

The `from` and a `to` arguments can be combined to specify a fixed historic time interval.

```
ncs# compliance reports report gold-check run \
> title "Third check" from 2015-02-04T00:00:00 to 2015-02-05T00:00:00
```

When a compliance report is run, the action will respond with a flag indicating if any discrepancies were found. Also, it reports how many devices and services have been verified in total by the report.

```
ncs# compliance reports report gold-check run \
> title "Fourth check" outformat text
time 2015-2-4T20:42:45.019012+00:00
compliance-status violations
info Checking 17 devices and 2 services
location http://.../report_7_admin_1_2015-2-4T20:42:45.019012+00:00.text
```

Below is an example of a compliance report result (in `text` format):

{% code title="Compliance report result" %}
```
$ cat ./state/compliance-reports/report_7_admin_1_2015-2-4T20\:42\:45.019012+00\:00.text
reportcookie : g2gCbQAAAAtGaWZ0aCBjaGVja20AAAAKZ29sZC1jaGVjaw==

Compliance report : Fourth check

        Publication date : 2015-2-4 20:42:45
        Produced by user : admin

Chapter : Summary

        Compliance result titled "Fourth check" defined by report "gold-check"
        Resulting in violations
        Checking 17 devices and 2 services
        Produced 2015-2-4 20:42:45
        From : Oldest available information
        To : 2015-2-4 20:42:45

Devices out of sync

p0

        check-sync unsupported for device

p1

        check-sync unsupported for device

p2

        check-sync unsupported for device

p3

        check-sync unsupported for device

pe0

        check-sync unsupported for device

pe1

        check-sync unsupported for device

pe3

        check-sync unsupported for device



Template discrepancies

gold-conf

        Discrepancies in device
        ce0
        ce1
        ce2
        ce3


Chapter : Details


Commit list

        SeqNo   ID      User    Client  Timestamp            Label  Comment
        0       10031   admin   cli     2015-02-04 20:31:42
        1       10030   admin   cli     2015-02-04 20:03:41
        2       10029   admin   cli     2015-02-04 19:54:40
        3       10028   admin   cli     2015-02-04 19:45:20
        4       10027   admin   cli     2015-02-04 18:38:05


Service commit changes

        No service data commits saved for the time interval


Device commit changes

        No device data commits saved for the time interval


Service differences

        No service data diffs found


Template discrepancies details

gold-conf

Device ce0

 config {
     ios:snmp-server {
+        community public {
+        }
     }
 }

Device ce1

 config {
     ios:snmp-server {
+        community public {
+        }
     }
 }

Device ce2

 config {
     ios:snmp-server {
+        community public {
+        }
     }
 }

Device ce3

 config {
     ios:snmp-server {
+        community public {
+        }
     }
 }
```
{% endcode %}

## Additional Configuration Checks

In some cases, it is insufficient to only check that the required configuration is present, as other configurations on the device can interfere with the desired functionality. For example, a service may configure a routing table entry for the 198.51.100.0/24 network. If someone also configures a more specific entry, say 198.51.100.0/28, that entry will take precedence and may interfere with the way the service requires the traffic to be routed. In effect, this additional configuration can render the service inoperable.

To help operators ensure there is no such extraneous configuration on the managed devices, the compliance reporting feature supports the so-called `strict` mode. This mode not only checks whether the required configuration is present but also reports any configuration present on the device that is not part of the template.

You can configure this mode in the report definition, when specifying the device template to check against, for example:

```
ncs(config)# compliance reports report gold-check
ncs(config-report-gold-check)# compare-template gold-conf mygrp strict
```

However, in practice, using the strict mode with device templates may prove challenging. Often, each device will have its own set of IP addresses configured. While you can supply variable values to the template, you likely need to maintain a separate set for each device (since each uses its own unique IPs).

One way to overcome this problem is to use services to configure all aspects of the managed device. But perhaps you only use NSO to configure a subset of all the services (configuration) on the devices. In this case, you can still perform generic configuration validation with the help of compliance templates, which are similar to, but separate from device templates.

With compliance templates, you use regular expressions to check compliance, instead of simple fixed values or variables, and they can be used with or without strict mode.

You can create a compliance template from scratch, similar to how you create a device template. To check that the router uses only internal DNS servers from the 10.0.0.0/8 range, you might create a compliance template such as:

```
admin@ncs(config)# compliance template internal-dns
admin@ncs(config-template-internal-dns)# ned-id router-nc-1.0 config sys dns server 10\\\\..+
```

Here, the value for the `/sys/dns/server` must start with `10.`, followed by any string (regular expression `.+`). Since a dot has a special meaning with regular expressions (any character), it must be escaped with a backslash to match only the actual dot character. But note the required multiple escaping (`\\\\`) in this case.

As these expressions can be non-trivial to construct, the templates have a `check` command that allows you to quickly check compliance for a set of devices, which is a great development aid.

<pre><code>admin@ncs(config)# show full-configuration devices device ex0 config sys dns server
devices device ex0
 config
  sys dns server 10.2.3.4
  !
  sys dns server 192.168.100.10
  !
 !
!
<strong>admin@ncs(config)# compliance template internal-dns
</strong><strong>admin@ncs(config-template-internal-dns)# check device ex0
</strong>check-result {
    device ex0
    result violations
    diff  config {
     sys {
         dns {
+            # after server 10.2.3.4
+            /* No match of 10\\..+ */
+            server 192.168.100.10;
         }
     }
 }

}
</code></pre>

Alternatively, you can use the `/compliance/create-template` action when you already have existing device templates that you would like to use as a starting point for a compliance template.

Finally, to use compliance templates in a report, reference them from `device-check/template`:

```
admin@ncs(config-report-gold-check)# device-check template internal-dns
```
