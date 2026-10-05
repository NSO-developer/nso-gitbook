<a id="cls-DpExceptionReporter"></a>
# DpExceptionReporter

```java
public interface com.tailf.dp.DpExceptionReporter
```

Interface for the user of the Dp deamon to handle catched exceptions
 in the implicit threads started in the Dp.read() method

## Members

**Methods**:

- [reportException(Throwable)](#m-reportexception-f2030dd5aa98)

## Methods

<a id="m-reportexception-f2030dd5aa98"></a>
### reportException(Throwable)

```java
public abstract boolean reportException(Throwable e)
```

Method called when exceptions are catched in the internal threads
 started in the Dp.read() method.

 If this callback is registered the Dp will delegate the handling
 of the exception to this method and the returning boolean defines if
 the Dp thread should throw a RuntimeException with the catched
 exception as cause

**Parameters**

- `Throwable e` - the catched exception

**Returns:** boolean if true the Dp thread will throw a new RuntimeException
 with exception e as cause
