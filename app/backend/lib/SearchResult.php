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
        public string     $id,
        public string     $name,
        public FeatureSet $features,
    )
    {
    }

    /**
     * Format the search result so that it can be used by the api consumer.
     */
    public function toApi(): mixed
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'features' => $this->features->toApi(),
        ];
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
                r.id,
                r.name,
                COALESCE(bit_or(mi.features), 0)
            FROM
                restaurants AS r
                LEFT JOIN menu_items AS mi
                    ON r.id = mi.restaurant_id
            WHERE
                r.name LIKE '%' || $1 || '%'
                AND ST_DWithin(r.location, $2, 1000)
            GROUP BY
                r.id
        ");

        // Convert the returned rows into search result objects.
        foreach ($resultRows as list ($id, $name, $featuresBigint)) {
            assert ($id !== NULL);
            assert ($name !== NULL);
            assert ($featuresBigint !== NULL);
            $features = FeatureSet::fromBigint((int)$featuresBigint);
            yield new SearchResult($id, $name, $features);
        }
    }
}
