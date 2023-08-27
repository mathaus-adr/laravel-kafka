<?php
namespace MathausAdr\LaravelKafka\Tests;

use MathausAdr\LaravelKafka\KafkaServiceProvider;

class TestCase extends \Orchestra\Testbench\TestCase
{
    public function setUp(): void
    {
        parent::setUp();
    }

    protected function getPackageProviders($app)
    {
        return [
            KafkaServiceProvider::class
        ];
    }

    protected function getEnvironmentSetUp($app)
    {
    }
}