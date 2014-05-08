<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class NewsController extends ControllerBase{

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

        $model = \News::find();

        $paginator = new Model(array(
            "data" => $model,
            "limit" => 5,
            "page" => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar("page", $page);
        $this->view->setVar("model", $model);

    }

    public function addAction(){

        if($this->request->isPost()){

            $model = new \News();

            $model->name = $this->request->getPost('name', array('string', 'striptags'));
            $model->full_content = $this->request->getPost('full_content');
            $model->preview_content = $this->request->getPost('preview_content');
            $model->date = time();

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'news',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Новина додана');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'news',
                'action' => 'index'
            ));
        }

    }

    public function deleteAction($id){

        $model = \News::findFirstById($id);

        if (!$model) {
            $this->flash->error('Новина не знайдена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'news',
                'action' => 'index'
            ));
        }

        if (!$model->delete()) {
            foreach ($model->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'news',
                'action' => 'index'
            ));
        }

        $this->flash->success('Новина видалена');
        return $this->dispatcher->forward(array(
            'namespace' => 'MyApp\Controllers\Admin',
            'controller' => 'news',
            'action' => 'index'
        ));

    }

    public function editAction($id){

        $model = \News::findFirstById($id);

        if (!$model) {
            $this->flash->error('Новина не знайдена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'news',
                'action' => 'index'
            ));
        }

        if($this->request->isPost()){

            $model->name = $this->request->getPost('name', array('string', 'striptags'));
            $model->full_content = $this->request->getPost('full_content');
            $model->preview_content = $this->request->getPost('preview_content');
            $model->date = strtotime($model->date);

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->dispatcher->forward(array(
                    'namespace' => 'MyApp\Controllers\Admin',
                    'controller' => 'news',
                    'action' => 'index'
                ));
            }

            $this->flash->success('Новина змінена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers\Admin',
                'controller' => 'news',
                'action' => 'index'
            ));

        }

        $this->view->setVar("model", $model);

    }

}