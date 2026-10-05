# com.tailf.navu.traversal

Utility package for traversing the NAVU tree (or a subset thereof)
 using the NAVU API.



 Using this package it is possible to retrieve all the `NavuNode`s
 that exist in *CDB* as well as those available through external data
 providers.



 There are two ways that one could use the Traversal API:


- *Passive traversal*: The user implements the method
 [`TraversalFilter#currentNode(com.tailf.navu.NavuNode)`](TraversalFilter.md#currentnode-6c186cdcfd7e)
 and registers it in
 [`NavuTreeTraversal#addFilter(
com.tailf.navu.traversal.TraversalFilter)`](NavuTreeTraversal.md#addfilter-8eb81a3c72a2).
 When all filters have been registered, the traversal process can be started
 through [`NavuTreeTraversal#traverse()`](NavuTreeTraversal.md#traverse-4f872e3540cb). The
 filters are invoked for each node the traversal process encounters.
- *Active traversal*:
 The user retrieves the nodes through an iterator and has full control over
 when the next `NavuNode` should be retrieved.




 The following example shows a passive traversal (Breadth-first traversal)


```
  NavuContext ctx = new NavuContext(maapi, th);
  NavuTreeTraversal traversalProcess =
      NavuTreeTraversal.createInstance(ctx, new NavuTraversalBfsMean());
  traversalProcess.addFilter(new TraversalFilter() {
      public void currentNode(NavuNode node) throws NavuException {
          // process the current node
      }
  }
  traversalProcess.traverse();
```



 The following example shows a passive traversal (Depth-first traversal)


```
  NavuContext ctx = new NavuContext(maapi, th);
  NavuTreeTraversal traversalProcess =
      NavuTreeTraversal.createInstance(ctx, new NavuTraversalDfsMean());
  traversalProcess.addFilter(new TraversalFilter() {
      public void currentNode(NavuNode node) throws NavuException {
          // process the current node
      }
  }
  traversalProcess.traverse();
```




 The following example shows an active traversal



```

  NavuContext ctx = new NavuContext(maapi, th);
  Iterator<NavuNode> it = NavuTreeTraversal.iterator(ctx);
  while(it.hasNext()) {
      NavuNode currentNode = it.next();
      // Process the node
  }
```

## Types

- [NavuTraversalBfsMean](NavuTraversalBfsMean.md#navutraversalbfsmean-ea7481a5cc40)
- [NavuTraversalDfsMean](NavuTraversalDfsMean.md#navutraversaldfsmean-0966a625a51d)
- [NavuTraversalMean](NavuTraversalMean.md#navutraversalmean-65fcdcfa38d1)
- [NavuTreeTraversal](NavuTreeTraversal.md#navutreetraversal-7a92763e1540)
- [TraversalFilter](TraversalFilter.md#traversalfilter-4e27b24c67a1)
- [TreeIterator](TreeIterator.md#treeiterator-a055e0e0311d)
