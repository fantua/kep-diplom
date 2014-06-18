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
        $numberPage = $this->request->getQuery('page', 'int', 1);

        $model = \Pages::find();

        $paginator = new \Paginator(array(
            'data' => $model,
            'limit' => 10,
            'page' => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar('page', $page);
        $this->view->setVar('model', $model);

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
                return $this->redirect('pages', 'add');
            }

            $this->flash->success('Сторінка додана');

            return $this->redirect('pages');
        }

    }

    public function deleteAction($id){

        $model = \Pages::findFirstById($id);

        if (!$model) {
            $this->flash->error('Сторінка не знайдена');
            return $this->redirect('pages');
        }

        if (!$model->delete()) {
            foreach ($model->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->redirect('pages');
        }

        $this->flash->success('Сторінка видалена');
        return $this->redirect('pages');

    }

    public function editAction($id){

        $model = \Pages::findFirstById($id);

        if (!$model) {
            $this->flash->error('Сторінка не знайдена');
            return $this->redirect('pages');
        }

        if($this->request->isPost()){

            if(!preg_match('/^[a-z0-9_-]+$/', $this->request->getPost('link'))){
                $this->flash->error('Посилання введено невірно. Дозволені символи: a-z, -, _');
                return false;
            }

            $model->name = $this->request->getPost('name', array('string', 'striptags'));
            $model->link = $this->request->getPost('link');
            $model->data = $this->request->getPost('data');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->redirect('pages', 'edit/'.$id);
            }

            $this->flash->success('Сторінка змінена');
            return $this->redirect('pages');

        }

        $this->view->setVar('model', $model);

    }

}

