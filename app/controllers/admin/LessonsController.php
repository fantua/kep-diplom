<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class LessonsController extends ControllerBase{

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

        $model = \Lessons::find();

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

            $model = new \Lessons();

            $model->name = $this->request->getPost('name', array('string', 'striptags'));
            $model->info = $this->request->getPost('info');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'lessons',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Предмет доданий');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'lessons',
                'action' => 'index'
            ));
        }
    }

    public function deleteAction($id){

        $model = \Lessons::findFirstById($id);

        if (!$model) {
            $this->flash->error('Предмет не знайдений');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'lessons',
                'action' => 'index'
            ));
        }

        if (!$model->delete()) {
            foreach ($model->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'lessons',
                'action' => 'index'
            ));
        }

        $this->flash->success('Предмет видалений');
        return $this->dispatcher->forward(array(
            'namespace' => 'MyApp\Controllers\Admin',
            'controller' => 'lessons',
            'action' => 'index'
        ));

    }

    public function editAction($id){
        $model = \Lessons::findFirstById($id);

        if (!$model) {
            $this->flash->error('Предмет не знайдений');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'lessons',
                'action' => 'index'
            ));
        }

        if($this->request->isPost()){

            $model->name = $this->request->getPost('name', array('string', 'striptags'));
            $model->info = $this->request->getPost('info');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'lessons',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Предмет змінений');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'lessons',
                'action' => 'index'
            ));

        }

        $this->view->setVar("model", $model);
    }

}