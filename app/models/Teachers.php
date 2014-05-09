<?php

class Teachers extends \Phalcon\Mvc\Model
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
    public $firstname;
     
    /**
     *
     * @var string
     */
    public $middlename;
     
    /**
     *
     * @var string
     */
    public $lastname;
     
    /**
     *
     * @var string
     */
    public $info;
     
    /**
     * @return Teachers[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return Teachers
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
            'firstname' => 'firstname', 
            'middlename' => 'middlename', 
            'lastname' => 'lastname', 
            'info' => 'info'
        );
    }

}
