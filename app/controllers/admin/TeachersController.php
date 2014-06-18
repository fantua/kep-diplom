<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag;

class TeachersController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Викладачі');
        parent::initialize();
    }

    public function indexAction(){
        $numberPage = $this->request->getQuery('page', 'int', 1);

        $model = \Teachers::find(['order' => 'lastname, firstname']);

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

            $model = new \Teachers();

            $model->firstname = $this->request->getPost('firstname', array('string', 'striptags', 'trim'));
            $model->middlename = $this->request->getPost('middlename', array('string', 'striptags', 'trim'));
            $model->lastname = $this->request->getPost('lastname', array('string', 'striptags', 'trim'));
            $model->info = $this->request->getPost('info');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->redirect('teachers', 'add');
            }

            $this->flash->success('Викладач доданий');
            return $this->redirect('teachers');
        }
    }

    public function deleteAction($id){
        $model = \Teachers::findFirstById($id);

        if (!$model) {
            $this->flash->error('Викладач не знайдений');
            return $this->redirect('teachers');
        }

        if (!$model->delete()) {
            foreach ($model->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->redirect('teachers');
        }

        $this->flash->success('Викладач видалений');
        return $this->redirect('teachers');

    }

    public function editAction($id){
        $model = \Teachers::findFirstById($id);

        if (!$model) {
            $this->flash->error('Викладач не знайдений');
            return $this->redirect('teachers');
        }

        if($this->request->isPost()){

            $model->firstname = $this->request->getPost('firstname', array('string', 'striptags', 'trim'));
            $model->middlename = $this->request->getPost('middlename', array('string', 'striptags', 'trim'));
            $model->lastname = $this->request->getPost('lastname', array('string', 'striptags', 'trim'));
            $model->info = $this->request->getPost('info');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->redirect('teachers', 'edit/'.$id);
            }

            $this->flash->success('Викладач змінений');
            return $this->redirect('teachers');

        }

        $this->view->setVar('model', $model);
    }

}