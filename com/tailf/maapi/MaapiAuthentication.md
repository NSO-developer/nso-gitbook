<a id="cls-MaapiAuthentication"></a>
# MaapiAuthentication

```java
public class com.tailf.maapi.MaapiAuthentication
```

Authentication result container. This class is returned as result of a
 authentication attempt using [`Maapi#authenticate(String, String)`](Maapi.md#m-authenticate-9b081cc66ee1)

## Members

**Constructors**:

- [MaapiAuthentication(ConfEObject)](#m-maapiauthentication-13a9030ac9e6)

**Methods**:

- [getGroups()](#m-getgroups-42a63746c815)
- [getReason()](#m-getreason-5eb89e7b2733)
- [isValid()](#m-isvalid-9646fea474d9)

## Constructors

<a id="m-maapiauthentication-13a9030ac9e6"></a>
### MaapiAuthentication(ConfEObject)

```java
public MaapiAuthentication(com.tailf.proto.ConfEObject o) throws com.tailf.maapi.MaapiException
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject), [MaapiException](MaapiException.md#cls-MaapiException)

**Parameters**

- `com.tailf.proto.ConfEObject o`


## Methods

<a id="m-getgroups-42a63746c815"></a>
### getGroups()

```java
public String[] getGroups()
```

<a id="m-getreason-5eb89e7b2733"></a>
### getReason()

```java
public String getReason()
```

<a id="m-isvalid-9646fea474d9"></a>
### isValid()

```java
public boolean isValid()
```
