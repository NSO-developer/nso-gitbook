# NedCapability <a href="#cls-NedCapability" id="cls-NedCapability"></a>

```java
public class com.tailf.ned.NedCapability
```

NedCapability is used to communicate the capabilities (supported
 namespace, revision, features and deviations) of a NedConnection
 (NedGeneric or NedCli).

## Members

**Constructors**:

- [NedCapability(String, String)](#m-NedCapability-cbee6d94f26b)
- [NedCapability(String, String, List<String>, String, List<String>)](#m-NedCapability-0618acf74952)
- [NedCapability(String, String, String, List<String>, String, List<String>)](#m-NedCapability-a0ce331f8ac0)

**Methods**:

- [encode()](#m-encode-fbae522bba37)
- [getDeviations()](#m-getDeviations-635611da0c3c)
- [getFeatures()](#m-getFeatures-2b82b997b3cb)
- [getModule()](#m-getModule-68694513ccce)
- [getName()](#m-getName-2634b18b4a25)
- [getRevision()](#m-getRevision-b0088aa9f0bf)
- [getURI()](#m-getURI-7ec1ffd8cd93)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### NedCapability(String, String) <a href="#m-NedCapability-cbee6d94f26b" id="m-NedCapability-cbee6d94f26b"></a>

```java
public NedCapability(String uri, String module)
```

**Parameters**

- `String uri`
- `String module`

### NedCapability(String, String, List<String>, String, List<String>) <a href="#m-NedCapability-0618acf74952" id="m-NedCapability-0618acf74952"></a>

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

### NedCapability(String, String, String, List<String>, String, List<String>) <a href="#m-NedCapability-a0ce331f8ac0" id="m-NedCapability-a0ce331f8ac0"></a>

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

### encode() <a href="#m-encode-fbae522bba37" id="m-encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#cls-ConfEObject)

### getDeviations() <a href="#m-getDeviations-635611da0c3c" id="m-getDeviations-635611da0c3c"></a>

```java
public java.util.List<String> getDeviations()
```

### getFeatures() <a href="#m-getFeatures-2b82b997b3cb" id="m-getFeatures-2b82b997b3cb"></a>

```java
public java.util.List<String> getFeatures()
```

### getModule() <a href="#m-getModule-68694513ccce" id="m-getModule-68694513ccce"></a>

```java
public String getModule()
```

### getName() <a href="#m-getName-2634b18b4a25" id="m-getName-2634b18b4a25"></a>

```java
public String getName()
```

### getRevision() <a href="#m-getRevision-b0088aa9f0bf" id="m-getRevision-b0088aa9f0bf"></a>

```java
public String getRevision()
```

### getURI() <a href="#m-getURI-7ec1ffd8cd93" id="m-getURI-7ec1ffd8cd93"></a>

```java
public String getURI()
```

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
