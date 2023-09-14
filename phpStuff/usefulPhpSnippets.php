<?php

/**
 * A Collection of notes, and useful snippets of php code that I use
 * regularly.
 */

function currentUsersHomeDirectoryPath() : string {
    // Determine the current users $HOME directory path on linux:
    $userInfo = posix_getpwuid(posix_geteuid());
    if(is_array($userInfo) && isset($userInfo['dir'])) {
        $usersHomeDirectoryPath = realpath(
            $userInfo['dir']
        );
    }
    return (isset($usersHomeDirectoryPath) ? strval($usersHomeDirectoryPath) : DIRECTORY_SEPARATOR . 'tmp');
}

/** Apply cli color to a string that will be output to a terminal. */
function applyCliColor(string $string, int $colorCode): string {
    return "\033[0m\033[48;5;" . strval($colorCode) . "m\033[38;5;0m" . $string . "\033[0m";
}
echo appCliColor("PHP Notes And Snippets", 81);
echo PHP_EOL;
echo PHP_EOL;
echo appCliColor("Users Home Directory Path:", 192);
echo PHP_EOL;
echo PHP_EOL . '    ';
echo appCliColor(currentUsersHomeDirectoryPath(), 202);
echo PHP_EOL;

/** Determine the Type based on the provided Json */
/* WARNING: Requires appropriate Darling libraries!
function determineType(
    \Darling\PHPJsonUtilities\classes\encoded\data\Json $json,
    \Darling\PHPJsonUtilities\interfaces\decoders\JsonDecoder $jsonDecoder
): \Darling\PHPJsonStorageUtilities\enumerations\Type|\Darling\PHPTextTypes\interfaces\strings\ClassString
{
    $data = $jsonDecoder->decode($json);
    if(is_object($data)) {
        return new ClassString($data);
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
*/
