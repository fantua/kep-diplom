<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag;

class ClassroomsController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Аудиторії');
        parent::initialize();
    }

    public function indexAction(){
        $numberPage = $this->request->getQuery('page', 'int', 1);

        $model = \Classrooms::find(['order' => 'name']);

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

            $model = new \Classrooms();

            $model->name = $this->request->getPost('name', array('string', 'striptags', 'trim'));

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->redirect('classrooms', 'add');
            }

            $this->flash->success('Аудиторія додана');
            return $this->redirect('classrooms');
        }
    }

    public function deleteAction($id){

        $model = \Classrooms::findFirstById($id);

        if (!$model) {
            $this->flash->error('Аудиторія не знайдена');
            return $this->redirect('classrooms');
        }

        if (!$model->delete()) {
            foreach ($model->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->redirect('classrooms');
        }

        $this->flash->success('Аудиторія видалена');
        return $this->redirect('classrooms');

    }

    public function editAction($id){
        $model = \Classrooms::findFirstById($id);

        if (!$model) {
            $this->flash->error('Аудиторія не знайдена');
            return $this->redirect('classrooms');
        }

        if($this->request->isPost()){

            $model->name = $this->request->getPost('name', array('string', 'striptags', 'trim'));

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->redirect('classrooms', 'edit/'.$id);
            }

            $this->flash->success('Аудиторія змінена');
            return $this->redirect('classrooms');

        }

        $this->view->setVar('model', $model);
    }

}