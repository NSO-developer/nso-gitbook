# com.tailf.navu

NAVU (Navigation Utilities) is an API which provides increased
 accessibility to the ConfD/NCS populated data model tree:
 NAVU-Tree.

 It is important to understand the distinction between a populated
 data tree and a schema tree.

 The NAVU-Tree is built on top of the schema tree
 [`MaapiSchemas`](../maapi/MaapiSchemas.md#s-MaapiSchemas) which is a linked structures of
 [`CSNode`](../maapi/MaapiSchemas/CSNode.md#s-CSNode) nodes. Each node in NAVU
 holds a reference to its corresponding `CSNode` which can be
 obtained through [`NavuNodeInfo`](NavuNodeInfo.md#s-NavuNodeInfo):



```
   NavuNode node = ...;
   MaapiSchemas.CSNode rawCSNode = node.getInfo().getCSNode();
```




 Navigation is done entirely on the populated `NAVU-Tree`.
 Each keypath represents a node or a `NavuNode`.

 A context ([`NavuContext`](NavuContext.md#s-NavuContext)) needs to be created and
 supplied before further navigation can be performed.



```
   NavuContext context = new NavuContext(maapi);
   context.startRunningTrans(Conf.MODE_READ_WRITE);
   NavuContainer base = new NavuContainer(context);
```



 NAVU uses its current context to retrieve its list instances with keys
 and its leafs with data values.

 In NAVU, a list instance is mapping between a
 [`ConfKey`](../conf/ConfKey.md#s-ConfKey) and an instance of
 [`NavuListEntry`](NavuListEntry.md#s-NavuListEntry) which is a subclass of
 [`NavuContainer`](NavuContainer.md#s-NavuContainer). The method
 [`NavuList`](NavuList.md#s-NavuList) (or one of its
 overloaded variants) retrieves the list entry.

 A [`NavuLeaf`](NavuLeaf.md#s-NavuLeaf) holds a value
 ([`ConfValue`](../conf/ConfValue.md#s-ConfValue)) that is retrieved through the current
 `NavuContext`.

 NAVU caches data throughout its NAVU-Tree.

 NAVU builds up its tree lazily, which means that it populates
 its children one level at a time. Internally in each NAVU class
 there exists a `refresh` method that retrieves the child
 nodes and stores them in a hash map.


 An explicit instance of a [`NavuContainer`](NavuContainer.md#s-NavuContainer) with only
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
 is to explicitly call [`NavuNode`](NavuNode.md#s-NavuNode)
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

 [`NavuNode`](NavuNode.md#s-NavuNode),
 [`NavuNode`](NavuNode.md#s-NavuNode) or
 [`NavuNode`](NavuNode.md#s-NavuNode) to move to the next
 level (depending on how the *yang* module is modeled).



 The main features of *NAVU* are:


- Tree *navigation* through the `NAVU-Tree`.

   - Regexp-based [`NavuContainer`](NavuContainer.md#s-NavuContainer),
 [`NavuContainer`](NavuContainer.md#s-NavuContainer),
 [`NavuContainer`](NavuContainer.md#s-NavuContainer) or through simplified
 XPath expression [`NavuContainer`](NavuContainer.md#s-NavuContainer),
 [`NavuContainer`](NavuContainer.md#s-NavuContainer)
 search through the tree structure: A regular expression search is provided
 to enable a free search.

     - Invocation of actions: Actions may be invoked from
 [`NavuAction`](NavuAction.md#s-NavuAction) nodes.

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


          - [`NavuContainer`](NavuContainer.md#s-NavuContainer) - is roughly equivalent to the
 *YANG* *container* node type. Within *NAVU* it is also used
 to represent the module root and list element nodes (through the subclass
 [`NavuListEntry`](NavuListEntry.md#s-NavuListEntry)).

             - [`NavuList`](NavuList.md#s-NavuList) - represents the *YANG* *list*
 node and provides a `NavuListEntry` collection.

               - [`NavuLeaf`](NavuLeaf.md#s-NavuLeaf) - represents *YANG* *leaf*
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

- [AbstractXMLtoConfXMLDefaultHandler](AbstractXMLtoConfXMLDefaultHandler.md#s-AbstractXMLtoConfXMLDefaultHandler)
- [IllegalParentNavuNodeException](IllegalParentNavuNodeException.md#s-IllegalParentNavuNodeException)
- [InternalSAXException](InternalSAXException.md#s-InternalSAXException)
- [KeyPath2NavuNode](KeyPath2NavuNode.md#s-KeyPath2NavuNode)
- [NavuAction](NavuAction.md#s-NavuAction)
- [NavuCdbSessionPool](NavuCdbSessionPool.md#s-NavuCdbSessionPool)
- [NavuCdbSessionPoolable](NavuCdbSessionPoolable.md#s-NavuCdbSessionPoolable)
- [NavuCdbSessionPoolImpl](NavuCdbSessionPoolImpl.md#s-NavuCdbSessionPoolImpl)
- [NavuChange](NavuChange.md#s-NavuChange)
- [NavuChangeDiffIterate](NavuChangeDiffIterate.md#s-NavuChangeDiffIterate)
- [NavuChoice](NavuChoice.md#s-NavuChoice)
- [NavuContainer](NavuContainer.md#s-NavuContainer)
- [NavuContext](NavuContext.md#s-NavuContext)
- [NavuContextBase](NavuContextBase.md#s-NavuContextBase)
- [NavuCursor](NavuCursor.md#s-NavuCursor)
- [NavuException](NavuException.md#s-NavuException)
- [NavuLeaf](NavuLeaf.md#s-NavuLeaf)
- [NavuLeafList](NavuLeafList.md#s-NavuLeafList)
- [NavuLeafListIterator](NavuLeafListIterator.md#s-NavuLeafListIterator)
- [NavuLinkedHashMap](NavuLinkedHashMap.md#s-NavuLinkedHashMap)
- [NavuList](NavuList.md#s-NavuList)
- [NavuListEntry](NavuListEntry.md#s-NavuListEntry)
- [NavuListEntryContext](NavuListEntryContext.md#s-NavuListEntryContext)
- [NavuListEntryIterator](NavuListEntryIterator.md#s-NavuListEntryIterator)
- [NavuNode](NavuNode.md#s-NavuNode)
- [NavuNodeInfo](NavuNodeInfo.md#s-NavuNodeInfo)
- [NavuNodeSetIterate](NavuNodeSetIterate.md#s-NavuNodeSetIterate)
- [NavuParser](NavuParser.md#s-NavuParser)
- [NavuSAXException](NavuSAXException.md#s-NavuSAXException)
- [NavuXMLtoConfXMLParamGetHandler](NavuXMLtoConfXMLParamGetHandler.md#s-NavuXMLtoConfXMLParamGetHandler)
- [NavuXMLtoConfXMLParamHandler](NavuXMLtoConfXMLParamHandler.md#s-NavuXMLtoConfXMLParamHandler)
- [NavuXMLtoConfXMLParamSetHandler](NavuXMLtoConfXMLParamSetHandler.md#s-NavuXMLtoConfXMLParamSetHandler)
- [NavuXMLtoConfXMLParamSetPrepareHandler](NavuXMLtoConfXMLParamSetPrepareHandler.md#s-NavuXMLtoConfXMLParamSetPrepareHandler)
- [NavuXPathContext](NavuXPathContext.md#s-NavuXPathContext)
- [NavuXPathSelect](NavuXPathSelect.md#s-NavuXPathSelect)
- [NavuXPathSelectIterate](NavuXPathSelectIterate.md#s-NavuXPathSelectIterate)
- [NavuXPathSelectResultSet](NavuXPathSelectResultSet.md#s-NavuXPathSelectResultSet)
- [NavuXPathSelectResultSetAccumulate](NavuXPathSelectResultSetAccumulate.md#s-NavuXPathSelectResultSetAccumulate)
- [NavuXPathSelectResultSetIterate](NavuXPathSelectResultSetIterate.md#s-NavuXPathSelectResultSetIterate)
- [NoSuchNavuCaseException](NoSuchNavuCaseException.md#s-NoSuchNavuCaseException)
- [NoSuchNavuChoiceException](NoSuchNavuChoiceException.md#s-NoSuchNavuChoiceException)
- [NoSuchNavuNodeException](NoSuchNavuNodeException.md#s-NoSuchNavuNodeException)
- [PreparedXMLStatement](PreparedXMLStatement.md#s-PreparedXMLStatement)
- [SessionContainer](SessionContainer.md#s-SessionContainer)
- [Verbosity](Verbosity.md#s-Verbosity)
