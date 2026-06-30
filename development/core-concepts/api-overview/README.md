---
description: Overview of NSO APIs.
---

# API Overview

NSO uses socket communication to coordinate work with applications, such as a Python or Java service. In addition to the control socket, NSO uses a number of worker sockets to process individual requests: performing service mapping or executing an action, for example. We collectively call these programs data provider applications, since the data provider protocol underpins all of them.

## Application Timeouts

The communication with data provider applications is subject to timeouts in order to manage the execution time of requests. These are defined in section `/ncs-config/api` in `ncs.conf`:

* `ncs-config/api/action-timeout`
* `ncs-config/api/query-timeout`
* `ncs-config/api/new-session-timeout`
* `ncs-config/api/connect-timeout`

For executing actions invoked by the clients, NSO uses `action-timeout` to ensures the response from data provider is received within the given time. If the data provider fails to do so within the stipulated timeout, NSO will kill the worker sockets executing the actions and trigger the abort action defined in `cb_abort()` without restarting the NSO VMs. The following code shows a trivial implementation of an abort action callback:

```python
class MyTestAction(Action):
    def cb_abort(self, uinfo):
        self.log.info('Action aborted: ')
```

There are some important points worth noting for action timeout:

* An action callback that times out in one user instance will not affect the result of an action callback in another user instance. This is because NSO executes actions using multiple worker sockets, and an action timeout will only terminate the worker socket executing that specific action.
* Implementing your own abort action callback in `cb_abort` allows you to handle actions that are timing out. If `cb_abort` is not defined, NSO cannot trigger the abort action during a timeout, preventing it from unlocking the action for a user session. Consequently, you must wait for the action callback to finish before attempting it again.

{% hint style="info" %}
See [examples.ncs/sdk-api/action-abort-py](https://github.com/NSO-developer/nso-examples/tree/6.7/sdk-api/action-abort-py) for an example of how to implement an abortable Python action that spawns a separate worker process using the multiprocessing library and returns the worker's outcome via a result queue or terminates the worker if the action is aborted.
{% endhint %}

For NSO operational data queries, NSO uses `query-timeout` to ensure the data provider return operational data within the given time. If the data provider fails to do so within the stipulated timeout, NSO will close its end of the control socket to the data provider. The NSO VMs will detect the socket close and exit.

For connection initiation requests between NSO and data providers, NSO uses `connect-timeout` to ensure the data provider send the initial message after connecting the socket to NSO within the given time. If the data provider fails to do so within the stipulated timeout, NSO will close its end of the control socket to the data provider. The NSO VMs will detect the socket close and exit.

For requests invoked by NSO, NSO uses `new-session-timeout` to ensure the data provider respond to the control socket request within the given time. If the data provider fails to do so within the stipulated timeout, NSO will close its end of the control socket to the data provider. The NSO VMs will detect the socket close and exit.
