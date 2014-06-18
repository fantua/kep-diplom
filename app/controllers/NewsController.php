<?php
namespace MyApp\Controllers;
use Phalcon\Tag as Tag;

class NewsController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Новини');
        parent::initialize();
    }

    public function indexAction(){
        $numberPage = $this->request->getQuery('page', 'int', 1);

        $model = \News::find(array('order' => 'id DESC'));

        $paginator = new \Paginator(array(
            'data' => $model,
            'limit' => 10,
            'page' => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar('page', $page);
        $this->view->setVar('model', $model);

    }

    public function viewAction($id){
        $model = \News::findFirstById($id);

        if (!$model) {
            $this->flash->error('Новина не знайдена');
            return $this->dispatcher->forward(array(
                'namespace' => 'MyApp\Controllers',
                'controller' => 'news',
                'action' => 'index'
            ));
        }

        $this->view->setVar('model', $model);
    }
}