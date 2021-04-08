#!/bin/sh
# Written by @Wireghoul - justanotherhacker.com
# part of the per directory webserver attack suite "htshells" project

# Using stager to help AV vendor and YARA rule author do better work
# Thanks to Giovanni/@wargio/#der0ad
cat << EOD
┬ ┬┌┬┐┌─┐┬ ┬┌─┐┬  ┬  ┌─┐
├─┤ │ └─┐├─┤├┤ │  │  └─┐
┴ ┴ ┴ └─┘┴ ┴└─┘┴─┘┴─┘└─┘
 justanotherhacker.com

EOD
if [ -z $1 ]; then
    echo "Usage $0 file" >&2
    exit 2
fi
grep -E '(^[^#].*|.*\\$|<\?|<\%|Require)' "$1" > .htaccess
echo ".htaccess file is ready"
