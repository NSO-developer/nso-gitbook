# ncs-project-git Man Page

`ncs-project-git` - For each package git repo, execute a git command

## Synopsis

`ncs-project git [OPTIONS]`

## Description

When developing a project which has many packages coming from remote git
repositories, it is convenient to be able to run git commands over all
those packages. For example, to display the latest diff or log entry in
each and every package. This command makes it possible to do exactly
this.

Note that the generated top project Makefile already contain two make
targets (gstat and glog) to perform two very common functions for
showing any changed but uncomitted files and for showing the last log
entry. The same functions can be achieved with this command, although it
may require some more typing, see the example below.

## Options

``  
> Any git command, including options.

## Examples

Show the latest log entry in each package.

<div class="informalexample">

      $ ncs-project git --no-pager log -n 1

      ------ Package: esc
      commit ccdf889f5fe46d92b5901c7faa9c749f500c68f9
      Author: Bill Smith <void@cisco.com>
      Date:   Wed Oct 14 10:46:38 2015 +0200

          Getting the latest model changes

      ------ Package: cisco-ios
      commit 05a221ab024108e311709d6491ba8526c31df0ed
      Merge: ea72b1e 82e281e
      Author: tailf-stash.gen@cisco.com <void@tail-f.com>
      Date:   Wed Oct 14 21:09:10 2015 +0200

          Merge pull request #8 in NED/cisco-ios

      ....
          

</div>
