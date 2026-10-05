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

- [AuditNetworkNotification](AuditNetworkNotification.md#cls-AuditNetworkNotification)
- [AuditNotification](AuditNotification.md#cls-AuditNotification)
- [CallHomeInfoNotification](CallHomeInfoNotification.md#cls-CallHomeInfoNotification)
- [CommitDiffNotification](CommitDiffNotification.md#cls-CommitDiffNotification)
- [CommitFailedNotification](CommitFailedNotification.md#cls-CommitFailedNotification)
- [CommitNotification](CommitNotification.md#cls-CommitNotification)
- [CommitProgressNotification](CommitProgressNotification.md#cls-CommitProgressNotification)
- [CommitQueueProgressNotification](CommitQueueProgressNotification.md#cls-CommitQueueProgressNotification)
- [CompactionNotification](CompactionNotification.md#cls-CompactionNotification)
- [ConfirmNotification](ConfirmNotification.md#cls-ConfirmNotification)
- [ForwardNotification](ForwardNotification.md#cls-ForwardNotification)
- [HaNotification](HaNotification.md#cls-HaNotification)
- [HealtCheckNotification](HealtCheckNotification.md#cls-HealtCheckNotification)
- [HeartbeatNotification](HeartbeatNotification.md#cls-HeartbeatNotification)
- [Notif](Notif.md#cls-Notif)
- [NotifException](NotifException.md#cls-NotifException)
- [Notification](Notification.md#cls-Notification)
- [NotificationCfg](NotificationCfg.md#cls-NotificationCfg)
- [NotificationType](NotificationType.md#cls-NotificationType)
- [PackageReloadNotification](PackageReloadNotification.md#cls-PackageReloadNotification)
- [ProgressNotification](ProgressNotification.md#cls-ProgressNotification)
- [ReopenLogsNotification](ReopenLogsNotification.md#cls-ReopenLogsNotification)
- [SnmpaNotification](SnmpaNotification.md#cls-SnmpaNotification)
- [StreamNotification](StreamNotification.md#cls-StreamNotification)
- [SubagentNotification](SubagentNotification.md#cls-SubagentNotification)
- [SyslogNotification](SyslogNotification.md#cls-SyslogNotification)
- [SystemGoingDownNotification](SystemGoingDownNotification.md#cls-SystemGoingDownNotification)
- [UpgradeNotification](UpgradeNotification.md#cls-UpgradeNotification)
- [UserSessNotification](UserSessNotification.md#cls-UserSessNotification)
