<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag;

class NewsController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Новини');
        parent::initialize();
    }

    public function indexAction(){
        $numberPage = $this->request->getQuery('page', 'int', 1);

        $model = \News::find(['order' => 'id DESC']);

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

            $model = new \News();

            $model->name = $this->request->getPost('name', array('string', 'striptags', 'trim'));
            $model->full_content = $this->request->getPost('full_content');
            $model->preview_content = $this->request->getPost('preview_content');
            $model->date = time();

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->redirect('news', 'add');
            }

            $this->flash->success('Новина додана');
            return $this->redirect('news');
        }

    }

    public function deleteAction($id){

        $model = \News::findFirstById($id);

        if (!$model) {
            $this->flash->error('Новина не знайдена');
            return $this->redirect('news');
        }

        if (!$model->delete()) {
            foreach ($model->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->redirect('news');
        }

        $this->flash->success('Новина видалена');
        return $this->redirect('news');

    }

    public function editAction($id){

        $model = \News::findFirstById($id);

        if (!$model) {
            $this->flash->error('Новина не знайдена');
            return $this->redirect('news');
        }

        if($this->request->isPost()){

            $model->name = $this->request->getPost('name', array('string', 'striptags', 'trim'));
            $model->full_content = $this->request->getPost('full_content');
            $model->preview_content = $this->request->getPost('preview_content');
            $model->date = strtotime($model->date);

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->redirect('news', 'edit/'.$id);
            }

            $this->flash->success('Новина змінена');
            return $this->redirect('news');

        }

        $this->view->setVar('model', $model);

    }

}