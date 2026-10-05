# MaapiSchemasUtil <a href="#maapischemasutil-bc1b43597fd6" id="maapischemasutil-bc1b43597fd6"></a>

```java
public class com.tailf.maapi.MaapiSchemasUtil
```

Utility class for MaapiSchemas This class contains tools for making recursive
 schema printouts. It also has a main method and can therefore be run as a
 java application.

## Members

**Constructors**:

- [MaapiSchemasUtil()](#maapischemasutil-96c7fe9b10ed)

**Methods**:

- [main(String[])](#main-1503518a8568)
- [printChildren(int, CSNode)](#printchildren-569289dd47f3)
- [printNodeFlags(int)](#printnodeflags-82155e1196a9)
- [printNodeInfo(int, CSNode)](#printnodeinfo-c2705fa59a11)

## Constructors

### MaapiSchemasUtil() <a href="#maapischemasutil-96c7fe9b10ed" id="maapischemasutil-96c7fe9b10ed"></a>

```java
public MaapiSchemasUtil()
```


## Methods

### main(String[]) <a href="#main-1503518a8568" id="main-1503518a8568"></a>

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

### printChildren(int, CSNode) <a href="#printchildren-569289dd47f3" id="printchildren-569289dd47f3"></a>

```java
public static void printChildren(int offset, com.tailf.maapi.MaapiSchemas.CSNode n)
```

Types: [CSNode](MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

Recursive printout of a schema tree from and including given node

**Parameters**

- `int offset` - indentation offset for printout, 0 at start.
- `com.tailf.maapi.MaapiSchemas.CSNode n` - start node for printout

### printNodeFlags(int) <a href="#printnodeflags-82155e1196a9" id="printnodeflags-82155e1196a9"></a>

```java
public static void printNodeFlags(int flags)
```

**Parameters**

- `int flags`

### printNodeInfo(int, CSNode) <a href="#printnodeinfo-c2705fa59a11" id="printnodeinfo-c2705fa59a11"></a>

```java
public static void printNodeInfo(int offset, com.tailf.maapi.MaapiSchemas.CSNode n)
```

Types: [CSNode](MaapiSchemas/CSNode.md#csnode-f12d9ad69c28)

Node info printout for a given node

**Parameters**

- `int offset` - indentation offset for printout, 0 at start.
- `com.tailf.maapi.MaapiSchemas.CSNode n` - node to printout
