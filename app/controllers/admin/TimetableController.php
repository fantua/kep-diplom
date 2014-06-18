<?php
namespace MyApp\Controllers\Admin;
use Phalcon\Tag as Tag;

class TimetableController extends ControllerBase{

    public function initialize(){
        $this->view->setTemplateAfter('main');
        Tag::setTitle('Розклад');
        parent::initialize();
    }

    public function indexAction(){
        $day = $this->request->get('day', 'int', \Days::findFirst()->id);
        $group = $this->request->get('group', 'int', \Groups::findFirst()->id);

        $model = \Timetables::find(array(
            'day_id = ?1 AND group_id = ?2',
            'bind' => array(
                1 => $day,
                2 => $group
            ),
            'order' => 'lesson_number_id'
        ));

        $this->elements->timetable = ['day' => $day, 'group' => $group];
        $this->view->setVar('models', $model);
    }

    public function addAction(){
        if($this->request->isPost()){

            $this->db->begin();

            $model = new \Timetables();

            $model->group_id = $this->request->getPost('group', 'int');
            $model->day_id = $this->request->getPost('day', 'int');
            $model->lesson_number_id = $this->request->getPost('lessonNumber', 'int');
            $model->lesson_id = $this->request->getPost('lesson', 'int');
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

            $weekTypes = $this->request->getPost('weekTypes');

            if(empty($weekTypes) || !is_array($weekTypes)){
                $this->flash->error('Помилка валілдації');
                $this->db->rollback();
                return $this->redirect('timetable', 'add');
            }

            foreach($weekTypes as $val){
                $timetableWeekTypes = new \TimetableWeekTypes();
                $timetableWeekTypes->timetable_id = $model->id;
                $timetableWeekTypes->week_type_id = (int)$val;

                if (!$timetableWeekTypes->save()) {
                    foreach ($timetableWeekTypes->getMessages() as $message) {
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

        $model['groups']    = \Groups::find(['order' => 'name']);
        $model['days']      = \Days::find();
        $model['numbers']   = \LessonNumbers::find();
        $model['lessons']   = \Lessons::find(['order' => 'name']);
        $model['teachers']  = \Teachers::find(['order' => 'lastname, firstname']);
        $model['types']     = \WeekTypes::find();
        $model['rooms']     = \Classrooms::find(['order' => 'name']);

        $this->view->setVar('model', $model);

    }

    public function editAction($id){

        $timetable = \Timetables::findFirstById($id);

        if (!$timetable) {
            $this->flash->error('Запис не знайдений');
            return $this->redirect('timetable');
        }

        if($this->request->isPost()){

            $this->db->begin();

            $timetable->group_id = $this->request->getPost('group', 'int');
            $timetable->day_id = $this->request->getPost('day', 'int');
            $timetable->lesson_number_id = $this->request->getPost('lessonNumber', 'int');
            $timetable->lesson_id = $this->request->getPost('lesson', 'int');
            $timetable->classroom_id = $this->request->getPost('classroom', 'int');

            if (!$timetable->save()) {
                foreach ($timetable->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                $this->db->rollback();
                return $this->redirect('timetable', 'edit/'.$id);
            }


            $teachers = $this->request->getPost('teachers');

            if(empty($teachers) || !is_array($teachers)){
                $this->flash->error('Помилка валілдації');
                $this->db->rollback();
                return $this->redirect('timetable', 'edit/'.$id);
            }

            $teachers = array_unique($teachers);

            $timetableTeachers = \TimetableTeachers::find(array('timetable_id = '.$id));

            if (!$timetableTeachers->delete()) {
                foreach ($timetableTeachers->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                $this->db->rollback();
                return $this->redirect('timetable', 'edit/'.$id);
            }

            foreach($teachers as $val){
                $timetableTeachers = new \TimetableTeachers();
                $timetableTeachers->timetable_id = $timetable->id;
                $timetableTeachers->teacher_id = (int)$val;

                if (!$timetableTeachers->save()) {
                    foreach ($timetableTeachers->getMessages() as $message) {
                        $this->flash->error((string) $message);
                    }
                    $this->db->rollback();
                    return $this->redirect('timetable', 'edit/'.$id);
                }

            }

            $weekTypes = $this->request->getPost('weekTypes');

            if(empty($weekTypes) || !is_array($weekTypes)){
                $this->flash->error('Помилка валілдації');
                $this->db->rollback();
                return $this->redirect('timetable', 'edit/'.$id);
            }

            $timetableWeekTypes = \TimetableWeekTypes::find(array('timetable_id = '.$id));

            if (!$timetableWeekTypes->delete()) {
                foreach ($timetableWeekTypes->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
                $this->db->rollback();
                return $this->redirect('timetable', 'edit/'.$id);
            }

            foreach($weekTypes as $val){
                $timetableWeekTypes = new \TimetableWeekTypes();
                $timetableWeekTypes->timetable_id = $timetable->id;
                $timetableWeekTypes->week_type_id = (int)$val;

                if (!$timetableWeekTypes->save()) {
                    foreach ($timetableWeekTypes->getMessages() as $message) {
                        $this->flash->error((string) $message);
                    }
                    $this->db->rollback();
                    return $this->redirect('timetable', 'edit/'.$id);
                }

            }


            $this->db->commit();


            $this->flash->success('Запис змінений');
            return $this->redirect('timetable');
        }


        $model = array();

        $model['groups']    = \Groups::find(['order' => 'name']);
        $model['days']      = \Days::find();
        $model['numbers']   = \LessonNumbers::find();
        $model['lessons']   = \Lessons::find(['order' => 'name']);
        $model['teachers']  = \Teachers::find(['order' => 'lastname, firstname']);

        foreach($timetable->timetableWeekTypes as $val){
            $timetableWeekTypes[] = $val->week_type_id;
        }

        $types = \WeekTypes::find();

        foreach($types as $val){
            $model['types'][] = array(
                'id' => $val->id,
                'name' => $val->name,
                'checked' => in_array($val->id, $timetableWeekTypes)
            );
        }

        $model['rooms']     = \Classrooms::find(['order' => 'name']);

        $this->view->setVar('model', $model);
        $this->view->setVar('timetable', $timetable);

    }

    public function deleteAction($id){

        $model = \Timetables::findFirstById($id);

        if (!$model) {
            $this->flash->error('Запис не знайдений');
            return $this->redirect('timetable');
        }

        if (!$model->delete()) {
            foreach ($model->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->redirect('timetable');
        }

        $this->flash->success('Запис видалений');
        return $this->redirect('timetable');

    }

}