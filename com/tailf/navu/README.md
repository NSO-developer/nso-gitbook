# com.tailf.navu

NAVU (Navigation Utilities) is an API which provides increased
 accessibility to the ConfD/NCS populated data model tree:
 NAVU-Tree.

 It is important to understand the distinction between a populated
 data tree and a schema tree.

 The NAVU-Tree is built on top of the schema tree
 [`MaapiSchemas`](../maapi/MaapiSchemas.md#maapischemas-821ac70b83b7) which is a linked structures of
 [`CSNode`](../maapi/MaapiSchemas/CSNode.md#csnode-f12d9ad69c28) nodes. Each node in NAVU
 holds a reference to its corresponding `CSNode` which can be
 obtained through [`NavuNodeInfo#getCSNode()`](NavuNodeInfo.md#getcsnode-cf7a085aa7f5):



```
   NavuNode node = ...;
   MaapiSchemas.CSNode rawCSNode = node.getInfo().getCSNode();
```




 Navigation is done entirely on the populated `NAVU-Tree`.
 Each keypath represents a node or a `NavuNode`.

 A context ([`NavuContext`](NavuContext.md#navucontext-2974e9f92a9e)) needs to be created and
 supplied before further navigation can be performed.



```
   NavuContext context = new NavuContext(maapi);
   context.startRunningTrans(Conf.MODE_READ_WRITE);
   NavuContainer base = new NavuContainer(context);
```



 NAVU uses its current context to retrieve its list instances with keys
 and its leafs with data values.

 In NAVU, a list instance is mapping between a
 [`ConfKey`](../conf/ConfKey.md#confkey-e4e1ca98e867) and an instance of
 [`NavuListEntry`](NavuListEntry.md#navulistentry-6c6e1431f291) which is a subclass of
 [`NavuContainer`](NavuContainer.md#navucontainer-8e321756755f). The method
 [`NavuList#elem(com.tailf.conf.ConfKey)`](NavuList.md#elem-172930b5966b) (or one of its
 overloaded variants) retrieves the list entry.

 A [`NavuLeaf`](NavuLeaf.md#navuleaf-aa68380b180b) holds a value
 ([`ConfValue`](../conf/ConfValue.md#confvalue-769292781c7d)) that is retrieved through the current
 `NavuContext`.

 NAVU caches data throughout its NAVU-Tree.

 NAVU builds up its tree lazily, which means that it populates
 its children one level at a time. Internally in each NAVU class
 there exists a `refresh` method that retrieves the child
 nodes and stores them in a hash map.


 An explicit instance of a [`NavuContainer`](NavuContainer.md#navucontainer-8e321756755f) with only
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
 is to explicitly call [`NavuNode#container(Integer)`](NavuNode.md#container-abb10ecdc3f6)
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

 [`NavuNode#container(String)`](NavuNode.md#container-76f5d191b16d),
 [`NavuNode#list(String)`](NavuNode.md#list-2c1a74a3cf07) or
 [`NavuNode#leaf(String)`](NavuNode.md#leaf-ac189787d67d) to move to the next
 level (depending on how the *yang* module is modeled).



 The main features of *NAVU* are:


- Tree *navigation* through the `NAVU-Tree`.

   - Regexp-based [`NavuContainer#select(ConfObject[])`](NavuContainer.md#select-336dd76cd112),
 `NavuContainer#select(java.util.List)`,
 [`NavuContainer#select(String)`](NavuContainer.md#select-5031325154b9) or through simplified
 XPath expression `NavuContainer#xPathSelect(String)`,
 `NavuContainer#xPathSelectIterate(String,
                                                        NavuNodeSetIterate)`
 search through the tree structure: A regular expression search is provided
 to enable a free search.

     - Invocation of actions: Actions may be invoked from
 [`NavuAction`](NavuAction.md#navuaction-d853bc49f0e8) nodes.

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


          - [`NavuContainer`](NavuContainer.md#navucontainer-8e321756755f) - is roughly equivalent to the
 *YANG* *container* node type. Within *NAVU* it is also used
 to represent the module root and list element nodes (through the subclass
 [`NavuListEntry`](NavuListEntry.md#navulistentry-6c6e1431f291)).

             - [`NavuList`](NavuList.md#navulist-472e8d6d3745) - represents the *YANG* *list*
 node and provides a `NavuListEntry` collection.

               - [`NavuLeaf`](NavuLeaf.md#navuleaf-aa68380b180b) - represents *YANG* *leaf*
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

- [AbstractXMLtoConfXMLDefaultHandler](AbstractXMLtoConfXMLDefaultHandler.md#abstractxmltoconfxmldefaulthandler-e8abaaf7c43d)
- [IllegalParentNavuNodeException](IllegalParentNavuNodeException.md#illegalparentnavunodeexception-a74e9b9f6d4a)
- [InternalSAXException](InternalSAXException.md#internalsaxexception-ecf958a8bf68)
- [KeyPath2NavuNode](KeyPath2NavuNode.md#keypath2navunode-6efe0ae690fd)
- [NavuAction](NavuAction.md#navuaction-d853bc49f0e8)
- [NavuCdbSessionPool](NavuCdbSessionPool.md#navucdbsessionpool-34864381adf5)
- [NavuCdbSessionPoolable](NavuCdbSessionPoolable.md#navucdbsessionpoolable-eedc8a7da633)
- [NavuChange](NavuChange.md#navuchange-03ae6b7f3c34)
- [NavuChoice](NavuChoice.md#navuchoice-e8914a50eee5)
- [NavuContainer](NavuContainer.md#navucontainer-8e321756755f)
- [NavuContext](NavuContext.md#navucontext-2974e9f92a9e)
- [NavuContextBase](NavuContextBase.md#navucontextbase-0061e2b12534)
- [NavuCursor](NavuCursor.md#navucursor-11e7b4ede514)
- [NavuException](NavuException.md#navuexception-d80fa0cb4f3f)
- [NavuLeaf](NavuLeaf.md#navuleaf-aa68380b180b)
- [NavuLeafList](NavuLeafList.md#navuleaflist-8d16c43a9b96)
- [NavuList](NavuList.md#navulist-472e8d6d3745)
- [NavuListEntry](NavuListEntry.md#navulistentry-6c6e1431f291)
- [NavuNode](NavuNode.md#navunode-73944820c8db)
- [NavuNodeInfo](NavuNodeInfo.md#navunodeinfo-ee275327d410)
- [NavuNodeSetIterate](NavuNodeSetIterate.md#navunodesetiterate-6793a6b9b4c2)
- [NavuParser](NavuParser.md#navuparser-248c0ebe248d)
- [NavuSAXException](NavuSAXException.md#navusaxexception-11da52982a79)
- [NavuXMLtoConfXMLParamGetHandler](NavuXMLtoConfXMLParamGetHandler.md#navuxmltoconfxmlparamgethandler-2a1e3a3c3efc)
- [NavuXMLtoConfXMLParamHandler](NavuXMLtoConfXMLParamHandler.md#navuxmltoconfxmlparamhandler-2c9b9823361c)
- [NavuXMLtoConfXMLParamSetHandler](NavuXMLtoConfXMLParamSetHandler.md#navuxmltoconfxmlparamsethandler-1ff1b1b00b63)
- [NavuXMLtoConfXMLParamSetPrepareHandler](NavuXMLtoConfXMLParamSetPrepareHandler.md#navuxmltoconfxmlparamsetpreparehandler-fa4631e01f27)
- [NavuXPathContext](NavuXPathContext.md#navuxpathcontext-b07e9b4d6361)
- [NoSuchNavuCaseException](NoSuchNavuCaseException.md#nosuchnavucaseexception-2ffd47d19768)
- [NoSuchNavuChoiceException](NoSuchNavuChoiceException.md#nosuchnavuchoiceexception-553bbfa1348d)
- [NoSuchNavuNodeException](NoSuchNavuNodeException.md#nosuchnavunodeexception-55702ea478b0)
- [PreparedXMLStatement](PreparedXMLStatement.md#preparedxmlstatement-abf8aaf04b3a)
- [SessionContainer](SessionContainer.md#sessioncontainer-a2e0f5259245)
- [Verbosity](Verbosity.md#verbosity-a9c618ec424f)
