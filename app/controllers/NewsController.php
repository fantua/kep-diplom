<?php
namespace MyApp\Controllers;
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

        $model = \News::find(array('order' => 'id DESC'));

        $paginator = new Model(array(
            "data" => $model,
            "limit" => 5,
            "page" => $numberPage
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar("page", $page);
        $this->view->setVar("model", $model);

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

        $this->view->setVar("model", $model);
    }
}