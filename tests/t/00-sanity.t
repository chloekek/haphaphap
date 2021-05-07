use v5.20;
use warnings;

use LWP::UserAgent;
use Test::More;

plan(tests => 2);

my $ua = LWP::UserAgent->new();
my $response = $ua->get('http://127.0.0.1:5000/api?action=ping');
ok($response->is_success);
is($response->content, '"pong"');
