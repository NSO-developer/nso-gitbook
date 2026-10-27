---
description: Traverse and edit NSO configuration using the YANG model.
---

# Config Editor

The **Configuration editor** view is the main interface for browsing and managing NSO configuration using the underlying YANG model. It displays the loaded YANG modules and configuration data in a hierarchical tree and provides a form-based view of the selected node.

In this view, you can browse configuration, inspect operational data, edit configurable nodes, invoke actions, and review metadata for the selected node. Depending on how you navigate in the Web UI, you may also be directed to the **Configuration editor** to continue viewing or editing a specific device, service, package, or other NSO object.

The **Configuration editor** consists of the following main parts:

* A navigation tree for browsing the YANG hierarchy.
* A form-based content area that renders the selected node.
* A **Metadata** button that opens a drawer with details about the selected node.
* Context-sensitive actions for nodes that support actions or presence operations.

<div data-with-frame="true"><figure><img src="../../.gitbook/assets/config-editor.png" alt=""><figcaption><p>Configuration Editor Main View</p></figcaption></figure></div>

## View Options

The following options are available in the **Configuration editor** view:

* **Include oper data**: Displays operational data together with the configuration tree. Use this option when you want to inspect runtime or status information in addition to configured data.
* **Edit mode**: Enables editing in the **Configuration editor**. When edit mode is enabled, configurable nodes can be modified directly in the rendered form or list view. When it is disabled, the view is read-only.

## Configuration Navigation

The Configuration Editor displays configuration defined by the YANG model in a hierarchical tree structure that you can browse and navigate. Expand nodes to reveal their child nodes, and use the filter field to narrow the visible nodes in the current tree. Choice nodes are expanded by default. Select choice and case labels to expand or collapse them. Drag the divider between the navigation tree and the rendered view to resize the tree.

Use **Filters** next to the filter field to choose whether action and leaf nodes appear in the tree:

* **Show actions** displays action nodes.
* **Show leafs** displays leaf nodes.

Select **Apply** to update the tree with the selected filters.

Selecting a node in the tree updates the content area to show the selected node. The rendered view depends on the type of YANG node selected. The tree itself shows the hierarchy, while the content area shows the data and controls available for the selected node.

For example, to access a specific device, enter **devices** in the filter field, expand **ncs:devices**, select **device** to load the device list, and then select the **ce0** entry to view or configure it.

<div data-with-frame="true"><figure><img src="../../.gitbook/assets/config-navigator.png" alt=""><figcaption><p>Configuration Navigation Example</p></figcaption></figure></div>

### Breadcrumb

The breadcrumb above the tree shows the current navigation path, for example **/ > ncs:devices > device > {ce1}**. This helps identify the selected node and the current root of the rendered view as you move deeper into the YANG hierarchy.

### Tree Icons

The tree shows the following icons. Leaf and action nodes appear according to the selected **Filters**; operational-data nodes appear when **Include oper data** is selected.

| Icon                                                                                        | Meaning                                                  |
| ------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| Key icon <img src="../../.gitbook/assets/key-icon.png" alt="" data-size="line" height="16">             | A key leaf, meaning a value that identifies a list entry |
| Leaf icon <img src="../../.gitbook/assets/leaf-icon.png" alt="" data-size="line" height="16">           | A regular leaf node                                      |
| List icon <img src="../../.gitbook/assets/list-icon.png" alt="" data-size="line" height="16">           | A list and leaf-list node                                |
| Split/arrows icon <img src="../../.gitbook/assets/choice-icon.png" alt="" data-size="line" height="16"> | A choice node                                            |
| Lightning icon <img src="../../.gitbook/assets/lighting-icon.png" alt="" data-size="line" height="16">  | An action node                                           |
| Database icon <img src="../../.gitbook/assets/database-icon.png" alt="" data-size="line" height="16">   | A node with operational data                             |

### Rendered Node View

When a node is selected, the content area on the right renders that node as a form or list-based view. Leaf values are shown directly as fields, while nested containers, lists, and leaf-lists must be selected from the tree to be rendered separately.

#### Input Fields and Behavior

Input fields in the rendered view depend on the YANG type of the selected node. For example, fields may be shown as text inputs, selection controls, or other widgets depending on the allowed values and schema definition.

Rendered fields show their YANG descriptions and default values. If a description or default value is not available, it is not shown. Additional node details, such as type and access, are available in the **Metadata** drawer.

Depending on the field type, changes are applied automatically when you update the value or when you leave the field. If a value is invalid or cannot be applied, the UI indicates the error on the relevant field so that you can correct it before committing the change.

#### **Show Configuration As**

Use **Show as** above the rendered node view to display the selected configuration in one of the following formats:

* Cisco XR CLI
* Juniper curly-brace CLI
* Set commands
* XML
* JSON
* XPath
* Keypath
* RESTCONF paths
* NETCONF get
* Maagic objects

The drawer lets you copy the displayed configuration or save it to a file.
#### Lists and Leaf-lists

In **Edit mode**, you can add or delete entries in editable lists and leaf-lists. When the YANG model declares a list or leaf-list as `ordered-by user`, you can arrange its entries in a user-defined order. Use the row actions to move an entry to the first or last position, or before or after another entry.

#### Service Plans

When the selected node is a service instance with plan data, the rendered view includes a **Plan** section that displays the service plan as a graphical representation. You can inspect it without leaving the **Configuration editor**.

#### Choice

YANG choices are rendered as grouped choice widgets in the content area. In the tree, a choice or case branch can be expanded for navigation, but selecting the parent context renders the choice as a whole widget, while selecting an individual child node renders only that specific node.

#### YANG `when` Statements

A node with a YANG `when` statement is available only when its condition evaluates to `true`. If the condition evaluates to `false`, the node is hidden from the tree. For a choice, cases whose `when` conditions evaluate to `false`, are hidden. The choice is hidden when none of its cases are available.

#### Metadata

Select **Metadata** above the rendered view to open a drawer with schema and node information for the currently selected tree node.

Depending on the node, the metadata can include information such as node type, kind, access, description, default value, tags, and annotations. The metadata drawer is the primary way to inspect node details that are not shown directly in the rendered field view.

#### Actions

For selected container nodes that define actions, the **Actions** button is shown above the rendered view and remains available even when **Edit mode** is disabled. In the tree, however, actions are shown only when **Edit mode** is enabled. If no actions are available for the selected container, the **Actions** button is hidden. When the action's YANG schema provides a description, the action drawer displays it with the action path.

Actions open a drawer whose inputs are generated from the action's YANG schema. Review the target and available inputs, then select **Run**. The drawer shows the result or error when the action completes. For actions applied to selected list rows, the selected rows are used as the action targets.

#### Presence Containers

If the selected node is a presence container, the rendered view provides controls to create or delete that container.
