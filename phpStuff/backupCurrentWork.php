<?php

namespace Darling\PHPJsonStorageUtilities\tests\interfaces\filesystem\storage\drivers;

use Darling\PHPJsonStorageUtilities\classes\filesystem\paths\JsonFilePath as JsonFilePathInstance;
use Darling\PHPJsonStorageUtilities\classes\filesystem\paths\JsonStorageDirectoryPath;
use Darling\PHPJsonStorageUtilities\classes\named\identifiers\Container;
use Darling\PHPJsonStorageUtilities\classes\named\identifiers\Location;
use Darling\PHPTextTypes\classes\strings\AlphanumericText;
use \Darling\PHPJsonStorageUtilities\classes\filesystem\storage\queries\JsonFilesystemStorageQuery;
use \Darling\PHPJsonStorageUtilities\classes\named\identifiers\Owner;
use \Darling\PHPJsonStorageUtilities\classes\collections\JsonCollection as JsonCollectionInstance;
use \Darling\PHPJsonStorageUtilities\classes\collections\JsonFilePathCollection as JsonFilePathCollectionInstance;
use \Darling\PHPJsonStorageUtilities\enumerations\Type;
use \Darling\PHPJsonStorageUtilities\interfaces\filesystem\paths\JsonFilePath;
use \Darling\PHPJsonStorageUtilities\interfaces\filesystem\storage\drivers\JsonFilesystemStorageDriver;
use \Darling\PHPJsonUtilities\classes\decoders\JsonDecoder as JsonDecoderInstance;
use \Darling\PHPJsonUtilities\interfaces\decoders\JsonDecoder;
use \Darling\PHPJsonUtilities\interfaces\encoded\data\Json;
use \Darling\PHPJsonUtilities\classes\encoded\data\Json as JsonInstance;
use \Darling\PHPTextTypes\classes\strings\ClassString as ClassStringInstance;
use \Darling\PHPTextTypes\classes\strings\Id;
use \Darling\PHPTextTypes\classes\strings\Name;
use \Darling\PHPTextTypes\classes\strings\Text;
use \Darling\PHPTextTypes\interfaces\strings\ClassString;
use \Darling\PHPReflectionUtilities\classes\utilities\Reflection;
use \Darling\PHPMockingUtilities\classes\mock\values\MockClassInstance;
use \ReflectionObject;


/**
 * The JsonFilesystemStorageDriverTestTrait defines common tests for
 * implementations of the JsonFilesystemStorageDriver interface.
 *
 * @see JsonFilesystemStorageDriver
 *
 */
trait JsonFilesystemStorageDriverTestTrait
{

    /**
     * @var JsonFilesystemStorageDriver $jsonFilesystemStorageDriver
     *                              An instance of a
     *                              JsonFilesystemStorageDriver
     *                              implementation to test.
     */
    protected JsonFilesystemStorageDriver $jsonFilesystemStorageDriver;

    /**
     * @var JsonFilePath $expectedJsonFilePath The JsonFilePath that
     *                                         will be used to test
     *                                         the JsonFilesystemStorageDriver
     *                                         being tested's read(),
     *                                         write(), and delete()
     *                                         methods.
     */
    private $expectedJsonFilePath;

    /**
     * @var Json $expectedJson The Json that will be used to test the
     *                         JsonFilesystemStorageDriver being
     *                         tested's read(), write(), and delete()
     *                         methods.
     */
    private $expectedJson;

    /**
     * Set up an instance of a JsonFilesystemStorageDriver
     * implementation to test.
     *
     * This method must set the JsonFilesystemStorageDriver
     * implementation instance to be tested via the
     * setJsonFilesystemStorageDriverTestInstance() method.
     *
     * This method must also set the JsonFilePath instance that will
     * be used to test the read(), write(), and delete() methods.
     *
     * This method may also be used to perform any additional
     * setup required by the implementation being tested.
     *
     * @return void
     *
     * @example
     *
     * ```
     * public function setUp(): void
     * {
     *     $testData = [
     *         $this->randomChars(),
     *         $this->randomClassStringOrObjectInstance(),
     *         $this->randomFloat(),
     *         $this->randomObjectInstance(),
     *         $this->prefixedRandomName($this->randomChars()),
     *     ];
     *     $json = new Json($testData[array_rand($testData)]);
     *     $this->setExpectedJson($json);
     *     $container = new Container(
     *         $this->determineType($this->expectedJson())
     *     );
     *     $jsonFilePath = new JsonFilePath(
     *         new JsonStorageDirectoryPath(
     *             new Name(new Text(self::TEST_STORAGE_DIRECTORY_NAME)),
     *         ),
     *         new Location($this->prefixedRandomName('Location')),
     *         $container,
     *         new Owner($this->prefixedRandomName('Owner')),
     *         $this->prefixedRandomName('Name'),
     *         new Id(),
     *     );
     *     $this->setExpectedJsonFilePath($jsonFilePath);
     *     $this->setJsonFilesystemStorageDriverTestInstance(
     *         new JsonFilesystemStorageDriver()
     *     );
     * }
     *
     * ```
     *
     */
    abstract protected function setUp(): void;

    /**
     * Return the JsonFilesystemStorageDriver implementation instance
     * to test.
     *
     * @return JsonFilesystemStorageDriver
     *
     */
    protected function jsonFilesystemStorageDriverTestInstance(): JsonFilesystemStorageDriver
    {
        return $this->jsonFilesystemStorageDriver;
    }

    /**
     * Set the JsonFilesystemStorageDriver implementation instance to
     * test.
     *
     * @param JsonFilesystemStorageDriver $jsonFilesystemStorageDriverTestInstance
     *                                 An instance of an
     *                                 implementation of
     *                                 the JsonFilesystemStorageDriver
     *                                 interface to test.
     *
     * @return void
     *
     */
    protected function setJsonFilesystemStorageDriverTestInstance(
        JsonFilesystemStorageDriver $jsonFilesystemStorageDriverTestInstance
    ): void
    {
        $this->jsonFilesystemStorageDriver = $jsonFilesystemStorageDriverTestInstance;
    }

    /**
     * Set the JsonFilePath that the JsonFilesystemStorageDriver
     * instance being tested is expected to read from, write to,
     * and delete.
     *
     * @return void
     *
     */
    protected function setExpectedJsonFilePath(
        JsonFilePath $jsonFilePath
    ): void
    {
        $this->expectedJsonFilePath = $jsonFilePath;
    }

    /**
     * Determine the type of data that is encoded as Json.
     *
     * @return Type|ClassString
     *
     */
    protected function determineType(Json $json): Type|ClassString
    {
        $jsonDecoder = new JsonDecoderInstance();
        $data = $jsonDecoder->decode($json);
        if(is_object($data)) {
            return new ClassStringInstance($data);
        }
        return match(gettype($data)) {
            Type::Array->value => Type::Array,
            Type::Bool->value => Type::Bool,
            Type::Float->value => Type::Float,
            Type::Int->value => Type::Int,
            Type::Null->value => Type::Null,
            Type::String->value => Type::String,
            Type::Object->value => Type::Object,
            Type::Resource->value => Type::Resource,
            Type::ResourceClosed->value => Type::ResourceClosed,
            Type::UnknownType->value => Type::UnknownType,
        };
    }

    /**
     * Return the JsonFilePath that the JsonFilesystemStorageDriver
     * instance being tested is expected to read from, write to,
     * and delete.
     *
     * @return JsonFilePath
     *
     */
    protected function expectedJsonFilePath(): JsonFilePath
    {
        return $this->expectedJsonFilePath;
    }

    /**
     * Set the Json that the JsonFilesystemStorageDriver instance
     * being tested is expected to read, write, and delete.
     *
     * @return void
     *
     */
    protected function setExpectedJson(Json $json): void
    {
        $this->expectedJson = $json;
    }

    /**
     * Return the Json that the JsonFilesystemStorageDriver instance
     * being tested is expected to read, write, and delete.
     *
     * @return Json
     *
     */
    protected function expectedJson(): Json
    {
        return $this->expectedJson;
    }

    protected function prefixedRandomName(string $prefix): Name
    {
        return new Name(
            new Text(
                $prefix .
                ucfirst(substr($this->randomChars(), 0, 3))
            )
        );
    }

    private function expectedJsonFilesystemStorageQueryResults(
        JsonFilesystemStorageQuery $query
    ): JsonCollectionInstance
    {
        $jsonDecoder = $this->jsonFilesystemStorageDriverTestInstance()
                            ->jsonDecoder();
        $jsonFilePath = $query->jsonFilePath();
        if($jsonFilePath instanceof JsonFilePath) {
            return new JsonCollectionInstance(
                new JsonInstance(
                    $jsonDecoder->decodeJsonString(
                        strval(
                            file_get_contents(
                                $jsonFilePath->__toString()
                            )
                        )
                    )
                )
            );
        }
        $files = glob($query->__toString());
        $data = [];
        if(is_array($files)) {
            foreach($files as $file) {
                $data[] = new JsonInstance(
                    $jsonDecoder->decodeJsonString(
                        strval(file_get_contents($file))
                    )
                );
            }
        }
        return new JsonCollectionInstance(...$data);
    }

    private function expectedStoredJsonFilePathQueryResults(
        JsonFilesystemStorageQuery $query
    ): JsonFilePathCollectionInstance
    {
        $jsonDecoder = $this->jsonFilesystemStorageDriverTestInstance()
                            ->jsonDecoder();
        $jsonFilePath = $query->jsonFilePath();
        if($jsonFilePath instanceof JsonFilePath) {
            return new JsonFilePathCollectionInstance($jsonFilePath);
        }
        $files = glob($query->__toString());
        /** @var array<int, JsonFilePath> $data */
        $data = [];
        if(is_array($files)) {
            foreach($files as $file) {
                $parts = explode(DIRECTORY_SEPARATOR, $file);
                #var_dump($parts);
                $data[] = new JsonFilePathInstance(
                    new JsonStorageDirectoryPath(new Name(new Text($parts[7] ?? ''))),
                    new Location(new Name(new Text($parts[8] ?? ''))),
                    new Container(
                        $this->determineType(
                            new JsonInstance(
                                $jsonDecoder->decodeJsonString(
                                    strval(file_get_contents($file))
                                )
                            )
                        )
                    ),
                    new Owner(new Name(new Text($parts[10] ?? ''))),
                    new Name(new Text($parts[11] ?? '')),
                    $this->determineIdFromFilePath($file),
                );
            }
        }
        #foreach($data as $jsf) {
            #echo PHP_EOL . "\033[0m\033[48;5;1m\033[38;5;0m" . $jsf->__toString() . "\033[0m" . PHP_EOL;
        #}
        return new JsonFilePathCollectionInstance(...$data);
    }

    private function determineIdFromFilePath(string $filePath) : Id
    {
        $reflection = new Reflection(new ClassStringInstance(new \Darling\PHPTextTypes\classes\strings\Id()));
        $mockClassInstance = new MockClassInstance($reflection);
        $object = $mockClassInstance->mockInstance();
        $reflectionClass = new ReflectionObject($object);
        if($object instanceof Id) {
            $reflectionClass = $reflectionClass->getParentClass()->getParentClass();
            $property =
                $reflectionClass->getProperty(
                    'text'
                );
            $property->setAccessible(true);
            $property->setValue(
                $object,
                new AlphanumericText(new Text('FOOBARBAZ'))
            );
            $reflectionClass = $reflectionClass->getParentClass();
            $property =
                $reflectionClass->getProperty(
                    'string'
                );
            $property->setAccessible(true);
            $property->setValue(
                $object,
                new AlphanumericText(new Text('FOOBARBAZ'))
            );
            var_dump($object);
            return $object;
        }
        return new Id();
    }

    /**
     * Test jsonDecoder() returns an instance of a JsonDecoder.
     *
     * @return void
     *
     * @covers JsonFilesystemStorageDriver->jsonDecoder()
     */
    public function test_jsonDecoder_returns_an_instance_of_a_JsonDecoder(): void
    {
        $this->assertTrue(
            $this->jsonFilesystemStorageDriverTestInstance()
                 ->jsonDecoder() instanceof JsonDecoder,
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'jsonDecoder',
                'return an instance of a JsonDecoder',
            ),
        );
    }

    /**
     * Test write writes to the expected JsonFilePath.
     *
     * @return void
     *
     * @covers JsonFilesystemStorageDriver->write()
     *
     */
    public function test_write_writes_to_the_expected_json_file_path(): void
    {
        $status = $this->jsonFilesystemStorageDriverTestInstance()->write(
            $this->expectedJson(),
            $this->expectedJsonFilePath()->jsonStorageDirectoryPath(),
            $this->expectedJsonFilePath->location(),
            $this->expectedJsonFilePath->owner(),
            $this->expectedJsonFilePath->name(),
            $this->expectedJsonFilePath()->id(),
        );
        $this->assertTrue(
            file_exists(
                $this->expectedJsonFilePath()->__toString()
            ),
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'write',
                'write to the expected JsonFilePath:' .
                PHP_EOL .
                PHP_EOL .
                $this->expectedJsonFilePath() .
                PHP_EOL .
                PHP_EOL,
            ),
        );
        $this->assertTrue(
            $status,
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'write',
                'write returns true if a file was written to the ' .
                'expected JsonFilePath',
            ),
        );
    }

    /**
     * Test write writes the expected json to the expected
     * JsonFilePath.
     *
     * @return void
     *
     * @covers JsonFilesystemStorageDriver->write()
     *
     */
    public function test_write_writes_the_expected_json_to_the_expected_json_file_path(): void
    {
        $status = $this->jsonFilesystemStorageDriverTestInstance()->write(
            $this->expectedJson(),
            $this->expectedJsonFilePath()->jsonStorageDirectoryPath(),
            $this->expectedJsonFilePath->location(),
            $this->expectedJsonFilePath->owner(),
            $this->expectedJsonFilePath->name(),
            $this->expectedJsonFilePath()->id(),
        );
        $this->assertEquals(
            $this->expectedJson()->__toString(),
            file_get_contents($this->expectedJsonFilePath()->__toString()),
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'write',
                'writes the expected Json to the expected JsonFilePath',
            ),
        );
        $this->assertTrue(
            $status,
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'write',
                'write returns true if the expected Json was ' .
                'written to the expected JsonFilePath',
            ),
        );
    }

    /**
     * Test write does not overwrite previously stored data.
     *
     * @return void
     *
     * @covers JsonFilesystemStorageDriver->write()
     *
     */
    public function test_write_does_not_overwrite_previously_stored_data(): void
    {
        /** Clear file status cache @see https://www.php.net/manual/en/function.clearstatcache.php */
        clearstatcache();
        $status = $this->jsonFilesystemStorageDriverTestInstance()->write(
            $this->expectedJson(),
            $this->expectedJsonFilePath()->jsonStorageDirectoryPath(),
            $this->expectedJsonFilePath->location(),
            $this->expectedJsonFilePath->owner(),
            $this->expectedJsonFilePath->name(),
            $this->expectedJsonFilePath()->id(),
        );
        clearstatcache();
        /**
         * Sleep between writes to allow file modification time to
         * change if original file is overwritten
         */
        sleep(1);
        $initialModificationTime = filemtime($this->expectedJsonFilePath()->__toString());
        $status = $this->jsonFilesystemStorageDriverTestInstance()->write(
            $this->expectedJson(),
            $this->expectedJsonFilePath()->jsonStorageDirectoryPath(),
            $this->expectedJsonFilePath->location(),
            $this->expectedJsonFilePath->owner(),
            $this->expectedJsonFilePath->name(),
            $this->expectedJsonFilePath()->id(),
        );
        clearstatcache();
        $lastModificationTime = filemtime($this->expectedJsonFilePath()->__toString());
        $this->assertEquals(
            $initialModificationTime,
            $lastModificationTime,
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'write',
                'must not overwrite previsouly stored Json'
            ),
        );
        $this->assertFalse(
            $status,
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'write',
                'return false if the expected Json was not ' .
                'written to the expected JsonFilePath',
            ),
        );
    }

    /**
     * Test read returns an empty JsonCollection if there is nothing
     * in storage.
     *
     * @return void
     *
     * @covers JsonFilesystemStorageDriver->read()
     *
     */
    public function test_read_returns_an_empty_JsonCollection_if_there_is_nothing_in_storage(): void
    {
        $expectedCollection = new JsonCollectionInstance();
        $jsonFilesystemStorageQuery = new JsonFilesystemStorageQuery(
            id: new Id(),
            name: $this->prefixedRandomName(
                'NameForTestReadReturnsEmptyJsonCollectionIfThereIsNothingInStorage'
            ),
            owner: new Owner(
                $this->prefixedRandomName(
                    'OwnerForTestReadReturnsEmptyJsonCollectionIfThereIsNothingInStorage'
                )
            ),
        );
        $this->assertEquals(
            [],
            $this->jsonFilesystemStorageDriverTestInstance()
                 ->read($jsonFilesystemStorageQuery)
                 ->collection(),
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'read',
                'returns an empty JsonCollection there is nothing in storage',
            ),
        );
    }

    /**
     * Test read returns an empty array if query does not produce
     * any matches.
     *
     * @return void
     *
     * @covers JsonFilesystemStorageDriver->read()
     *
     */
    public function test_read_returns_an_empty_JsonCollection_if_query_does_not_produce_any_matches(): void
    {
        $randomData = [
            $this->randomClassStringOrObjectInstance(),
            $this->randomChars(),
            rand(PHP_INT_MIN, PHP_INT_MAX),
            floatval(strval(rand(0, 100)) . strval(rand(0, 100))),
        ];
        for(
            $numberOfJsonInstancesWrittenToStorage = 0;
            $numberOfJsonInstancesWrittenToStorage < rand(10, 20);
            $numberOfJsonInstancesWrittenToStorage++
        ) {
            $this->jsonFilesystemStorageDriverTestInstance()->write(
                new JsonInstance($randomData[array_rand($randomData)]),
                $this->expectedJsonFilePath->jsonStorageDirectoryPath(),
                new Location(new Name(new Text($this->randomChars()))),
                new Owner(new Name(new Text($this->randomChars()))),
                $this->prefixedRandomName(
                    'ReadReturnsEmptyJsonCollectionIfQueryDoesNotMatch'
                ),
                new Id(),
            );
        }
        $jsonFilesystemStorageQuery = new JsonFilesystemStorageQuery(
            id: new Id(),
            name: $this->prefixedRandomName(
                'NameForTestReadReturnsEmptyJsonCollectionIfQueryDoesNotMatch'
            ),
            owner: new Owner(
                $this->prefixedRandomName(
                    'OwnerForTestReadReturnsEmptyJsonCollectionIfQueryDoesNotMatch'
                )
            ),
        );
        $this->assertEquals(
            [],
            $this->jsonFilesystemStorageDriverTestInstance()
                 ->read($jsonFilesystemStorageQuery)->collection(),
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'read',
                'returns an empty JsonCollection if query does not ' .
                'produce any matches',
            ),
        );
    }

    /**
     *
     * @return void
     *
     * @covers JsonFilesystemStorageDriver->read()
     *
     */
    public function test_read_returns_a_JsonCollection_that_contains_all_of_the_Json_in_storage_if_the_JsonFilesystemStorageQuery_is_empty(): void
    {
        $randomData = [
            $this->randomClassStringOrObjectInstance(),
            $this->randomChars(),
            rand(PHP_INT_MIN, PHP_INT_MAX),
            floatval(strval(rand(0, 100)) . strval(rand(0, 100))),
        ];
        for(
            $numberOfJsonInstancesWrittenToStorage = 0;
            $numberOfJsonInstancesWrittenToStorage < rand(10, 20);
            $numberOfJsonInstancesWrittenToStorage++
        ) {
            $this->jsonFilesystemStorageDriverTestInstance()->write(
                new JsonInstance($randomData[array_rand($randomData)]),
                $this->expectedJsonFilePath->jsonStorageDirectoryPath(),
                new Location(new Name(new Text($this->randomChars()))),
                new Owner(new Name(new Text($this->randomChars()))),
                $this->prefixedRandomName(
                    'ReadReturnsJsonCollectionContaingAllStoredJsonIfQueryIsEmpty'
                ),
                new Id(),
            );
        }
        $jsonFilesystemStorageQuery = new JsonFilesystemStorageQuery();
        $actualQueryResults = $this->jsonFilesystemStorageDriverTestInstance()
                             ->read($jsonFilesystemStorageQuery);
        $this->assertEquals(
            $this->expectedJsonFilesystemStorageQueryResults(
                $jsonFilesystemStorageQuery
            ),
            $actualQueryResults,
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'read',
                'return all stored Json if query is empty',
            ),
        );
        $this->assertEquals(
            $numberOfJsonInstancesWrittenToStorage,
            count($actualQueryResults->collection()),
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'read',
                'return all stored Json if query is empty.' .
                'Expected ' .
                $numberOfJsonInstancesWrittenToStorage .
                ' items in the returned JsonCollection ' .
                'but there are only' .
                count($actualQueryResults->collection()) . ' items in the ' .
                'returned JsonCollection',
            ),
        );
    }

    /**
     *
     * @return void
     *
     * @covers JsonFilesystemStorageDriver->read()
     *
     */
    public function test_read_returns_a_JsonCollection_that_only_contains_a_single_Json_instance_read_from_the_specified_JsonFilePath_if_the_specified_JsonFilesystemStorageQuery_specifies_a_JsonFilePath(): void
    {
        $randomData = [
            $this->randomClassStringOrObjectInstance(),
            $this->randomChars(),
            rand(PHP_INT_MIN, PHP_INT_MAX),
            floatval(strval(rand(0, 100)) . strval(rand(0, 100))),
        ];
        /** @var array<int, JsonFilePath> $jsonFilePaths */
        $jsonFilePaths = [];
        for(
            $numberOfJsonInstancesWrittenToStorage = 0;
            $numberOfJsonInstancesWrittenToStorage < rand(10, 20);
            $numberOfJsonInstancesWrittenToStorage++
        ) {
            $jsonInstance = new JsonInstance($randomData[array_rand($randomData)]);
            $jsonFilesystemStorageDirectoryPath = $this->expectedJsonFilePath->jsonStorageDirectoryPath();
            $location = new Location(new Name(new Text($this->randomChars())));
            $container = new Container($this->determineType($jsonInstance));
            $owner = new Owner(new Name(new Text($this->randomChars())));
            $name = $this->prefixedRandomName('ReadOnlyReturnsTheJsoneReadFromSpecifiedJsonFilePathIfJsonFilePathIsQueried');
            $id = new Id();
            $this->jsonFilesystemStorageDriverTestInstance()->write(
                $jsonInstance,
                $jsonFilesystemStorageDirectoryPath,
                $location,
                $owner,
                $name,
                $id,
            );
            $jsonFilePaths[] = new JsonFilePathInstance(
                $jsonFilesystemStorageDirectoryPath,
                $location,
                $container,
                $owner,
                $name,
                $id
            );
        }
        $jsonFilesystemStorageQuery = new JsonFilesystemStorageQuery(jsonFilePath: $jsonFilePaths[array_rand($jsonFilePaths)]);
        $expectedQueryResults = $this->expectedJsonFilesystemStorageQueryResults(
            $jsonFilesystemStorageQuery
        );
        $actualQueryResults = $this->jsonFilesystemStorageDriverTestInstance()
                             ->read($jsonFilesystemStorageQuery);
        $this->assertEquals(
            $expectedQueryResults,
            $actualQueryResults,
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'read',
                'return only the Json stored at the specified ' .
                'JsonFilePath if the query is specifies a ' .
                'JsonFilePath',
            ),
        );
    }

    /**
     *
     * @return void
     *
     * @covers JsonFilesystemStorageDriver->read()
     *
     */
    public function test_read_returns_a_JsonCollection_that_contains_the_expected_Json_intances_based_on_a_JsonFilesystemStorageQuery(): void
    {
        $randomData = [
            $this->randomClassStringOrObjectInstance(),
            $this->randomChars(),
            rand(PHP_INT_MIN, PHP_INT_MAX),
            floatval(strval(rand(0, 100)) . strval(rand(0, 100))),
        ];
        /** @var array<int, JsonFilesystemStorageQuery> $completeQueries */
        $completeQueries = [];
        /** @var array<int, JsonFilesystemStorageQuery> $incompleteQueries  */
        $incompleteQueries = [];
        /** @var array<int, JsonFilesystemStorageQuery> $jsonFilePathQueries */
        $jsonFilePathQueries = [];
        for(
            $numberOfJsonInstancesWrittenToStorage = 0;
            $numberOfJsonInstancesWrittenToStorage < rand(10, 20);
            $numberOfJsonInstancesWrittenToStorage++
        ) {
            $jsonInstance = new JsonInstance($randomData[array_rand($randomData)]);
            $jsonFilesystemStorageDirectoryPath = $this->expectedJsonFilePath->jsonStorageDirectoryPath();
            $location = new Location(new Name(new Text($this->randomChars())));
            $container = new Container($this->determineType($jsonInstance));
            $owner = new Owner(new Name(new Text($this->randomChars())));
            $name = $this->prefixedRandomName('ReadOnlyReturnsTheJsoneReadFromSpecifiedJsonFilePathIfJsonFilePathIsQueried');
            $id = new Id();
            $this->jsonFilesystemStorageDriverTestInstance()->write(
                $jsonInstance,
                $jsonFilesystemStorageDirectoryPath,
                $location,
                $owner,
                $name,
                $id,
            );
            $completeQueries[] = new JsonFilesystemStorageQuery(
                jsonStorageDirectoryPath: $jsonFilesystemStorageDirectoryPath,
                location: $location,
                container: $container,
                owner: $owner,
                name: $name,
                id: $id,
            );
            $incompleteQueries[] = new JsonFilesystemStorageQuery(
                jsonStorageDirectoryPath: (rand(0, 1) === 0 ? $jsonFilesystemStorageDirectoryPath : null),
                location: (rand(0, 1) === 0 ? $location : null),
                container: (rand(0, 1) === 0 ? $container : null),
                owner: (rand(0, 1) === 0 ? $owner : null),
                name: (rand(0, 1) === 0 ? $name : null),
                id: (rand(0, 1) === 0 ? $id : null),
            );
            $jsonFilePath = new JsonFilePathInstance(
                $jsonFilesystemStorageDirectoryPath,
                $location,
                $container,
                $owner,
                $name,
                $id
            );
            $jsonFilePathQueries[] = new JsonFilesystemStorageQuery(
                jsonFilePath: $jsonFilePath,
            );
        }
        $completeJsonFilesystemStorageQuery = $completeQueries[array_rand($completeQueries)];
        $expectedQueryResults = $this->expectedJsonFilesystemStorageQueryResults(
            $completeJsonFilesystemStorageQuery
        );
        $actualQueryResults = $this->jsonFilesystemStorageDriverTestInstance()
                             ->read($completeJsonFilesystemStorageQuery);
        $this->assertEquals(
            $expectedQueryResults,
            $actualQueryResults,
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'read',
                'return only the Json stored at the specified ' .
                'JsonFilePath if the query is specifies a ' .
                'JsonFilePath',
            ),
        );
        $incompleteJsonFilesystemStorageQuery = $incompleteQueries[array_rand($incompleteQueries)];
        $expectedQueryResults = $this->expectedJsonFilesystemStorageQueryResults(
            $incompleteJsonFilesystemStorageQuery
        );
        $actualQueryResults = $this->jsonFilesystemStorageDriverTestInstance()
                             ->read($incompleteJsonFilesystemStorageQuery);
        $this->assertEquals(
            $expectedQueryResults,
            $actualQueryResults,
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'read',
                'return only the Json stored at the specified ' .
                'JsonFilePath if the query is specifies a ' .
                'JsonFilePath',
            ),
        );
        $jsonFilePathJsonFilesystemStorageQuery = $jsonFilePathQueries[array_rand($jsonFilePathQueries)];
        $expectedQueryResults = $this->expectedJsonFilesystemStorageQueryResults(
            $jsonFilePathJsonFilesystemStorageQuery
        );
        $actualQueryResults = $this->jsonFilesystemStorageDriverTestInstance()
                             ->read($jsonFilePathJsonFilesystemStorageQuery);
        $this->assertEquals(
            $expectedQueryResults,
            $actualQueryResults,
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'read',
                'return only the Json stored at the specified ' .
                'JsonFilePath if the query is specifies a ' .
                'JsonFilePath',
            ),
        );
    }

    /**
     * Test storedJsonFilePaths returns an empty
     * JsonFilePathCollection if there is nothing in storage.
     *
     * @return void
     *
     * @covers JsonFilesystemStorageDriver->storedJsonFilePaths()
     *
     */
    public function test_storedJsonFilePaths_returns_an_empty_JsonFilePathCollection_if_there_is_nothing_in_storage(): void
    {
        $jsonFilesystemStorageQuery = new JsonFilesystemStorageQuery(
            id: new Id(),
            name: $this->prefixedRandomName(
                'NameForTeststoredJsonFilePathsReturnsEmptyJsonFilePathCollectionIfThereIsNothingInStorage'
            ),
            owner: new Owner(
                $this->prefixedRandomName(
                    'OwnerForTeststoredJsonFilePathsReturnsEmptyJsonFilePathCollectionIfThereIsNothingInStorage'
                )
            ),
        );
        $this->assertEquals(
            [],
            $this->jsonFilesystemStorageDriverTestInstance()
                 ->storedJsonFilePaths($jsonFilesystemStorageQuery)
                 ->collection(),
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'storedJsonFilePaths',
                'returns an empty JsonFilePathCollection there is nothing in storage',
            ),
        );
    }


    /**
     * Test storedJsonFilePaths returns an empty array if query does not produce
     * any matches.
     *
     * @return void
     *
     * @covers JsonFilesystemStorageDriver->storedJsonFilePaths()
     *
     */
    public function test_storedJsonFilePaths_returns_an_empty_JsonFilePathCollection_if_query_does_not_produce_any_matches(): void
    {
        $randomData = [
            $this->randomClassStringOrObjectInstance(),
            $this->randomChars(),
            rand(PHP_INT_MIN, PHP_INT_MAX),
            floatval(strval(rand(0, 100)) . strval(rand(0, 100))),
        ];
        for(
            $numberOfJsonInstancesWrittenToStorage = 0;
            $numberOfJsonInstancesWrittenToStorage < rand(10, 20);
            $numberOfJsonInstancesWrittenToStorage++
        ) {
            $this->jsonFilesystemStorageDriverTestInstance()->write(
                new JsonInstance($randomData[array_rand($randomData)]),
                $this->expectedJsonFilePath->jsonStorageDirectoryPath(),
                new Location(new Name(new Text($this->randomChars()))),
                new Owner(new Name(new Text($this->randomChars()))),
                $this->prefixedRandomName(
                    'storedJsonFilePathsReturnsEmptyJsonFilePathCollectionIfQueryDoesNotMatch'
                ),
                new Id(),
            );
        }
        $jsonFilesystemStorageQuery = new JsonFilesystemStorageQuery(
            id: new Id(),
            name: $this->prefixedRandomName(
                'NameForTeststoredJsonFilePathsReturnsEmptyJsonFilePathCollectionIfQueryDoesNotMatch'
            ),
            owner: new Owner(
                $this->prefixedRandomName(
                    'OwnerForTeststoredJsonFilePathsReturnsEmptyJsonFilePathCollectionIfQueryDoesNotMatch'
                )
            ),
        );
        $this->assertEquals(
            [],
            $this->jsonFilesystemStorageDriverTestInstance()
                 ->storedJsonFilePaths($jsonFilesystemStorageQuery)->collection(),
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'storedJsonFilePaths',
                'returns an empty JsonFilePathCollection if query does not ' .
                'produce any matches',
            ),
        );
    }

    /**
     *
     * @return void
     *
     * @covers JsonFilesystemStorageDriver->storedJsonFilePaths()
     *
     */
    public function test_storedJsonFilePaths_returns_a_JsonFilePathCollection_that_only_contains_a_single_JsonFilePath_instance_that_matches_the_specified_JsonFilePath_if_the_specified_JsonFilesystemStorageQuery_specifies_a_JsonFilePath(): void
    {
        $randomData = [
            $this->randomClassStringOrObjectInstance(),
            $this->randomChars(),
            rand(PHP_INT_MIN, PHP_INT_MAX),
            floatval(strval(rand(0, 100)) . strval(rand(0, 100))),
        ];
        /** @var array<int, JsonFilePath> $jsonFilePaths */
        $jsonFilePaths = [];
        for(
            $numberOfJsonInstancesWrittenToStorage = 0;
            $numberOfJsonInstancesWrittenToStorage < rand(10, 20);
            $numberOfJsonInstancesWrittenToStorage++
        ) {
            $jsonInstance = new JsonInstance($randomData[array_rand($randomData)]);
            $jsonFilesystemStorageDirectoryPath = $this->expectedJsonFilePath->jsonStorageDirectoryPath();
            $location = new Location(new Name(new Text($this->randomChars())));
            $container = new Container($this->determineType($jsonInstance));
            $owner = new Owner(new Name(new Text($this->randomChars())));
            $name = $this->prefixedRandomName('storedJsonFilePathsOnlyReturnsTheJsonestoredJsonFilePathsFromSpecifiedJsonFilePathIfJsonFilePathIsQueried');
            $id = new Id();
            $this->jsonFilesystemStorageDriverTestInstance()->write(
                $jsonInstance,
                $jsonFilesystemStorageDirectoryPath,
                $location,
                $owner,
                $name,
                $id,
            );
            $jsonFilePaths[] = new JsonFilePathInstance(
                $jsonFilesystemStorageDirectoryPath,
                $location,
                $container,
                $owner,
                $name,
                $id
            );
        }
        $jsonFilesystemStorageQuery = new JsonFilesystemStorageQuery(jsonFilePath: $jsonFilePaths[array_rand($jsonFilePaths)]);
        $expectedQueryResults = $this->expectedStoredJsonFilePathQueryResults(
            $jsonFilesystemStorageQuery
        );
        $actualQueryResults = $this->jsonFilesystemStorageDriverTestInstance()
                             ->storedJsonFilePaths($jsonFilesystemStorageQuery);
        $this->assertEquals(
            $expectedQueryResults,
            $actualQueryResults,
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'storedJsonFilePaths',
                'return only the Json stored at the specified ' .
                'JsonFilePath if the query is specifies a ' .
                'JsonFilePath',
            ),
        );
    }

    public function test_storedJsonFilePaths_returns_a_JsonCollection_that_contains_all_of_the_Json_in_storage_if_the_JsonFilesystemStorageQuery_is_empty(): void
    {
        $randomData = [
            $this->randomClassStringOrObjectInstance(),
            $this->randomChars(),
            rand(PHP_INT_MIN, PHP_INT_MAX),
            floatval(strval(rand(0, 100)) . strval(rand(0, 100))),
        ];
        for(
            $numberOfJsonInstancesWrittenToStorage = 0;
            $numberOfJsonInstancesWrittenToStorage < rand(10, 20);
            $numberOfJsonInstancesWrittenToStorage++
        ) {
            $this->jsonFilesystemStorageDriverTestInstance()->write(
                new JsonInstance($randomData[array_rand($randomData)]),
                $this->expectedJsonFilePath->jsonStorageDirectoryPath(),
                new Location(new Name(new Text($this->randomChars()))),
                new Owner(new Name(new Text($this->randomChars()))),
                $this->prefixedRandomName(
                    'storedJsonFilePathsReturnsJsonCollectionContaingAllStoredJsonIfQueryIsEmpty'
                ),
                new Id(),
            );
        }
        $jsonFilesystemStorageQuery = new JsonFilesystemStorageQuery();
        $actualQueryResults = $this->jsonFilesystemStorageDriverTestInstance()
                             ->storedJsonFilePaths($jsonFilesystemStorageQuery);
        $this->assertEquals(
            $this->expectedStoredJsonFilePathQueryResults(
                $jsonFilesystemStorageQuery
            ),
            $actualQueryResults,
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'storedJsonFilePaths',
                'return all stored Json if query is empty',
            ),
        );
        $this->assertEquals(
            $numberOfJsonInstancesWrittenToStorage,
            count($actualQueryResults->collection()),
            $this->testFailedMessage(
                $this->jsonFilesystemStorageDriverTestInstance(),
                'storedJsonFilePaths',
                'return all stored Json if query is empty.' .
                'Expected ' .
                $numberOfJsonInstancesWrittenToStorage .
                ' items in the returned JsonCollection ' .
                'but there are only' .
                count($actualQueryResults->collection()) . ' items in the ' .
                'returned JsonCollection',
            ),
        );
    }

    abstract protected function randomClassStringOrObjectInstance(): string|object;
    abstract protected function randomChars(): string;
    abstract protected static function assertTrue(bool $condition, string $message = ''): void;
    abstract protected static function assertFalse(bool $condition, string $message = ''): void;
    abstract protected static function assertEquals(mixed $expected, mixed $actual, string $message = ''): void;
    abstract protected function testFailedMessage(object $object, string $method, string $message): string;

}

