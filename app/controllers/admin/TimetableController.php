<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class TimetableController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Розклад');
        parent::initialize();
    }

    public function indexAction(){

    }

    public function addAction(){

    }

    public function editAction($id){

    }

}