use v5.20;
use warnings;

use Haphaphap::Api;
use Haphaphap::Seed;
use JSON::PP qw(decode_json);
use Test::More;

plan(tests => 14);

# Restore the database test data.
Haphaphap::Seed::seed;

# Convenient function for calling the search api.
# It forwards the query and location arguments.
sub search
{
    # Send the request and receive the response.
    my $response = Haphaphap::Api::get(action => 'search', @_);

    # The search endpoint should always succeed.
    ok($response->is_success);

    # Parse the response body as json.
    decode_json($response->content);
}

my $response;

# Search with no query and no location.
$response = search(query => '', location => '');
is_deeply($response, []);

# Search with a query and no location.
$response = search(query => 'Testaurant', location => '');
is_deeply($response, []);

# Search with no query from within the middle of nowhere.
$response = search(query => '', location => '-51.512,-130.287');
is_deeply($response, []);

# Search with a query from within the middle of nowhere.
$response = search(query => 'Testaurant', location => '-51.512,-130.287');
is_deeply($response, []);

# Search with no query from a place with restaurants.
$response = search(query => '', location => '52.09314,5.11842');
is_deeply(
    $response,
    [
        {
            id => '33ea3da1-d435-4e2e-92f2-132243f3f03d',
            name => 'Testaurant 1',
        },
    ],
);

# Search with a query from a place with restaurants.
$response = search(query => 'Testaurant', location => '52.09314,5.11842');
is_deeply(
    $response,
    [
        {
            id => '33ea3da1-d435-4e2e-92f2-132243f3f03d',
            name => 'Testaurant 1',
        },
    ],
);

# Search with a query from a place with restaurants,
# but none of the restaurants match the query.
$response = search(query => 'Broodjes', location => '52.09314,5.11842');
is_deeply($response, []);
