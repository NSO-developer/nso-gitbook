# com.tailf.navu

NAVU (Navigation Utilities) is an API which provides increased
 accessibility to the ConfD/NCS populated data model tree:
 NAVU-Tree.

 It is important to understand the distinction between a populated
 data tree and a schema tree.

 The NAVU-Tree is built on top of the schema tree
 [`MaapiSchemas`](../maapi/MaapiSchemas.md#cls-MaapiSchemas) which is a linked structures of
 [`CSNode`](../maapi/MaapiSchemas/CSNode.md#cls-CSNode) nodes. Each node in NAVU
 holds a reference to its corresponding `CSNode` which can be
 obtained through [`NavuNodeInfo#getCSNode()`](NavuNodeInfo.md#m-getcsnode-cf7a085aa7f5):



```
   NavuNode node = ...;
   MaapiSchemas.CSNode rawCSNode = node.getInfo().getCSNode();
```




 Navigation is done entirely on the populated `NAVU-Tree`.
 Each keypath represents a node or a `NavuNode`.

 A context ([`NavuContext`](NavuContext.md#cls-NavuContext)) needs to be created and
 supplied before further navigation can be performed.



```
   NavuContext context = new NavuContext(maapi);
   context.startRunningTrans(Conf.MODE_READ_WRITE);
   NavuContainer base = new NavuContainer(context);
```



 NAVU uses its current context to retrieve its list instances with keys
 and its leafs with data values.

 In NAVU, a list instance is mapping between a
 [`ConfKey`](../conf/ConfKey.md#cls-ConfKey) and an instance of
 [`NavuListEntry`](NavuListEntry.md#cls-NavuListEntry) which is a subclass of
 [`NavuContainer`](NavuContainer.md#cls-NavuContainer). The method
 [`NavuList#elem(com.tailf.conf.ConfKey)`](NavuList.md#m-elem-172930b5966b) (or one of its
 overloaded variants) retrieves the list entry.

 A [`NavuLeaf`](NavuLeaf.md#cls-NavuLeaf) holds a value
 ([`ConfValue`](../conf/ConfValue.md#cls-ConfValue)) that is retrieved through the current
 `NavuContext`.

 NAVU caches data throughout its NAVU-Tree.

 NAVU builds up its tree lazily, which means that it populates
 its children one level at a time. Internally in each NAVU class
 there exists a `refresh` method that retrieves the child
 nodes and stores them in a hash map.


 An explicit instance of a [`NavuContainer`](NavuContainer.md#cls-NavuContainer) with only
 the `NavuContext`:



```
   NavuContext context = new NavuContext(maapi);
   context.startRunningTrans(Conf.MODE_READ_WRITE);
   NavuContainer base = new NavuContainer(context);
   assert base.getInfo().isRootOfModules();
```




 is the *base* of the `NAVU-Tree`. The *base* of
 the `NAVU-Tree` represents only a "dummy" *base* node.
 Most operation on this node will throw exceptions.

 The only operation that should be done on the *base* node
 is to explicitly call [`NavuNode#container(Integer)`](NavuNode.md#m-container-abb10ecdc3f6)
 with the `module` hash as its argument.




```
   ConfNamespace ns = new MyNamespace();
   final int hash = ns.hash();
   NavuContainer module = base.container(hash);
```




 The `module` reference in the above snippet represents
 the node that "points" to the *module* of a specific *YANG*
 module.

 When we reach the point where we have a reference to a specific
 *module* the next step would be to call:

 [`NavuNode#container(String)`](NavuNode.md#m-container-76f5d191b16d),
 [`NavuNode#list(String)`](NavuNode.md#m-list-2c1a74a3cf07) or
 [`NavuNode#leaf(String)`](NavuNode.md#m-leaf-ac189787d67d) to move to the next
 level (depending on how the *yang* module is modeled).



 The main features of *NAVU* are:


- Tree *navigation* through the `NAVU-Tree`.

   - Regexp-based [`NavuContainer#select(ConfObject[])`](NavuContainer.md#m-select-336dd76cd112),
 `NavuContainer#select(java.util.List)`,
 [`NavuContainer#select(String)`](NavuContainer.md#m-select-5031325154b9) or through simplified
 XPath expression `NavuContainer#xPathSelect(String)`,
 `NavuContainer#xPathSelectIterate(String,
                                                        NavuNodeSetIterate)`
 search through the tree structure: A regular expression search is provided
 to enable a free search.

     - Invocation of actions: Actions may be invoked from
 [`NavuAction`](NavuAction.md#cls-NavuAction) nodes.

       - Data loading on demand: Nodes are loaded when they are requested.

         - Schema-driven validation: The navigation is validated against the
 `MaapiSchemas`.

           - *Delta-awareness*: *NAVU* can be invoked to tag the
 tree with changes performed in a transaction.

 The key component of *NAVU* is the MAAPI schema
 functionality. The schema provides schema knowledge of the *YANG*
 model. The navigation is done at runtime according to the schema loaded at
 creation time of the root node.

 One of the ideas behind *NAVU* is that it shall be easy to use for
 people who have a good understanding of the *YANG* modeling language.
 Hence, primitives and classes are named according to the *YANG* building
 blocks. The navigation is performed top-down, starting from the root module
 and moving down through the model. This is done using the primitives
 *container*, *list*, *leaf* and *elem*.

 The following node types are provided by *NAVU*.


          - [`NavuContainer`](NavuContainer.md#cls-NavuContainer) - is roughly equivalent to the
 *YANG* *container* node type. Within *NAVU* it is also used
 to represent the module root and list element nodes (through the subclass
 [`NavuListEntry`](NavuListEntry.md#cls-NavuListEntry)).

             - [`NavuList`](NavuList.md#cls-NavuList) - represents the *YANG* *list*
 node and provides a `NavuListEntry` collection.

               - [`NavuLeaf`](NavuLeaf.md#cls-NavuLeaf) - represents *YANG* *leaf*
 nodes which hold data.

 *NAVU* becomes aware of the schema at start-up time. Hence, any
 schema-violating operations will be detected at runtime.
 Furthermore, *NAVU* only reads data when it is needed. So even if you
 have a very large tree structure, *NAVU* will only attempt read data
 when the data is required.

 It is not a prerequisite, but it is highly recommended to use
 *confdc/ncsc* to generate namespace classes. By using confdc generated.
 namespace classes you get the following benefits:


              - Your IDE will help you to auto-complete you node names.
                 - You will get a compile-time error if the model is changed and node
 names are changed.

 The *YANG* model used in the examples below:




```
   module navutest {
     namespace http://examples.com/navutest;
     prefix nt;

     import tailf-common {
       prefix tailf;
     }

     container address-book {
       list friends {
         key name;
         leaf name {
           type string;
         }

         leaf age {
           type uint8;
         }

         tailf:action friday-night-call {
           tailf:actionpoint friendly-action;
           input {
             leaf request {
               type string;
             }
           }
           output {
             leaf response {
               type string;
             }
           }
         }
       }
     }
   }
```




 **Example 1: Iterating through a list**




```
   navutest ntns = new navutest();
   NavuContext context = new NavuContext(maapi);
   context.startRunningTrans(Conf.MODE_READ_WRITE);
   NavuContainer base = new NavuContainer(context);
   NavuContainer nt = base.container(ntns.hash());

   NavuList friends = nt.container(ntns.nt_address_book)
                        .list(ntns.nt_friends);

   for (NavuContainer friend : friends) {
       System.out.println(friend.leaf(ntns.nt_age).value());
   }
```




 **Example 2: Executing an action**




```
   NavuList friends = nt.container(ntns.nt_address_book)
                        .list(ntns.nt_friends);

   for (NavuContainer friend : friends) {
       NavuAction action = friend.action("friday-night-call");
       ConfXMLParam[] result =
           action.call(new ConfXMLParam[] {
                           new ConfXMLParamValue(ntns.hash(),
                                                 ntns.nt_request,
                                                 new ConfBuf("the string"))
                       });
       // Or, equivalently:
       result = action.call("<request>the string</request>");
   }
```




 **Example 3: Using regexp search**

 This example shows how to use a regular expression when navigating
 *NAVU*.
 The expression is divided by / per level. Furthermore, a
 list element has two levels; one for the list node name, and one
 for the list element key. When matching against keys, keep in mind that
 the string representation of a key contains surrounding braces and that
 the key values will be quoted if they contain special characters.




```
   // Select all friends whose names begin with the letter a
   // (and contain more than one character)
   Collection<NavuNode> friendsColl = nt.select(".+/.+/\\{[Aa].+\\}");

   for (NavuNode friend : friendsColl) {
       System.out.println(
           ((NavuContainer)friend).leaf(ntns.nt_name).value());
       System.out.println(
           ((NavuContainer)friend).leaf(ntns.nt_age).value());
   }
```




 **Example 4: Using XPath search**




```
   Collection<NavuNode> friendsUno =
       nt.container(ntns.nt_address_book)
         .xPathSelect("friends[name='uno']/*");

   for (NavuNode friend : friendsUno) {
       System.out.println(((NavuLeaf)friend).value());
   }
```

## Types

- [AbstractXMLtoConfXMLDefaultHandler](AbstractXMLtoConfXMLDefaultHandler.md#cls-AbstractXMLtoConfXMLDefaultHandler)
- [IllegalParentNavuNodeException](IllegalParentNavuNodeException.md#cls-IllegalParentNavuNodeException)
- [InternalSAXException](InternalSAXException.md#cls-InternalSAXException)
- [KeyPath2NavuNode](KeyPath2NavuNode.md#cls-KeyPath2NavuNode)
- [NavuAction](NavuAction.md#cls-NavuAction)
- [NavuCdbSessionPool](NavuCdbSessionPool.md#cls-NavuCdbSessionPool)
- [NavuCdbSessionPoolable](NavuCdbSessionPoolable.md#cls-NavuCdbSessionPoolable)
- [NavuChange](NavuChange.md#cls-NavuChange)
- [NavuChoice](NavuChoice.md#cls-NavuChoice)
- [NavuContainer](NavuContainer.md#cls-NavuContainer)
- [NavuContext](NavuContext.md#cls-NavuContext)
- [NavuContextBase](NavuContextBase.md#cls-NavuContextBase)
- [NavuCursor](NavuCursor.md#cls-NavuCursor)
- [NavuException](NavuException.md#cls-NavuException)
- [NavuLeaf](NavuLeaf.md#cls-NavuLeaf)
- [NavuLeafList](NavuLeafList.md#cls-NavuLeafList)
- [NavuList](NavuList.md#cls-NavuList)
- [NavuListEntry](NavuListEntry.md#cls-NavuListEntry)
- [NavuNode](NavuNode.md#cls-NavuNode)
- [NavuNodeInfo](NavuNodeInfo.md#cls-NavuNodeInfo)
- [NavuNodeSetIterate](NavuNodeSetIterate.md#cls-NavuNodeSetIterate)
- [NavuParser](NavuParser.md#cls-NavuParser)
- [NavuSAXException](NavuSAXException.md#cls-NavuSAXException)
- [NavuXMLtoConfXMLParamGetHandler](NavuXMLtoConfXMLParamGetHandler.md#cls-NavuXMLtoConfXMLParamGetHandler)
- [NavuXMLtoConfXMLParamHandler](NavuXMLtoConfXMLParamHandler.md#cls-NavuXMLtoConfXMLParamHandler)
- [NavuXMLtoConfXMLParamSetHandler](NavuXMLtoConfXMLParamSetHandler.md#cls-NavuXMLtoConfXMLParamSetHandler)
- [NavuXMLtoConfXMLParamSetPrepareHandler](NavuXMLtoConfXMLParamSetPrepareHandler.md#cls-NavuXMLtoConfXMLParamSetPrepareHandler)
- [NavuXPathContext](NavuXPathContext.md#cls-NavuXPathContext)
- [NoSuchNavuCaseException](NoSuchNavuCaseException.md#cls-NoSuchNavuCaseException)
- [NoSuchNavuChoiceException](NoSuchNavuChoiceException.md#cls-NoSuchNavuChoiceException)
- [NoSuchNavuNodeException](NoSuchNavuNodeException.md#cls-NoSuchNavuNodeException)
- [PreparedXMLStatement](PreparedXMLStatement.md#cls-PreparedXMLStatement)
- [SessionContainer](SessionContainer.md#cls-SessionContainer)
- [Verbosity](Verbosity.md#cls-Verbosity)
