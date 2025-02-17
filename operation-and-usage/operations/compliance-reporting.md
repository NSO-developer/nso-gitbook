---
description: Audit and verify your network for configuration compliance.
---

# Compliance Reporting

When the network configuration is broken, there is a need to gather information and verify the network. NSO has numerous functions to show different aspects of such a network configuration verification. However, to simplify this task, compliance reporting can assemble information using a selection of these NSO functions and present the resulting information in one report. This report aims to answer two fundamental questions:

* Who has done what?
* Is the network correctly configured?

What defines a correctly configured network? Where is the authoritative configuration kept? Naturally, NSO, with the configurations stored in CDB, is the authority. Checking the live devices against the NSO-stored device configuration is a fundamental part of compliance reporting. Compliance reporting can also be based on one or a number of stored templates which the live devices are compared against. The compliance reports can also be a combination of both approaches.

Compliance reporting can be configured to check the current situation, check historical events, or both. To assemble historical events, rollback files are used. Therefore this functionality must be enabled in NSO before report execution, otherwise, the history view cannot be presented.

The reports can be created in either plain text, HTML, or DocBook XML format. In addition, the data can also be exported to a SQLite database file. The DocBook XML format allows you to use the report in further post-processing, such as creating a PDF using Apache FOP and your own custom styling.

{% hint style="info" %}
Reports can be generated using either the CLI or Web UI. The suggested and favored way of generating compliance reports is via the Web UI, which provides a convenient way of creating, configuring, and consuming compliance reports. In the NSO Web UI, compliance reporting options are accessible from the **Tools** menu (see [Web User Interface](../webui/) for more information). The CLI options are described in the sections below.
{% endhint %}

## Creating Compliance Report Definitions <a href="#d5e4797" id="d5e4797"></a>

It is possible to create several named compliance report definitions. Each named report defines the devices, services, and/or templates that should be part of the network configuration verification.

Let us walk through a simple compliance report definition. This example is based on the [examples.ncs/service-management/mpls-vpn-java](https://github.com/NSO-developer/nso-examples/tree/6.4/service-management/mpls-vpn-java) example. For the details of the included services and devices in this example, see the `README` file.

Each report definition has a name and can specify device and service checks. Device checks are further classified into sync and configuration checks. Device sync checks verify the in-sync status of the devices included in the report, while device configuration checks verify individual device configuration against a compliance template (see [Device Configuration Checks](compliance-reporting.md#device-configuration-checks)).

For device checks, you can select the devices to be checked in four different ways:

* `all-devices` - Check all defined devices.
* `device-group` - Specified list of device groups.
* `device` - Specified list of devices.
* `select-devices` - Specified by an XPath expression.

Consider the following example report definition named `gold-check`:

```bash
ncs(config)# compliance reports report gold-check
ncs(config-report-gold-check)# device-check all-devices
```

This report definition, when executed, checks whether all devices known to NSO are in sync.

For such a check, the behavior of the verification can be specified:

* To request a check-sync action to verify that the device is currently in sync. This behavior is controlled by the leaf `current-out-of-sync` (default `true`).
* To scan the commit log (i.e. rollback files) for changes on the devices and report these. This behavior is controlled by the leaf `historic-changes` (default `true`).

```bash
ncs(config-report-gold-check)# device-check ?
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

For the example `gold-check`, you can also use service checks. This type of check verifies if the specified service instances are in sync, that is if the network devices contain configuration as defined by these services. You can select the services to be checked in four different ways:

* `all-services` - Check all known service instances.
* `service` - Specified list of service instances.
* `select-services` - Specified list of service instances through an XPath expression.
* `service-type` - Specified list of service types.

For service checks, the verification behavior can be specified as well:

* To request a check-sync action to verify that the service is currently in sync. This behavior is controlled by the leaf `current-out-of-sync` (default `true`).
* To scan the commit log (i.e. rollback files) for changes on the services and report these. This behavior is controlled by the leaf `historic-changes` (default `true`).

```bash
ncs(config-report-gold-check)# service-check ?
Possible completions:
  all-services          Report on all services
  current-out-of-sync   Should current check-sync action be performed?
  historic-changes      Include commit log events from within the report
                        interval
  select-services       Report on services selected by an XPath expression
  service               Report on specific services
  service-type          The type of service.
  <cr>
```

In the example report, you might choose the default behavior and check all instances of the `l3vpn` service:

```bash
ncs(config-report-gold-check)# service-check service-type /l3vpn:vpn/l3vpn:l3vpn
ncs(config-report-gold-check)# commit
Commit complete.
ncs(config-report-gold-check)# show full-configuration
compliance reports report gold-check
 device-check all-devices
 service-check service-type /l3vpn:vpn/l3vpn:l3vpn
!
```

You can also use the web UI to define compliance reports. See the section [Compliance Reporting](../webui/tools.md#sec.webui_compliance) for more information.

## Running Compliance Reports <a href="#d5e4911" id="d5e4911"></a>

Compliance reporting is a read-only operation. When running a compliance report, the result is stored in a file located in a sub-directory `compliance-reports` under the NSO `state` directory. NSO has operational data for managing this report storage which makes it possible to list existing reports.

Here is an example of such a report listing:

```bash
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

```bash
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

* `title`: The title in the resulting report.
* `from`: The date and time from which the report should start the information gathering. If not set, the oldest available information is implied.
* `to`: The date and time when the information gathering should stop. If not set, the current date and time are implied. If set, no new check-syncs of devices and/or services will be attempted.
* `outformat`: One of `xml`, `html`, `text`, or `sqlite`. If `xml` is specified, the report will formatted using the DocBook schema.

We will request a report run with a `title` and formatted as `text`.

```bash
ncs# compliance reports report gold-check run \
> title "My First Report" outformat text
```

In the above command, the report was run without a `from` or a `to` argument. This implies that historical information gathering will be based on all available information. This includes information gathered from rollback files.

When a `from` argument is supplied to a compliance report run action, this implies that only historical information younger than the `from` date and time is checked.

```bash
ncs# compliance reports report gold-check run \
> title "First check" from 2015-02-04T00:00:00
```

When a `to` argument is supplied, this implies that historical information will be gathered for all logged information up to the date and time of the `to` argument.

```bash
ncs# compliance reports report gold-check run \
> title "Second check" to 2015-02-05T00:00:00
```

The `from` and a `to` arguments can be combined to specify a fixed historic time interval.

```bash
ncs# compliance reports report gold-check run \
> title "Third check" from 2015-02-04T00:00:00 to 2015-02-05T00:00:00
```

When a compliance report is run, the action will respond with a flag indicating if any discrepancies were found. Also, it reports how many devices and services have been verified in total by the report.

```bash
ncs# compliance reports report gold-check run \
> title "Fourth check" outformat text
time 2015-2-4T20:42:45.019012+00:00
compliance-status violations
info Checking 17 devices and 2 services
location http://.../report_7_admin_1_2015-2-4T20:42:45.019012+00:00.text
```

Below is an example of a compliance report result (in `text` format):

{% code title="Compliance Report Result" %}
```bash
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

## Device Configuration Checks

Services are the preferred way to manage device configuration in NSO as they provide numerous benefits (see [Why services?](../../development/core-concepts/services.md#d5e536) in Development). However, on your journey to full automation, perhaps you only use NSO to configure a subset of all the services (configuration) on the devices. In this case, you can still perform generic configuration validation on other parts with the help of device configuration checks.

Often, each device will have a somewhat different configuration, such as its own set of IP addresses, which makes checking against a static template impossible. For this reason, NSO supports compliance templates.

These templates are similar to but separate from, device templates. With compliance templates, you use regular expressions to check compliance, instead of simple fixed values. You can also define and reference variables that get their values when a report is run. All selected devices are then checked against the compliance template and the differences (if any) are reported as a compliance violation.

You can create a compliance template from scratch. For example, to check that the router uses only internal DNS servers from the 10.0.0.0/8 range, you might create a compliance template such as:

```bash
admin@ncs(config)# compliance template internal-dns
admin@ncs(config-template-internal-dns)# ned-id router-nc-1.0 config sys dns server 10\\\\..+
```

Here, the value of the `/sys/dns/server` must start with `10.`, followed by any string (the regular expression `.+`). Since a dot has a special meaning with regular expressions (any character), it must be escaped with a backslash to match only the actual dot character. But note the required multiple escaping (`\\\\`) in this case.

As these expressions can be non-trivial to construct, the templates have a `check` command that allows you to quickly check compliance for a set of devices, which is a great development aid.

```bash
admin@ncs(config)# show full-configuration devices device ex0 config sys dns server
devices device ex0
 config
  sys dns server 10.2.3.4
  !
  sys dns server 192.168.100.10
  !
 !
!
admin@ncs(config)# compliance template internal-dns
admin@ncs(config-template-internal-dns)# check device ex0
check-result {
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
```

Alternatively, you can use the `/compliance/create-template` action when you already have existing device templates that you would like to use as a starting point for a compliance template. For example:

```bash
admin@ncs(config)# show full-configuration devices template use-internal-dns
devices template use-internal-dns
 ned-id router-nc-1.0
  config
   ! Tags: replace (/devices/template{use-internal-dns}/ned-id{router-nc-1.0:router-nc-1.0}/config/r:sys/dns)
   sys dns server 10.8.8.8
   !
  !
 !
!
admin@ncs(config)# compliance create-template name internal-dns device-template use-internal-dns
admin@ncs(config)# show configuration
compliance template internal-dns
 ned-id router-nc-1.0
  config
   ! Tags: replace (/compliance/template{internal-dns}/ned-id{router-nc-1.0:router-nc-1.0}/config/r:sys/dns)
   sys dns server 10.8.8.8
   !
  !
 !
!
admin@ncs(config)# compliance template internal-dns
admin@ncs(config-template-internal-dns)# ned-id router-nc-1.0 config sys dns server 10\\\\..+
```

Finally, to use compliance templates in a report, reference them from `device-check/template`:

```bash
admin@ncs(config-report-gold-check)# device-check template internal-dns
```

{% hint style="info" %}
By default the schemas for compliance templates are not accessible from application client libraries such as MAAPI. This reduces the memory usage for large device data models. The schema can be made accessible with the `/ncs-config/enable-client-template-schemas` setting in `ncs.conf`.
{% endhint %}

## Additional Configuration Checks

In some cases, it is insufficient to only check that the required configuration is present, as other configurations on the device can interfere with the desired functionality. For example, a service may configure a routing table entry for the 198.51.100.0/24 network. If someone also configures a more specific entry, say 198.51.100.0/28, that entry will take precedence and may interfere with the way the service requires the traffic to be routed. In effect, this additional configuration can render the service inoperable.

To help operators ensure there is no such extraneous configuration on the managed devices, the compliance reporting feature supports the so-called `strict` mode. This mode not only checks whether the required configuration is present but also reports any configuration present on the device that is not part of the template.

You can configure this mode in the report definition, when specifying the device template to check against, for example:

```bash
ncs(config)# compliance reports report gold-check
ncs(config-report-gold-check)# device-check template internal-dns strict
```

## Device Live-Status Checks

In addition to configuration, compliance templates can also check for operational data. This can be used, for example, to check device interface statuses and device software versions.

This feature is opt-in and requires the NEDs to be re-compiled with the `--ncs-with-operational-compliance` [ncsc(1)](../../man/section1.md#ncsc) flag. Instructions on how to re-compile a NED is included in each NED package.

```bash
admin@ncs(config)# compliance template interface-up
admin@ncs(config-template-interface-up)# ned-id router-nc-1.0 live-status sys interfaces interface eth0
admin@ncs(config-interface-eth0)# status link up
admin@ncs(config-interface-eth0)# commit
Commit complete.
```

When running a check against a device, the result will show a violation if the status of the interface link is not up.

```bash
admin@ncs(config-template-interface-up)# check device [ ex0 ]
check-result {
    device ex0
    result violations
    diff  live-status {
     sys {
         interfaces {
             interface eth0 {
                 status {
-                    link up;
+                    link down;
                 }
             }
         }
     }
 }

}
```

{% hint style="info" %}
Running checks on live-status data is slower than configuration data since it requires connecting to devices to read the data. In comparison, configuration data is checked against data in CDB.
{% endhint %}
