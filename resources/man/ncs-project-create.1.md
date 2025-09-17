# ncs-project-create Man Page

`ncs-project-create` - Command to create an NCS project

## Synopsis

`ncs-project create [OPTIONS] project-name`

## Description

Creates an NCS project, which consists of directories, configuration
files and packages necessary to run an NCS system.

After running this command, the command: *ncs-project update* , should
be run.

The NCS project connects an NCS installation with an arbitrary number of
packages. This is declared in a `project-meta-data.xml` file which is
located in the directory structure as created by this command.

The generated project should be seen as an initial project structure.
Once generated, the `project-meta-data.xml` file should be manually
modified. After the `project-meta-data.xml` file has been changed the
command *ncs-project setup* should be used to bring the project content
up to date.

A package, defined in the `project-meta-data.xml` file, can be located
at a remote git repository and will then be cloned; or the package may
be local to the project itself.

If a package version is specified to origin from a git repository, it
may refer to a particular git commit hash, a branch or a tag. This way
it is possible to either lock down an exact package version or always
make use of the latest version of a particular branch.

A package can also be specified as *local*, which means that it exists
in place and no attempts to retrieve it will be made. Note however that
it still needs to be a proper package with a `package-meta-data.xml`
file.

There is also an option to create a project from an exported bundle. The
bundle is generated using the *ncs-project export* command.

## Options

`-h, --help`  
> Print a short help text and exit.

`-d, --dest` Directory  
> Specify the project (directory) location. The directory will be
> created if not existing. If not specified, the *project-name* will be
> used.

`-u, --ncs-bin-url` URL  
> Specify the exact URL pointing to an NCS install binary. Can be a
> *http://* or *file:///* URL.

`--from-bundle=<bundle_path>` URL  
> Specify the exact path pointing to a bundled NCS Project. The bundle
> should have been created using the *ncs-project export* command.

## Examples

Generate a project using whatever NCS we have in our PATH.

<div class="informalexample">

      $ ncs-project create foo-project
      Creating directory: /home/my/foo-project
      using locally installed NCS
      wrote project to /home/my/foo-project
          

</div>

Generate a project using a particular NCS release, located at a
particular directory.

<div class="informalexample">

      $ ncs-project create -u file:///lab/releases/ncs-4.0.1.linux.x86_64.installer.bin foo-project
      Creating directory: /home/my/foo-project
      cp /lab/releases/ncs-4.0.1.linux.x86_64.installer.bin /home/my/foo-project
      Installing NCS...
      INFO  Using temporary directory /tmp/ncs_installer.25681 to stage NCS installation bundle
      INFO  Unpacked ncs-4.0.1 in /home/my/foo-project/ncs-installdir
      INFO  Found and unpacked corresponding DOCUMENTATION_PACKAGE
      INFO  Found and unpacked corresponding EXAMPLE_PACKAGE
      INFO  Generating default SSH hostkey (this may take some time)
      INFO  SSH hostkey generated
      INFO  Environment set-up generated in /home/my/foo-project/ncs-installdir/ncsrc
      INFO  NCS installation script finished
      INFO  Found and unpacked corresponding NETSIM_PACKAGE
      INFO  NCS installation complete

      Installing NCS...done
      DON'T FORGET TO: source /home/my/foo-project/ncs-installdir/ncsrc
      wrote project to /home/my/foo-project
          

</div>

Generate a project using a project bundle created with the export
command.

<div class="informalexample">

      $  ncs-project create --from-bundle=test_bundle-1.0.tar.gz --dest=installs
      Using NCS 4.2.0 found in /home/jvikman/dev/tailf/ncs_dir
      wrote project to /home/my/installs/test_bundle-1.0
          

</div>

After a project has been created, we need to have its
`project-meta-data.xml` file updated before making use of the
*ncs-project update* command.
