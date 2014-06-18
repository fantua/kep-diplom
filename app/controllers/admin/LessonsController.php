<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag;

class LessonsController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Предмети');
        parent::initialize();
    }

    public function indexAction(){
        $numberPage = $this->request->getQuery('page', 'int', 1);

        $model = \Lessons::find(['order' => 'name']);

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

            $this->db->begin();

            $model = new \Lessons();

            $model->name = $this->request->getPost('name', array('string', 'striptags', 'trim'));
            $model->info = $this->request->getPost('info');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                $this->db->rollback();
                return $this->redirect('lessons', 'add');
            }

            $files = $this->request->getPost('files');

            if(empty($files) || !is_array($files)){
                $this->flash->error('Помилка валілдації');
                $this->db->rollback();
                return $this->redirect('lessons', 'add');
            }

            $files = array_unique($files);

            foreach($files as $val){
                $lessonsFiles = new \LessonsFiles();
                $lessonsFiles->lesson_id = $model->id;
                $lessonsFiles->file_id = (int)$val;

                if (!$lessonsFiles->save()) {
                    foreach ($lessonsFiles->getMessages() as $message) {
                        $this->flash->error((string) $message);
                    }
                    $this->db->rollback();
                    return $this->redirect('lessons', 'add');
                }

            }

            $this->db->commit();

            $this->flash->success('Предмет доданий');
            return $this->redirect('lessons');
        }

        $files = \Files::find();

        $this->view->setVar('files', $files);
    }

    public function deleteAction($id){

        $model = \Lessons::findFirstById($id);

        if (!$model) {
            $this->flash->error('Предмет не знайдений');
            return $this->redirect('lessons');
        }

        if (!$model->delete()) {
            foreach ($model->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->redirect('lessons');
        }

        $this->flash->success('Предмет видалений');
        return $this->redirect('lessons');

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
            $this->db->begin();

            $model->name = $this->request->getPost('name', array('string', 'striptags', 'trim'));
            $model->info = $this->request->getPost('info');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                $this->db->rollback();
                return $this->redirect('lessons', 'edit/'.$id);
            }

            $files = $this->request->getPost('files');

            if(empty($files) || !is_array($files)){
                $this->flash->error('Помилка валілдації');
                $this->db->rollback();
                return $this->redirect('lessons', 'add');
            }

            $files = array_unique($files);

            $lessonsFiles = \LessonsFiles::find(array('lesson_id = '.$id));

            if (!$lessonsFiles->delete()) {
                foreach ($lessonsFiles->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                $this->db->rollback();
                return $this->redirect('lessons', 'edit/'.$id);
            }

            foreach($files as $val){
                $lessonsFiles = new \LessonsFiles();
                $lessonsFiles->lesson_id = $model->id;
                $lessonsFiles->file_id = (int)$val;

                if (!$lessonsFiles->save()) {
                    foreach ($lessonsFiles->getMessages() as $message) {
                        $this->flash->error((string) $message);
                    }
                    $this->db->rollback();
                    return $this->redirect('lessons', 'add');
                }

            }

            $this->db->commit();

            $this->flash->success('Предмет змінений');
            return $this->redirect('lessons');

        }

        $files = \Files::find();

        $this->view->setVar('files', $files);
        $this->view->setVar('model', $model);
    }

}