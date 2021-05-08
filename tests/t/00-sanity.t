use v5.20;
use warnings;

use Haphaphap::Api;
use Test::More;

plan(tests => 2);

my $response = Haphaphap::Api::get(action => 'ping');
ok($response->is_success);
is($response->content, '"pong"');
