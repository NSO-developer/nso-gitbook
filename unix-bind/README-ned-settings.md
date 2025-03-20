# NED settings details
----------------------

  This NED is equipped with a number of runtime configuration options "NED settings" allowing for
  customization by the end user. All options are configurable using the NSO API for NED settings.
  Most NED settings can be configured globally, per device profile or per device instance in the
  following locations:

  global
    /ncs:devices/global-settings/ned-settings/unix-bind/
  profile
    /ncs:devices/ncs:profiles/profile:<name>/ned-settings/unix-bind/
  device
    /ncs:/device/devices/device:<name>/ned-settings/unix-bind/

  Profiles setting overrides global-settings and device settings override profile settings,
  hence the narrowest scope of the setting is used by the device.

  If user changes a ned-setting, then user must reconnect to the device, i.e.
  disconnect and connect in order for the new setting to take effect.

  From the NSO CLI the device instance NED settings for this NED are available under:

   ```
   # config
   # devices device dev-1 ned-settings unix-bind

   Press TAB to see all the NED settings.

   ```


# Table of contents
-------------------

  ```
  1. ned-settings unix-bind
  2. common-settings
  3. file-settings
     3.1. record-files
  4. connection
  5. logger
  6. developer
  ```


# 1. ned-settings unix-bind
---------------------------


# 2. ned-settings unix-bind common-settings
-------------------------------------------


    - common-settings username <string>

      Southbound username used for backing up the files.


# 3. ned-settings unix-bind file-settings
-----------------------------------------


    - file-settings warning-message-separator <string>

      WarningMessage string for delimiting the NED managed section; Separate the lines using newline
      separator (Unix style LF)!.


    - file-settings file-dir-backup <string>

      Backup directory for db files ; defaults to: /usr/local/bind9/backup.


    - file-settings file-staging-dir <string>

      Staging directory for db files; defaults to: /ned-staging-tmp.


## 3.1. ned-settings unix-bind file-settings record-files
---------------------------------------------------------

  [IMPORTANT] Resource Record file list managed by the NED.

    - file-settings record-files <absolute-name>

      - absolute-name <string>

        Note, use absolute file paths here; complete path + filename to file located on the DNS
        server.


# 4. ned-settings unix-bind connection
--------------------------------------

  Configure settings specific to the connection between NED and device.


    - connection ssh client <enum>

      Configure the SSH client to use. Relevant only when using the NED with NSO 5.6 or later.

      ganymed  - The legacy SSH client. Used on all older versions of NSO.

      sshj     - The new SSH client with support for the latest crypto features. This is the default
                 when using the NED on NSO 5.6 or later.


    - connection ssh host-key known-hosts-file <string>

      Path to openssh formatted 'known_hosts' file containing valid host keys.


    - connection ssh host-key public-key-file <string>

      Path to openssh formatted public (.pub) host key file.


    - connection ssh auth-key private-key-file <string>

      Path to openssh formatted private key file.


    - connection ssl accept-any <true|false> (default true)

      Accept any SSL certificate presented by the device.
      Warning! This enables Man in the Middle attacks and
      should only be used for testing and troubleshooting.


    - connection ssl certificate <binary>

      SSL certificate stored in DER format but since it is entered
      as Base64 it is very similar to PEM but without banners like
      "----- BEGIN CERTIFICATE -----".

      Default uses the default trusted certificates installed in
      Java JVM.

      An easy way to get the PEM of a server:
      openssl s_client -connect HOST:PORT


# 5. ned-settings unix-bind logger
----------------------------------

  Settings for controlling logs generated.


    - logger level <enum> (default debug)

      Set level of logging.

      error    - error.

      info     - info.

      verbose  - verbose.

      debug    - debug.


    - logger java <true|false> (default true)

      Toggle logs to be added to ncs-java-vm.log.


# 6. ned-settings unix-bind developer
-------------------------------------

  Contains settings used for debugging (intended for NED developers).


    - developer progress-verbosity <enum> (default debug)

      Maximum NED verbosity level which will get written in devel.log file.

      disabled      - disabled.

      normal        - normal.

      verbose       - verbose.

      very-verbose  - very-verbose.

      debug         - debug.


    - developer platform model <string>

      Override device model name/number.


    - developer platform name <string>

      Override device name.


    - developer platform version <string>

      Override device version.


# 7. IMPORTANT notes on NED-SETTINGS above:

## - The NED relies on the NED-settings defined in order to synchronize and manage target device content. 
## - The NED will manage the *.db files used by bind9 server configurations. 
### - The management of the resource records addresses NAPTR and A Records only at this time. 
##  - It is mandatory to properly define unix-bind file-settings section and record files. 
## - It is also mandatory to have write access to the nso and configured ned-settings user which refers to a system user. 

--- 

### 7.1 Define the BIND9 specific Record files : 
- Read/Write access is needed for configured files and file locations. 
- For example, to add the record files, one must create entries under ned-settings unix-bind file-settings record-files list for each file to be managed:

```
devices device <device-name> ned-settings unix-bind file-settings record-files </full/path/to/fileName1.ext>
devices device <device-name> ned-settings unix-bind file-settings record-files </full/path/to/fileName2.db>
      ...
devices device <device-name> ned-settings unix-bind file-settings record-files </full/path/to/fileName3.txt>
```

### 7.2 Backup directory and usage:
- Although optional, `ned-settings unix-bind file-dir-backup` was generally set to : "/usr/local/bind9/backup". 
- Read/Write access is needed to the backup folder/dir. 
```
devices device <device-name> ned-settings unix-bind file-settings file-dir-backup </full/path/to/backup-folder>
```
### Warning! Not setting file-dir-backup will DISABLE file backup in the pre-commit phase! [UBIND-40]

### 7.3 File staging directory

- Optional as well, it shoul be defaulted to `/ned-staging-tmp`.
- RW access needed to it. 

- Explicitly set it to other path:
```
devices device <device-name> ned-settings unix-bind file-settings file-staging-dir </full/path/to/staging-folder>
```

### 7.4 Warning message separator 
### Optional, but critical when used; please read below points carefully
### Conventions to be adopted for the correct warning message separator usage:
- Use bind9 syntax for the comments (start each line with a ';'
- Use unix style newline separator '\n' to define each new line
- Enter the entire message as a string, quoted to preserve the desired message format
- If no message is defined, the default value below will be used.
- The db record files must be cleaned of the previous warning messages
- The warning messages must not be interleaved. Only one shall be used per NCS server instance.
- The warning message will be handled line by line by splitting the string by newline (\n).
- Keep the first line of the message different to the syntax of NAPTR or A records

### Example of default value (between quotes, escaped) to be set : ###
```
          "; BEWARE ==========================================================\n
           ; The below section of the file has been auto-generated by the NED.\n
           ; DO NOT edit manually.\n
           ; BEWARE ==========================================================\n\n"
```


```
devices device <device-name> ned-settings unix-bind file-settings warning-message-separator ";<MESSAGE LINE 1>\n;<MESSAGE LINE 2>\n ... \n"
```
## -> Note that the warning message must end with at least one newline! 


###  7.5 Define southbound/system username used for backing up the files

```
devices device <device-name> ned-settings unix-bind common-settings username <backup-user-name>
```

### > Commit and Sync-from after updating ned settings as described above to get the data accordingly.
