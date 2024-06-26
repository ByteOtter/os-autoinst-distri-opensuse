# SUSE's openQA tests
#
# Copyright 2018 SUSE LLC
# SPDX-License-Identifier: FSFAP
#
# Summary: Record the disk usage before migration
# Maintainer: QE YaST and Migration (QE Yam) <qe-yam at suse de>

use base "opensusebasetest";
use strict;
use warnings;
use testapi;
use migration 'record_disk_info';
use serial_terminal qw(select_serial_terminal);

sub run {
    select_serial_terminal();

    # The disk space usage info would be helpful to debug upgrade failure
    # with disk exhausted error
    record_disk_info;
}

1;
