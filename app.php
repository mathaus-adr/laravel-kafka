<?php

require __DIR__ . '/vendor/autoload.php';

use Enqueue\RdKafka\RdKafkaConnectionFactory;

$connectionFactory = new RdKafkaConnectionFactory('kafka:9092');

$context = $connectionFactory->createContext();
$message = $context->createMessage('Hello world!');
$fooTopic = $context->createTopic('helloworld');

$context->createProducer()->send($fooTopic, $message);

echo 'A test message has been sent to the topic "helloworld".' . PHP_EOL;