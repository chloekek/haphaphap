# This module can be imported by tests to call the haphaphap api.

package Haphaphap::Api;

use v5.20;
use warnings;

use LWP::UserAgent;
use URI::Escape qw(uri_escape);

my $ua = LWP::UserAgent->new();

# Send a get request to the api using the given query string parameters.
# The response is returned as an HTTP::Response object.
sub get
{
    my (%q) = @_;
    my $q = join '&', map { "$_=" . uri_escape($q{$_}) } keys %q;
    my $url = "http://127.0.0.1:5000/api?$q";
    $ua->get($url);
}

1;
