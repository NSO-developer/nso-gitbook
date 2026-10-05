# com.tailf.ha

Package for setup and control of High Availability cluster nodes.


 This package is used to connect to the High Availability (HA) subsystem.
 Configuration data can then be replicated on several nodes in a cluster.


 Example:
 We set up three nodes in an HA cluster, one as primary and the other
 two as secondaries, and afterwards check their state.




```
 Socket s0 = new Socket("localhost", 4565);
 Socket s1 = new Socket("localhost", 4575);
 Socket s2 = new Socket("localhost", 4585);

 Ha ha0 = new Ha(s0, "clus0");
 Ha ha1 = new Ha(s1, "clus0");
 Ha ha2 = new Ha(s2, "clus0");

 ConfHaNode primary =
     new ConfHaNode(new ConfBuf("node0"),
                    new ConfIPv4(InetAddress.getByName("localhost")));


 ha0.bePrimary(primary.getNodeId());
 ha1.beSecondary(new ConfBuf("node1"), primary, true);
 ha2.beSecondary(new ConfBuf("node2"), primary, true);

 HaStatus status0 = ha0.status();
 HaStatus status1 = ha1.status();
 HaStatus status2 = ha2.status();
```

## Types

- [Ha](Ha.md#cls-Ha)
- [HaException](HaException.md#cls-HaException)
- [HaOrderType](HaOrderType.md#cls-HaOrderType)
- [HaStateType](HaStateType.md#cls-HaStateType)
- [HaStatus](HaStatus.md#cls-HaStatus)
