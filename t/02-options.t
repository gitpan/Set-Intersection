use strict;

use Test::More tests => 4;

use Set::Intersection;

my @r = get_intersection([1 .. 9], [map { $_ * 2 } 1 .. 3], [map { $_ * 3 } 1 .. 3]);
is scalar(@r), 1;
is $r[0], 6;

@r = get_intersection({-preordered=>1}, [1 .. 9], [map { $_ * 2 } 1 .. 3], [map { $_ * 3 } 1 .. 3]);
is scalar(@r), 1;
is $r[0], 6;

