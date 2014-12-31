#!/usr/bin/perl -w

use strict;

use lib qw(/home/grinnz/perl5/lib/perl5/POE/Test/Loops);
use Test::More;
use POSIX qw(_exit);

sub skip_tests {
    $ENV{LIBEV_FLAGS} = 1;
    return "EV module or select backend could not be loaded" if (
        do { eval "use EV"; $@ }
    );
    return "EV was not built with a select backend" if EV::backend() != 1;
}


BEGIN {
  if (my $why = skip_tests('ses_nfa')) {
    plan skip_all => $why
  }
}

# Run the tests themselves.
require 'ses_nfa.pm';

_exit 0 if $^O eq 'MSWin32';
CORE::exit 0;