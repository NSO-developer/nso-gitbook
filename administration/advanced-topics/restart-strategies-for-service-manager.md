---
description: Restart strategy for the service manager.
---

# Service Manager Restart

The service manager executes in a Java VM outside of NSO. The `NcsMux` initializes a number of sockets to NSO at startup. These are Maapi sockets and data provider sockets. NSO can choose to close any of these sockets whenever NSO requests the service manager to perform a task, and that task is not finished within the stipulated timeout. If that happens, the service manager must be restarted. The timeout(s) are controlled by several `ncs.conf` parameters found under `/ncs-config/japi`.
