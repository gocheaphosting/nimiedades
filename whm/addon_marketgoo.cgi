#!/usr/local/cpanel/3rdparty/bin/perl
#WHMADDON:marketgoo:MarketGoo Configuration

use lib '/usr/local/cpanel';
use Cpanel::cPanelFunctions ();
use Cpanel::Form            ();
use Cpanel::Config          ();
use Whostmgr::HTMLInterface ();
use Whostmgr::ACLS          ();

print "Content-type: text/html\r\n\r\n";

Whostmgr::ACLS::init_acls();
if (!Whostmgr::ACLS::checkacl( 'all' ) ) {
    print 'Access Denied.';
    exit;
}
else
{
    my $security_token = $ENV{'cp_security_token'} || '';
    print "<meta http-equiv=\"refresh\" content=\"0;url=$security_token/marketgoo/index.php\"/>";
}
