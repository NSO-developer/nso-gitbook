---
description: Run NSO as non-root user.
---

# Run NSO as Non-Privileged User

A common misfeature found on UNIX operating systems is the restriction that only `root` can bind to ports below 1024. Many a dollar has been wasted on workarounds, and often the results are security holes.

Both FreeBSD and Solaris have elegant configuration options to turn this feature off. On FreeBSD:

```bash
# sysctl net.inet.ip.portrange.reservedhigh=0
```

The above is best added to your `/etc/sysctl.conf`.

Similarly, on Solaris, we can just configure this. Assuming we want to run NSO under a non-root user `ncs`. On Solaris, we can do that easily by granting the specific right to bind privileged ports below 1024 (and only that) to the `ncs` user using:

```bash
# /usr/sbin/usermod -K defaultpriv=basic,net_privaddr ncs
```

And check that we get what we want through:

```bash
# grep ncs /etc/user_attr
ncs::::type=normal;defaultpriv=basic,net_privaddr
```

Linux doesn't have anything like the above. There are a couple of options on Linux. The best is to use an auxiliary program like `authbind` (`http://packages.debian.org/stable/authbind`) or `privbind` (`http://sourceforge.net/projects/privbind/`).

These programs are run by `root`. To start NCS under e.g., `privbind`, we can do:

```bash
# privbind -u ncs /opt/ncs/current/bin/ncs -c /etc/ncs.conf
```

The above command starts NSO as the user `ncs` and binds to ports below 1024.
