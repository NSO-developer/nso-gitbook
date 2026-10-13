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

- [AuditNetworkNotification](AuditNetworkNotification.md#auditnetworknotification-8c937b78f433)
- [AuditNotification](AuditNotification.md#auditnotification-7a35f4700e9c)
- [CallHomeInfoNotification](CallHomeInfoNotification.md#callhomeinfonotification-d29c7e74561c)
- [CommitDiffNotification](CommitDiffNotification.md#commitdiffnotification-c6f5ad668010)
- [CommitFailedNotification](CommitFailedNotification.md#commitfailednotification-bef571382961)
- [CommitNotification](CommitNotification.md#commitnotification-30ba63db10de)
- [CommitProgressNotification](CommitProgressNotification.md#commitprogressnotification-700cb70f0b31)
- [CommitQueueProgressNotification](CommitQueueProgressNotification.md#commitqueueprogressnotification-a2a32afaa4c3)
- [CompactionNotification](CompactionNotification.md#compactionnotification-401ddf1907af)
- [ConfirmNotification](ConfirmNotification.md#confirmnotification-10447869c375)
- [ForwardNotification](ForwardNotification.md#forwardnotification-1c104ab318e3)
- [HaNotification](HaNotification.md#hanotification-18807803b5fa)
- [HealtCheckNotification](HealtCheckNotification.md#healtchecknotification-ed82ebc35dd0)
- [HeartbeatNotification](HeartbeatNotification.md#heartbeatnotification-0af557025d11)
- [Notif](Notif.md#notif-09a310797640)
- [NotifException](NotifException.md#notifexception-d843ea72ec3f)
- [Notification](Notification.md#notification-b2e7d82d4215)
- [NotificationCfg](NotificationCfg.md#notificationcfg-9d212d006400)
- [NotificationType](NotificationType.md#notificationtype-1f10f57e184d)
- [PackageReloadNotification](PackageReloadNotification.md#packagereloadnotification-d077e4cc2049)
- [ProgressNotification](ProgressNotification.md#progressnotification-97286de4fe31)
- [ReopenLogsNotification](ReopenLogsNotification.md#reopenlogsnotification-1b749f5f2295)
- [SnmpaNotification](SnmpaNotification.md#snmpanotification-1dc17468977a)
- [StreamNotification](StreamNotification.md#streamnotification-80461d0dc6f6)
- [SubagentNotification](SubagentNotification.md#subagentnotification-d8adb6073ef3)
- [SyslogNotification](SyslogNotification.md#syslognotification-5d0087332348)
- [SystemGoingDownNotification](SystemGoingDownNotification.md#systemgoingdownnotification-b2014b44eb10)
- [UpgradeNotification](UpgradeNotification.md#upgradenotification-8f9e3ffbdab5)
- [UserSessNotification](UserSessNotification.md#usersessnotification-da9415293f94)
