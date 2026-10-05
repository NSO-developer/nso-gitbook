<a id="s-MaapiSchemasUtil"></a>
# MaapiSchemasUtil

```java
public class com.tailf.maapi.MaapiSchemasUtil
```

Utility class for MaapiSchemas This class contains tools for making recursive
 schema printouts. It also has a main method and can therefore be run as a
 java application.

## Members

**Constructors**:

- [MaapiSchemasUtil()](#s-MaapiSchemasUtil-1)

**Methods**:

- [main(String[])](#s-main)
- [printChildren(int, CSNode)](#s-printChildren)
- [printNodeFlags(int)](#s-printNodeFlags)
- [printNodeInfo(int, CSNode)](#s-printNodeInfo)

## Constructors

<a id="s-MaapiSchemasUtil-1"></a>
### MaapiSchemasUtil()

```java
public MaapiSchemasUtil()
```


## Methods

<a id="s-main"></a>
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

<a id="s-printChildren"></a>
### printChildren(int, CSNode)

```java
public static void printChildren(int offset, com.tailf.maapi.MaapiSchemas.CSNode n)
```

Types: [CSNode](MaapiSchemas/CSNode.md#s-CSNode)

Recursive printout of a schema tree from and including given node

**Parameters**

- `int offset` - indentation offset for printout, 0 at start.
- `com.tailf.maapi.MaapiSchemas.CSNode n` - start node for printout

<a id="s-printNodeFlags"></a>
### printNodeFlags(int)

```java
public static void printNodeFlags(int flags)
```

**Parameters**

- `int flags`

<a id="s-printNodeInfo"></a>
### printNodeInfo(int, CSNode)

```java
public static void printNodeInfo(int offset, com.tailf.maapi.MaapiSchemas.CSNode n)
```

Types: [CSNode](MaapiSchemas/CSNode.md#s-CSNode)

Node info printout for a given node

**Parameters**

- `int offset` - indentation offset for printout, 0 at start.
- `com.tailf.maapi.MaapiSchemas.CSNode n` - node to printout
