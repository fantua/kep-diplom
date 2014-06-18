<?php
namespace MyApp\Controllers;
use Phalcon\Tag as Tag;

class LessonsController extends ControllerBase{

    protected $model;

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Предмети');

        parent::initialize();

        $id = $this->request->get('id', 'int');

        if(empty($id)){
            $this->model = \Lessons::findFirst();
        }else{
            $this->model = \Lessons::findFirstById($id);
        }

        if(!$this->model)
            return $this->redirect('lessons');

        $this->view->setVar('model', $this->model);
        $this->elements->timetable = ['id' => $this->model->id];
    }

    public function indexAction(){
    }

    public function teachersAction(){
        $data = $this->modelsManager->createBuilder()
            ->distinct(true) //не працює
            ->from('Teachers')
            ->innerJoin('TimetableTeachers')
            ->innerJoin('Timetables', 't.id = TimetableTeachers.timetable_id', 't')
            ->where('t.lesson_id = ?1', array(1 => $this->model->id))
            ->groupBy(array('lastname', 'firstname')) //заміна distinct
            ->orderBy(array('lastname', 'firstname'))
            ->getQuery()
            ->execute();

        $this->view->setVar('data', $data);
    }

    public function filesAction(){
        $data = $this->modelsManager->createBuilder()
            ->distinct(true) //не працює
            ->from('Files')
            ->innerJoin('LessonsFiles')
            ->where('LessonsFiles.lesson_id = ?1', array(1 => $this->model->id))
            ->getQuery()
            ->execute();

        $this->view->setVar('data', $data);
    }
}