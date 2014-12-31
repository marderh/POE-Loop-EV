#!/usr/bin/perl -w

use strict;

use lib qw(/home/grinnz/perl5/lib/perl5/POE/Test/Loops);
use Test::More;
use POSIX qw(_exit);

sub skip_tests {
    $ENV{LIBEV_FLAGS} = 2;
    return "EV module or poll backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a poll backend" if EV::backend() != 2;
}


BEGIN {
  if (my $why = skip_tests('z_rt54319_bazerka_followtail')) {
    plan skip_all => $why
  }
}

# Run the tests themselves.
require 'z_rt54319_bazerka_followtail.pm';

_exit 0 if $^O eq 'MSWin32';
CORE::exit 0;