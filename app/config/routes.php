<?php

$router = new Phalcon\Mvc\Router(false);

$router->removeExtraSlashes(true);

$router->add('/:controller/:action/:params', array(
	'namespace' => 'MyApp\Controllers',
	'controller' => 1,
	'action' => 2,
	'params' => 3,
));

$router->add('/:controller', array(
	'namespace' => 'MyApp\Controllers',
	'controller' => 1
));

// Page controller
$router->add('/page/:params', array(
    'namespace' => 'MyApp\Controllers',
    'controller' => 'page',
    'params' => 1,
));


/* Admin routes */
$router->add('/admin/:controller/:action/:params', array(
	'namespace' => 'MyApp\Controllers\Admin',
	'controller' => 1,
	'action' => 2,
	'params' => 3,
));

$router->add('/admin/:controller', array(
	'namespace' => 'MyApp\Controllers\Admin',
	'controller' => 1
));

$router->add('/admin', array(
    'namespace' => 'MyApp\Controllers\Admin'
));

return $router;