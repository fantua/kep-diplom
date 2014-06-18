<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag;

class SettingsController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Налаштування');
        parent::initialize();
    }

    public function indexAction(){
        if($this->request->isPost()){
            $model = \Settings::findFirst();
            $model->week_mark = $this->request->getPost('weekMark', array('string', 'striptags', 'trim'));

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->redirect('settings');
            }

            $this->flash->success('Змінено');
            return $this->redirect('settings');
        }

        $model = \Settings::findFirst();
        $this->view->setVar('model', $model);
    }

    public function adminAction(){
        if($this->request->isPost()){
            $password = $this->request->getPost('password', array('string', 'trim'));

            if($password != $this->request->getPost('repassword', array('string', 'trim'))){
                $this->flash->error('Паролі не збігаються');
                return $this->redirect('settings', 'admin');
            }

            $model = \Admins::findFirstById($this->session->get('auth')['id']);
            $model->password = sha1($password);

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                return $this->redirect('settings', 'admin');
            }

            $this->flash->success('Змінено');
            return $this->redirect('settings', 'admin');
        }

        $model = \Settings::findFirst();
        $this->view->setVar('model', $model);
    }

}

