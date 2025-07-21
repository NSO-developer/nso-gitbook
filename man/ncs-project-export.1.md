# ncs-project-export Man Page

`ncs-project-export` - Command to create a bundle from a NCS project

## Synopsis

`ncs-project export [OPTIONS] project-name`

## Description

Collects relevant packages and files from an existing NCS project and
saves them in a tar file - a *bundle*. This exported bundle can then be
distributed to be unpacked, either with the *ncs-project create*
command, or simply unpacked using the standard *tar* command.

The bundle is declared in the `project-meta-data.xml` file in the
*bundle* section. The packages included in the bundle are leafrefs to
the packages defined at the root of the model. We can also define a
specific tag, commit or branch, even a different location for the
packages, different from the one used while developing. For example we
might develop against an experimental branch of a repository, but bundle
with a specific release of that same repository. Tags or commit SHA
hashes are recommended since branch HEAD pointers usually are a moving
target. Should a branch name be used, a warning is issued.

A list of extra files to be included can be specified.

Url references will not be built, i.e they will be added to the bundle
as is.

The list of packages to be included in the bundle can be picked from git
repositories or locally in the same way as when updating an NCS Project.

Note that the generated `project-meta-data.xml` file, included in the
bundle, will specify all the packages as *local* to avoid any dangling
pointers to non-accessible git repositories.

## Options

`-h, --help`  
> Print a short help text and exit.

`-v, --verbose`  
> Print debugging information when creating the bundle.

`--prefix=<prefix>`  
> Add a prefix to the bundle file name. Cannot be used together with the
> name option.

`--pkg-prefix=<prefix>`  
> Use a specific prefix for the compressed packages used in the bundle
> instead of the default "ncs-\$lt;vsn\>" where the \<vsn\> is the NCS
> version that ncs-project is shipped with.

`--name=<name>`  
> Skip any configured name and use *name* as the bundle file name.

`--skip-build`  
> When the packages have been retrieved from their different locations,
> this option will skip trying to build the packages. No (re-)build will
> occur of the packages. This can be used to export a bundle for a
> different NCS version.

`--skip-pkg-update`  
> This option will not try to use the package versions defined in the
> "bundle" part of the project-meta-data, but instead use whatever
> versions are installed in the "packages" directory. This can be used
> to export modified packages. Use with care.

`--snapshot`  
> Add a timestamp to the bundle file name.

## Examples

Generate a bundle, this command is run in a directory containing a NSO
project.

<div class="informalexample">

      $ ncs-project export
      Creating bundle ...
      Creating bundle ... ok
          

</div>

We can also export a bundle with a specific name, below we will create a
bundle called `test.tar.gz`.

<div class="informalexample">

      $ ncs-project export --name=test
      Creating bundle ...
      Creating bundle ... ok
          

</div>

Example of how to specify some extra files to be included into the
bundle, in the `project-meta-data.xml` file.

<div class="informalexample">

      <bundle>
        <name>test_bundle</name>
        <includes>
          <file>
            <path>README</path>
          </file>
          <file>
            <path>ncs.conf</path>
          </file>
        </includes>
        ...
      </bundle>
          

</div>

Example of how to specify packages to be included in the bundle, in the
`project-meta-data.xml` file.

<div class="informalexample">

      <bundle>
        ...
        <package>
          <name>resource-manager</name>
          <git>
            <repo>ssh://git@stash.tail-f.com/pkg/resource-manager.git</repo>
            <tag>1.2</tag>
          </git>
        </package>
        <!-- Use the repos specified in '../../packages-store' -->
        <package>
          <name>id-allocator</name>
          <git>
            <tag>1.0</tag>
          </git>
        </package>
        <!-- A local package -->
        <!-- (the version vill be picked from the package-meta-data.xml) -->
        <package>
          <name>my-local</name>
          <local/>
        </package>
      </bundle>
          

</div>

Example of how to extract only the packages using *tar*.

<div class="informalexample">

      tar xzf my_bundle-1.0.tar.gz my_bundle-1.0/packages
          

</div>

The command uses a temporary directory called *.bundle*, the directory
contains copies of the included packages, files and
project-meta-data.xml. This temporary directory is removed by the export
command. Should it remain for some reason it can safely be removed.

The tar-ball can be extracted using *tar* and the packages can be
installed like any other packages.
