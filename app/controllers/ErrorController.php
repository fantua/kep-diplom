<?php
namespace MyApp\Controllers;
use Phalcon\Tag as Tag;

class ErrorController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('404');
        parent::initialize();
    }

    public function indexAction(){

        $this->response->setHeader(404, 'Not Found');

    }
}