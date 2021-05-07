<?php
require_once __DIR__ . '/../lib/initialize.php';

$pg = pg_connect('host=127.0.0.1 user=haphaphap_app password=haphaphap_app dbname=haphaphap');

echo '"pong"';
