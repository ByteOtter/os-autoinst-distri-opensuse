use strict;
use warnings;
use base "y2logsstep";
use testapi;

sub run() {
    my $self = shift;
    assert_screen "before-package-selection";

    #send_key "ctrl-alt-shift-x"; sleep 3;
    select_console('install-shell');

    type_string "(cat .timestamp ; echo .packages.initrd: ; cat .packages.initrd; echo 'CAT_INITRD')>/dev/$serialdev\n";
    wait_serial 'CAT_INITRD';
    type_string "(echo .packages.root: ; cat .packages.root; echo 'PACKAGES_ROOT')>/dev/$serialdev\n";
    wait_serial 'PACKAGES_ROOT';
    type_string "ls -lR /update\n";
    save_screenshot;
    wait_idle;

    select_console('installation');
    assert_screen "inst-returned-to-yast", 15;

}

1;
# vim: set sw=4 et:
