# Python ncs.alarm Module

NCS Alarm Manager module.

## Functions

### clear_alarm

```python
clear_alarm(alarm)
```

Clear an alarm.

Arguments:
    alarm -- An instance of Alarm.

### managed_object_instance

```python
managed_object_instance(instanceval)
```

Create a managed object of type instance-identifier.

Arguments:
    instanceval -- The instance-identifier (string or HKeypathRef)

### managed_object_oid

```python
managed_object_oid(oidval)
```

Create a managed object of type yang:object-identifier.

Arguments:
    oidval -- The OID (string)

### managed_object_string

```python
managed_object_string(strval)
```

Create a managed object of type string.

Arguments:
    strval --- The string value

### raise_alarm

```python
raise_alarm(alarm)
```

Raise an alarm.

Arguments:
    alarm -- An instance of Alarm.


## Classes

### _class_ **Alarm**

Class representing an alarm.

Alarm(managed_device, managed_object, alarm_type, specific_problem, severity, alarm_text, impacted_objects=None, related_alarms=None, root_cause_objects=None, time_stamp=None, custom_attributes=None)

Create an Alarm object.

Arguments:
managed_device
        The managed device this alarm is associated with. Plain string
        which identifies the device.
managed_object
        The managed object this alarm is associated with. Also referred
        to as the "Alarming Object". This object may not be referred to
        in the root_cause_objects parameter. If an NCS Service
        generates an alarm based on an error state in a device used by
        that service, managed_object should be the service Id and the
        device should be included in the root_cause_objects list. This
        parameter must be a ncs.Value object. Use one of the methods
        managed_object_string(), managed_object_oid() or
        managed_object_instance() to create the value.
alarm_type
        Type of alarm. This is a YANG identity. Alarm types are defined
        by the YANG developer and should be designed to be as specific
        as possible.
specific_problem
        If the alarm_type isn't enough to describe the alarm, this
        field can be used in combination. Keep in mind that when
        dynamically adding a specific problem, there is no way for the
        operator to know in advance which alarms can be raised.
severity
        State of the alarm; cleared, indeterminate, critical, major,
        minor, warning (enum).
alarm_text
        A human readable description of this problem.
impacted_objects
        A list of Managed Objects that may no longer function due to
        this alarm. Typically these point to NCS Services that are
        dependent on the objects on the device that reported the
        problem. In NCS 2.3 and later there is a backpointer attribute
        available on objects in the device tree that has been created by
        a Service. These backpointers are instance reference pointers
        that should be set in this list. Use one of the methods
        managed_object_string(), managed_object_oid() or
        managed_object_instance() to create the instances to populate
        this list.
related_alarms
        References to other alarms that have been generated as a
        consequence of this alarm, or that has some other relationship
        to this alarm. Should be a list of AlarmId instances.
root_cause_objects
        A list of Managed Objects that are likely to be the root cause
        of this alarm. This is different from the "Alarming Object". See
        managed_object above for details. Use one of the methods
        managed_object_string(), managed_object_oid() or
        managed_object_instance() to create the instances to populate
        this list.
time_stamp
        A date-and-time when this alarm was generated.
custom_attributes
        A list of custom leafs augmented into the alarm list.

Members:

<details>

<summary>add_attribute(...)</summary>

Method:

```python
add_attribute(self, prefix, tag, value)
```

Add or update custom attribute

</details>

<details>

<summary>add_status_attribute(...)</summary>

Method:

```python
add_status_attribute(self, prefix, tag, value)
```

Add or update custom status change attribute

</details>

<details>

<summary>alarm_id(...)</summary>

Method:

```python
alarm_id(self)
```

Get the unique Id of this alarm as an AlarmId instance.

</details>

<details>

<summary>get_key(...)</summary>

Method:

```python
get_key(self)
```

Get alarm list key.

</details>

<details>

<summary>key</summary>

_Readonly property_

Get alarm list key.

</details>

### _class_ **AlarmId**

Represents the unique Id of an Alarm.

AlarmId(alarm_type, managed_device, managed_object, specific_problem=None)

Create an AlarmId.

Members:

_None_

### _class_ **CustomAttribute**

Class representing a custom attribute set on an alarm.

CustomAttribute(prefix, tag, value)

Members:

_None_

### _class_ **CustomStatusAttribute**

Class representing a custom attribute set on an alarm.

CustomStatusAttribute(prefix, tag, value)

Members:

_None_

