<?php
class Helper extends Phalcon\Mvc\User\Component {

    public function cutName($name){
        return substr($name, 0, 2);
    }

    public function getTimetableWeek(){
        $model =  \Settings::findFirst();
        $date = strtotime($model->week_mark);

        return ((time() - $date) / 604800) % 4 + 1;
    }

}