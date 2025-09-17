# ncs_cmd Man Page

`ncs_cmd` - Command line utility that interfaces to common NSO library
functions

## Synopsis

`ncs [common options] [filename]`

`ncs [common options] -c string`

`ncs -h | -h commands | -h command-name`

Common options:

`[-r | -o | -e | -S] [-f [w] | [p] | [r | s]] [-a address] [-p port] [-u user] [-g group] [-x context] [-s] [-m] [-h] [-d]`

## Description

The `ncs_cmd` utility is implemented as a wrapper around many common CDB
and MAAPI function calls. The purpose is to make it easier to prototype
and test various NSO issues using normal scripting tools.

Input is provided as a file (default `stdin` unless a filename is given)
or as directly on the command line using the `-c string` option. The
`ncs_cmd` expects commands separated by semicolon (;) or newlines. A
pound (#) sign means that the rest of the line is treated as a comment.
For example:

<div class="informalexample">

    ncs_cmd -c get_phase

</div>

Would print the current start-phase of NSO, and:

<div class="informalexample">

    ncs_cmd -c "get_phase ; get_txid"

</div>

would first print the current start-phase, then the current transaction
ID of CDB.

Sessions towards CDB, and transactions towards MAAPI are created
as-needed. At the end of the script any open CDB sessions are closed,
and any MAAPI read/write transactions are committed.

## Options

`-d`  
> Debug flag. Add more to increase debug level. All debug output will be
> to stderr.

`-m`  
> Don't load the schemas at startup.

## Environment Variables

`NCS_IPC_ADDR`  
> The address used to connect to the NSO daemon, overrides the compiled
> in default.

`NCS_IPC_PORT`  
> The port number to connect to the NSO daemon on, overrides the
> compiled in default.

## Examples

1.  <div class="informalexample">

    Getting the address of eth0

        ncs_cmd -c "get /sys:sys/ifc{eth0}/ip"

    </div>

2.  <div class="informalexample">

    Setting a leaf in CDB operational

        ncs_cmd -o -c "set /sys:sys/ifc{eth0}/stat/tx 88"

    </div>

3.  <div class="informalexample">

    Making NSO running on localhost the HA primary, with the name node0

        ncs_cmd -c "primary node0"

    Then tell the NSO also running on localhost, but listening on port
    4566, to become secondary and name it node1

        ncs_cmd -p 4566 -c "secondary node1 node0 127.0.0.1"

    </div>
