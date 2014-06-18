<?php

namespace MyApp\Controllers;

use Phalcon\Mvc\Controller,
    Phalcon\Tag;

class ControllerBase extends Controller{

    protected function initialize(){
        Tag::prependTitle('СІ КЕП - ');
    }

    protected function forward($controller, $action = 'index', $namespace = 'MyApp\Controllers'){
        return $this->dispatcher->forward(array(
            'namespace' => $namespace,
            'controller' => $controller,
            'action' => $action
        ));
    }

    protected function redirect($controller, $action = 'index', $admin = false){
        $base = ($admin) ? 'admin/' : '';

        return $this->response->redirect(
            $base.
            $controller.'/'.
            $action
        );
    }

}