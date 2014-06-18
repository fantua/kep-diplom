<?php
use \Phalcon\Validation\Message;

class Timetables extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;
     
    /**
     *
     * @var integer
     */
    public $group_id;
     
    /**
     *
     * @var integer
     */
    public $day_id;
     
    /**
     *
     * @var integer
     */
    public $lesson_number_id;
     
    /**
     *
     * @var integer
     */
    public $lesson_id;
     
    /**
     *
     * @var integer
     */
    public $classroom_id;
     
    /**
     * @return Timetables[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return Timetables
     */
    public static function findFirst($parameters = array())
    {
        return parent::findFirst($parameters);
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id', 
            'group_id' => 'group_id', 
            'day_id' => 'day_id', 
            'lesson_number_id' => 'lesson_number_id', 
            'lesson_id' => 'lesson_id',
            'classroom_id' => 'classroom_id'
        );
    }

    public function initialize()
    {
        $this->belongsTo("group_id", "Groups", "id");
        $this->belongsTo("day_id", "Days", "id");
        $this->belongsTo("lesson_number_id", "LessonNumbers", "id");
        $this->belongsTo("lesson_id", "Lessons", "id");
        $this->belongsTo("classroom_id", "Classrooms", "id");
        $this->hasMany("id", "TimetableTeachers", "timetable_id");
        $this->hasMany("id", "TimetableWeekTypes", "timetable_id");
    }

    public function validation(){

        if(empty($this->group_id) || !Groups::findFirstById($this->group_id)){
            $this->appendMessage(new Message('Помилка валідації'));

            return false;
        }

        if(empty($this->day_id) || !Days::findFirstById($this->day_id)){
            $this->appendMessage(new Message('Помилка валідації'));

            return false;
        }


        if(empty($this->lesson_number_id) || !LessonNumbers::findFirstById($this->lesson_number_id)){
            $this->appendMessage(new Message('Помилка валідації'));

            return false;
        }

        if(empty($this->lesson_id) || !Lessons::findFirstById($this->lesson_id)){
            $this->appendMessage(new Message('Помилка валідації'));

            return false;
        }

        if(empty($this->classroom_id) || !Classrooms::findFirstById($this->classroom_id)){
            $this->appendMessage(new Message('Помилка валідації'));

            return false;
        }

        return $this->validationHasFailed() != true;
    }

}
