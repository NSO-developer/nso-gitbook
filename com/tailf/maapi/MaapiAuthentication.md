# MaapiAuthentication <a href="#cls-MaapiAuthentication" id="cls-MaapiAuthentication"></a>

```java
public class com.tailf.maapi.MaapiAuthentication
```

Authentication result container. This class is returned as result of a
 authentication attempt using [`Maapi#authenticate(String, String)`](Maapi.md#m-authenticate-9b081cc66ee1)

## Members

**Constructors**:

- [MaapiAuthentication(ConfEObject)](#m-MaapiAuthentication-13a9030ac9e6)

**Methods**:

- [getGroups()](#m-getGroups-42a63746c815)
- [getReason()](#m-getReason-5eb89e7b2733)
- [isValid()](#m-isValid-9646fea474d9)

## Constructors

### MaapiAuthentication(ConfEObject) <a href="#m-MaapiAuthentication-13a9030ac9e6" id="m-MaapiAuthentication-13a9030ac9e6"></a>

```java
public MaapiAuthentication(com.tailf.proto.ConfEObject o) throws com.tailf.maapi.MaapiException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [MaapiException](MaapiException.md#cls-MaapiException)

**Parameters**

- `com.tailf.proto.ConfEObject o`


## Methods

### getGroups() <a href="#m-getGroups-42a63746c815" id="m-getGroups-42a63746c815"></a>

```java
public String[] getGroups()
```

### getReason() <a href="#m-getReason-5eb89e7b2733" id="m-getReason-5eb89e7b2733"></a>

```java
public String getReason()
```

### isValid() <a href="#m-isValid-9646fea474d9" id="m-isValid-9646fea474d9"></a>

```java
public boolean isValid()
```
