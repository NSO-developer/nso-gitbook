# com.tailf.ncs.alarmman

The Alarm Manager provides utilities for management of the NCS alarm list.

 The main features are:


- Injection of alarms - the user is provided with an API
 to inject alarms in to the NCS Alarm list.
   - Subscription of alarms from the NCS alarm list -
 the user can subscribe to updated alarms

 The following functions are available in the sub-packages of alarmman:

  - ***Alarm classes and util classes:***
  `com.tailf.ncs.alarmman.common`
  - ***Alarm subscription capabilities:***
  `com.tailf.ncs.alarmman.consumer`
  - ***Alarm creation capabilities:***
  `com.tailf.ncs.alarmman.producer`




```
                      - Subscribers (AlarmSource) -
             O                      O                     O
              ^                     ^                     ^
               \                    |                    /
                \                   |                   /
                 \                  |                  /
                  \                 |                 /
                   \                |                /
                   -----------------------------------
                   |              NCS                |
                   |              Alarm              |
                   |              List               |
                   -----------------------------------
                   ^                ^                ^
                  /                 |                 \
                 /                  |                  \
                /                   |                   \
               /                    |                    \
              /                     |                     \
             O                      O                      O
                        - Producers (AlarmSink) -
```
