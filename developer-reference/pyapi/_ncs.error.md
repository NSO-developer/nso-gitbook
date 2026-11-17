# Python _ncs.error Module

This module defines new NCS Python API exception classes.

Instead of checking for CONFD_ERR or CONFD_EOF return codes all Python
module APIs raises an exception instead.

## Classes

### _class_ **EOF**

This exception will be thrown from an API function that, from a C perspective,
would result in a CONFD_EOF return value.

Members:

<details>

<summary>add_note(...)</summary>

Method:

Exception.add_note(note) --
add a note to the exception

</details>

<details>

<summary>args</summary>


</details>

<details>

<summary>with_traceback(...)</summary>

Method:

Exception.with_traceback(tb) --
set self.__traceback__ to tb and return self.

</details>

### _class_ **Error**

This exception will be thrown from an API function that, from a C perspective,
would result in a CONFD_ERR return value.

When the high-level `ncs.error` module is imported, which importing
 ncs does, a failure raises a subclass of this class for some error
codes, for example `ncs.error.NotFoundError`. The module also adds the
code attribute and the format() method to this class.

Available attributes:

* confd_errno -- the underlying error number
* confd_strerror -- string representation of the confd_errno
* confd_lasterr -- string with additional textual information
* strerror -- os error string (available if confd_errno is CONFD_ERR_OS)

Members:

<details>

<summary>add_note(...)</summary>

Method:

Exception.add_note(note) --
add a note to the exception

</details>

<details>

<summary>args</summary>


</details>

<details>

<summary>code</summary>

_Readonly property_

The error code as an ErrorCode enum member.

Falls back to the raw integer `confd_errno` if the value does not
correspond to a known `ErrorCode` member.

</details>

<details>

<summary>format(...)</summary>

Method:

```python
format(self: Any) -> str
```

Format as CODE_NAME: description (details).

This provides a richer format than the default str() representation.
The default str() preserves the original low-level format for
backward compatibility.

Example:

    try:
        maapi.connect(sock, '127.0.0.1', 9999)
    except Error as e:
        print(e.format())  # OS: system call failed (...)

</details>

<details>

<summary>with_traceback(...)</summary>

Method:

Exception.with_traceback(tb) --
set self.__traceback__ to tb and return self.

</details>

