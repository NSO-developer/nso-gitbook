---
description: Remove System Install.
---

# Uninstall System Install

{% hint style="warning" %}
Applies to System Install.
{% endhint %}

NSO can be uninstalled using the [ncs-installer(1)](https://developer.cisco.com/docs/nso-guides-6.1/#!manual-pages/man.1.ncs-installer) option only if NSO is installed with `--system-install` option. Either part of the static files or the full installation can be removed using `ncs-uninstall` option. Ensure to stop NSO before uninstalling.

```
# ncs-uninstall --all
```

Executing the above command removes the Installation Directory `/opt/ncs` including symbolic links, Configuration Directory `/etc/ncs`, Run Directory `/var/opt/ncs`, Log Directory `/var/log/ncs`, init scripts from `/etc/init.d` and user profile scripts from `/etc/profile.d`.

To make sure that no license entitlements are consumed after you have uninstalled NSO, be sure to perform the deregister command in the CLI:

```
admin@ncs# license smart deregister
```
