<?php

namespace MyApp\Controllers;

use Phalcon\Mvc\Controller,
    Phalcon\Tag;

class ControllerBase extends Controller{

    protected function initialize(){
        Tag::prependTitle('IFITS - ');
    }

}