#!/bin/sh
set -ex

headsize=$(grep -nxF '* [Get Started](developer-reference/get-started.md)' \
    SUMMARY.md | cut -d: -f1)
cat SUMMARY.md | head -n $headsize > summary_parts/0-SUMMARY
ls summary_parts/[0-9]* | sort | xargs cat > SUMMARY.md
