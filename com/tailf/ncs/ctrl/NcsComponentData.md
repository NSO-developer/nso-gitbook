# NcsComponentData <a href="#ncscomponentdata-b345f6915023" id="ncscomponentdata-b345f6915023"></a>

```java
public class com.tailf.ncs.ctrl.NcsComponentData
```

Parsed command Component data

## Members

**Constructors**:

- [NcsComponentData\(NcsPDData, String, String, String, String, String, String\[\]\)](#ncscomponentdata-2d0c349d77e7)

**Methods**:

- [getClasses\(\)](#getclasses-af3620c8cef5)
- [getComponentName\(\)](#getcomponentname-7c7a8acb1be7)
- [getComponentType\(\)](#getcomponenttype-8cb31666621f)
- [getNedIdNS\(\)](#getnedidns-6d5bc3028343)
- [getNedIdTag\(\)](#getnedidtag-9254c612474d)
- [getNedType\(\)](#getnedtype-0f22e3831af4)
- [getParentPackage\(\)](#getparentpackage-8f854d27b434)
- [getUniqueName\(\)](#getuniquename-f814f98e3025)
- [isPendingStop\(\)](#ispendingstop-eeb09cbcc411)
- [setPendingStop\(boolean\)](#setpendingstop-6efd01c6ce11)
- [toString\(\)](#tostring-e9d48c5503ef)

## Constructors

### NcsComponentData(NcsPDData, String, String, String, String, String, String[]) <a href="#ncscomponentdata-2d0c349d77e7" id="ncscomponentdata-2d0c349d77e7"></a>

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

Types: [NcsPDData](NcsPDData.md#ncspddata-37ade94897d4)

**Parameters**

- `com.tailf.ncs.ctrl.NcsPDData parentPackage`
- `String componentName`
- `String componentType`
- `String nedType`
- `String nedIdNS`
- `String nedIdTag`
- `String[] classes`


## Methods

### getClasses() <a href="#getclasses-af3620c8cef5" id="getclasses-af3620c8cef5"></a>

```java
public String[] getClasses()
```

### getComponentName() <a href="#getcomponentname-7c7a8acb1be7" id="getcomponentname-7c7a8acb1be7"></a>

```java
public String getComponentName()
```

### getComponentType() <a href="#getcomponenttype-8cb31666621f" id="getcomponenttype-8cb31666621f"></a>

```java
public String getComponentType()
```

### getNedIdNS() <a href="#getnedidns-6d5bc3028343" id="getnedidns-6d5bc3028343"></a>

```java
public String getNedIdNS()
```

### getNedIdTag() <a href="#getnedidtag-9254c612474d" id="getnedidtag-9254c612474d"></a>

```java
public String getNedIdTag()
```

### getNedType() <a href="#getnedtype-0f22e3831af4" id="getnedtype-0f22e3831af4"></a>

```java
public String getNedType()
```

### getParentPackage() <a href="#getparentpackage-8f854d27b434" id="getparentpackage-8f854d27b434"></a>

```java
public com.tailf.ncs.ctrl.NcsPDData getParentPackage()
```

Types: [NcsPDData](NcsPDData.md#ncspddata-37ade94897d4)

### getUniqueName() <a href="#getuniquename-f814f98e3025" id="getuniquename-f814f98e3025"></a>

```java
public String getUniqueName()
```

### isPendingStop() <a href="#ispendingstop-eeb09cbcc411" id="ispendingstop-eeb09cbcc411"></a>

```java
public boolean isPendingStop()
```

### setPendingStop(boolean) <a href="#setpendingstop-6efd01c6ce11" id="setpendingstop-6efd01c6ce11"></a>

```java
public void setPendingStop(boolean shouldStop)
```

**Parameters**

- `boolean shouldStop`

### toString() <a href="#tostring-e9d48c5503ef" id="tostring-e9d48c5503ef"></a>

```java
public String toString()
```
