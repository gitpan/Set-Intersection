use strict;

use Test::More tests => 1;

use Set::Intersection;

use Data::Dumper;

# use of undef in key of hash is warning ??
eval { get_intersection([undef],[undef,undef]); };
ok !$@;

