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
#   $ wget https://raw.github.com/twoixter/nimiedades/master/marketgoo-install.sh
#   $ /bin/sh ./marketgoo-install.sh
#
#   Execute installer directly from GitHub
#   $ wget -O - http://dl.dropbox.com/u/11210438/flockonus-stack.sh | sh
#
##############################################################################

WHITE=$(tput setaf 7 ; tput bold)
RED=$(tput setaf 1 ; tput bold)
RESET=$(tput sgr0)
WHMROOT=/usr/local/cpanel/whostmgr
TMPNAME=$(mktemp -d marketgooplugin.XXXXXXXXX)
CPVERSION=$(cat 2>/dev/null /usr/local/cpanel/version)

cleanup()
{
    local rc=$?
    trap - EXIT

    rm -rf $TMPNAME
    exit $rc
}

download_latest()
{
    echo
    echo "${WHITE}Downloading latest plug-in version${RESET}"
    mkdir -p $TMPNAME
    wget -q -O $TMPNAME/mktsrc.tar.gz --no-check-certificate https://github.com/twoixter/nimiedades/archive/master.tar.gz > /dev/null
}

install_whm_addon()
{
    echo "${WHITE}Installing WHM AddOn${NO_COLOUR}"

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

[ -d $TMPNAME ] || download_latest

install_whm_addon

echo "${WHITE}*** DONE ***${RESET}"
rm -rf $TMPNAME
