# SUSE's openQA tests
#
# Copyright © 2017 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.
#
# Summary: Changes the VERSION to UPGRADE_TARGET_VERSION and
#       reload needles.
#       After original system being patched, we need switch
#       VERSION to the target version of upgrade.
# Maintainer: Qingming Su <qmsu@suse.com>

use base "opensusebasetest";
use strict;
use warnings;
use testapi;

sub run {
    # After being patched, original system is ready for upgrade
    my $upgrade_target_version = get_required_var('UPGRADE_TARGET_VERSION');

    if (get_var('VERSION') ne $upgrade_target_version) {
        # Switch to upgrade target version and reload needles
        set_var('VERSION', $upgrade_target_version, reload_needles => 1);
    }
}

1;
# vim: set sw=4 et:
