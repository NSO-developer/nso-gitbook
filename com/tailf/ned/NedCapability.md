<a id="cls-NedCapability"></a>
# NedCapability

```java
public class com.tailf.ned.NedCapability
```

NedCapability is used to communicate the capabilities (supported
 namespace, revision, features and deviations) of a NedConnection
 (NedGeneric or NedCli).

## Members

**Constructors**:

- [NedCapability(String, String)](#m-nedcapability-cbee6d94f26b)
- [NedCapability(String, String, List<String>, String, List<String>)](#m-nedcapability-0618acf74952)
- [NedCapability(String, String, String, List<String>, String, List<String>)](#m-nedcapability-a0ce331f8ac0)

**Methods**:

- [encode()](#m-encode-fbae522bba37)
- [getDeviations()](#m-getdeviations-635611da0c3c)
- [getFeatures()](#m-getfeatures-2b82b997b3cb)
- [getModule()](#m-getmodule-68694513ccce)
- [getName()](#m-getname-2634b18b4a25)
- [getRevision()](#m-getrevision-b0088aa9f0bf)
- [getURI()](#m-geturi-7ec1ffd8cd93)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-nedcapability-cbee6d94f26b"></a>
### NedCapability(String, String)

```java
public NedCapability(String uri, String module)
```

**Parameters**

- `String uri`
- `String module`

<a id="m-nedcapability-0618acf74952"></a>
### NedCapability(String, String, List<String>, String, List<String>)

```java
public NedCapability(
    String uri,
    String module,
    java.util.List<String> features,
    String revision,
    java.util.List<String> deviations
)
```

**Parameters**

- `String uri`
- `String module`
- `java.util.List<String> features`
- `String revision`
- `java.util.List<String> deviations`

<a id="m-nedcapability-a0ce331f8ac0"></a>
### NedCapability(String, String, String, List<String>, String, List<String>)

```java
public NedCapability(
    String str,
    String uri,
    String module,
    java.util.List<String> features,
    String revision,
    java.util.List<String> deviations
)
```

This class mimics a capability as returned by a NETCONF agent
 over the NETCONF protocol. A NED needs to return an array
 of these after it has connected to its managed device.
 This returned list of Capabilities make NCS handle a NED connection
 in a manner similar to a NETCONF connection.
 The list of capabilities returned by the NED connect code
 needs to precisely identify the actual capabilities of the device
 i.e which YANG modules NCS shall use when communication with the device.

**Parameters**

- `String str` - The full capability string similar to how a NETCONF agent
 returns. This optional parameter can be set to ""
- `String uri` - The actual capability uri. This parameter is required.
- `String module` - The name of the YANG module that implements this
 capability Required parameter.
- `java.util.List<String> features` - If the modules is using the features 'feature' of
 YANG, which features are enabled by this device.
- `String revision` - If there exists multiple revisions of the yang module
 that implements this capability, which revision does this particular
 device run.
- `java.util.List<String> deviations` - If the YANG feature 'deviations' are used,
 which deviations does this device have.


## Methods

<a id="m-encode-fbae522bba37"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

<a id="m-getdeviations-635611da0c3c"></a>
### getDeviations()

```java
public java.util.List<String> getDeviations()
```

<a id="m-getfeatures-2b82b997b3cb"></a>
### getFeatures()

```java
public java.util.List<String> getFeatures()
```

<a id="m-getmodule-68694513ccce"></a>
### getModule()

```java
public String getModule()
```

<a id="m-getname-2634b18b4a25"></a>
### getName()

```java
public String getName()
```

<a id="m-getrevision-b0088aa9f0bf"></a>
### getRevision()

```java
public String getRevision()
```

<a id="m-geturi-7ec1ffd8cd93"></a>
### getURI()

```java
public String getURI()
```

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
