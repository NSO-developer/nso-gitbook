# Python ncs.service_log Module

This module provides service logging

## Classes

### _class_ **ServiceLog**

This class contains methods to write service log entries.

ServiceLog(node_or_maapi)

Initialize a service log object.

Members:

<details>

<summary>debug(...)</summary>

Method:

```python
debug(self, path, msg, type)
```

Log a debug message.

</details>

<details>

<summary>error(...)</summary>

Method:

```python
error(self, path, msg, type)
```

Log an error message.

</details>

<details>

<summary>info(...)</summary>

Method:

```python
info(self, path, msg, type)
```

Log an information message.

</details>

<details>

<summary>trace(...)</summary>

Method:

```python
trace(self, path, msg, type)
```

Log a trace message.

</details>

<details>

<summary>warn(...)</summary>

Method:

```python
warn(self, path, msg, type)
```

Log an warning message.

</details>

