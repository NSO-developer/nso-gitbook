---
description: Create and manage service deployment.
---

# Services

The **Services** view is used to view, create, and manage services in your NSO deployment. The default **Services** view displays the existing services.

<div data-with-frame="true"><figure><img src="../../.gitbook/assets/services.png" alt=""><figcaption><p>Services View</p></figcaption></figure></div>

## Search <a href="#d5e6128" id="d5e6128"></a>

If you have multiple services configured, you can use the **Search** to filter down results to the service of your choice. The search filter matches the entered characters to the service name and shows the results accordingly. Results are shown only for the service point that you have selected.

To filter the service list:

1. In the **Select service type** drop-down, select the service point to populate all the services under it.
2. Enter a partial or full name of the service you are searching for.
3. Press **Enter**.

## Create a Service <a href="#d5e6142" id="d5e6142"></a>

To create and deploy a service:

1. In the **Select service type** drop-down, select the service point.
2. Click the **Add service** button. You will be redirected to the **Configuration editor** view.
3. Click the <img src="../../.gitbook/assets/add-button.png" alt="" data-size="line" height="16"> button.
4. In the pop-up, enter the name of the service that will identify it.
5. Click **Create**.
6. You can configure additional service data in the **Configuration editor**.
7. Review and commit the service to NSO in the **Transactions** view. Committing the service deploys it to NSO and displays it in the **Services** view.

## Edit Service Configuration <a href="#d5e6291" id="d5e6291"></a>

Service configuration is viewed and carried out in the Configuration Editor. In the **Services** view, you can use the **Modify in Config Editor** option on the desired service to access its config in the Configuration Editor. You need to have **Edit mode** enabled to perform edits.

{% hint style="warning" %}
The **Configuration editor** view shows a host of options when configuring a service. You are expected to be well-versed with these options (and service concepts in general) before you delve into service configuration. Refer to the [Services](../../development/core-concepts/services.md) and [Developing Services](../../development/advanced-development/developing-services/) documentation for more information.
{% endhint %}

## Apply an Action on a Service <a href="#d5e6164" id="d5e6164"></a>

You can apply actions to a service from the **Services** view or the **Config editor**.

{% tabs %}
{% tab title="From the Services View" %}
To apply an action on a service:

1. Select a service point to display its services.
2. On the desired service row, click the more options <img src="../../.gitbook/assets/more-options.png" alt="" data-size="line" height="16"> button.
3. Select the desired action.
4. Configure any available parameters in the drawer.
5. Click **Run** to initiate the action.

{% hint style="info" %}
You can run **Check sync** on multiple services at once. Select the services using the checkboxes, then use the **Choose actions** button.
{% endhint %}

**Actions Possible in the Services View**

The available actions depend on the selected service schema and your access permissions. Possible actions include **Check sync**, **Deep check sync**, **Redeploy**, **Reactive redeploy**, **Touch**, **Get modifications**, **Undeploy**, **Set rank**, and **Purge**. See [Lifecycle Operations](../operations/lifecycle-operations.md) for details of these actions.

{% hint style="info" %}
The **Modify in Config Editor** and **Delete** options are GUI-specific operations accessible on the service row.
{% endhint %}
{% endtab %}

{% tab title="From the Config Editor" %}
You can also apply actions to an individual service from the **Config editor**. The same service actions are available directly from the **Services** view.

1. Access the service in the **Config editor** by selecting **Modify in Config Editor** on the service row.
2. Click **Actions** and select the desired action.
3. Configure any available parameters in the drawer.
4. Click **Run** to initiate the action.
{% endtab %}
{% endtabs %}

## View Service Details

To view details of a service:

1. In the **Select service type** drop-down, select the service point.
2. Click the desired service. This opens up the service details view.
3. Browse service details using the following tabs:
   * **Details**
   * **Plan** (hidden if no plan configured)
   * **Log**

## Delete a Service <a href="#d5e6324" id="d5e6324"></a>

To delete a service instance:

1. In the **Select service type** drop-down list, select the service point.
2. Select, using the checkbox, the service to be deleted. You can select multiple services at once.
3. Click **Delete**.
4. Confirm the intent in the pop-up.
5. Review and commit the change in the **Transactions** view.

{% hint style="info" %}
To skip the commit management (Transactions) review, use the **Commit changes directly** option in the **Delete service instance** pop-up.
{% endhint %}
