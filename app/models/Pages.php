<?php
use \Phalcon\Validation\Message;

class Pages extends \Phalcon\Mvc\Model
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
    public $link;
     
    /**
     *
     * @var string
     */
    public $data;
     
    /**
     * @return Pages[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return Pages
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
            'link' => 'link', 
            'data' => 'data'
        );
    }

    public function validation(){

        if(empty($this->link) || Pages::findFirst(array('conditions' => 'link = ?1 AND id != ?2', 'bind' => array(1 => $this->link, 2 => $this->id)))){
            $this->appendMessage(new Message('Таке посилання вже існує'));

            return false;
        }

        return $this->validationHasFailed() != true;
    }

}
