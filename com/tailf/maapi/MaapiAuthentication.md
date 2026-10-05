<a id="s-MaapiAuthentication"></a>
# MaapiAuthentication

```java
public class com.tailf.maapi.MaapiAuthentication
```

Authentication result container. This class is returned as result of a
 authentication attempt using [`Maapi`](Maapi.md#s-Maapi)

## Members

**Constructors**:

- [MaapiAuthentication(ConfEObject)](#s-MaapiAuthentication-1)

**Methods**:

- [getGroups()](#s-getGroups)
- [getReason()](#s-getReason)
- [isValid()](#s-isValid)

## Constructors

<a id="s-MaapiAuthentication-1"></a>
### MaapiAuthentication(ConfEObject)

```java
public MaapiAuthentication(com.tailf.proto.ConfEObject o) throws com.tailf.maapi.MaapiException
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject), [MaapiException](MaapiException.md#s-MaapiException)

**Parameters**

- `com.tailf.proto.ConfEObject o`


## Methods

<a id="s-getGroups"></a>
### getGroups()

```java
public String[] getGroups()
```

<a id="s-getReason"></a>
### getReason()

```java
public String getReason()
```

<a id="s-isValid"></a>
### isValid()

```java
public boolean isValid()
```
