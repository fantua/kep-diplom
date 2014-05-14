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
        $this->elements->timetable = ['group' => 1];
    }

    public function lessonsAction(){
        $this->elements->timetable = ['group' => 1];
    }

    public function timetableAction(){
        $this->elements->timetable = ['group' => 1];
    }
}