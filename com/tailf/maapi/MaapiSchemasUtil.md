# MaapiSchemasUtil <a href="#cls-MaapiSchemasUtil" id="cls-MaapiSchemasUtil"></a>

```java
public class com.tailf.maapi.MaapiSchemasUtil
```

Utility class for MaapiSchemas This class contains tools for making recursive
 schema printouts. It also has a main method and can therefore be run as a
 java application.

## Members

**Constructors**:

- [MaapiSchemasUtil()](#m-MaapiSchemasUtil-96c7fe9b10ed)

**Methods**:

- [main(String[])](#m-main-1503518a8568)
- [printChildren(int, CSNode)](#m-printChildren-569289dd47f3)
- [printNodeFlags(int)](#m-printNodeFlags-82155e1196a9)
- [printNodeInfo(int, CSNode)](#m-printNodeInfo-c2705fa59a11)

## Constructors

### MaapiSchemasUtil() <a href="#m-MaapiSchemasUtil-96c7fe9b10ed" id="m-MaapiSchemasUtil-96c7fe9b10ed"></a>

```java
public MaapiSchemasUtil()
```


## Methods

### main(String[]) <a href="#m-main-1503518a8568" id="m-main-1503518a8568"></a>

```java
public static void main(String[] args)
```

Main method, downloads all schemas from the server using
 Maapi.loadSchemas, recurses through all schema trees and prints types and
 node info.

 Run as:




```
 java com.tailf.maapi.MaapiSchemasUtil [hostname_or_ip, [port]]
```



 Where `hostname_or_ip` is the name or ip of the server
 (default 127.0.0.1) and `port` is the server port
 (default 4565)

**Parameters**

- `String[] args` - String array optionally containing the hostname and the
             port of the server

### printChildren(int, CSNode) <a href="#m-printChildren-569289dd47f3" id="m-printChildren-569289dd47f3"></a>

```java
public static void printChildren(int offset, com.tailf.maapi.MaapiSchemas.CSNode n)
```

Types: [CSNode](MaapiSchemas/CSNode.md#cls-CSNode)

Recursive printout of a schema tree from and including given node

**Parameters**

- `int offset` - indentation offset for printout, 0 at start.
- `com.tailf.maapi.MaapiSchemas.CSNode n` - start node for printout

### printNodeFlags(int) <a href="#m-printNodeFlags-82155e1196a9" id="m-printNodeFlags-82155e1196a9"></a>

```java
public static void printNodeFlags(int flags)
```

**Parameters**

- `int flags`

### printNodeInfo(int, CSNode) <a href="#m-printNodeInfo-c2705fa59a11" id="m-printNodeInfo-c2705fa59a11"></a>

```java
public static void printNodeInfo(int offset, com.tailf.maapi.MaapiSchemas.CSNode n)
```

Types: [CSNode](MaapiSchemas/CSNode.md#cls-CSNode)

Node info printout for a given node

**Parameters**

- `int offset` - indentation offset for printout, 0 at start.
- `com.tailf.maapi.MaapiSchemas.CSNode n` - node to printout
