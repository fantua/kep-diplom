{{ flash.output() }}

<center>
    <form method="get">
        <div class="input-group" style="width: 435px;">
            <span class="input-group-addon">Предмет</span>
            {{ elements.getLessonsOptions() }}
        </div>
    </form>
</center>
<br>
<div>
    <ul class="nav nav-tabs">
        <li class="active"><a href="/lessons/index?id={{ model.id }}">Інформація</a></li>
        <li><a href="/lessons/teachers?id={{ model.id }}">Викладачі</a></li>
        <li><a href="/lessons/files?id={{ model.id }}">Файли</a></li>
    </ul>
    <br>
    {{ model.info }}
</div>