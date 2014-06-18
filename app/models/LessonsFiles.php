<?php
class LessonsFiles extends \Phalcon\Mvc\Model
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
    public $file_id;
     
    /**
     *
     * @var integer
     */
    public $lesson_id;
     
    /**
     * @return LessonsFiles[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return LessonsFiles
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
            'file_id' => 'file_id', 
            'lesson_id' => 'lesson_id'
        );
    }

    public function initialize()
    {
        $this->belongsTo("file_id", "Files", "id");
        $this->belongsTo("lesson_id", "Lessons", "id");
    }

    public function validation(){

        if(empty($this->file_id) || !Files::findFirstById($this->file_id)){
            $this->appendMessage(new Message('Помилка валідації'));

            return false;
        }

        return $this->validationHasFailed() != true;
    }

}
