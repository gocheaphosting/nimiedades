#!/usr/local/cpanel/3rdparty/bin/perl
#WHMADDON:marketgoo:MarketGoo Configuration

my $security_token = $ENV{'cp_security_token'} || '';
print "<meta http-equiv=\"refresh\" content=\"0;url=$security_token/marketgoo/index.php\"/>";
