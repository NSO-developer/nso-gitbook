---
description: Start and stop the NSO daemon.
---

# Start and Stop NSO

{% hint style="warning" %}
Applies to Local Install.
{% endhint %}

The command `ncs -h` shows various options when starting NSO. By default, NSO starts in the background without an associated terminal. It is recommended to add NSO to the `/etc/init` scripts of the deployment hosts. For more information, see the [ncs(1)](../../../man/ncs.1.md) in Manual Pages.

Whenever you start (or reload) the NSO daemon, it reads its configuration from `./ncs.conf` or `${NCS_DIR}/etc/ncs/ncs.conf` or from the file specified with the `-c` option. Parts of the configuration can also be placed in the `ncs.conf.d` directory that must be placed next to the actual `ncs.conf` file.

```bash
$ ncs
$ ncs --stop
$ ncs -h
...
```
