# com.tailf.navu.traversal

Utility package for traversing the NAVU tree (or a subset thereof)
 using the NAVU API.



 Using this package it is possible to retrieve all the `NavuNode`s
 that exist in *CDB* as well as those available through external data
 providers.



 There are two ways that one could use the Traversal API:


- *Passive traversal*: The user implements the method
 [`TraversalFilter`](TraversalFilter.md#s-TraversalFilter)
 and registers it in
 [`NavuTreeTraversal`](NavuTreeTraversal.md#s-NavuTreeTraversal).
 When all filters have been registered, the traversal process can be started
 through [`NavuTreeTraversal`](NavuTreeTraversal.md#s-NavuTreeTraversal). The
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

- [NavuTraversalBfsMean](NavuTraversalBfsMean.md#s-NavuTraversalBfsMean)
- [NavuTraversalDfsMean](NavuTraversalDfsMean.md#s-NavuTraversalDfsMean)
- [NavuTraversalMean](NavuTraversalMean.md#s-NavuTraversalMean)
- [NavuTreeTraversal](NavuTreeTraversal.md#s-NavuTreeTraversal)
- [TraversalFilter](TraversalFilter.md#s-TraversalFilter)
- [TreeIterator](TreeIterator.md#s-TreeIterator)
