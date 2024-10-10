---
description: Create and manage service deployment.
---

# Services

The **Service manager** view is where you create, deploy, and manage services in your NSO deployment. Available services are displayed in this view by default.

<figure><img src="../../images/service-view.png" alt=""><figcaption><p>Service Manager View</p></figcaption></figure>

## Search <a href="#d5e6128" id="d5e6128"></a>

If you have several services configured, you can use the **Search** to filter down results to the services(s) of your choice. The search filter matches the entered characters to the service name and shows the results accordingly. Results are shown only for the service point that you have selected.

To filter the service list:

1. Select the desired service point from the list to populate all the services under it.
2. Enter a partial or full name of the service you are searching for.
3. Press **Enter**.

## Create a Service <a href="#d5e6142" id="d5e6142"></a>

1. In the **Select service type** drop-down list, select a service point.
2. Click the **Add service** button. You will be redirected to the Configuration Editor.
3. Click the plus <img src="../../images/add-action.png" alt="" data-size="line"> button.
4. In the **Add new list item** pop-up, enter the name of the service.
5. Confirm the intent.
6. Review and commit the service to NSO in the **Commit manager**.

## Apply an Action on a Service <a href="#d5e6164" id="d5e6164"></a>

You can apply actions on a service from the **Service manager** view or the **Configuration editor**.

Start by selecting a service point to populate all services under it, and then follow the instructions below.

{% tabs %}
{% tab title="From the Service Manager View" %}
To apply an action on a service:

1. On the desired service in the list, click the more options <img src="../../.gitbook/assets/image.png" alt="" data-size="line"> button.
2. Choose the preferred action from the list, i.e., **Re-deploy**, **Un-deploy**, **Check sync**, **Deep check sync**, or **get modifications**.&#x20;

{% hint style="info" %}
The **Check sync** action can be run on multiple services at once by selecting multiple services using the checkbox and then running the action using the **Choose actions** button.
{% endhint %}

**Actions Possible in the Service Manager View**

See [Lifecycle Operations](../operations/lifecycle-operations.md) for the details of service actions (**Re-deploy**, **Un-deploy**, **Check sync**, **Deep check sync**, and **get modifications**).
{% endtab %}

{% tab title="From the Configuration Editor -> Actions Tab" %}
Additional actions are applied to an individual service. Use this option if you want to run an action with additional parameters.

1. Access the **Actions** tab in the **Configuration editor**.
2. Click the desired action in the list.
3.  At this point, you can configure different parameters.

    (Use the **Reset action parameters** option to reset all parameters to default value).
4. Run the action.

{% hint style="info" %}
Fetch the action information by clicking the info <img src="../../images/actions-info.png" alt="" data-size="line"> icon in the **Configuration editor** -> **Actions** tab.
{% endhint %}

**Actions Possible in the Configuration Editor -> Actions Tab**

Access the service in the **Configuration editor** to run the following actions: **reactive-re-deploy**, **un-deploy**, **deep-check-sync**, **touch, set-rank**, **get-modifications**, and **purge**.

See [Lifecycle Operations](../operations/lifecycle-operations.md) for the details of these actions.
{% endtab %}
{% endtabs %}

## Edit Service Configuration <a href="#d5e6291" id="d5e6291"></a>

Service configuration is viewed and carried out in the Configuration Editor.

{% hint style="info" %}
The **Configuration editor** view shows a host of options when configuring a service. You are expected to be well-versed with these options (and service concepts in general) before you delve into service configuration. Refer to the [Services](../../development/core-concepts/services.md) and [Developing Services](../../development/advanced-development/developing-services/) documentation for more information.
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
