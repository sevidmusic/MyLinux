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

function coloredOutput(string $message, int $colorCodeNumber) : string
{
    return "\033[38;5;0m\033[48;5;" . strval($colorCodeNumber) . "m " . $message . " \033[38;5;0m ";
}

echo coloredOutput("PHP Notes And Snippets", 81);
echo PHP_EOL;
echo PHP_EOL;
echo coloredOutput("Users Home Directory Path:", 192);
echo PHP_EOL;
echo PHP_EOL . '    ';
echo coloredOutput(currentUsersHomeDirectoryPath(), 202);
echo PHP_EOL;
