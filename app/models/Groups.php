<?php
use \Phalcon\Validation\Message;

class Groups extends \Phalcon\Mvc\Model
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
     * @var integer
     */
    public $curator;
     
    /**
     *
     * @var string
     */
    public $info;
     
    /**
     * @return Groups[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return Groups
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
            'curator' => 'curator', 
            'info' => 'info'
        );
    }

    public function initialize()
    {
        $this->hasOne("curator", "Teachers", "id");
        $this->hasMany("id", "Timetables", "group_id");
    }

    public function validation(){

        if(empty($this->curator) || !Teachers::findFirstById($this->curator) || Groups::findFirst(array('conditions' => 'curator = ?1 AND id != ?2', 'bind' => array(1 => $this->curator, 2 => $this->id)))){
            $this->appendMessage(new Message('Помилка валідації'));

            return false;
        }

        return $this->validationHasFailed() != true;
    }

}
