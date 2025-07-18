# Python ncs.log Module

This module provides some logging utilities.

## Functions

### init_logging

```python
init_logging(vmid, log_file, log_level)
```

Initialize logging

### log_datefmt

```python
log_datefmt()
```

Return date format used in logging.

### log_file

```python
log_file()
```

Return log file used, if any else None

### log_format

```python
log_format()
```

Return log format.

### log_handler

```python
log_handler()
```

Return log handler used, if any else None

### mk_log_formatter

```python
mk_log_formatter()
```

Create log formatter with log and date format setup

### reopen_logs

```python
reopen_logs()
```

Re-open log files if log handler is set

### set_log_level

```python
set_log_level(vmid, log_level)
```

Set log level on the vmid logger and root logger


## Classes

### _class_ **Log**

A log helper class.

This class makes it easier to write log entries. It encapsulates
another log object that supports Python standard log interface, and
makes it easier to format the log message be adding the ability to
support multiple arguments.

Example use:

    import logging
    import confd.log

    logger = logging.getLogger(__name__)
    mylog = confd.log.Log(logger)

    count = 3
    name = 'foo'
    mylog.debug('got ', count, ' values from ', name)

```python
Log(logobject, add_timestamp=False)
```

Initialize a Log object.

The argument 'logobject' is mandatory and can be any object which
should support as least one of the standard log methods (info, warning,
error, critical, debug). If 'add_timestamp' is set to True a time stamp
will precede your log message.

Members:

<details>

<summary>critical(...)</summary>

Method:

```python
critical(self, *args)
```

Log a critical message.

</details>

<details>

<summary>debug(...)</summary>

Method:

```python
debug(self, *args)
```

Log a debug message.

</details>

<details>

<summary>error(...)</summary>

Method:

```python
error(self, *args)
```

Log an error message.

</details>

<details>

<summary>exception(...)</summary>

Method:

```python
exception(self, *args)
```

Log an exception message.

</details>

<details>

<summary>fatal(...)</summary>

Method:

```python
fatal(self, *args)
```

Just calls critical().

</details>

<details>

<summary>info(...)</summary>

Method:

```python
info(self, *args)
```

Log an information message.

</details>

<details>

<summary>warning(...)</summary>

Method:

```python
warning(self, *args)
```

Log a warning message.

</details>

### _class_ **ParentProcessLogHandler**


```python
ParentProcessLogHandler(log_q)
```

Members:

<details>

<summary>acquire(...)</summary>

Method:

```python
acquire(self)
```

Acquire the I/O thread lock.

</details>

<details>

<summary>addFilter(...)</summary>

Method:

```python
addFilter(self, filter)
```

Add the specified filter to this handler.

</details>

<details>

<summary>close(...)</summary>

Method:

```python
close(self)
```

Tidy up any resources used by the handler.

This version removes the handler from an internal map of handlers,
_handlers, which is used for handler lookup by name. Subclasses
should ensure that this gets called from overridden close()
methods.

</details>

<details>

<summary>createLock(...)</summary>

Method:

```python
createLock(self)
```

Acquire a thread lock for serializing access to the underlying I/O.

</details>

<details>

<summary>emit(...)</summary>

Method:

```python
emit(self, record)
```

Emit log record by sending a pre-formatted record to the parent
process

</details>

<details>

<summary>filter(...)</summary>

Method:

```python
filter(self, record)
```

Determine if a record is loggable by consulting all the filters.

The default is to allow the record to be logged; any filter can veto
this by returning a false value.
If a filter attached to a handler returns a log record instance,
then that instance is used in place of the original log record in
any further processing of the event by that handler.
If a filter returns any other true value, the original log record
is used in any further processing of the event by that handler.

If none of the filters return false values, this method returns
a log record.
If any of the filters return a false value, this method returns
a false value.

.. versionchanged:: 3.2

   Allow filters to be just callables.

.. versionchanged:: 3.12
   Allow filters to return a LogRecord instead of
   modifying it in place.

</details>

<details>

<summary>flush(...)</summary>

Method:

```python
flush(self)
```

Flushes the stream.

</details>

<details>

<summary>format(...)</summary>

Method:

```python
format(self, record)
```

Format the specified record.

If a formatter is set, use it. Otherwise, use the default formatter
for the module.

</details>

<details>

<summary>get_name(...)</summary>

Method:

```python
get_name(self)
```


</details>

<details>

<summary>handle(...)</summary>

Method:

```python
handle(self, record)
```

Conditionally emit the specified logging record.

Emission depends on filters which may have been added to the handler.
Wrap the actual emission of the record with acquisition/release of
the I/O thread lock.

Returns an instance of the log record that was emitted
if it passed all filters, otherwise a false value is returned.

</details>

<details>

<summary>handleError(...)</summary>

Method:

```python
handleError(self, record)
```

Handle errors which occur during an emit() call.

This method should be called from handlers when an exception is
encountered during an emit() call. If raiseExceptions is false,
exceptions get silently ignored. This is what is mostly wanted
for a logging system - most users will not care about errors in
the logging system, they are more interested in application errors.
You could, however, replace this with a custom handler if you wish.
The record which was being processed is passed in to this method.

</details>

<details>

<summary>name</summary>


</details>

<details>

<summary>release(...)</summary>

Method:

```python
release(self)
```

Release the I/O thread lock.

</details>

<details>

<summary>removeFilter(...)</summary>

Method:

```python
removeFilter(self, filter)
```

Remove the specified filter from this handler.

</details>

<details>

<summary>setFormatter(...)</summary>

Method:

```python
setFormatter(self, fmt)
```

Set the formatter for this handler.

</details>

<details>

<summary>setLevel(...)</summary>

Method:

```python
setLevel(self, level)
```

Set the logging level of this handler.  level must be an int or a str.

</details>

<details>

<summary>setStream(...)</summary>

Method:

```python
setStream(self, stream)
```

Sets the StreamHandler's stream to the specified value,
if it is different.

Returns the old stream, if the stream was changed, or None
if it wasn't.

</details>

<details>

<summary>set_name(...)</summary>

Method:

```python
set_name(self, name)
```


</details>

<details>

<summary>terminator</summary>

```python
terminator = '\n'
```


</details>

