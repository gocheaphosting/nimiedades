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
#   Execute this file in your shell:
#   $ /bin/sh ./marketgoo-install.sh
#
##############################################################################

WHITE=$(tput setaf 7 ; tput bold)
NO_COLOUR=$(tput sgr0)
WHMROOT=/usr/local/cpanel/whostmgr

install_whm_addon()
{
    echo ${WHITE}Installing WHM AddOn${NO_COLOUR}

    mkdir -p /var/cpanel/apps
    
}


install
