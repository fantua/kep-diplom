<?php
use \Phalcon\Validation\Message;

class TimetableTeachers extends \Phalcon\Mvc\Model
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
    public $timetable_id;
     
    /**
     *
     * @var integer
     */
    public $teacher_id;
     
    /**
     * @return TimetableTeachers[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return TimetableTeachers
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
            'timetable_id' => 'timetable_id', 
            'teacher_id' => 'teacher_id'
        );
    }

    public function initialize()
    {
        $this->belongsTo("timetable_id", "Timetables", "id");
        $this->belongsTo("teacher_id", "Teachers", "id");
    }

    public function validation(){

        if(empty($this->teacher_id) || !Teachers::findFirst($this->teacher_id)){
            $this->appendMessage(new Message('Помилка валідації'));

            return false;
        }

        return $this->validationHasFailed() != true;
    }

}
