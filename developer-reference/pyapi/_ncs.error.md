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

<summary>with_traceback(...)</summary>

Method:

Exception.with_traceback(tb) --
set self.__traceback__ to tb and return self.

</details>

