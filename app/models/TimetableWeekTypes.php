<?php
use \Phalcon\Validation\Message;

class TimetableWeekTypes extends \Phalcon\Mvc\Model
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
    public $week_type_id;
     
    /**
     * @return TimetableWeekTypes[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return TimetableWeekTypes
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
            'week_type_id' => 'week_type_id'
        );
    }

    public function initialize()
    {
        $this->belongsTo("timetable_id", "Timetables", "id");
        $this->belongsTo("week_type_id", "WeekTypes", "id");
    }

    public function validation(){

        if(empty($this->week_type_id) || !WeekTypes::findFirstById($this->week_type_id)){
            $this->appendMessage(new Message('Помилка валідації'));

            return false;
        }

        return $this->validationHasFailed() != true;
    }

}
