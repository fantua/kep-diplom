<?php
namespace MyApp\Controllers;
use Phalcon\Tag as Tag;

class TeachersController extends ControllerBase{

    protected $model;

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Викладачі');

        parent::initialize();

        $id = $this->request->get('id', 'int');

        if(empty($id)){
            $this->model = \Teachers::findFirst();
        }else{
            $this->model = \Teachers::findFirstById($id);
        }

        if(!$this->model)
            return $this->redirect('teachers');

        $this->view->setVar('model', $this->model);
        $this->elements->timetable = ['id' => $this->model->id];
    }

    public function indexAction(){
    }

    public function lessonsAction(){
        $data = $this->modelsManager->createBuilder()
            ->distinct(true) //не працює
            ->from('Lessons')
            ->innerJoin('Timetables')
            ->innerJoin('TimetableTeachers', 't.timetable_id = Timetables.id', 't')
            ->where('t.teacher_id = ?1', array(1 => $this->model->id))
            ->groupBy('name') //заміна distinct
            ->orderBy('name')
            ->getQuery()
            ->execute();

        $this->view->setVar('data', $data);
    }

    public function timetableAction(){
        $weekType = $this->request->get('type', 'int');

        if(empty($weekType)){
            $model = \WeekTypes::findFirstById($this->helper->getTimetableWeek());
        }else{
            $model = \WeekTypes::findFirstById($weekType);
        }

        if(!$model)
            return $this->redirect('groups');

        $timetables = $this->modelsManager->createBuilder()
            ->from('Timetables')
            ->innerJoin('TimetableWeekTypes')
            ->innerJoin('TimetableTeachers')
            ->where('TimetableTeachers.teacher_id = ?1 AND TimetableWeekTypes.week_type_id = ?2', array(
                1 => $this->model->id,
                2 => $model->id
            ))
            ->orderBy('lesson_number_id')
            ->getQuery()
            ->execute();

        $data = array();

        foreach($timetables as $val){
            switch($val->days->name){
                case 'Понеділок':
                    $data['monday'][$val->lessonNumbers->name] = $val;
                    break;
                case 'Вівторок':
                    $data['tuesday'][$val->lessonNumbers->name] = $val;
                    break;
                case 'Середа':
                    $data['wednesday'][$val->lessonNumbers->name] = $val;
                    break;
                case 'Четвер':
                    $data['thursday'][$val->lessonNumbers->name] = $val;
                    break;
                case "П'ятниця":
                    $data['friday'][$val->lessonNumbers->name] = $val;
                    break;
            }
        }

        $lessonNumbers = \LessonNumbers::maximum(array('column' => 'name'));
        $lessons = array();

        for($i = 1; $i <= $lessonNumbers; $i++)
            $lessons[] = $i;

        $this->view->setVar('lessons', $lessons);
        $this->view->setVar('data', $data);
        $this->elements->timetable['weekType'] = $model->id;
    }
}