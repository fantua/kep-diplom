<?php
class LessonNumbers extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;
     
    /**
     *
     * @var string
     */
    public $name;
     
    /**
     *
     * @var string
     */
    public $start_time;
     
    /**
     *
     * @var string
     */
    public $end_time;
     
    /**
     * @return LessonNumbers[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return LessonNumbers
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
            'name' => 'name', 
            'start_time' => 'start_time', 
            'end_time' => 'end_time'
        );
    }

    public function initialize()
    {
        $this->hasMany("id", "Timetables", "lesson_number_id");
    }


}
