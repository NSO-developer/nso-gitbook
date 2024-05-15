---
description: Perform backup and restore of your NSO installation.
---

# Backup and Restore

All parts of the NSO installation can be backed up and restored with standard file system backup procedures.

The most convenient way to do backup and restore is to use the `ncs-backup` command. In that case, the following procedure is used.

## Take a Backup <a href="#d5e7884" id="d5e7884"></a>

NSO Backup backs up the database (CDB) files, state files, config files, and rollback files from the installation directory. To take a complete backup (for disaster recovery), use:

```
# ncs-backup
```

The backup will be stored in the "run directory", by default `/var/opt/ncs`, as `/var/opt/ncs/backups/ncs-VERSION@DATETIME.backup`.

For more information on backup, refer to the [ncs-backup(1)](https://developer.cisco.com/docs/nso-guides-6.1/#!ncs-man-pages-volume-1/man.1.ncs-backup) in Manual Pages.

## Restore a Backup <a href="#d5e7896" id="d5e7896"></a>

NSO Restore is performed if you would like to switch back to a previous good state or restore a backup.

It is always advisable to stop NSO before performing a restore.

1.  First stop NSO if NSO is not stopped yet.

    ```
    /etc/init.d/ncs stop
    ```


2.  Restore the backup.

    ```
    ncs-backup --restore
    ```

    \
    Select the backup to be restored from the available list of backups. The configuration and database with run-time state files are restored in `/etc/ncs` and `/var/opt/ncs`.
3.  Start NSO.

    ```
    /etc/init.d/ncs start
    ```
