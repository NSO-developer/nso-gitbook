# com.tailf.ncs.alarmman.producer

The Alarm Manager producer package provides support for injection of
 alarms into the NCS Alarm list.

 **Example 1: Injection of alarm directly**




```
 // If this is not running inside the NCS JVM,
 // a maapi socket is needed in order to write the alarms.
 Maapi maapi = new Maapi(UnixDomainSocketAddress.of(Conf.NCS_PATH));
 maapi.startUserSession("system", "system");

 AlarmSink sink = new AlarmSink(maapi);
 ArrayList<AlarmId> idList = new ArrayList<AlarmId>();

 AlarmId a1 =
     new AlarmId(new ManagedDevice("device0"),
                 new ConfIdentityRef(new NcsAlarms().hash(),
                                     NcsAlarms._ncs_dev_manager_alarm),
                 new ManagedObject("/ncs:devices/device[name=device0]" +
                                   "/config/root1"));

 AlarmId a2 =
     new AlarmId(new ManagedDevice("device0"),
                 new ConfIdentityRef(new NcsAlarms().hash(),
                                     NcsAlarms._ncs_dev_manager_alarm),
                 new ManagedObject("/ncs:devices/device[name=device0]" +
                                   "/config/root2"));
 idList.add(a1);
 idList.add(a2);

 sink.submitAlarm(new ManagedDevice("device0"),
                  new ManagedObject("/ncs:devices/device[name=device0]" +
                                    "/config/root3"),
                  new ConfIdentityRef(new NcsAlarms().hash(),
                                      NcsAlarms._ncs_dev_manager_alarm),
                  new ConfBuf("My specific problem"),
                  PerceivedSeverity.WARNING,
                  new ConfBuf("This is a warning"),
                  null,
                  idList,
                  null,
                  ConfDatetime.getConfDatetime(),
                  new AlarmAttribute(new myAlarm(),
                                     myAlarm._custom_alarm_attribute_,
                                     new ConfBuf("an alarm attribute")),
                  new StatusChangeAttribute(new myAlarm(),
                                            myAlarm._custom_change_attribute_,
                                            new ConfBuf("a change")));
```




 **Example 2: Injection of alarm through AlarmSinkCental which is
 started when NCS JVM is started**




```
 AlarmSink sink = new AlarmSink();
 ArrayList<AlarmId> idList = new ArrayList<AlarmId>();

 AlarmId a1 =
     new AlarmId(new ManagedDevice("device0"),
                 new ConfIdentityRef(new NcsAlarms().hash(),
                                     NcsAlarms._ncs_dev_manager_alarm),
                 new ManagedObject("/ncs:devices/device[name=device0]" +
                                   "/config/root1"));
 AlarmId a2 =
     new AlarmId(new ManagedDevice("device0"),
                 new ConfIdentityRef(new NcsAlarms().hash(),
                                     NcsAlarms._ncs_dev_manager_alarm),
                 new ManagedObject("/ncs:devices/device[name=device0]" +
                                   "/config/root2"));
 idList.add(a1);
 idList.add(a2);

 sink.submitAlarm(new ManagedDevice("device0"),
                  new ManagedObject("/ncs:devices/device[name=device0]" +
                                    "/config/root3"),
                  new ConfIdentityRef(new NcsAlarms().hash(),
                                      NcsAlarms._ncs_dev_manager_alarm),
                  new ConfBuf("My specific problem"),
                  PerceivedSeverity.WARNING,
                  new ConfBuf("This is a warning"),
                  null,
                  idList,
                  null,
                  ConfDatetime.getConfDatetime(),
                  new AlarmAttribute(new myAlarm(),
                                     myAlarm._custom_alarm_attribute_,
                                     new ConfBuf("an alarm attribute")),
                  new StatusChangeAttribute(new myAlarm(),
                                            myAlarm._custom_change_attribute_,
                                            new ConfBuf("a change")));
```

## Types

- [AlarmSink](AlarmSink.md#alarmsink-acdd67050779)
- [AlarmSinkCentral](AlarmSinkCentral.md#alarmsinkcentral-a7b03cb7fde1)
