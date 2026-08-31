---
description: Start and stop the NSO daemon.
---

# Start and Stop NSO

{% hint style="warning" %}
Applies to Local Install.
{% endhint %}

The command `ncs -h` shows various options when starting NSO. By default, NSO starts in the background without an associated terminal. A Local Install is intended for development, lab, and evaluation use. For an always-on production deployment managed by the operating system, use a [System Install](../system-install.md) and the generated systemd service. For more information about the `ncs` command, see the [ncs(1)](../../../resources/man/ncs.1.md) in Manual Pages.

Whenever you start (or reload) the NSO daemon, it reads its configuration from `./ncs.conf` or `${NCS_DIR}/etc/ncs/ncs.conf` or from the file specified with the `-c` option. Parts of the configuration can also be placed in the `ncs.conf.d` directory that must be placed next to the actual `ncs.conf` file.

```bash
$ ncs
$ ncs --stop
$ ncs -h
...
```
