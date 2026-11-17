# MaapiAuthentication <a href="#maapiauthentication-b8288dadf67d" id="maapiauthentication-b8288dadf67d"></a>

```java
public class com.tailf.maapi.MaapiAuthentication
```

Authentication result container. This class is returned as result of a
 authentication attempt using [`Maapi#authenticate(String, String)`](Maapi.md#authenticate-9b081cc66ee1)

## Members

**Constructors**:

- [MaapiAuthentication\(ConfEObject\)](#maapiauthentication-13a9030ac9e6)

**Methods**:

- [getGroups\(\)](#getgroups-42a63746c815)
- [getReason\(\)](#getreason-5eb89e7b2733)
- [isValid\(\)](#isvalid-9646fea474d9)

## Constructors

### MaapiAuthentication(ConfEObject) <a href="#maapiauthentication-13a9030ac9e6" id="maapiauthentication-13a9030ac9e6"></a>

```java
public MaapiAuthentication(com.tailf.proto.ConfEObject o) throws com.tailf.maapi.MaapiException
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350), [MaapiException](MaapiException.md#maapiexception-af58eb4e109e)

**Parameters**

- `com.tailf.proto.ConfEObject o`


## Methods

### getGroups() <a href="#getgroups-42a63746c815" id="getgroups-42a63746c815"></a>

```java
public String[] getGroups()
```

### getReason() <a href="#getreason-5eb89e7b2733" id="getreason-5eb89e7b2733"></a>

```java
public String getReason()
```

### isValid() <a href="#isvalid-9646fea474d9" id="isvalid-9646fea474d9"></a>

```java
public boolean isValid()
```
