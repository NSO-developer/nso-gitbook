# ncs-project Man Page

`ncs-project` - Command to invoke NCS project commands

## Synopsis

`ncs-project command [OPTIONS]`

## Description

This command is used to invoke one of the NCS project commands.

An NCS project is a complete running NCS installation. It can contain
all the needed packages and the config data that is required to run the
system.

The NCS project is described in a project-meta-data.xml file according
to the `tailf-ncs-project.yang` Yang model. By using the ncs-project
commands, the complete project can be populated. This can be used for
encapsulating NCS demos or even a full blown turn-key system.

Each command is described in its own man-page, which can be displayed by
calling: `ncs-project help` *\<command\>*

The *OPTIONS* are forwarded to the the invoked script verbatim.

## Command

`create`  
> Create a new NCS project.

`export`  
> Export an NCS project.

`git`  
> For each git package repository, execute an arbitrary git command.

`update`  
> Populate a new NCS project or update an existing project. NOTE: Was
> called 'setup' earlier.

`help` command  
> Display the man-page for the specified NCS project command.
