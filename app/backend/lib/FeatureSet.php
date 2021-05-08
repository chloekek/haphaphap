<?php
declare(strict_types = 1);
namespace Haphaphap;

use ReflectionClass;

/**
 * Set of menu item features.
 */
final class FeatureSet
{
    /**
     * Constant for each feature.
     * Each feature has its own bit.
     */
    public const VEGAN       = 1 << 0;
    public const VEGETARIAN  = 1 << 1;
    public const GLUTEN_FREE = 1 << 2;

    private function __construct(
        private int $bigint,
    )
    {
    }

    /**
     * Create a feature set from its integer representation.
     * Each bit represents the presence (1) or absence (0)
     * of the feature that occupies that bit.
     */
    public static function fromBigint(int $bigint): FeatureSet
    {
        return new FeatureSet($bigint);
    }

    /**
     * Format the feature so that it can be used by the api consumer.
     */
    public function toApi(): mixed
    {
        // Get the constants in this class.
        $reflect = new ReflectionClass(self::class);
        /** @var array<string,int> */
        $constants = $reflect->getConstants();

        // For each constant, check if the value is in the set.
        // If it is, append its name to the result array.
        $result = [];
        foreach ($constants as $name => $value)
            if ($this->has($value))
                $result[] = $name;
        return $result;
    }

    /**
     * Return whether the given feature is in the set.
     */
    public function has(int $feature): bool
    {
        return ($this->bigint & $feature) !== 0;
    }
}
