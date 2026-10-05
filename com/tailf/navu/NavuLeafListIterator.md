<a id="s-NavuLeafListIterator"></a>
# NavuLeafListIterator

```java
public abstract class com.tailf.navu.NavuLeafListIterator
    implements java.util.Iterator<com.tailf.conf.ConfValue>
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue)

## Members

**Constructors**:

- [NavuLeafListIterator(NavuLeafList)](#s-NavuLeafListIterator-1)

**Fields**:

- [navuLeafList](#s-navuLeafList)

**Methods**:

- [encode()](../conf/ConfValue.md#s-encode) from ConfValue
- [equals(Object)](../conf/ConfValue.md#s-equals) from ConfValue
- [getNext()](#s-getNext)
- [getStringByValue(ConfPath, ConfValue)](../conf/ConfValue.md#s-getStringByValue) from ConfValue
- [getStringByValue(String, ConfValue)](../conf/ConfValue.md#s-getStringByValue-1) from ConfValue
- [getValueByString(ConfPath, String)](../conf/ConfValue.md#s-getValueByString) from ConfValue
- [getValueByString(String, String)](../conf/ConfValue.md#s-getValueByString-1) from ConfValue
- [hashCode()](../conf/ConfValue.md#s-hashCode) from ConfValue
- [hasNext()](#s-hasNext)
- [next()](#s-next)
- [remove()](#s-remove)
- [toString()](../conf/ConfValue.md#s-toString) from ConfValue

## Constructors

<a id="s-NavuLeafListIterator-1"></a>
### NavuLeafListIterator(NavuLeafList)

```java
protected NavuLeafListIterator(
    com.tailf.navu.NavuLeafList navuLeafList
)
    throws com.tailf.navu.NavuException
```

Types: [NavuLeafList](NavuLeafList.md#s-NavuLeafList), [NavuException](NavuException.md#s-NavuException)

**Parameters**

- `com.tailf.navu.NavuLeafList navuLeafList`


## Fields

<a id="s-navuLeafList"></a>
### navuLeafList

```java
protected com.tailf.navu.NavuLeafList navuLeafList = null;
```

Types: [NavuLeafList](NavuLeafList.md#s-NavuLeafList)


## Methods

<a id="s-getNext"></a>
### getNext()

```java
protected abstract com.tailf.conf.ConfValue getNext() throws Exception
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue)

<a id="s-hasNext"></a>
### hasNext()

```java
public boolean hasNext()
```

<a id="s-next"></a>
### next()

```java
public com.tailf.conf.ConfValue next()
```

Types: [ConfValue](../conf/ConfValue.md#s-ConfValue)

<a id="s-remove"></a>
### remove()

```java
public void remove()
```
