<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag;

class FilesController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Файли');
        parent::initialize();
    }

    public function indexAction(){
        $numberPage = $this->request->getQuery('page', 'int', 1);

        $model = \Files::find();

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

        if($this->request->isPost() && $this->request->hasFiles()){

            $file = $this->request->getUploadedFiles()[0];
            if($file->getRealType() != 'application/pdf'){
                $this->flash->error('Файл повинен бути в фортматі pdf');
                return $this->redirect('files', 'add');
            }

            $model = new \Files();
            $model->name = $this->request->getPost('name', array('string', 'striptags', 'trim'));

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->redirect('files', 'add');
            }

            $file->moveTo(__DIR__.'/../../../public/uploads/'.$model->id.'.pdf');

            $this->flash->success('Файл завантажено');
            return $this->redirect('files');
        }

    }

    public function deleteAction($id){

        $model = \Files::findFirstById($id);

        if (!$model) {
            $this->flash->error('Файл не знайдений');
            return $this->redirect('files');
        }

        if (!$model->delete()) {
            foreach ($model->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->redirect('files');
        }

        unlink(__DIR__.'/../../../public/uploads/'.$model->id.'.pdf');

        $this->flash->success('Файл видалений');
        return $this->redirect('files');

    }

}