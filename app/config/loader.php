<?php

$loader = new \Phalcon\Loader();

/**
 * We're a registering a set of directories taken from the configuration file
 */

$loader->registerNamespaces(array(
	'MyApp\Controllers' => __DIR__ . '/../controllers/',
    'MyApp\Controllers\Admin' => __DIR__ . '/../controllers/admin/'
))->register();

$loader->registerDirs(
    array(
        $config->application->pluginsDir,
        $config->application->libraryDir,
        $config->application->modelsDir,
        $config->application->helpersDir,
    )
)->register();