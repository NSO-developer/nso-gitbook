#!/bin/sh
cd "$(dirname $0)"
ls *.part | sort | xargs cat
