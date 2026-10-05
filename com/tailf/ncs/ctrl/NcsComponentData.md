<a id="s-NcsComponentData"></a>
# NcsComponentData

```java
public class com.tailf.ncs.ctrl.NcsComponentData
```

Parsed command Component data

## Members

**Constructors**:

- [NcsComponentData(NcsPDData, String, String, String, String, String, String[])](#s-NcsComponentData-1)

**Methods**:

- [getClasses()](#s-getClasses)
- [getComponentName()](#s-getComponentName)
- [getComponentType()](#s-getComponentType)
- [getNedIdNS()](#s-getNedIdNS)
- [getNedIdTag()](#s-getNedIdTag)
- [getNedType()](#s-getNedType)
- [getParentPackage()](#s-getParentPackage)
- [getUniqueName()](#s-getUniqueName)
- [isPendingStop()](#s-isPendingStop)
- [setPendingStop(boolean)](#s-setPendingStop)
- [toString()](#s-toString)

## Constructors

<a id="s-NcsComponentData-1"></a>
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

Types: [NcsPDData](NcsPDData.md#s-NcsPDData)

**Parameters**

- `com.tailf.ncs.ctrl.NcsPDData parentPackage`
- `String componentName`
- `String componentType`
- `String nedType`
- `String nedIdNS`
- `String nedIdTag`
- `String[] classes`


## Methods

<a id="s-getClasses"></a>
### getClasses()

```java
public String[] getClasses()
```

<a id="s-getComponentName"></a>
### getComponentName()

```java
public String getComponentName()
```

<a id="s-getComponentType"></a>
### getComponentType()

```java
public String getComponentType()
```

<a id="s-getNedIdNS"></a>
### getNedIdNS()

```java
public String getNedIdNS()
```

<a id="s-getNedIdTag"></a>
### getNedIdTag()

```java
public String getNedIdTag()
```

<a id="s-getNedType"></a>
### getNedType()

```java
public String getNedType()
```

<a id="s-getParentPackage"></a>
### getParentPackage()

```java
public com.tailf.ncs.ctrl.NcsPDData getParentPackage()
```

Types: [NcsPDData](NcsPDData.md#s-NcsPDData)

<a id="s-getUniqueName"></a>
### getUniqueName()

```java
public String getUniqueName()
```

<a id="s-isPendingStop"></a>
### isPendingStop()

```java
public boolean isPendingStop()
```

<a id="s-setPendingStop"></a>
### setPendingStop(boolean)

```java
public void setPendingStop(boolean shouldStop)
```

**Parameters**

- `boolean shouldStop`

<a id="s-toString"></a>
### toString()

```java
public String toString()
```
