<?php
declare(strict_types = 1);
namespace Haphaphap;

/**
 * Entry point of the backend app.
 * The main static method is invoked for each incoming request.
 */
final class Main
{
    private function __construct()
    {
    }

    /**
     * Handle an incoming request.
     */
    public static function main(): void
    {
        switch (self::getParam('action')) {
            case 'ping': self::handlePing(); break;
            case 'search': self::handleSearch(); break;
            default: self::handleNotFound(); break;
        }
    }

    private static function handlePing(): void
    {
        echo \json_encode('pong');
    }

    private static function handleSearch(): void
    {
        // Retrieve and parse the input.
        $query = self::getParam('query');
        $location = Location::fromApi(self::getParam('location'));

        // If no location is given, then we cannot find any restaurants.
        if ($location === NULL) {
            echo '[]';
            return;
        }

        // Retrieve the search results.
        $database = self::connectDatabase();
        $results = SearchResult::forQuery($database, $query, $location);

        // Format the search results.
        echo '[';
        foreach ($results as $i => $result) {
            if ($i !== 0)
                echo ',';
            echo $result->toApi();
        }
        echo ']';
    }

    private static function handleNotFound(): void
    {
        \header('Status: 404');
        echo \json_encode(NULL);
    }

    /**
     * Retrieve a query string parameter as a string.
     * If it is not set, the empty string is returned.
     */
    private static function getParam(string $name): string
    {
        return (string)($_GET[$name] ?? '');
    }

    /**
     * Connect to the database.
     * The port number is passed by php-fpm,
     * and configured in php-fpm.conf.
     */
    private static function connectDatabase(): Database
    {
        return new Database('
            host=127.0.0.1
            user=haphaphap_app
            password=haphaphap_app
            dbname=haphaphap
        ');
    }
}
