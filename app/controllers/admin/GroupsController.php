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
        $numberPage = $this->request->getQuery('page', 'int', 1);

        $model = \Groups::find(['order' => 'name']);

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

            $model = new \Groups();

            $model->name = $this->request->getPost('name', array('string', 'striptags', 'trim'));
            $model->curator = $this->request->getPost('curator', 'int');
            $model->info = $this->request->getPost('info');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->redirect('groups', 'add');
            }

            $this->flash->success('Група додана');
            return $this->redirect('groups');
        }

        $model = $this->modelsManager->createBuilder()
            ->from('Teachers')
            ->leftJoin('Groups')
            ->where('Groups.curator IS NULL')
            ->orderBy('Teachers.lastname, Teachers.firstname')
            ->getQuery()
            ->execute();

        $this->view->setVar('model', $model);

    }

    public function deleteAction($id){

        $model = \Groups::findFirstById($id);

        if (!$model) {
            $this->flash->error('Група не знайдена');
            return $this->redirect('groups');
        }

        if (!$model->delete()) {
            foreach ($model->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->redirect('groups');
        }

        $this->flash->success('Група видалена');
        return $this->redirect('groups');

    }

    public function editAction($id){
        $model = \Groups::findFirstById($id);

        if (!$model) {
            $this->flash->error('Група не знайдена');
            return $this->redirect('groups');
        }

        if($this->request->isPost()){

            $model->name = $this->request->getPost('name', array('string', 'striptags', 'trim'));
            $model->curator = $this->request->getPost('curator', 'int');
            $model->info = $this->request->getPost('info');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->redirect('groups', 'edit/'.$id);
            }

            $this->flash->success('Група змінена');
            return $this->redirect('groups');

        }

        $teachers = $this->modelsManager->createBuilder()
            ->from('Teachers')
            ->leftJoin('Groups')
            ->where('Groups.id = ?1 OR Groups.curator IS NULL', array(
                1 => $id
            ))
            ->orderBy('Teachers.lastname, Teachers.firstname')
            ->getQuery()
            ->execute();

        $this->view->setVar('teachers', $teachers);
        $this->view->setVar('model', $model);
    }

}