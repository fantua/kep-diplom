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

}

