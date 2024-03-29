use strict;
use Test::More tests => 18;

use Set::Intersection;

my @l1 = qw/3 1 4 1 5 9/;
my @l2 = qw/1 7 3 2 0 5/;

my @r = get_intersection(\@l1, \@l2);
is scalar(@r), 3;
is join(',', sort @r), '1,3,5';
is join(' ', @l1), '3 1 4 1 5 9';
is join(' ', @l2), '1 7 3 2 0 5';

my @l3 = qw/2 4 3 6 2 0 6 7 9/;

@r = get_intersection(\@l1, \@l2, \@l3);
is scalar(@r), 1;
is $r[0], 3;
is join(' ', @l1), '3 1 4 1 5 9';
is join(' ', @l2), '1 7 3 2 0 5';
is join(' ', @l3), '2 4 3 6 2 0 6 7 9';

my @l4 = qw/1 4 1 4 2/;

@r = get_intersection(\@l1, \@l2, \@l3, \@l4);
ok !@r;

@r = get_intersection([qw/1 3 5 7 9/], [qw/1 1 2 3 5 8 13/]);
is scalar(@r), 3;
is join(',', sort @r), '1,3,5';

@r = get_intersection([qw/there is more than one way to do it/], [qw/there is nothing to do/]);
is scalar(@r), 4;
is join(',', sort @r), 'do,is,there,to';

@r = get_intersection([],[]);
ok !@r;

@r = get_intersection([],[1]);
ok !@r;

@r = get_intersection();
ok !@r;

@r = get_intersection([qw/1 2 3 4 5/]);
is join(',', @r), '1,2,3,4,5';

