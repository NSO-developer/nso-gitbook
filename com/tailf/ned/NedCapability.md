# NedCapability <a href="#nedcapability-26ca5e07f364" id="nedcapability-26ca5e07f364"></a>

```java
public class com.tailf.ned.NedCapability
```

NedCapability is used to communicate the capabilities (supported
 namespace, revision, features and deviations) of a NedConnection
 (NedGeneric or NedCli).

## Members

**Constructors**:

- [NedCapability\(String, String\)](#nedcapability-cbee6d94f26b)
- [NedCapability\(String, String, List\<String\>, String, List\<String\>\)](#nedcapability-0618acf74952)
- [NedCapability\(String, String, String, List\<String\>, String, List\<String\>\)](#nedcapability-a0ce331f8ac0)

**Methods**:

- [encode\(\)](#encode-fbae522bba37)
- [getDeviations\(\)](#getdeviations-635611da0c3c)
- [getFeatures\(\)](#getfeatures-2b82b997b3cb)
- [getModule\(\)](#getmodule-68694513ccce)
- [getName\(\)](#getname-2634b18b4a25)
- [getRevision\(\)](#getrevision-b0088aa9f0bf)
- [getURI\(\)](#geturi-7ec1ffd8cd93)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### NedCapability(String, String) <a href="#nedcapability-cbee6d94f26b" id="nedcapability-cbee6d94f26b"></a>

```java
public NedCapability(String uri, String module)
```

**Parameters**

- `String uri`
- `String module`

### NedCapability(String, String, List&lt;String&gt;, String, List&lt;String&gt;) <a href="#nedcapability-0618acf74952" id="nedcapability-0618acf74952"></a>

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

### NedCapability(String, String, String, List&lt;String&gt;, String, List&lt;String&gt;) <a href="#nedcapability-a0ce331f8ac0" id="nedcapability-a0ce331f8ac0"></a>

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

### encode() <a href="#encode-fbae522bba37" id="encode-fbae522bba37"></a>

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#confeobject-2a9c0d03e350)

### getDeviations() <a href="#getdeviations-635611da0c3c" id="getdeviations-635611da0c3c"></a>

```java
public java.util.List<String> getDeviations()
```

### getFeatures() <a href="#getfeatures-2b82b997b3cb" id="getfeatures-2b82b997b3cb"></a>

```java
public java.util.List<String> getFeatures()
```

### getModule() <a href="#getmodule-68694513ccce" id="getmodule-68694513ccce"></a>

```java
public String getModule()
```

### getName() <a href="#getname-2634b18b4a25" id="getname-2634b18b4a25"></a>

```java
public String getName()
```

### getRevision() <a href="#getrevision-b0088aa9f0bf" id="getrevision-b0088aa9f0bf"></a>

```java
public String getRevision()
```

### getURI() <a href="#geturi-7ec1ffd8cd93" id="geturi-7ec1ffd8cd93"></a>

```java
public String getURI()
```

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
