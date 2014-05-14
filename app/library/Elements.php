<?php
class Elements extends Phalcon\Mvc\User\Component{

    public $timetable = array();

    private $_adminHeaderMenu = array(
        'pull-left' => array(
            'news' => array(
                'caption' => 'Новини',
                'action' => 'index'
            ),
            'pages' => array(
                'caption' => 'Статичні сторінки',
                'action' => 'index'
            ),
            'teachers' => array(
                'caption' => 'Викладачі',
                'action' => 'index'
            ),
            'lessons' => array(
                'caption' => 'Предмети',
                'action' => 'index'
            ),
            'classrooms' => array(
                'caption' => 'Аудиторії',
                'action' => 'index'
            ),
            'groups' => array(
                'caption' => 'Групи',
                'action' => 'index'
            ),
            'timetable' => array(
                'caption' => 'Розклад',
                'action' => 'index'
            )
        ),
        'pull-right' => array(
            'session' => array(
                'caption' => 'Вихід',
                'action' => 'exit'
            )
        )
    );

    private $_headerMenu = array(
        'pull-right' => array(
            'index' => array(
                'caption' => 'Головна',
                'action' => 'index'
            ),
            'news' => array(
                'caption' => 'Новини',
                'action' => 'index'
            ),
            'contacts' => array(
                'caption' => 'Контакти',
                'action' => 'index'
            )
        )
    );

    public function getAdminMenu(){
        $controller = $this->view->getControllerName();

        echo '<ul class="nav navbar-nav">';

        foreach ($this->_adminHeaderMenu['pull-left'] as $key => $val){
            if($key == $controller)
                echo '<li class="active">';
            else
                echo '<li>';
            echo "<a href=\"/admin/{$key}/{$val['action']}\">{$val['caption']}</a>";
            echo '</li>';
        }

        echo '</ul>';

        echo '<ul class="nav navbar-nav navbar-right">';

        foreach ($this->_adminHeaderMenu['pull-right'] as $key => $val){
            if($key == $controller)
                echo '<li class="active">';
            else
                echo '<li>';
            echo "<a href=\"/admin/{$key}/{$val['action']}\">{$val['caption']}</a>";
            echo '</li>';
        }

        echo '</ul>';
    }

    public function getMenu(){
        $controller = $this->view->getControllerName();

        echo '<ul id="top_menu" class="nav nav-pills pull-right">';

        foreach ($this->_headerMenu['pull-right'] as $key => $val){
            if($key == $controller)
                echo '<li class="active">';
            else
                echo '<li>';
            echo "<a href=\"/{$key}/{$val['action']}\">{$val['caption']}</a>";
            echo '</li>';
        }

        echo '</ul>';

    }

    public function getDaysPills(){
        $model = \Days::find();

        echo '<ul class="nav nav-pills">';

        foreach($model as $val){
            echo '<li '.(($val->id == $this->timetable['day']) ? 'class="active"' : '').'><a href="?day='.$val->id.'&group='.$this->timetable['group'].'">'.$val->name.'</a></li>';
        }

        echo '</ul>';
    }

    public function getGroupsOptions(){
        $model = \Groups::find();

        echo '<select class="form-control" name="group" onchange="submit();">';

        foreach($model as $val){
            echo '<option '.(($val->id == $this->timetable['group']) ? 'selected' : '').' value="'.$val->id.'">'.$val->name.'</option>';
        }

        echo '</select>';
        echo '<input type="hidden" name="day" value="'.$this->timetable['day'].'">';
    }

}