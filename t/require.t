use strict;
use warnings;
use Test::More tests => 3;

my $mod = 'ExtUtils::F77';
use_ok $mod;

is $mod->testcompiler, 1, 'testcompiler method returns 1';

is $mod->runtimeok, 1, 'runtime libs found';

diag "Method: $_, ", explain $mod->$_ for qw(runtime trail_ compiler cflags);
