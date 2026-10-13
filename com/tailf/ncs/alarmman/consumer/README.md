# com.tailf.ncs.alarmman.consumer

The Alarm Manager consumer package provides support for subscription to
 alarms in the NCS Alarm list.

 **Example: Subscription to alarms**




```
 try (Cdb cdb = new Cdb(
         "my-alarm-source-socket", NcsMain.getInstance().getAddress())) {

     // Get and start alarm source - this must only be done once per JVM
     AlarmSourceCentral asc = new AlarmSourceCentral(100000, cdb);
     asc.start();

     try (AlarmSource source = new AlarmSource(asc)) {

         // Collect subscribed alarms.
         Alarm alarm = source.takeAlarm();

         while (alarm != null) {
             System.out.println(alarm);
             for (Attribute attr: alarm.getCustomAttributes()) {
                 System.out.println(attr);
             }

             alarm = source.takeAlarm();
         }
     }
 }
```

## Types

- [AlarmSource](AlarmSource.md#alarmsource-f5bcbf5bed9e)
- [AlarmSourceCentral](AlarmSourceCentral.md#alarmsourcecentral-bdfee4422149)
