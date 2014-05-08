<?php

namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag;

class PagesController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Головна');
        parent::initialize();
    }

    public function indexAction(){

    }

}

