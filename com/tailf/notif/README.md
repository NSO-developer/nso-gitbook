# com.tailf.notif

Package for subscription to asynchronous events.

  The server can deliver various classes of events to subscribing
  applications. The architecture is based on notification sockets.
  An application connects a notification socket to the server and
  provides a bit mask indicating which types of events it is interested in.

  The following is a list of the different asynchronous event classes that
  can be delivered from the server to the application(s)


- NOTIF_AUDIT - Audit events.
    - NOTIF_COMMIT_DIFF - A complete diff compared to previous configuration.
      - NOTIF_COMMIT_FAILED - Failed commit events.
        - NOTIF_COMMIT_SIMPLE - Commit events.
          - NOTIF_COMMIT_PROGRESS - Commit in progress events.
            - NOTIF_CONFIRMED_COMMIT - Confirmed commit events.
              - NOTIF_FORWARD_INFO - Forward northbound agent events.
                - NOTIF_HA_INFO - Changes in ConfD/NCS's perception of the cluster
  configuration.
                  - NOTIF_HEARTBEAT - Heartbeat events.
                    - NOTIF_SNMPA - SNMP agent audit log.
                      - NOTIF_SUBAGENT_INFO - Subagent related events.
                        - NOTIF_SYSLOG - Syslog events.
                          - NOTIF_UPGRADE_EVENT - Upgrade events.
                            - NOTIF_COMPACTION - Compaction events.
                              - NOTIF_USER_SESSION - Whenever a user session is started or stopped.

## Types

- [AuditNetworkNotification](AuditNetworkNotification.md#s-AuditNetworkNotification)
- [AuditNotification](AuditNotification.md#s-AuditNotification)
- [CallHomeInfoNotification](CallHomeInfoNotification.md#s-CallHomeInfoNotification)
- [CommitDiffNotification](CommitDiffNotification.md#s-CommitDiffNotification)
- [CommitFailedNotification](CommitFailedNotification.md#s-CommitFailedNotification)
- [CommitNotification](CommitNotification.md#s-CommitNotification)
- [CommitProgressNotification](CommitProgressNotification.md#s-CommitProgressNotification)
- [CommitQueueProgressNotification](CommitQueueProgressNotification.md#s-CommitQueueProgressNotification)
- [CompactionNotification](CompactionNotification.md#s-CompactionNotification)
- [ConfirmNotification](ConfirmNotification.md#s-ConfirmNotification)
- [ForwardNotification](ForwardNotification.md#s-ForwardNotification)
- [HaNotification](HaNotification.md#s-HaNotification)
- [HealtCheckNotification](HealtCheckNotification.md#s-HealtCheckNotification)
- [HeartbeatNotification](HeartbeatNotification.md#s-HeartbeatNotification)
- [Notif](Notif.md#s-Notif)
- [NotifException](NotifException.md#s-NotifException)
- [Notification](Notification.md#s-Notification)
- [NotificationCfg](NotificationCfg.md#s-NotificationCfg)
- [NotificationType](NotificationType.md#s-NotificationType)
- [PackageReloadNotification](PackageReloadNotification.md#s-PackageReloadNotification)
- [ProgressNotification](ProgressNotification.md#s-ProgressNotification)
- [ReopenLogsNotification](ReopenLogsNotification.md#s-ReopenLogsNotification)
- [SnmpaNotification](SnmpaNotification.md#s-SnmpaNotification)
- [StreamNotification](StreamNotification.md#s-StreamNotification)
- [SubagentNotification](SubagentNotification.md#s-SubagentNotification)
- [SyslogNotification](SyslogNotification.md#s-SyslogNotification)
- [SystemGoingDownNotification](SystemGoingDownNotification.md#s-SystemGoingDownNotification)
- [UpgradeNotification](UpgradeNotification.md#s-UpgradeNotification)
- [UserSessNotification](UserSessNotification.md#s-UserSessNotification)
