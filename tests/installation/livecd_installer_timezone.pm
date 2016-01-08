use strict;
use warnings;
use base "y2logsstep";
use testapi;

# this test case are copied from 065_installer_timezone to adapt
# LiveCD installer excuses before then partition setup
sub run() {
    assert_screen "inst-timezone", 125 || die 'no timezone';
    send_key $cmd{"next"};
}

1;
# vim: set sw=4 et:
