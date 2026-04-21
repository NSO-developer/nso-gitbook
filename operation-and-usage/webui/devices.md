---
description: Manage devices, device groups, and authgroups in your NSO deployment.
---

# Devices

The **Devices** section provides options to manage devices, device groups, and authgroups in the NSO network.&#x20;

## Device Management <a href="#d5e5752" id="d5e5752"></a>

The **Device management** view lists the devices in the network and provides options to manage them. Expand a device in the list to view more details about it.

<div data-with-frame="true"><figure><img src="../../.gitbook/assets/device-management.png" alt=""><figcaption><p>Device Management View</p></figcaption></figure></div>

### **Search and Filter Devices**

You can search for a device by its name, IP address, or other parameters. You can also narrow down the results by using the **Select device group** filter.

### **Add a Device**

To add a new device to NSO:

1. Click the **Add device** button. You will be redirected to the **Configuration editor**.
2. Click the **Add list item** button.
3. Enter the name of the device.
4. Click the device name in the list to configure the device further.
5. Review and commit the changes in the **Transactions** view.

### **Apply an Action on a Device**

Actions can be applied on a device from the **Device management** view or the **Configuration editor**.

{% tabs %}
{% tab title="From the Device Management View" %}
An action can be applied to a single or multiple devices at once.

1. Select the device(s) from the list using the checkbox.
2. Using the **Choose actions** button, select the desired action. The result of the action is returned momentarily.

{% hint style="info" %}
In the **Device management** view, you can also apply actions on a device using the more options <img src="../../.gitbook/assets/more-options.png" alt="" data-size="line"> button.
{% endhint %}

**Actions Possible in the Device Management View**

Available actions include **Connect**, **Ping**, **Sync from**, **Sync to**, **Check sync**, **Compare config**, **Fetch ssh host keys**, and **Apply template**, and. See [Lifecycle Operations](../operations/lifecycle-operations.md) for the details of these actions.

{% hint style="info" %}
The **Modify in Config Editor** and **Delete** are GUI-specific operations accessible by clicking the more options <img src="../../.gitbook/assets/more-options.png" alt="" data-size="line"> button on the device row.
{% endhint %}
{% endtab %}

{% tab title="From the Configuration Editor" %}
Additional actions are applied to an individual device. Use this option if you want to run an action with additional parameters.

1. Click the device name in the list. You will be redirected to the **Configuration editor** view.
2. Click the **Actions** button.
3. Click the desired action in the list.
4. At this point, you can configure different parameters.
5. Click **Run** to initiate the action.

**Actions Possible in the Configuration Editor -> Actions Tab**

If you access the device in the **Configuration editor**, the following additional actions are available:

**migrate**, **instantiate-from-other-device**, **check-yang-modules**, **scp-to**, **copy-capabilities**, **compare-config**, **connect**, **scp-from**, **find-capabilities**, **sync-from**, **disconnect**, **rename**, **add-capability**, **sync-to**, **ping**, **load-native-config**, **apply-template**, **check-sync**, **delete-config**, **clear-trace**, and **fetch-host-keys**,

See [Lifecycle Operations](../operations/lifecycle-operations.md) for the details of these actions.
{% endtab %}
{% endtabs %}

### **Edit Device Configuration**

To edit the configuration of an existing device:

1. In the **Devices** view, locate the desired device.
2. Open the device in the **Configuration editor** by either clicking the device name in the list and then enabling **Edit mode**, or by clicking the more options button <img src="../../.gitbook/assets/more-options.png" alt="" data-size="line"> on the device row and selecting **Modify in Config Editor**, which opens the device with edit mode already enabled.
3. Make the desired changes. Depending on the field type, changes are applied automatically when you update the value or when you leave the field.
4. Review and commit the change in the **Transactions** view.

## Device Groups <a href="#d5e5978" id="d5e5978"></a>

The **Device groups** view lists all the available groups and devices belonging to them. You can add new device groups in this view as well as carry out actions on devices belonging to a group.

<div data-with-frame="true"><figure><img src="../../.gitbook/assets/device-groups.png" alt=""><figcaption><p>Device Groups View</p></figcaption></figure></div>

### **Create a Device Group**

Device groups allow for the grouping and collective management of devices.

1. Click **Add device group**.
2. In the **Create device group** pop-up, specify the group name.
   * If you want to place the new device group under a parent group, select the **Place under parent device group** option and specify the parent group.
3. Click **Create**. You will be redirected to the group's details page. Here, the following panes are available:
   * **Details**: Displays basic details of the group, i.e., its name and parent/subgroup information. To link a sub-group, use the **Connect sub device group** option.
   * **Devices in this group**: Displays currently added devices in the group and provides the option to remove them from the group.
   * **Add devices**: Displays all available NSO devices and provides the option to add them to the group.
4. In the **Add devices** pane, select the device(s) that you want to add to the new group and click **Add to device group**. The added devices become visible under the **Devices in this group** pane.
5. Finally, click **Create device group**.

### **Remove Device(s) from a Device Group**

1. Click the desired device group to access the group's detail page.
2. In the **Devices in this group** pane, select the device(s) to be removed from the group.
3. Click **Remove from device group**. The devices are removed immediately (without a Commit Manager review).
4. Click **Save device group**.

### **Apply an Action on a Device Group**

Device group actions let you perform an action on all the devices belonging to a group.

1. Select the desired device group from the list. It is possible to select multiple groups at once.
2. Choose the desired action from the **Choose actions** button.

{% hint style="info" %}
In the **Device groups** view, you can also apply actions on a device group using the more options <img src="../../.gitbook/assets/more-options.png" alt="" data-size="line"> button.
{% endhint %}

**Actions Possible in the Device Groups View**

The available group actions are the same as in the section called [Apply an Action on a Device](devices.md#apply-an-action-on-a-device) (e.g., **Connect**, **Sync from**, **Sync to**, etc.) and are described in [Lifecycle Operations](../operations/lifecycle-operations.md).

{% hint style="info" %}
The **Modify in Config editor** option is accessible by clicking the more options <img src="../../.gitbook/assets/more-options.png" alt="" data-size="line"> button on a device group.
{% endhint %}

## Authgroups

The **Authgroups** view display device authentication groups and provides ways to manage them. Concepts and settings involved in the authentication groups setup are discussed in [NSO Device Management](../operations/nso-device-manager.md#user_guide.devicemanager.authgroups).

The **Authgroups** views include:

* The **Authgroups** - **group** view
* The **Authgroups** - **SNMP group** view

### Authgroups - group

The **Authgroups** - **group** view is used to view, search, and manage device authentication groups for CLI and NETCONF-managed devices.

<div data-with-frame="true"><figure><img src="../../.gitbook/assets/device-authgroups.png" alt=""><figcaption><p>Authgroups View (Group)</p></figcaption></figure></div>

#### Create an Authgroup

To create a new group:

1. Click the **Add authgroup** button.
2. Enter the **Authgroup name** and click **Continue**.
3. In the group details page, add users to the newly created group. If a default map is desired for unknown/unmapped users, use the **Set default-map** option.
   1. Click the **Add user** button to bring up the **Add user** overlay window. Here, you have the option to add the user with the authentication type set to 'remote mapping' or 'callback':
      * Remote mapping: If remote mapping is desired, specify the **local-user** that is to be mapped to remote authentication credentials and configure the following settings:
        * **remote-user**: Choose between **same-user** or **remote-name** options.
        * **remote-auth**: Choose between **same-pass**, **remote-password**, or **public-key** options.
        * **remote-secondary-auth** (optional): Choose between **same-secondary-password** or **remote-secondary-password** options.
      * Callback: If a callback-type authentication is desired to retrieve login credentials, specify the **local-user**, set the **Use callback** flag, and configure the following settings:
        * **callback-node**
        * **action-name**
   2. Click **Add**. This adds the newly created user to the group and displays it in the list.
4. Click **Create** **authgroup** to save and finish creating the group.

#### View/Edit Authgroup Details

To view/edit details of a group:

1. Click the group name to access the group details page.
2. Make the desired changes, such as adding/removing a user from the group, editing existing user settings, or configuring general group settings.
3. Click the **Save authgroup** button to save and apply the changes.

#### Delete an Authgroup

To delete a group:

{% hint style="warning" %}
Proceed with caution as the changes are applied immediately.
{% endhint %}

1. Select the desired group using the checkbox.
2. Click **Delete**.
3. Confirm the intent by pressing **Delete** in the pop-up.

### Authgroups - SNMP group

The **Authgroups** **-** **SNMP group** view is used to view, search, and manage device authentication groups for SNMP-managed devices.

<div data-with-frame="true"><figure><img src="../../.gitbook/assets/device-snmpgroup.png" alt=""><figcaption><p>Authgroups View (SNMP Group)</p></figcaption></figure></div>

#### Create an SNMP Group

To add a new group:

1. Click the **Add SNMP group** button.
2. Enter the **SNMP group name** and click **Continue**.
3. In the group details page, add users to the newly created group. If a default map is desired for unknown/unmapped users, use the **Set default-map** option.
   1. Click the **Add user** button to bring up the **Add user** overlay window.
   2. Specify the **local-user** and configure the following settings:
      * **remote-user**: Choose between **same-user** or **remote-name** options.
      * **security-level**: Use **auth-priv**. Then configure SHA as the authentication protocol and AES as the privacy protocol, together with the required remote passwords.
   3. Click **Add**. This adds the newly created user to the group and displays it in the list.
4. Click **Create** **SNMP** **group** to save and finish creating the group.

#### View/Edit SNMP Group Details

To view/edit details of a group:

1. Click the group name to access the group details page.
2. Make the desired changes, such as adding/removing a user from the group, editing existing user settings, or configuring general group settings.
3. Click the **Save SNMP group** button to save and apply the changes.

#### Delete an SNMP Group

To delete a group:

{% hint style="warning" %}
Proceed with caution as the changes are applied immediately.
{% endhint %}

1. Select the desired group using the checkbox.
2. Click **Delete**.
3. Confirm the intent by pressing **Delete** in the pop-up.
