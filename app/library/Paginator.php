<?php
class Paginator extends Phalcon\Paginator\Adapter\Model{

    public function getPaginate(){
        $page = parent::getPaginate();

        if($page->last > $page->next)
            $page->next = $page->last;

        return $page;
    }

}