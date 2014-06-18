<?php
namespace MyApp\Controllers;
use Phalcon\Tag as Tag;

class IndexController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Головна');
        parent::initialize();
    }

    public function indexAction(){

        $news = \News::find(array('order' => 'id DESC'));

        $paginator = new \Paginator(array(
            'data' => $news,
            'limit' => 5,
            'page' => 1
        ));
        $page = $paginator->getPaginate();

        $this->view->setVar('page', $page);
        $this->view->setVar('news', $news);

    }
}