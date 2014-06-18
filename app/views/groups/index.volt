{{ flash.output() }}

<center>
    <form method="get">
        <div class="input-group" style="width: 435px;">
            <span class="input-group-addon">Група</span>
            {{ elements.getGroupsOptions() }}
        </div>
    </form>
</center>
<br>
<div>
    <ul class="nav nav-tabs">
        <li class="active"><a href="/groups/index?id={{ model.id }}">Інформація</a></li>
        <li><a href="/groups/lessons?id={{ model.id }}">Предмети</a></li>
        <li><a href="/groups/timetable?id={{ model.id }}">Розклад</a></li>
    </ul>
    <br>

    <div class="alert alert-info">
         Куратор: <a href="/teachers/index?id={{ model.teachers.id }}" class="alert-link">{{ model.teachers.lastname }} {{ model.teachers.firstname }} {{ model.teachers.middlename }}</a>
    </div>

    <br>

    {{ model.info }}
</div>