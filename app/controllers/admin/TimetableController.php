<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag,
    Phalcon\Paginator\Adapter\Model;

class TimetableController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Розклад');
        parent::initialize();
    }

    public function indexAction(){
        $day = $this->request->get('day', 'int');
        $group = $this->request->get('group', 'int');

        if(empty($day))
            $day = \Days::findFirst()->id;

        if(empty($group))
            $group = \Groups::findFirst()->id;

        $model = \Timetables::find(array(
            'day_id = ?1 AND group_id = ?2',
            'bind' => array(
                1 => $day,
                2 => $group
            ),
            'order' => 'lesson_number_id'
        ));

        /*foreach($model as $val){
            echo $val->id;
            echo '<br>';
        }

        die();*/

        $this->elements->timetable = ['day' => $day, 'group' => $group];
        $this->view->setVar("models", $model);
    }

    public function addAction(){

        if($this->request->isPost()){

            $this->db->begin();


            $model = new \Timetables();

            $model->group_id = $this->request->getPost('group', 'int');
            $model->day_id = $this->request->getPost('day', 'int');
            $model->lesson_number_id = $this->request->getPost('lessonNumber', 'int');
            $model->lesson_id = $this->request->getPost('lesson', 'int');
            $model->week_type_id = $this->request->getPost('weekType', 'int');
            $model->classroom_id = $this->request->getPost('classroom', 'int');

            if (!$model->save()) {
                foreach ($model->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                $this->db->rollback();
                return $this->redirect('timetable', 'add');
            }


            $teachers = $this->request->getPost('teachers');

            if(empty($teachers) || !is_array($teachers)){
                $this->flash->error('Помилка валілдації');
                $this->db->rollback();
                return $this->redirect('timetable', 'add');
            }

            $teachers = array_unique($teachers);

            foreach($teachers as $val){
                $timetableTeachers = new \TimetableTeachers();
                $timetableTeachers->timetable_id = $model->id;
                $timetableTeachers->teacher_id = (int)$val;

                if (!$timetableTeachers->save()) {
                    foreach ($timetableTeachers->getMessages() as $message) {
                        $this->flash->error((string) $message);
                    }
                    $this->db->rollback();
                    return $this->redirect('timetable', 'add');
                }

            }


            $this->db->commit();


            $this->flash->success('Запис доданий');
            return $this->redirect('timetable');
        }

        $model = array();

        $model['groups']    = \Groups::find();
        $model['days']      = \Days::find();
        $model['numbers']   = \LessonNumbers::find();
        $model['lessons']   = \Lessons::find();
        $model['teachers']  = \Teachers::find();
        $model['types']     = \WeekTypes::find();
        $model['rooms']     = \Classrooms::find();

        $this->view->setVar("model", $model);

    }

    public function editAction($id){

    }

    public function test($a){
        return 'test';
    }

}