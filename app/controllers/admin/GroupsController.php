<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class GroupsController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Групи');
        parent::initialize();
    }

    public function indexAction(){
        $numberPage = $this->request->getQuery("page", "int");

        if ($numberPage <= 0) {
            $numberPage = 1;
        }

        $model = \Groups::find();

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

            $model = new \Groups();

            $model->name = $this->request->getPost('name', array('string', 'striptags'));
            $model->curator = $this->request->getPost('curator', 'int');
            $model->info = $this->request->getPost('info');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'groups',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Група додана');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'groups',
                'action' => 'index'
            ));
        }

        $model = \Teachers::find();

        $this->view->setVar("model", $model);

    }

    public function deleteAction($id){

        $model = \Groups::findFirstById($id);

        if (!$model) {
            $this->flash->error('Група не знайдена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'groups',
                'action' => 'index'
            ));
        }

        if (!$model->delete()) {
            foreach ($model->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'groups',
                'action' => 'index'
            ));
        }

        $this->flash->success('Група видалена');
        return $this->dispatcher->forward(array(
            'namespace' => 'MyApp\Controllers\Admin',
            'controller' => 'groups',
            'action' => 'index'
        ));

    }

    public function editAction($id){
        $model = \Groups::findFirstById($id);

        if (!$model) {
            $this->flash->error('Група не знайдена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'groups',
                'action' => 'index'
            ));
        }

        if($this->request->isPost()){

            $model->name = $this->request->getPost('name', array('string', 'striptags'));
            $model->curator = $this->request->getPost('curator', 'int');
            $model->info = $this->request->getPost('info');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'groups',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Група змінена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'groups',
                'action' => 'index'
            ));

        }

        $teachers = \Teachers::find();

        $this->view->setVar("teachers", $teachers);
        $this->view->setVar("model", $model);
    }

}