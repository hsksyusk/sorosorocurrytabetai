use strict;
use warnings;
use Test::More;


use Catalyst::Test 'sorosorocurrytabetai';
use sorosorocurrytabetai::Controller::batch;

ok( request('/batch')->is_success, 'Request should succeed' );
done_testing();
