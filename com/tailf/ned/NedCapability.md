<a id="s-NedCapability"></a>
# NedCapability

```java
public class com.tailf.ned.NedCapability
```

NedCapability is used to communicate the capabilities (supported
 namespace, revision, features and deviations) of a NedConnection
 (NedGeneric or NedCli).

## Members

**Constructors**:

- [NedCapability(String, String)](#s-NedCapability-1)
- [NedCapability(String, String, List<String>, String, List<String>)](#s-NedCapability-2)
- [NedCapability(String, String, String, List<String>, String, List<String>)](#s-NedCapability-3)

**Methods**:

- [encode()](#s-encode)
- [getDeviations()](#s-getDeviations)
- [getFeatures()](#s-getFeatures)
- [getModule()](#s-getModule)
- [getName()](#s-getName)
- [getRevision()](#s-getRevision)
- [getURI()](#s-getURI)
- [toString()](#s-toString)

## Constructors

<a id="s-NedCapability-1"></a>
### NedCapability(String, String)

```java
public NedCapability(String uri, String module)
```

**Parameters**

- `String uri`
- `String module`

<a id="s-NedCapability-2"></a>
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

<a id="s-NedCapability-3"></a>
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

<a id="s-encode"></a>
### encode()

```java
public com.tailf.proto.ConfEObject encode()
```

Types: [ConfEObject](../proto/ConfEObject.md#s-ConfEObject)

<a id="s-getDeviations"></a>
### getDeviations()

```java
public java.util.List<String> getDeviations()
```

<a id="s-getFeatures"></a>
### getFeatures()

```java
public java.util.List<String> getFeatures()
```

<a id="s-getModule"></a>
### getModule()

```java
public String getModule()
```

<a id="s-getName"></a>
### getName()

```java
public String getName()
```

<a id="s-getRevision"></a>
### getRevision()

```java
public String getRevision()
```

<a id="s-getURI"></a>
### getURI()

```java
public String getURI()
```

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
