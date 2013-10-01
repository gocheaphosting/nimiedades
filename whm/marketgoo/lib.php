<?php

/*
 *                         _        _
 *                        | |      | |
 *    _ __ ___   __ _ _ __| | _____| |_ __ _  ___   ___
 *   | '_ ` _ \ / _` | '__| |/ / _ \ __/ _` |/ _ \ / _ \
 *   | | | | | | (_| | |  |   <  __/ || (_| | (_) | (_) |
 *   |_| |_| |_|\__,_|_|  |_|\_\___|\__\__, |\___/ \___/
 *                                      __/ |
 *   MarketGoo Plug-in for cPanel      |___/
 *
 */

define("MKTGOO_PARTNERID_FILE", ".marketgoo_partner_id");

//-----------------------------------------------------------------------------
function generate_partnerid()
{
    $index = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    $base  = strlen($index);

    mt_srand(microtime(true) * 100000 + memory_get_usage(true));
	$in = mt_rand().microtime(true);

	$out = "";
    for ($t = floor(log($in, $base)); $t >= 0; $t--) {
        $bcp = bcpow($base, $t);
        $a   = floor($in / $bcp) % $base;
        $out = $out . substr($index, $a, 1);
        $in  = $in - ($a * $bcp);
    }
    return substr($out, 0, 10);
}

//-----------------------------------------------------------------------------
function get_partnerid()
{
	$pwuid = posix_getpwuid(posix_getuid());
	if (!file_exists($pwuid["dir"]."/".MKTGOO_PARTNERID_FILE)) {
		return "NO EXISTE";
	} else {
		return file_get_contents($pwuid["dir"]."/".MKTGOO_PARTNERID_FILE);
	}
}


?>