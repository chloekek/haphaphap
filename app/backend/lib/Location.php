<?php
declare(strict_types = 1);
namespace Haphaphap;

/**
 * Data type for (latitude, longitude) pair.
 */
final class Location
{
    /**
     * Construct the pair from its components.
     */
    public function __construct(
        public float $latitude,
        public float $longitude,
    )
    {
    }

    /**
     * Parse the pair as given to the api.
     * If invalid, NULL is returned.
     */
    public static function fromApi(string $value): ?Location
    {
        $segments = \explode(',', $value);
        if (\count($segments) !== 2)
            return NULL;
        return new Location((float)$segments[0], (float)$segments[1]);
    }

    /**
     * Format the pair as suitable input for the postgis geometry type.
     */
    public function toPostgis(): string
    {
        // SRID=4326 is the coordinate system we use.
        // See the postgis documentation for more information.
        return "SRID=4326;POINT($this->longitude $this->latitude)";
    }
}
