---
description: Schedule provisioning tasks in NSO.
---

# Phased Provsioning

Phased Provisioning is a Cisco NSO add-on package for scheduling provisioning tasks. Initially designed for gradual service rollout, it leverages NSO actions to give you more fine-grained control over how and when changes are introduced into the network.

A common way of using NSO is by an operator performing an action through the NSO CLI, which takes place immediately. However, when you perform a large number of changes or other actions, you likely have additional requirements, such as:

* You want to limit how many changes or actions can run at the same time.
* You want to schedule changes or actions to run outside of business hours.
* One or two actions failing is fine, but if several of them fail, you want to stop provisioning and investigate.

Phased Provisioning allows you to do all of that and more. As the framework invokes standard NSO actions to do the actual work, you can use it not just for services provisioning but for NED migrations and other operations too.

## Installation <a href="#installation" id="installation"></a>

The NSO Phased Provisioning binaries are available from [Cisco Software Central](https://software.cisco.com/download/home) and contain the `phased-provisioning` package. Add it to NSO in a manner suitable for your installation. This usually entails copying the package file to the appropriate `packages/` folder and performing a package reload. If in doubt, please refer to the NSO product documentation on package management.

To verify the status of the package on your NSO instance, run the `show packages package phased-provisioning` command.

If you later wish to uninstall, simply remove the package from NSO, which will also remove all Phased-Provisioning-specific configuration and data. It is highly recommended that you make a backup before removing the package, in case you need to restore or reference the data later.

## Quickstart <a href="#quickstart" id="quickstart"></a>

After adding the package, Phased Provisioning does not require any special configuration and you can start using it right away. All you need is an NSO action that you want to use it with. In this Quickstart, that will be the device NED migrate action, which is built into NSO.

The goal is to migrate a number of devices from router-nc-1.0 NED to router-nc-1.1. One way of doing this is with the `/devices/migrate` action all at once, or by manually invoking the `/devices/device/migrate` action on each device with the `new-ned-id` parameter as:

```markup
admin@ncs# devices device <some-device> migrate new-ned-id router-nc-1.1
```

### Create a Task <a href="#create-a-task" id="create-a-task"></a>

However, considering you want to achieve a phased (staggered) rollout, create a Phased Provisioning `task` to instruct the framework of the actions that you want to perform:

```markup
admin@ncs# config
admin@ncs(config)# phased-provisioning task run_ned_migrate
admin@ncs(config-task-run_ned_migrate)# target /devices/device
admin@ncs(config-task-run_ned_migrate)# action action-name migrate
admin@ncs(config-task-run_ned_migrate)# action variable new-ned-id value router-nc-1.1
admin@ncs(config-variable-new-ned-id)# show configuration
phased-provisioning task run_ned_migrate
 target /devices/device
 action action-name migrate
 action variable new-ned-id
  value router-nc-1.1
 !
!
```

This configuration defines a task named `run_ned_migrate`. It also defines a `target` value (that is an instance identifier) to select the nodes on which you want to run the action.

You provide the action name with the `action/action-name` value and set any parameters that the action requires. The name of the parameter can be set through `variable/name` and the value of the parameter can be set through any one of the below:

* `variable/value` for the string value of the parameter.
* `variable/expr` for XPath expression (value is determined through XPath calculation with respect to nodes filtered by `target` and `filter` or the `target-nodes` defined while running the task).

Here, the single argument is `new-ned-id` with the value of `router-nc-1.1`.

If the action has an input empty leaf, then you can only set `variable/name` without defining any value, for example, device `sync-from` action with `no-wait-for-lock` flag.

In the current configuration, the action will run on all the devices. This is likely not what you want and you can further limit the nodes using an XPath expression through a `filter` value, for example, to only devices that currently use the router-nc-1.0 NED:

```markup
admin@ncs(config-task-run_ned_migrate)# filter device-type/netconf/ned-id='router-nc-1.0:router-nc-1.0'
```

If you want to run an action on heterogeneous nodes which may not be determined from a single `target` and `filter`, then you can define a task without `target` and `filter` values. But, while running the task, you must dynamically set the nodes in `target-nodes` of `run` action, described later in this document.

> **Note**: Please check the description for `/phased-provisioning/task/action/action-name` regarding the conditions to determine action execution status.

### Create a Policy for the Task <a href="#create-a-policy-for-the-task" id="create-a-policy-for-the-task"></a>

In addition to what the task will do, you also need to specify how and when it will run. You do this with a Phased Provisioning `policy`:

```markup
admin@ncs(config)# phased-provisioning policies policy one_by_one
admin@ncs(config-policy-one_by_one)# batch size 1
admin@ncs(config-policy-one_by_one)# error-budget 1
admin@ncs(config-policy-one_by_one)# schedule immediately
admin@ncs(config-policy-one_by_one)# show configuration
phased-provisioning policies policy one_by_one
 schedule immediately
 batch size 1
 error-budget 1
!
```

The "one\_by\_one" policy, as it is named in this example, will run one migration at a time (`batch/size`), with an `error-budget` of 1, meaning the task will stop as soon as more than one migration fails. The value for `schedule` is `immediately`, which means as soon as possible after you submit this task for processing. Instead, you could also schedule it for a particular time in the future, such as Saturday at 1 a.m.

Finally, configure the task to use this policy:

```markup
admin@ncs(config)# phased-provisioning task run_ned_migrate
admin@ncs(config-task-run_ned_migrate)# policy one_by_one
admin@ncs(config-task-run_ned_migrate)# commit
admin@ncs(config-task-run_ned_migrate)# end
```

### Run the Task <a href="#run-the-task" id="run-the-task"></a>

Having committed the task, you must also submit it to the scheduler if you want it to run. Use the `/phased-provisioning/task/run` action to do so:

```markup
admin@ncs# phased-provisioning task run_ned_migrate run
```

If the task does not already have a `target` set, you must pass dynamic nodes in `target-nodes`, for example:

```markup
admin@ncs# phased-provisioning task upgrade run target-nodes [ /devices/device{cisco-8201} /devices/device{ncs-5500} /custom-service{nexus} ]
```

> **Note:** The selected `target-nodes` must support invoking the selected `action` or `self-test` action with the provided parameters, as defined in the task.

### View the Task Status <a href="#view-the-task-status" id="view-the-task-status"></a>

You can observe the status of the task with the `show phased-provisioning task-status` command, such as:

```markup
admin@ncs# show phased-provisioning task-status run_ned_migrate
phased-provisioning task-status run_ned_migrate
 state                  completed
 reason                 "All scheduled requests are processed."
 current-error-budget   1
 allocated-error-budget 1
 completed-nodes /ncs:devices/device{ex0}
 completed-nodes /ncs:devices/device{ex1}
 completed-nodes /ncs:devices/device{ex2}
```

### Brief View of Task Status <a href="#brief-view-of-task-status" id="brief-view-of-task-status"></a>

With many items (nodes) in the task, the output could be huge and you might want to use the `brief` action instead (note that there is no show in the command now):

```markup
admin@ncs# phased-provisioning task-status run_ned_migrate brief
```

### Resume a Suspended task <a href="#resume-a-suspended-task" id="resume-a-suspended-task"></a>

In case enough actions fail, the error budget runs out and the execution stops:

```markup
phased-provisioning task-status run_ned_migrate
 state                  suspended
 reason                 "Phased provisioning has exceeded the maximum number of errors allowed."
 current-error-budget   -1
 allocated-error-budget 1
 pending-nodes /ncs:devices/device{ex2}
 failed-nodes /ncs:devices/device{ex0}
  failure-reason "external error (19): Trying to migrate to the NED identity already configured"
 failed-nodes /ncs:devices/device{ex1}
  failure-reason "external error (19): Trying to migrate to the NED identity already configured"
```

To restart processing, use the `/phased-provisioning/task/resume` action, allowing more errors to accumulate (if you reset the error budget) or not:

```markup
admin@ncs# phased-provisioning task run_ned_migrate resume reset-error-budget true
```

### Pause a Task <a href="#pause-a-task" id="pause-a-task"></a>

You can temporarily pause an in-progress task, such as when you observe a problem and want to intervene to avoid additional failures.

Use the `/phased-provisioning/task/pause` action for pausing a task. This will suspend the task with an appropriate reason. You can later restart the task by executing the `/phased-provisioning/task/resume` action.

```markup
admin@ncs# phased-provisioning task run_ned_migrate pause
```

The task will be suspended with a reason as observed in `task-status`.

```markup
phased-provisioning task-status run_ned_migrate
 state                  suspended
 reason                 "Task is paused by user."
 current-error-budget   0
 allocated-error-budget 1
 pending-nodes /ncs:devices/device{ex2}
 completed-nodes /ncs:devices/device{ex0}
 failed-nodes /ncs:devices/device{ex1}
  failure-reason "external error (19): Trying to migrate to the NED identity already configured"
```

### Retry Failed Nodes <a href="#retry-failed-nodes" id="retry-failed-nodes"></a>

If you want to re-try running the task for the failed nodes, use the`/phased-provisioning/task/retry-failures` action. This will move the failed nodes back to pending, so that, the nodes can be re-executed again. You can also re-execute specific failed nodes by specifying these in `failed-nodes` input of `retry-failures` action. This action does not change the `error-budget`.

To retry all failed nodes:

```markup
admin@ncs# phased-provisioning task run_ned_migrate retry-failures
```

To retry specific failed nodes:

```markup
admin@ncs# phased-provisioning task run_ned_migrate retry-failures failed-nodes [ /devices/device{ex1} ]
```

If the task has already completed, then after executing this action, the task will be marked `suspended` with appropriate `reason`. Then you can resume the task again to retry the failed nodes.

```markup
phased-provisioning task-status run_ned_migrate
 state                  suspended
 reason                 "Failed nodes are moved back to pending. Resume task to retry."
 current-error-budget   0
 allocated-error-budget 1
 pending-nodes /ncs:devices/device{ex1}
 completed-nodes /ncs:devices/device{ex0}
 failed-nodes /ncs:devices/device{ex2}
  failure-reason "external error (19): Trying to migrate to the NED identity already configured"
```

## Phased Service Provisioning <a href="#phased-service-provisioning" id="phased-service-provisioning"></a>

While great for running actions, you can also use this functionality to provision (or de-provision) services in a staged/phased manner. There are two steps to achieving this:

* First, configure service instances as you would normally, but commit the changes with the `commit no-deploy` command.
* Second, configure a Phased Provisioning _task_ to invoke the `reactive-re-deploy` action for these services, taking advantage of all the Phased Provisioning features.

Here is an example of a trivial `static-dns` service.

```markup
admin@ncs# config
Entering configuration mode terminal
admin@ncs(config)# static-dns ex0 dns 10.0.0.1
admin@ncs(config-static-dns-ex0)# static-dns ex1 dns 10.1.0.1
admin@ncs(config-static-dns-ex1)# static-dns ex2 dns 10.2.0.1
admin@ncs(config-static-dns-ex2)# top
admin@ncs(config)# commit no-deploy
Commit complete.
admin@ncs(config)# exit
```

You can verify that using the `commit no-deploy` did not result in any device configuration yet:

```markup
admin@ncs# show static-dns * modified
                         LSA
NAME  DEVICES  SERVICES  SERVICES
-----------------------------------
ex0   -        -         -
ex1   -        -         -
ex2   -        -         -

admin@ncs#
```

Then, create a task for phased provisioning, using the `one_by_one` policy from Quickstart:

```markup
admin@ncs(config)# phased-provisioning task deploy-dns
admin@ncs(config-task-deploy-dns)# target /static-dns
admin@ncs(config-task-deploy-dns)# filter starts-with(name,'ex')
admin@ncs(config-task-deploy-dns)# action action-name reactive-re-deploy
admin@ncs(config-task-deploy-dns)# policy one_by_one
admin@ncs(config-task-deploy-dns)# show configuration
phased-provisioning task deploy-dns
 target /static-dns
 filter starts-with(name,'ex')
 action action-name reactive-re-deploy
 policy one_by_one
!
admin@ncs(config-task-deploy-dns)# commit
admin@ncs(config-task-deploy-dns)# end
```

Finally, start the task:

```markup
admin@ncs# phased-provisioning task deploy-dns run
```

You can follow the task's progress with the following `show` command:

```markup
admin@ncs# show phased-provisioning task-status deploy-dns | repeat 1
```

> **Note:** This command will refresh the output every second, stop it by pressing **Ctrl+c**.

## Custom Tests for Provisioning Validation <a href="#custom-tests-for-provisioning-validation" id="custom-tests-for-provisioning-validation"></a>

For simple services, such as the preceding `static-dns`, successfully updating device configuration may be a sufficient indicator that the service was deployed without problems. For more complex services, you typically want to run additional tests to ensure everything went according to plan. Such services will often have a `self-test` action that performs this additional validation.

Phased Provisioning allows you to run custom verification, whether you are deploying services or doing some other type of provisioning. You can configure this under `self-test` container in the _task_ configuration.

> Please check the description for `/phased-provisioning/task/self-test/action-name` regarding the restrictions applied for action validation.

For example, the following commands will configure the service `self-test` action for validation.

```markup
admin@ncs(config)# phased-provisioning task deploy-dns
admin@ncs(config-task-deploy-dns)# self-test action-name self-test
```

Alternatively, you can use `self-test/test-expr` with an XPath expression, which must evaluate to a true value.

## Setting Start Time <a href="#setting-start-time" id="setting-start-time"></a>

In addition to an immediately scheduled policy, you can opt for a policy with future scheduling. This allows you to set a (possibly recurring) time when provisioning takes place.

You can set two separate parameters:

* **`time`:** Configures at what time to start, in the Vixie-style cron format (further described below).
* **`window`:** Configures for how long after the start time new items can start processing.

Using both of these parameters enables you to limit the execution of a task to a particular time of day, such as when you have a service window. If there are still items in the task after the current window has passed, the system will wait for the next occurrence to process the remaining items.

The format for the time parameter is as follows:

```markup
---------- minute (0 - 59)
| ---------- hour (0 - 23)
| | ---------- day of month (1 - 31)
| | | ---------- month (1 - 12) | (jan - dec)
| | | | ---------- day of week (0 - 6) | (sun - sat)
| | | | |
* * * * *
```

Each of the asterisks (`*`) represents a field, which can take one of the following values:

* A number, such as `5`.
* A number range, such as `5-10`.
* An asterisk `*`, meaning any. For example, 0-59 and `*` are equivalent for the first (minute) field.

Each of these values can further be followed by a slash (`/`) and a number, denoting a step. For example, if used in the first field, `*/3` means every third minute instead of every minute (`*` only).

A number, range, and step can also be combined together with a comma (`,`) for each of these values. For example, if used in the first field, `5,10-13,20,25-28,*/15` means at minute 5, every minute from 10 through 13, at minute 20, every minute from 25 through 28, and every 15th minute.

## Updating policy <a href="#updating-policy" id="updating-policy"></a>

You can update a policy used in a task irrespective of the task's running status (`init`, `in-progress`, `completed`, or `suspended`).

* Updating a `completed` task's policy will not impact anything.
* If an `init` task's policy schedule is updated to `immediately`, then the task will start executing batches immediately. Change to `error-budget` will also be reflected immediately. Change to `batch-size` or `schedule/future/time` or `schedule/future/window` will only reflect when the task starts as per the new schedule time.
* If a `suspended` task's policy is updated, then the changes will be reflected upon resuming the task.
* For an `in-progress` task,
  * If the policy schedule updated from `immediately` to `schedule/future/time` or `schedule/future/time` changed to a **new time**, then after the completion of the current batch, the next batch execution will be stopped and scheduled as per the new schedule time.
  * If the policy schedule updated from `schedule/future/time` to `immediately`, the task will continue to run till it completes.
  * Update to `batch-size` or `schedule/future/window` will be reflected upon the next batch execution after the current batch completion.
  * Update to `error-budget` will be reflected immediately to `allocated-error-budget` whereas the `current-error-budget` is adjusted depending on previously failed nodes.

## Security Considerations <a href="#security-considerations" id="security-considerations"></a>

Phased Provisioning tasks perform _no_ access checks for the configured actions. When a user is given access to the Phased Provisioning feature through NACM, they can implicitly invoke any action in NSO. That is, even if a user can't access an action directly, they can configure a task that invokes this action.

To amend this behavior, you can wrap Phased Provisioning functionality with custom actions or services and in this way limit available actions.

Tasks with future-scheduled policies make use of the NSO built-in scheduler functionality, which runs the task as the user that submitted it for scheduling (the user that invoked the `run` action on the task). If external authentication or PAM supplies the user groups for this user or you explicitly set groups using the `ncs_cli -g` command when connecting, the scheduling may fail.

This happens if the `admin` user is not mapped to a group with sufficient NACM permissions in NSO, such as in the default system-install configuration.

To address this issue, add the "admin" user to the correct group, using the `/nacm/groups/group/user-name` configuration. Instead of "admin", you can choose a different user with the `/phased-provisioning/local-user` setting. In any case, this user must have permission to invoke actions on the `/cisco-pdp:phased-provisioning/task/` node. For example:

```markup
admin@ncs(config)# nacm groups group ncsadmin user-name admin
```

As a significantly less secure alternative, you can change the default for a user without a matching group by using the `/nacm/exec-default` setting.

## Further Reading <a href="#further-reading" id="further-reading"></a>

* The `phased-provisioning` data model in `phased-provisioning/src/yang/cisco-phased-provisioning.yang`.
