{{ flash.output() }}

<center>
    <form method="get">
        <div class="input-group" style="width: 435px;">
            <span class="input-group-addon">Викладач</span>
            {{ elements.getTeachersOptions() }}
        </div>
    </form>
</center>
<br>
<div>
    <ul class="nav nav-tabs">
        <li class="active"><a href="/teachers/index?id={{ model.id }}">Інформація</a></li>
        <li><a href="/teachers/lessons?id={{ model.id }}">Предмети</a></li>
        <li><a href="/teachers/timetable?id={{ model.id }}">Розклад</a></li>
    </ul>
    <br>
    {{ model.info }}
</div>