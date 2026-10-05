# CLIInteraction <a href="#cls-CLIInteraction" id="cls-CLIInteraction"></a>

```java
public class com.tailf.maapi.CLIInteraction
```

Get CLI Interaction class for interaction with the user via the CLI.
 This class is retrieved using the [`Maapi#getCLIInteraction(int)`](Maapi.md#m-getCLIInteraction-9602971a279d)
 method as is intended to be used from inside an action callback

## Members

**Constructors**:

- [CLIInteraction(Maapi, int)](#m-CLIInteraction-6a1b37c9c9ba)

**Methods**:

- [cmd(String)](#m-cmd-eb782fd04760)
- [cmd(String, EnumSet<CLIInteractionFlag>)](#m-cmd-6c89d5978ec8)
- [cmd(String, EnumSet<CLIInteractionFlag>, String)](#m-cmd-2610c4fd95ef)
- [cmdIO(String, EnumSet<CLIInteractionFlag>, String)](#m-cmdIO-b5995307ada1)
- [get(String)](#m-get-e86cd4d90bf3)
- [printf(String, Object[])](#m-printf-a63ff41f959f)
- [prompt(String, boolean)](#m-prompt-297d27e3e528)
- [prompt(String, boolean, int)](#m-prompt-8d2b71411d58)
- [promptOneOf(String, String[], boolean)](#m-promptOneOf-a845984ad36e)
- [promptOneOf(String, String[], boolean, int)](#m-promptOneOf-0a6e79d200d3)
- [readEOF(boolean)](#m-readEOF-0a63a88d6c07)
- [readEOF(boolean, int)](#m-readEOF-303fe4cb25f2)
- [set(String, String)](#m-set-6cacddbc8231)
- [write(String)](#m-write-65e1fbc7c416)

## Constructors

### CLIInteraction(Maapi, int) <a href="#m-CLIInteraction-6a1b37c9c9ba" id="m-CLIInteraction-6a1b37c9c9ba"></a>

```java
protected CLIInteraction(com.tailf.maapi.Maapi maapi, int usid)
```

Types: [Maapi](Maapi.md#cls-Maapi)

**Parameters**

- `com.tailf.maapi.Maapi maapi`
- `int usid`


## Methods

### cmd(String) <a href="#m-cmd-eb782fd04760" id="m-cmd-eb782fd04760"></a>

```java
public synchronized void cmd(
    String command
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Execute CLI command in ongoing CLI session.

**Parameters**

- `String command`

**Throws**

- `IOException`
- `ConfException`

### cmd(String, EnumSet<CLIInteractionFlag>) <a href="#m-cmd-6c89d5978ec8" id="m-cmd-6c89d5978ec8"></a>

```java
public synchronized void cmd(
    String command,
    java.util.EnumSet<com.tailf.maapi.CLIInteractionFlag> flags
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#cls-CLIInteractionFlag), [ConfException](../conf/ConfException.md#cls-ConfException)

Execute CLI command in ongoing CLI session. The flags field is used to
 disable certain checks during the execution. The value is a EnumSet of
 the enumeration CLIInteractionFlag.

**Parameters**

- `String command`
- `java.util.EnumSet<com.tailf.maapi.CLIInteractionFlag> flags`

**Throws**

- `IOException`
- `ConfException`

### cmd(String, EnumSet<CLIInteractionFlag>, String) <a href="#m-cmd-2610c4fd95ef" id="m-cmd-2610c4fd95ef"></a>

```java
public synchronized void cmd(
    String command,
    java.util.EnumSet<com.tailf.maapi.CLIInteractionFlag> flags,
    String unhide
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [CLIInteractionFlag](CLIInteractionFlag.md#cls-CLIInteractionFlag), [ConfException](../conf/ConfException.md#cls-ConfException)

Execute CLI command in ongoing CLI session. The flags field is used to
 disable certain checks during the execution. The value is a EnumSet of
 the enumeration CLIInteractionFlag. The unhide parameter is used for
 passing a hide groups which is unhidden during the execution of the
 command.

**Parameters**

- `String command`
- `java.util.EnumSet<com.tailf.maapi.CLIInteractionFlag> flags`
- `String unhide`

**Throws**

- `IOException`
- `ConfException`

### cmdIO(String, EnumSet<CLIInteractionFlag>, String) <a href="#m-cmdIO-b5995307ada1" id="m-cmdIO-b5995307ada1"></a>

```java
public synchronized com.tailf.maapi.MaapiInputStream cmdIO(
    String command,
    java.util.EnumSet<com.tailf.maapi.CLIInteractionFlag> flags,
    String unhide
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [MaapiInputStream](MaapiInputStream.md#cls-MaapiInputStream), [CLIInteractionFlag](CLIInteractionFlag.md#cls-CLIInteractionFlag), [ConfException](../conf/ConfException.md#cls-ConfException)

Execute CLI command in ongoing CLI session and output result on socket.
 The flags field is used to disable certain checks during the execution.
 The value is a EnumSet of the enumeration CLIInteractionFlag. The unhide
 parameter is used for passing a hide groups which is unhidden during the
 execution of the command.

 Data is returned as a MaapiInputStream that is read until EOF.

**Parameters**

- `String command`
- `java.util.EnumSet<com.tailf.maapi.CLIInteractionFlag> flags`
- `String unhide`

**Returns:** MaapiInputStream

**Throws**

- `IOException`
- `ConfException`

### get(String) <a href="#m-get-e86cd4d90bf3" id="m-get-e86cd4d90bf3"></a>

```java
public synchronized String get(
    String parameter
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Read CLI session parameter.

**Parameters**

- `String parameter`

**Returns:** String

**Throws**

- `IOException`
- `ConfException`

### printf(String, Object[]) <a href="#m-printf-a63ff41f959f" id="m-printf-a63ff41f959f"></a>

```java
public synchronized void printf(
    String fmt,
    Object[] arguments
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Write to the CLI using printf formatting. This

**Parameters**

- `String fmt`
- `Object[] arguments`

**Throws**

- `IOException`
- `ConfException`

### prompt(String, boolean) <a href="#m-prompt-297d27e3e528" id="m-prompt-297d27e3e528"></a>

```java
public synchronized String prompt(
    String promptStr,
    boolean echo
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Prompt user for a string. The echo parameter is used to control if the
 input should be echoed or not. If set to true all input will be visible
 and if set to false only stars will be shown instead of the actual
 characters entered by the user. The resulting user string is returned.

**Parameters**

- `String promptStr`
- `boolean echo`

**Returns:** String

**Throws**

- `IOException`
- `ConfException`

### prompt(String, boolean, int) <a href="#m-prompt-8d2b71411d58" id="m-prompt-8d2b71411d58"></a>

```java
public synchronized String prompt(
    String promptStr,
    boolean echo,
    int timeout
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

This function does the same as prompt(String promptStr), but also takes a
 timeout parameter, which controls how long (in seconds) to wait for input
 before aborting.

**Parameters**

- `String promptStr`
- `boolean echo`
- `int timeout`

**Returns:** String

**Throws**

- `IOException`
- `ConfException`

### promptOneOf(String, String[], boolean) <a href="#m-promptOneOf-a845984ad36e" id="m-promptOneOf-a845984ad36e"></a>

```java
public synchronized String promptOneOf(
    String promptStr,
    String[] choice,
    boolean echo
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Prompt user for one of the strings given in the choice parameter.

 For example:



```
 CLIInteraction cli = maapi.getCLIInteraction(usid);
 String result =
     cli.promptOneOf(Do you want to proceed (yes/no): ,
                     new String[] { yes,
                     no }, true);
```



 The user can enter a unique prefix of the choice but the value returned
 will always be one of the strings provided in the choice parameter. If
 the user enters a value not in choice he will automatically be
 re-prompted.

 For example:



```
     Do you want to proceed (yes/no): maybe
     The value must be one of: yes,no.
     Do you want to proceed (yes/no):
```

**Parameters**

- `String promptStr`
- `String[] choice`
- `boolean echo`

**Returns:** String

**Throws**

- `IOException`
- `ConfException`

### promptOneOf(String, String[], boolean, int) <a href="#m-promptOneOf-0a6e79d200d3" id="m-promptOneOf-0a6e79d200d3"></a>

```java
public synchronized String promptOneOf(
    String promptStr,
    String[] choice,
    boolean echo,
    int timeout
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

This function does the same as promptOneOf(String promptStr, String[]
 choice, boolean echo), but also takes a timeout parameter. If no activity
 is seen for timeout seconds an error is thrown

**Parameters**

- `String promptStr`
- `String[] choice`
- `boolean echo`
- `int timeout`

**Returns:** String

**Throws**

- `IOException`
- `ConfException`

### readEOF(boolean) <a href="#m-readEOF-0a63a88d6c07" id="m-readEOF-0a63a88d6c07"></a>

```java
public synchronized String readEOF(
    boolean echo
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Read a multi line string from the CLI. The user has to end the input
 using ctrl-D. The entered characters is returned as a String. The echo
 parameters controls if the entered characters should be echoed or not. If
 set to true they will be visible and if set to false stars will be
 echoed instead.

**Parameters**

- `boolean echo`

**Returns:** String

**Throws**

- `IOException`
- `ConfException`

### readEOF(boolean, int) <a href="#m-readEOF-303fe4cb25f2" id="m-readEOF-303fe4cb25f2"></a>

```java
public synchronized String readEOF(
    boolean echo,
    int timeout
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

This function does the same as readEOF(boolean echo), but also takes a
 timeout parameter, which indicates how long the user may be idle (in
 seconds) before the reading is aborted.

**Parameters**

- `boolean echo`
- `int timeout`

**Returns:** String

**Throws**

- `IOException`
- `ConfException`

### set(String, String) <a href="#m-set-6cacddbc8231" id="m-set-6cacddbc8231"></a>

```java
public synchronized void set(
    String parameter,
    String value
)
    throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Set CLI session parameter.

**Parameters**

- `String parameter`
- `String value`

**Throws**

- `IOException`
- `ConfException`

### write(String) <a href="#m-write-65e1fbc7c416" id="m-write-65e1fbc7c416"></a>

```java
public synchronized void write(String str) throws java.io.IOException, com.tailf.conf.ConfException
```

Types: [ConfException](../conf/ConfException.md#cls-ConfException)

Write to the CLI.

**Parameters**

- `String str`

**Throws**

- `IOException`
- `ConfException`
