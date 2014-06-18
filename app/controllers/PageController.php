<?php
namespace MyApp\Controllers;
use Phalcon\Tag as Tag;

class PageController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        parent::initialize();
    }

    public function indexAction($link){

        $model = \Pages::findFirst("link = '$link'");

        if(!$model)
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers',
                'controller' => 'index',
                'action' => 'index'
            ));


        Tag::appendTitle($model->name);

        $this->view->setVar('model', $model);

    }
}