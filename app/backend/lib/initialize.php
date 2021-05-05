<?php

// When a php notice, warning or error is raised, we want an exception.
// This makes sure that if something goes wrong, we fail early.
// To do that, all we have to do is install a throwing error handler.
set_error_handler(
    fn(int $severity, string $message, string $file, int $line) =>
        throw new ErrorException($message, 0, $severity, $file, $line),
);
