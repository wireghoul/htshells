#!/bin/bash
if [[ ( $# -ne 1 ) || ( ! -f $1 ) ]]; then
	echo "Usage: $0 [MODLIST_FILE]"
	echo "Create a module-check .htaccess file using the module name list contained within MODLIST_FILE."
	exit
fi
cat $1 | xargs -i{} echo -e "<IfModule {}>\n  Header always set X-Apache-ModCheck-{} Active\n</IfModule>" > modcheck.htaccess
echo "Your module checking htaccess file has been created as 'modcheck.htaccess'!"
