<?php
declare(strict_types = 1);
namespace Haphaphap;

/**
 * One of the results of a search query.
 */
final class SearchResult
{
    /**
     * Construct a search result from its parts.
     */
    public function __construct(
        public string $id,
        public string $name,
    )
    {
    }

    /**
     * Format the search result so that it can be used by the api consumer.
     */
    public function toApi(): string
    {
        return \json_encode([
            'id' => $this->id,
            'name' => $this->name,
        ]);
    }

    /**
     * Return the search results for a given query.
     *
     * @return iterable<int,SearchResult>
     */
    public static function forQuery(
        Database $database,
        string   $query,
        Location $location,
    ): iterable
    {
        // Retrieve the search results using an sql query.
        $resultRows = $database->query([$query, $location->toPostgis()], "
            SELECT
                id,
                name
            FROM
                restaurants
            WHERE
                name LIKE '%' || $1 || '%'
                AND ST_DWithin(location, $2, 1000)
        ");

        // Convert the returned rows into search result objects.
        foreach ($resultRows as list ($id, $name)) {
            assert ($id !== NULL);
            assert ($name !== NULL);
            yield new SearchResult($id, $name);
        }
    }
}
