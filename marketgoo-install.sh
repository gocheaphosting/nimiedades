#!/bin/sh
##############################################################################
#                         _        _                    
#                        | |      | |                   
#    _ __ ___   __ _ _ __| | _____| |_ __ _  ___   ___  
#   | '_ ` _ \ / _` | '__| |/ / _ \ __/ _` |/ _ \ / _ \ 
#   | | | | | | (_| | |  |   <  __/ || (_| | (_) | (_) |
#   |_| |_| |_|\__,_|_|  |_|\_\___|\__\__, |\___/ \___/ 
#                                      __/ |            
#   MarketGoo Plug-in for cPanel      |___/             
#
#
#   Download and execute this file in your shell:
#   $ wget http://raw.github.com/twoixter/nimiedades/master/marketgoo-install.sh
#   $ /bin/sh ./marketgoo-install.sh
#
#   Execute installer directly from GitHub
#   $ wget -q -O - http://raw.github.com/twoixter/nimiedades/master/marketgoo-install.sh | sh
#
##############################################################################

WHITE=$(tput setaf 7 ; tput bold)
RED=$(tput setaf 1 ; tput bold)
RESET=$(tput sgr0)
WHMROOT=/usr/local/cpanel/whostmgr
TEMPDIR=$(mktemp -d marketgooplugin.XXXXXXXXX)
SRCDIR=${TEMPDIR}/nimiedades-master
CPVERSION=$(cat 2>/dev/null /usr/local/cpanel/version)

cleanup()
{
    local rc=$?
    trap - EXIT

    rm -rf $TEMPDIR
    exit $rc
}

download_latest()
{
    echo
    echo "${WHITE}Downloading latest plug-in version${RESET}"
    wget -q -O - http://github.com/twoixter/nimiedades/archive/master.tar.gz | tar xz -C $TEMPDIR
}

install_whm_addon()
{
    echo "${WHITE}Installing WHM AddOn${NO_COLOUR}"

    cp -r $SRCDIR/whm/marketgoo/ $WHMROOT/docroot/ >/dev/null 2>&1
    cp -f $SRCDIR/whm/addon_marketgoo.cgi $WHMROOT/docroot/cgi/ >/dev/null 2>&1
    cp -f $SRCDIR/whm/marketgoo.gif $WHMROOT/docroot/themes/x/icons/ >/dev/null 2>&1
#    chmod 0755 $WHMROOT/docroot/cgi/addon_sitelock.cgi
}

install_cpanel_plugin()
{
    echo "${WHITE}Installing cPanel Plug-in${NO_COLOUR}"

#    mkdir -p /var/cpanel/apps
}



trap cleanup HUP PIPE INT QUIT TERM EXIT

if [ ! -f /usr/local/cpanel/version ]; then
    echo
    echo "${RED}***** Cpanel not found *****${RESET}"
    echo "${WHITE}Are you sure you're running this on a Cpanel server?${RESET}"
    echo
    exit
fi

if [ ! -f /usr/local/cpanel/Cpanel/LiveAPI.pm ]; then
    echo
    echo "${RED}***** Cpanel::LiveAPI not found. *****${RESET}"
    echo "${WHITE}MarketGoo Plugin requires Cpanel::LiveAPI.${RESET}"
    echo "Please ensure you are running at least Cpanel version 11.32.2."
    echo "(current Cpanel version: $CPVERSION)"
    echo
    exit
fi

download_latest && install_whm_addon && install_cpanel_plugin
echo "${WHITE}*** DONE ***${RESET}"
