#!/bin/sh
set -ex

sed -E 's|^(.+)$|  * [\1 Module](developer-reference/pyapi/\1.md)|' \
    developer-reference/pyapi/modules.lst > summary_parts/4-pymodules.gen

sed -E 's|^( *)([^ ]+) (.*)$|\1  * [`\3`](developer-reference/java/\2)|' \
    developer-reference/java/files.lst > summary_parts/8-jclasses.gen

ls summary_parts/[0-9]* | sort | xargs cat > SUMMARY.md
