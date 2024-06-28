---
description: Develop NSO services using Visual Studio (VS) Code extensions.
---

# NSO Developer Studio

NSO Developer Studio provides an integrated framework for developing NSO services using Visual Studio (VS) Code extensions. The extensions come with a core feature set to help you create services and connect to running CDB instances from within the VS Code environment. The following extensions are available as part of the NSO Developer Studio:

* **NSO Developer Studio - Developer**: Used for creating NSO services. Also referred to as NSO Developer extension in this guide.
* **NSO Developer Studio - Explorer**: Used for connecting to and inspecting NSO instance. Also referred to as NSO Explorer extension in this guide.

{% hint style="info" %}
Throughout this guide, references to the VS Code GUI elements are made. It is recommended that you understand the GUI terminology before proceeding. To familiarize yourself with the VS Code GUI terminology, refer to VS Code [UX Guidelines](https://code.visualstudio.com/api/ux-guidelines/overview).

CodeLens is a VS Code feature to facilitate performing inline contextual actions. See [Extensions using CodeLens](https://code.visualstudio.com/blogs/2017/02/12/code-lens-roundup) for more information.
{% endhint %}

{% hint style="success" %}
#### Contribute <a href="#d5e10639" id="d5e10639"></a>

If you feel certain code snippets would be helpful or would like to help contribute to enhancing the extension, please get in touch: jwycoff@cisco.com.
{% endhint %}

## NSO Developer Studio - Developer Extension <a href="#d5e10642" id="d5e10642"></a>

This section describes the installation and functionality of the NSO Developer extension.

The purpose of the NSO Developer extension is to provide a base framework for developers to create their own NSO services. The focus of this guide is to manifest the creation of a simple NSO service package using the NSO Developer extension. At this time, reactive FastMAP and Nano services are not supported with this extension.

In terms of an NSO package, the extension supports YANG, XML, and Python to bring together various elements required to create a simple service.

After the installation, you can use the extension to create services and perform additional functions described below.

### System Requirements <a href="#d5e10648" id="d5e10648"></a>

To get started with development using the NSO Developer extension, ensure that the following prerequisites are met on your system. The prerequisites are not a requirement to install the NSO Developer extension, but for NSO development after the extension is installed.

* Visual Studio Code.
* Java JDK 11 or higher.
* Python 3.9 or higher (recommended).

### Install the Extension <a href="#d5e10658" id="d5e10658"></a>

Installation of the NSO Developer extension is done via the VS Code marketplace.

To install the NSO Developer extension in your VS Code environment:

1. Open VS Code and click the **Extensions** icon on the **Activity Bar**.
2. Search for the extension using the keywords "nso developer studio" in the **Search Extensions in Marketplace** field.
3. In the search results, locate the extension (**NSO Developer Studio - Developer**) and click **Install**.
4. Wait while the installation completes. A notification at the bottom-right corner indicates that the installation has finished. After the installation, an NSO icon is added to the **Activity Bar**.

### Make a New Service Package (Python only) <a href="#d5e10677" id="d5e10677"></a>

Use the **Make Package** command in VS Code to create a new Python package. The purpose of this command is to provide functionality similar to the `ncs-make-package` CLI command, that is, to create a basic structure for you to start developing a new Python service package. The `ncs-make-package` command, however, comes with several additional options to create a package.

To make a new Python service package:

1. In the VS Code menu, go to **View**, and choose **Command Palette**.
2. In the **Command Palette**, type or pick the command **NSO: Make Package**. This brings up the **Make Package** dialog where you can configure package details.
3. In the **Make Package** dialog, specify the following package details:
   * **Package Name**: Name of the package.
   * **Package Location**: Destination folder where the package is to be created.
   * **Namespace**: Namespace of the YANG module, e.g. `http://www.cisco.com/myModule`.
   * **Prefix**: The prefix to be given to the YANG module, e.g. `msp`.
   * **Yang Version**: The YANG version that this module follows.
4. Click **Create Package**. This creates the required package and opens up a new instance of VS Code with the newly created NSO package.
5. If the **Workspace Trust** dialog is shown, click **Yes, I Trust the Authors**.

#### **Open an Existing Package**

Use the **Open Existing Package** command to open an already existing package.

To open an existing package:

1. In the VS Code menu, go to **View**, then choose **Command Palette**.
2. In the **Command Palette**, type or pick the command **NSO: Open Existing Package**.
3. Browse for the package on your local disk and open it. This brings up a new instance of VS Code and opens the package in it.

### Edit YANG files <a href="#d5e10738" id="d5e10738"></a>

Opening a YANG file for edit results in VS Code detecting syntax errors in the YANG file. The errors show up due to missing path to YANG files and can be resolved using the following procedure.

**Add YANG models for Yangster**

For YANG support, a third-party extension called Yangster is used. Yangster is able to resolve imports for core NSO models but requires additional configuration.

To add YANG models for Yangster:

1. Create a new file named `yang.settings` by right-clicking in the blank area of the **Explorer** view and choosing **New File** from the pop-up.
2. Locate the NSO source YANG files on your local disk and copy the path.
3. In the file `yang.settings`, enter the path in the JSON format: `{ "yangPath": "<path to Yang files >" }`, for example, `{ "yangPath": /home/my-user-name/nso-6.0/src/ncs/yang}`. On Microsoft Windows, make sure that the backslash (`\`) is escaped, e.g., "`C:\\user\\folder\\src\\yang`".
4. Save the file.
5. Wait while the Yangster extension indexes and parses the YANG file to resolve NSO imports. After the parsing is finished, errors in the YANG file will disappear.

#### **View YANG Diagram**

YANG diagram is a feature provided by the Yangster extension.

To view the YANG diagram:

1. Update the YANG file. (Pressing **Ctrl+space** brings up auto-completion where applicable.)
2. Right-click anywhere in the VS Code **Editor** area and select **Open in Diagram** in the pop-up.

#### **Add a New YANG Module**

To add a new YANG module:

1. In the **Explorer** view, navigate to the **yang** folder and select it.
2. Right-click on the **yang** folder and select **NSO: Add Yang Module** from the pop-up menu. This brings up the **Create Yang Module** dialog where you can configure module details.
3. In the **Create Yang Module** dialog, fill in the following details:
   * **Module Name**: Name of the module.
   * **Namespace**: Namespace of the module, e.g., `http://www.cisco.com/myModule`.
   * **Prefix**: Prefix for the YANG module.
   * **Yang Version**: Version of YANG for this module.
4. Click **Finish**. This creates and opens up the newly created module.

#### **Add a Service Point**

Often while working on a package, there is a requirement to create a new service. This usually involves adding a service point. Adding a service point also requires other parts of the files to be updated, for example, Python.

Service points are usually added to lists.

To add a service point:

1.  Update your YANG model as required. The extension automatically detects the list elements and displays a CodeLens called **Add Service Point**. An example is shown below.

    ```
      container users {
        list user {
          key "name";
          description
            "This is a list of users in the system.";
        leaf name {
          type string;
          }
        leaf type {
          type string;
          }
        leaf full-name {
          type string;
          }
        }
      }
    ```
2. Click the **Add Service Point** CodeLens. This brings up the **Add Service Point** dialog.
3. Fill in the **Service Point ID** that is used to identify the service point, for example, `mySimpleService`.
4. Next, in the **Python Details** section, select using the **Python Module** field if you want to create a new Python module or use an existing one.
   * If you opt to create a new Python file, relevant sections are automatically updated in `package-meta-data.xml`.
   * If you select an existing Python module from the list, it is assumed that you are selecting the correct module and that, it has been created correctly, i.e., the `package-meta-data.xml` file is updated with the component definition.
5. Enter the **Service CB Class**, for example, `SimpleServiceCB`.
6. Finish creating the service by clicking **Add Service Point**.

#### **Register an Action Point**

All action points in a YANG model must be registered in NSO. Registering an action point also requires other parts of the files to be updated, for example, Python (`register_action`), and update `package-meta-data` if needed.

Action points are usually defined to lists or containers.

To register an action point:

1.  Update your YANG model as required. The extension automatically detects the action point elements in YANG and displays a CodeLens called **Add Action Point**. An example is shown below.

    ```
      ...
      container server {
          tailf:action ping {
          tailf:actionpoint pingaction;
            input {
              leaf destination {
                type inet:ip-address;
              }
            }
            output {
              leaf packet-loss {
                type uint8;
              }
            }
          }
        }
    ```

    ####

    Note that it is mandatory to specify `tailf:actionpoint <actionpointname>` under `tailf:action <actionname>`. This is a known limitation.

    ####

    The action point CodeLens at this time only works for the `tailf:action` statement, and not for the YANG `rpc` or YANG 1.1 `action` statements.
2. Click the **Add Action Point** CodeLens. This brings up the **Register Action Point** dialog.
3. Next, in the **Python Details** section, select using the **Python Module** field if you want to create a new Python module or use an existing one.
   * If you opt to create a new Python file, relevant sections are automatically updated in `package-meta-data.xml`.
   * If you select an existing Python module from the list, it is assumed that you are selecting the correct module, and that it has been created correctly, i.e., the `package-meta-data.xml` file is updated with the component definition.
4. Enter the action class name in the **Main Class name used as entry point** field, for example, `MyAction`.
5. Finish by clicking **Register Action Point**.

### Edit Python Files <a href="#d5e10893" id="d5e10893"></a>

Opening a Python file uses the Microsoft Pylance extension. This extension provides syntax highlighting and other features such as code completion.

{% hint style="info" %}
To resolve NCS import errors with the Pylance extension, you need to configure the path to NSO Python API in VS Code settings. To do this, go to VS Code **Preferences** > **Settings** and type `python.analysis.extraPaths` in the **Search settings** field. Next, click **Add Item**, and enter the path to NSO Python API, for example, `/home/my-user-name/nso-6.0/src/ncs/pyapi`. Press **OK** when done.
{% endhint %}

#### **Add a New Python Module**

To add a new Python module:

1. In the **Primary Sidebar**, **Explorer** view, right-click on the `python` folder.
2. Select **NSO: Add Python Module** from the pop-up. This brings up the **Create Python Module** dialog.
3. In the **Create Python Module** dialog, fill in the following details:
   * **Module Name**: Name of the module, for example, `MyServicePackage.service`.
   * **Component Name**: Name of the component that will be used to identify this module, for example, `service`.
   * **Class Name**: Name of the class to be invoked, for example, `Main`.
4. Click **Finish**.

#### **Use Python Code Completion Snippets**

Pre-defined snippets in VS Code allow for NSO Python code completion.

To use a Python code completion snippet:

1. Open a Python file for editing.
2. Type in one of the following pre-defined texts to display snippet options:
   * `maapi`: to view options for creating a `maapi` write transaction.
   * `ncs`: to view options for snippet for `ncs` template and variables.
3. Select a snippet from the pop-up to insert its code. This also highlights config items that can be changed. Press the **Tab** key to cycle through each value.

### Edit XML Template Files <a href="#d5e10958" id="d5e10958"></a>

The final part of a typical service development is creating and editing the XML configuration template.

**Add a New XML Template**

To add a new XML template:

1. In the **Primary Sidebar**, **Explorer** view, right-click on the **templates** folder.
2. Select **NSO: Add XML Template** from the pop-up. This brings up the **Add XML Template** dialog.
3. In the **Add XML Template** dialog, fill in the **XML Template** name, for example, `mspSimpleService`.
4. Click **Finish**.

**Use XML Code Completion Snippets**

Pre-defined snippets in VS Code allow for NSO XML code completion of processing instructions and variables.

To use an XML code completion snippet:

1. Open an XML file for editing.
2. Type in one of the following pre-defined texts to display snippet options:
   * For processing instructions: `<?` followed by a character, for example `<?i` to view snippets for an `if` statement. All supported processing instructions are available as snippets.
   *   For variables: `$` followed by a character(s) matching the variable name, for example, `$VA` to view the variable snippet. Variables defined in the XML template via the `<?set` processing instruction or defined in Python code are displayed.

       ####

       Note: Auto-completion can also be triggered by pressing the **Ctrl+Space** keys.
3. Select an option from the pop-up to insert the relevant XML processing instruction or variable. Items that require further configuration are highlighted. Press the **Tab** key to cycle through the items.

**XML Code Validation**

The NSO Developer extension also performs code validation wherever possible. The following warning and error messages are shown if the extension is unable to validate the code:

* A warning is shown if a user enters a variable in an XML template that is not detected by the NSO Developer extension.
* An error message is shown if the ending tags in a processing instruction do not match.

### Limitations <a href="#d5e11016" id="d5e11016"></a>

The extension provides help on a best-effort basis by showing error messages and warnings wherever possible. Still, in certain situations, code validation is not possible. An example of such a limitation is when the extension is not able to detect a template variable that is defined elsewhere and passed indirectly (i.e., the variable is not directly called).

Consider the following code for example, where the extension will successfully detect that a template variable `IP_ADDRESS` has been set.

`vars.add('IP_ADDRESS','192.168.0.1')`

Now consider the following code. While it serves the same purpose, it will fail to be detected.

`ip_add_var_name = 'IP_ADDRESS' vars.add(ip_add_var_name, '192.168.0.1')`

## NSO Developer Studio - Explorer Extension <a href="#d5e11026" id="d5e11026"></a>

This section describes the installation and functionality of the NSO Explorer extension.

The purpose of the NSO Explorer extension is to allow the user to connect to a running instance of NSO and navigate the CDB from within VS Code.

### System Requirements <a href="#d5e11030" id="d5e11030"></a>

To get started with the NSO Explorer extension, ensure that the following prerequisites are met on your system. The prerequisites are not a requirement to install the NSO Explorer extension, but for NSO development after the extension is installed.

* Visual Studio Code.
* Java JDK 11 or higher.
* Python 3.9 or higher (recommended).

### Install the Extension <a href="#d5e11040" id="d5e11040"></a>

Installation of the NSO Explorer extension is done via the VS Code marketplace.

To install the NSO Explorer extension in your VS Code environment:

1. Open VS Code and click the **Extensions** icon on the **Activity Bar**.
2. Search for the extension using the keywords "nso developer studio" in the **Search Extensions in Marketplace** field.
3. In the search results, locate the extension (**NSO Developer Studio - Explorer**) and click **Install**.
4. Wait while the installation completes. A notification at the bottom-right corner indicates that the installation has finished. After the installation, an NSO icon is added to the **Activity Bar**.

### Connect to NSO Instance <a href="#d5e11059" id="d5e11059"></a>

The NSO Explorer extension allows you to connect to and inspect a live NSO instance from within the VS Code. This procedure assumes that you have not previously connected to an NSO instance.

To connect to an NSO instance:

1. In the **Activity Bar**, click the **NSO** icon to open **NSO Explorer**.
2. If no NSO instance is already configured, a welcome screen is displayed with an option to add a new NSO instance.
3. Click the **Add NSO Instance** button to open the **Settings** editor.
4. In the **Settings** editor, click the link **Edit in settings.json**. This opens the `settings.json`file for editing.
5.  Next, edit the `settings.json` file as shown below:

    ```
      "NSO.Instance": [
        {
          "host": "<hostname/ip>",
          "port": "<port>",
          "scheme": "http|https",
          "username": "<username>",
          "password": "<password>"
        }
      ]
    ```
6.  Save the file when done.

    If settings have been configured correctly, NSO Explorer will attempt to connect to the running NSO instance and display the NSO configuration.

### Inspect the CDB Tree <a href="#d5e11087" id="d5e11087"></a>

Once the NSO Explorer extension is configured, the user can inspect the CDB tree.

To inspect the CDB tree, use the following functions:

* **Get Element Info**: Click the **i** (info) icon on the **Explorer** bar, or alternatively inline next to an element in the **Explorer** view.
* **Copy KeyPath**: Click the `{KP}` icon to copy the keypath for the selected node.
* **Copy XPath**: Click the `{XP}` icon to copy the XPath for the selected node.
* **Get XML Config**: Click the `XML` icon to retrieve the XML configuration for the selected node and copy it to the clipboard.

If data has changed in NSO, click the refresh button at the top of the **Explorer** pane to fetch it.
