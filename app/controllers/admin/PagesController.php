<?php

namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class PagesController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Головна');
        parent::initialize();
    }

    public function indexAction(){

        $numberPage = $this->request->getQuery("page", "int");

        if ($numberPage <= 0) {
            $numberPage = 1;
        }

        $model = \Pages::find();

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

            if(!preg_match('/^[a-z0-9_-]+$/', $this->request->getPost('link'))){
                $this->flash->error('Посилання введено невірно. Дозволені символи: a-z, 0-9, -, _');
                return false;
            }

            $model = new \Pages();

            $model->name = $this->request->getPost('name', array('string', 'striptags'));
            $model->link = $this->request->getPost('link');
            $model->data = $this->request->getPost('data');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'pages',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Сторінка додана');

            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'pages',
                'action' => 'index'
            ));
        }

    }

    public function deleteAction($id){

        $model = \Pages::findFirstById($id);

        if (!$model) {
            $this->flash->error('Сторінка не знайдена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'pages',
                'action' => 'index'
            ));
        }

        if (!$model->delete()) {
            foreach ($model->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'pages',
                'action' => 'index'
            ));
        }

        $this->flash->success('Сторінка видалена');
        return $this->dispatcher->forward(array(
            'namespace' => 'MyApp\Controllers\Admin',
            'controller' => 'pages',
            'action' => 'index'
        ));

    }

    public function editAction($id){

        $model = \Pages::findFirstById($id);

        if (!$model) {
            $this->flash->error('Сторінка не знайдена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'pages',
                'action' => 'index'
            ));
        }

        if($this->request->isPost()){

            if(!preg_match('/^[a-z0-9_-]+$/', $this->request->getPost('link'))){
                $this->flash->error('Посилання введено невірно. Дозволені символи: a-z, -, _');
                return false;
            }

            $model = new \Pages();

            $model->name = $this->request->getPost('name', array('string', 'striptags'));
            $model->link = $this->request->getPost('link');
            $model->data = $this->request->getPost('data');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'pages',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Сторінка змінена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'pages',
                'action' => 'index'
            ));

        }

        $this->view->setVar("model", $model);

    }

}

