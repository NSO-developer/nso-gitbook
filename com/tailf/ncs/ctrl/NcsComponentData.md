<a id="cls-NcsComponentData"></a>
# NcsComponentData

```java
public class com.tailf.ncs.ctrl.NcsComponentData
```

Parsed command Component data

## Members

**Constructors**:

- [NcsComponentData(NcsPDData, String, String, String, String, String, String[])](#m-ncscomponentdata-2d0c349d77e7)

**Methods**:

- [getClasses()](#m-getclasses-af3620c8cef5)
- [getComponentName()](#m-getcomponentname-7c7a8acb1be7)
- [getComponentType()](#m-getcomponenttype-8cb31666621f)
- [getNedIdNS()](#m-getnedidns-6d5bc3028343)
- [getNedIdTag()](#m-getnedidtag-9254c612474d)
- [getNedType()](#m-getnedtype-0f22e3831af4)
- [getParentPackage()](#m-getparentpackage-8f854d27b434)
- [getUniqueName()](#m-getuniquename-f814f98e3025)
- [isPendingStop()](#m-ispendingstop-eeb09cbcc411)
- [setPendingStop(boolean)](#m-setpendingstop-6efd01c6ce11)
- [toString()](#m-tostring-e9d48c5503ef)

## Constructors

<a id="m-ncscomponentdata-2d0c349d77e7"></a>
### NcsComponentData(NcsPDData, String, String, String, String, String, String[])

```java
public NcsComponentData(
    com.tailf.ncs.ctrl.NcsPDData parentPackage,
    String componentName,
    String componentType,
    String nedType,
    String nedIdNS,
    String nedIdTag,
    String[] classes
)
```

Types: [NcsPDData](NcsPDData.md#cls-NcsPDData)

**Parameters**

- `com.tailf.ncs.ctrl.NcsPDData parentPackage`
- `String componentName`
- `String componentType`
- `String nedType`
- `String nedIdNS`
- `String nedIdTag`
- `String[] classes`


## Methods

<a id="m-getclasses-af3620c8cef5"></a>
### getClasses()

```java
public String[] getClasses()
```

<a id="m-getcomponentname-7c7a8acb1be7"></a>
### getComponentName()

```java
public String getComponentName()
```

<a id="m-getcomponenttype-8cb31666621f"></a>
### getComponentType()

```java
public String getComponentType()
```

<a id="m-getnedidns-6d5bc3028343"></a>
### getNedIdNS()

```java
public String getNedIdNS()
```

<a id="m-getnedidtag-9254c612474d"></a>
### getNedIdTag()

```java
public String getNedIdTag()
```

<a id="m-getnedtype-0f22e3831af4"></a>
### getNedType()

```java
public String getNedType()
```

<a id="m-getparentpackage-8f854d27b434"></a>
### getParentPackage()

```java
public com.tailf.ncs.ctrl.NcsPDData getParentPackage()
```

Types: [NcsPDData](NcsPDData.md#cls-NcsPDData)

<a id="m-getuniquename-f814f98e3025"></a>
### getUniqueName()

```java
public String getUniqueName()
```

<a id="m-ispendingstop-eeb09cbcc411"></a>
### isPendingStop()

```java
public boolean isPendingStop()
```

<a id="m-setpendingstop-6efd01c6ce11"></a>
### setPendingStop(boolean)

```java
public void setPendingStop(boolean shouldStop)
```

**Parameters**

- `boolean shouldStop`

<a id="m-tostring-e9d48c5503ef"></a>
### toString()

```java
public String toString()
```
