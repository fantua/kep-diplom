<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class TeachersController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Новини');
        parent::initialize();
    }

    public function indexAction(){
        $numberPage = $this->request->getQuery("page", "int");

        if ($numberPage <= 0) {
            $numberPage = 1;
        }

        $model = \Teachers::find();

        $paginator = new Model(array(
            "data" => $model,
            "limit" => 10,
            "page" => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar("page", $page);
        $this->view->setVar("model", $model);
    }

    public function addAction(){
        if($this->request->isPost()){

            $model = new \Teachers();

            $model->firstname = $this->request->getPost('firstname', array('string', 'striptags'));
            $model->middlename = $this->request->getPost('middlename', array('string', 'striptags'));
            $model->lastname = $this->request->getPost('lastname', array('string', 'striptags'));
            $model->info = $this->request->getPost('info');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'teachers',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Викладач доданий');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'teachers',
                'action' => 'index'
            ));
        }
    }

    public function editAction($id){

    }

}