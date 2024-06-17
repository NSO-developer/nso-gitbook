---
description: Create and manage service deployment.
---

# Services

The **Service manager** view is where you create, deploy, and manage services in your NSO deployment. Available services are displayed in this view by default.

<figure><img src="../../images/service-view.png" alt=""><figcaption><p>Service Manager View</p></figcaption></figure>

{% hint style="info" %}
**Columns in the Services List**

* **name**: The name of the service.
* **plan**: Shows the service plan.
* **devices**: Shows the number of devices associated with the service. Use the refresh <img src="../../images/refresh.png" alt="" data-size="line"> button to reload the devices list.
* **check-sync**, **re-deploy**, and **re-deploy dry-run** denote the actions that you can perform on a service.
{% endhint %}

{% hint style="success" %}
Hide and display the columns of your choice by using the column selection <img src="../../images/col-select.png" alt="" data-size="line"> icon.
{% endhint %}

## Search Filter <a href="#d5e6128" id="d5e6128"></a>

If you have several services configured, you can use the **Search filter** to filter down results to the services(s) of your choice. The search filter matches the entered characters to the service name and shows the results accordingly. Results are shown only for the service point that you have selected.

To filter the service list:

1. Select the desired service point from the list to populate all the services under it.
2. Enter a partial or full name of the service you are searching for.
3. Press **Enter**.

## Create a Service <a href="#d5e6142" id="d5e6142"></a>

1. In the **Select service point** drop-down list, select a service point.
2. Click the add <img src="../../images/add-action.png" alt="" data-size="line"> button.
3. In the **Create service** pop-up, enter the name of the service.
4. Confirm the intent.
5. Review and commit the service to NSO in the **Commit manager**.

## Apply an Action on a Service <a href="#d5e6164" id="d5e6164"></a>

You can apply actions on a service from the **Service manager** view or the **Configuration editor**.

Start by selecting a service point to populate all services under it, and then follow the instructions below.

{% tabs %}
{% tab title="From the Service Manager View" %}
You can apply an action on a single service or multiple services at once.

To apply an action on a service:

* On the desired service in the list, click the action button (i.e., **check-sync**, **re-deploy**, or **re-deploy dry-run**).

To apply an action on multiple services:

1. Select the desired services from the list.
2. Using the **run action** <img src="../../images/run-action.png" alt="" data-size="line"> button, select the desired service action.
3. Confirm the intent.

**Actions Possible in the Service Manager View**

Available actions include **check-sync**, **re-deploy**, and **re-deploy dry-run**.

See [Lifecycle Operations](../cli-1/lifecycle-operations.md) for the details of these actions.

{% hint style="info" %}
**Action Result**

The result of running a basic action is displayed using one of the following colors:

* A red button color means that the action was unsuccessful.
* A green button color means that the action was successful.

Expand the button further to get more information about the result.
{% endhint %}
{% endtab %}

{% tab title="From the Configuration Editor -> Actions Tab" %}
Additional actions are applied per individual service. Use this option if you want to run an action with additional parameters.

1. Click the service name in the list.
2. Access the **Actions** tab in the **Configuration editor**.
3. Click the desired action in the list.
4.  At this point, you can configure different parameters.

    (Use the **Reset action parameters** option to reset all parameters to default value).
5. Run the action.

{% hint style="info" %}
Fetch the action information by clicking the info <img src="../../images/actions-info.png" alt="" data-size="line"> icon in the **Configuration editor** -> **Actions** tab.
{% endhint %}

**Actions Possible in the Configuration Editor -> Actions Tab**

Access the service in the **Configuration editor** to run the following actions: **reactive-re-deploy**, **un-deploy**, **deep-check-sync**, **touch, set-rank**, **get-modifications**, **purge**.

See [Lifecycle Operations](../cli-1/lifecycle-operations.md) for the details of these actions.
{% endtab %}
{% endtabs %}

## Edit Service Configuration <a href="#d5e6291" id="d5e6291"></a>

Service configuration is viewed and carried out in the Configuration Editor.

{% hint style="info" %}
The **Configuration editor** view shows a host of options when configuring a service. You are expected to be well-versed with these options (and service concepts in general) before you delve into service configuration. Refer to the [Services](../../development/concepts/services.md) and [Developing Services](../../development/development/developing-services/) documentation for more information.
{% endhint %}

To start configuring a service:

1. Click the service name in the list.
2. In the **Configuration editor**, access the **Edit config** tab to make changes to the service.
3. Commit the changes in the **Commit manager**.

{% hint style="info" %}
The other two tabs, i.e., **Config** and **Operdata** can be respectively used to:

* View the service configuration, and,
* View the service's operational data.
{% endhint %}

## Delete a Service <a href="#d5e6324" id="d5e6324"></a>

1. In the services list, click the service that you want to delete. You can select multiple services.
2. Click the remove <img src="../../images/remove-action.png" alt="" data-size="line"> button.
3. Review and commit the change in the **Commit manager**.
