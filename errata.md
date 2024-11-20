---
description: Corrections for the latest NSO release.
icon: file-circle-exclamation
---

# Errata

The following deprecation entry is missing from the CHANGES file shipped with the release:

```
Obsoleted query-timeout, connect-timeout, and new-session-timeout in
container /ncs-config/japi. The new container /ncs-config/api now
includes query-timeout, connect-timeout, new-session-timeout, and a
new timeout called action-timeout, which handles the action callback.
```
