<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class ClassroomsController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Аудиторії');
        parent::initialize();
    }

    public function indexAction(){
        $numberPage = $this->request->getQuery("page", "int");

        if ($numberPage <= 0) {
            $numberPage = 1;
        }

        $model = \Classrooms::find();

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

            $model = new \Classrooms();

            $model->name = $this->request->getPost('name', array('string', 'striptags'));

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'classrooms',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Аудиторія додана');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'classrooms',
                'action' => 'index'
            ));
        }
    }

    public function deleteAction($id){

        $model = \Classrooms::findFirstById($id);

        if (!$model) {
            $this->flash->error('Аудиторія не знайдена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'classrooms',
                'action' => 'index'
            ));
        }

        if (!$model->delete()) {
            foreach ($model->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'classrooms',
                'action' => 'index'
            ));
        }

        $this->flash->success('Аудиторія видалена');
        return $this->dispatcher->forward(array(
            'namespace' => 'MyApp\Controllers\Admin',
            'controller' => 'classrooms',
            'action' => 'index'
        ));

    }

    public function editAction($id){
        $model = \Classrooms::findFirstById($id);

        if (!$model) {
            $this->flash->error('Аудиторія не знайдена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'classrooms',
                'action' => 'index'
            ));
        }

        if($this->request->isPost()){

            $model->name = $this->request->getPost('name', array('string', 'striptags'));

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'classrooms',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Аудиторія змінена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'classrooms',
                'action' => 'index'
            ));

        }

        $this->view->setVar("model", $model);
    }

}