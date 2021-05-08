<?php
declare(strict_types = 1);
namespace Haphaphap;

/**
 * Type-safe database connection interface.
 */
final class Database
{
    /**
     * @var resource
     */
    private $raw;

    /**
     * Connect to a postgresql database.
     * The dsn format is documented in the libpq documentation.
     */
    public function __construct(string $dsn)
    {
        $this->raw = \pg_connect($dsn);
    }

    /**
     * Perform a sql query and yield the rows.
     * The sql query is performed even if the rows are not consumed.
     *
     * @param array<?string> $params
     * @return iterable<array<?string>>
     */
    public function query(array $params, string $sql): iterable
    {
        $result = \pg_query_params($this->raw, $sql, $params);
        return self::yieldRows($result);
    }

    /**
     * @param resource $result
     * @return iterable<int,array<int,?string>>
     */
    private static function yieldRows($result): iterable
    {
        for (;;) {
            /** @var false|array<int,?string> */
            $row = \pg_fetch_row($result);
            if ($row === FALSE)
                break;
            yield $row;
        }
    }
}
