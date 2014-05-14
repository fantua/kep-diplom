<?php
namespace MyApp\Controllers;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class GroupsController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Групи');
        parent::initialize();
    }

    public function indexAction(){

    }

    public function lessonsAction(){

    }

    public function timetableAction(){

    }
}