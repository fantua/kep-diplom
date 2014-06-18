<?php

namespace MyApp\Controllers\Admin;

use Phalcon\Mvc\Controller,
    Phalcon\Tag,
    Phalcon\Mvc\Dispatcher;

class ControllerBase extends Controller{

    public function beforeExecuteRoute(Dispatcher $dispatcher){
        $controller = $dispatcher->getControllerName();
        $action = $dispatcher->getActionName();
        $auth = $this->session->get('auth');

        if($auth){
            if($controller == 'session' && $action == 'index')
                return $this->response->redirect('admin/index');
        }else{
            if($controller != 'session')
                return $this->response->redirect('admin/session');
        }
    }

    protected function initialize(){
        Tag::prependTitle('СІ КЕП - Адміністрування - ');
    }

	public function afterExecuteRoute(){
        $viewsDir = $this->view->getViewsDir();

        if(strpos($viewsDir, 'admin/'))
            $viewsDir = str_replace('admin/', '', $viewsDir);

		$this->view->setViewsDir($viewsDir . 'admin/');
	}

    protected function forward($controller, $action = 'index', $namespace = 'MyApp\Controllers\Admin'){
        return $this->dispatcher->forward(array(
            'namespace' => $namespace,
            'controller' => $controller,
            'action' => $action
        ));
    }

    protected function redirect($controller, $action = 'index', $admin = true){
        $base = ($admin) ? 'admin/' : '';

        return $this->response->redirect(
            $base.
            $controller.'/'.
            $action
        );
    }

}
