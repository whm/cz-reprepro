#!/usr/bin/perl -w
#
# tests/help.t

use Test::More qw( no_plan );

##############################################################################
# Main Routine
##############################################################################

# List of perl source files
%script_list = ('usr/bin/reprepro-backend'   => '^Debian repository remctl',
                'usr/bin/cz-reprepro-upload' => '^Usage',
);

for my $s (sort keys %script_list) {
    my $out;
    my $cmd = "../$s help";
    my $rex = $script_list{$s};
    $out = `$cmd 2>&1`;
    if (!ok($out =~ /$rex/, "Help Switch ($s)")) {
        print $out
    }
}
