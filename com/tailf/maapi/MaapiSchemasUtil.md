<a id="cls-MaapiSchemasUtil"></a>
# MaapiSchemasUtil

```java
public class com.tailf.maapi.MaapiSchemasUtil
```

Utility class for MaapiSchemas This class contains tools for making recursive
 schema printouts. It also has a main method and can therefore be run as a
 java application.

## Members

**Constructors**:

- [MaapiSchemasUtil()](#m-maapischemasutil-96c7fe9b10ed)

**Methods**:

- [main(String[])](#m-main-1503518a8568)
- [printChildren(int, CSNode)](#m-printchildren-569289dd47f3)
- [printNodeFlags(int)](#m-printnodeflags-82155e1196a9)
- [printNodeInfo(int, CSNode)](#m-printnodeinfo-c2705fa59a11)

## Constructors

<a id="m-maapischemasutil-96c7fe9b10ed"></a>
### MaapiSchemasUtil()

```java
public MaapiSchemasUtil()
```


## Methods

<a id="m-main-1503518a8568"></a>
### main(String[])

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

<a id="m-printchildren-569289dd47f3"></a>
### printChildren(int, CSNode)

```java
public static void printChildren(int offset, com.tailf.maapi.MaapiSchemas.CSNode n)
```

Types: [CSNode](MaapiSchemas/CSNode.md#cls-CSNode)

Recursive printout of a schema tree from and including given node

**Parameters**

- `int offset` - indentation offset for printout, 0 at start.
- `com.tailf.maapi.MaapiSchemas.CSNode n` - start node for printout

<a id="m-printnodeflags-82155e1196a9"></a>
### printNodeFlags(int)

```java
public static void printNodeFlags(int flags)
```

**Parameters**

- `int flags`

<a id="m-printnodeinfo-c2705fa59a11"></a>
### printNodeInfo(int, CSNode)

```java
public static void printNodeInfo(int offset, com.tailf.maapi.MaapiSchemas.CSNode n)
```

Types: [CSNode](MaapiSchemas/CSNode.md#cls-CSNode)

Node info printout for a given node

**Parameters**

- `int offset` - indentation offset for printout, 0 at start.
- `com.tailf.maapi.MaapiSchemas.CSNode n` - node to printout
