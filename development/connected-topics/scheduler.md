---
description: Schedule background tasks in NSO.
---

# Scheduler

NSO includes a native time-based job scheduler suitable for scheduling background work. Tasks can be scheduled to run at particular times or periodically at fixed times, dates, or intervals. It can typically be used to automate system maintenance or administrative tasks.

## Scheduling Periodic Work <a href="#d5e9339" id="d5e9339"></a>

You can represent a recurring schedule with either a compact cron-like expression or structured fields. When the task is triggered, the configured action is invoked on the configured action node instance. The action is run as the user that configured the task.

For example, schedule `sync-from` to run at 2 AM on the 1st of every month using a cron-like expression:

```bash
admin(config)# scheduler task sync schedule "0 2 1 * *" \
action-name sync-from action-node /devices
```

The structured form uses leaf-lists for the minute, hour, day of month, month, and day of week. An omitted field matches all values. This example has the same schedule:

```bash
admin(config)# scheduler task sync minute [ 0 ] hour [ 2 ] \
day-of-month [ 1 ] action-name sync-from action-node /devices
```

The structured form accepts numeric values for minute (`0`-`59`), hour (`0`-`23`), day of month (`1`-`31`), and month (`1`-`12`). Day of week uses the names `sunday` through `saturday`. Specify multiple values in a leaf-list to select more than one value. If both day of month and day of week are restricted, a date matches when either field matches, following Vixie cron behavior.

{% hint style="info" %}
If the task was added through an XML `init` file, the task will run with the `system` user, which implies that AAA rules will not be applied at all. Thus, the task action will not be able to initiate device communication.
{% endhint %}

If the action node instance is given as an XPath 1.0 expression, the expression is evaluated with the root as the context node, and the expression must return a node set. The action is then invoked on each node in this node set.

Optionally, action parameters can be configured in XML format to be passed to the action during invocation.

```bash
admin(config-task-sync)# action-params "<device>ce0</device><device>ce1</device>"
admin(config)# commit
```

Once the task has been configured, you can view the next run times of the task:

```cli
admin(config)# scheduler task sync get-next-run-times display 3
next-run-time [ 2017-11-01 02:00:00+00:00 2017-12-01 02:00:00+00:00 2018-01-01 02:00:00+00:00 ]
```

The task's read-only state includes its effective recurring schedule, its next run time, and whether it is currently running:

```cli
admin# show scheduler task sync state
schedule       0 2 1 * *
next-run-time  2017-11-01T02:00:00+00:00
running        false
```

For a recurring task, `state schedule` shows the effective schedule in canonical cron-like form, including when the task was configured with structured fields. For a one-shot task, `state next-run-time` is the configured time if it has not passed. The `running` status is at `scheduler/task/state/running`.

### Cron Schedule Expression <a href="#d5e9364" id="d5e9364"></a>

The cron-like schedule is a string comprising five fields separated by white space. It supports a Vixie-cron-compatible subset; not all Vixie cron extensions are supported.

The table below shows expression rules.

| Field        | Allowed values  | Allowed special characters |
| ------------ | --------------- | -------------------------- |
| Minutes      | 0-59            | \* , - /                   |
| Hours        | 0-23            | \* , - /                   |
| Day of month | 1-31            | \* , - /                   |
| Month        | 1-12 or JAN-DEC | \* , - /                   |
| Day of week  | 0-6 or SUN-SAT  | \* , - /                   |

The following list describes the supported special characters and how you can use them in a cron expression.

* Star (`*`). Selects all values within a field. For example, `*` in the minute field selects every minute.
* Comma _(_`,`_)_. Commas are used to specify additional values. For example, using `MON,WED,FRI` in the day of week field.
* Hyphen _(_`-`_)_. Hyphens define ranges. For example `1-5` in the day of week field indicates every day between Monday and Friday, inclusive.
* Forward slash _(_`/`_)_. Slashes can be combined with ranges to specify increments. For example, `*/5` in the minutes field indicates every 5 minutes.

### Scheduling Periodic Compaction <a href="#ug.sc.compaction" id="ug.sc.compaction"></a>

[Compaction](../../administration/advanced-topics/cdb-persistence.md#compaction) in NSO can take a considerable amount of time, during which transactions could be blocked. To avoid disruption, it might be advantageous to schedule compaction during times of low NSO utilization. This can be done using the NSO scheduler and a service. See [examples.ncs/misc/periodic-compaction](https://github.com/NSO-developer/nso-examples/tree/6.7/misc/periodic-compaction) for an example that demonstrates how to create a periodic compaction service that can be scheduled using the NSO scheduler.

## Scheduling Non-recurring Work <a href="#d5e9418" id="d5e9418"></a>

The scheduler can also be used to configure non-recurring tasks that will run at a particular time.

```bash
admin(config)# scheduler task my-compliance-report time 2017-11-01T02:00:00+01:00 \
action-name check-compliance action-node /reports
```

A non-recurring task will by default be removed when it has finished executing. It will be up to the action to raise an alarm if an error occurs. The task can also be kept in the task list by setting the `keep` leaf.

## Scheduling in an HA Cluster <a href="#d5e9426" id="d5e9426"></a>

In an HA cluster, a scheduled task will by default be run on the primary HA node. By configuring the `ha-mode` leaf a task can be scheduled to run on nodes with a particular HA mode, for example, scheduling a read-only action on the secondary nodes. More specifically, a task can be configured with the `ha-node-id` to only run on a certain node. These settings will not have any effect on a standalone node.

```bash
admin(config)# scheduler task my-compliance-report schedule "0 2 1 * *" \
ha-mode secondary ha-node-id secondary-node1 \
action-name check-compliance action-node /reports
```

{% hint style="info" %}
The scheduler is disabled when HA is enabled and when HA mode is `NONE`. See [Mode of Operation](../../administration/management/high-availability.md#ha.moo) in HA for more details.
{% endhint %}

## Troubleshooting <a href="#d5e9438" id="d5e9438"></a>

Troubleshooting information is covered below.

### History Log <a href="#d5e9440" id="d5e9440"></a>

To find out whether a scheduled task has run successfully or not, the easiest way is to view the history log of the scheduler. It will display the latest runs of the scheduled task.

```bash
admin# show scheduler task sync history | notab
history history-entry 2017-11-01T02:00:00.55003+00:00 0
 duration  0.15
 succeeded true
history history-entry 2017-12-01T02:00:00.549939+00:00 0
 duration  0.09
 succeeded true
history history-entry 2017-01-01T02:00:00.550128+00:00 0
 duration  0.01
 succeeded false
 info      "Resource device ce0 doesn't exist"
```

### XPath Log <a href="#d5e9446" id="d5e9446"></a>

Detailed information from the XPath evaluator can be enabled and made available in the XPath log. Add the following snippet to `ncs.conf`.

```xml
<xpathTraceLog>
  <enabled>true</enabled>
  <filename>./xpath.trace</filename>
</xpathTraceLog>
```

### Devel Log <a href="#d5e9452" id="d5e9452"></a>

Error information is written to the development log. The development log is meant to be used as support while developing the application. It is enabled in `ncs.conf`:

```xml
<developer-log>
  <enabled>true</enabled>
  <file>
    <name>./logs/devel.log</name>
     <enabled>true</enabled>
  </file>
</developer-log>
<developer-log-level>trace</developer-log-level>
```

### Suspending the Scheduler <a href="#d5e9458" id="d5e9458"></a>

While investigating a failure with a scheduled task or performing maintenance on the system, like upgrading, it might be useful to suspend the scheduler temporarily.

```bash
admin# scheduler suspend
```

When ready, the scheduler can be resumed.

```bash
admin# scheduler resume
```
