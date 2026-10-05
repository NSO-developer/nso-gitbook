# NcsComponentData <a href="#cls-NcsComponentData" id="cls-NcsComponentData"></a>

```java
public class com.tailf.ncs.ctrl.NcsComponentData
```

Parsed command Component data

## Members

**Constructors**:

- [NcsComponentData(NcsPDData, String, String, String, String, String, String[])](#m-NcsComponentData-2d0c349d77e7)

**Methods**:

- [getClasses()](#m-getClasses-af3620c8cef5)
- [getComponentName()](#m-getComponentName-7c7a8acb1be7)
- [getComponentType()](#m-getComponentType-8cb31666621f)
- [getNedIdNS()](#m-getNedIdNS-6d5bc3028343)
- [getNedIdTag()](#m-getNedIdTag-9254c612474d)
- [getNedType()](#m-getNedType-0f22e3831af4)
- [getParentPackage()](#m-getParentPackage-8f854d27b434)
- [getUniqueName()](#m-getUniqueName-f814f98e3025)
- [isPendingStop()](#m-isPendingStop-eeb09cbcc411)
- [setPendingStop(boolean)](#m-setPendingStop-6efd01c6ce11)
- [toString()](#m-toString-e9d48c5503ef)

## Constructors

### NcsComponentData(NcsPDData, String, String, String, String, String, String[]) <a href="#m-NcsComponentData-2d0c349d77e7" id="m-NcsComponentData-2d0c349d77e7"></a>

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

### getClasses() <a href="#m-getClasses-af3620c8cef5" id="m-getClasses-af3620c8cef5"></a>

```java
public String[] getClasses()
```

### getComponentName() <a href="#m-getComponentName-7c7a8acb1be7" id="m-getComponentName-7c7a8acb1be7"></a>

```java
public String getComponentName()
```

### getComponentType() <a href="#m-getComponentType-8cb31666621f" id="m-getComponentType-8cb31666621f"></a>

```java
public String getComponentType()
```

### getNedIdNS() <a href="#m-getNedIdNS-6d5bc3028343" id="m-getNedIdNS-6d5bc3028343"></a>

```java
public String getNedIdNS()
```

### getNedIdTag() <a href="#m-getNedIdTag-9254c612474d" id="m-getNedIdTag-9254c612474d"></a>

```java
public String getNedIdTag()
```

### getNedType() <a href="#m-getNedType-0f22e3831af4" id="m-getNedType-0f22e3831af4"></a>

```java
public String getNedType()
```

### getParentPackage() <a href="#m-getParentPackage-8f854d27b434" id="m-getParentPackage-8f854d27b434"></a>

```java
public com.tailf.ncs.ctrl.NcsPDData getParentPackage()
```

Types: [NcsPDData](NcsPDData.md#cls-NcsPDData)

### getUniqueName() <a href="#m-getUniqueName-f814f98e3025" id="m-getUniqueName-f814f98e3025"></a>

```java
public String getUniqueName()
```

### isPendingStop() <a href="#m-isPendingStop-eeb09cbcc411" id="m-isPendingStop-eeb09cbcc411"></a>

```java
public boolean isPendingStop()
```

### setPendingStop(boolean) <a href="#m-setPendingStop-6efd01c6ce11" id="m-setPendingStop-6efd01c6ce11"></a>

```java
public void setPendingStop(boolean shouldStop)
```

**Parameters**

- `boolean shouldStop`

### toString() <a href="#m-toString-e9d48c5503ef" id="m-toString-e9d48c5503ef"></a>

```java
public String toString()
```
