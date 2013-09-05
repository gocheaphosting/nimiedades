<?php

include("/usr/local/cpanel/php/cpanel.php");

$cpanel = &new CPANEL();

print_r( $cpanel->cpanelprint('$homedir') );
print_r( $cpanel->cpanelprint('$isreseller') );
print_r( $cpanel->cpanelprint('$isresellerlogin') );

$cpanel->end();

?>
