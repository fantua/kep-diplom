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
        <li><a href="/lessons/index?id={{ model.id }}">Інформація</a></li>
        <li class="active"><a href="/lessons/teachers?id={{ model.id }}">Викладачі</a></li>
        <li><a href="/lessons/files?id={{ model.id }}">Файли</a></li>
    </ul>
    <br>

    {% for teacher in data %}
    {% if loop.first %}
    <table class="table table-striped table-hover" style="text-align: center;">
        <tbody>
    {% endif %}
        <tr >
            <td><a href="/teachers/index?id={{ teacher.id }}">{{ teacher.lastname }} {{ teacher.firstname }} {{ teacher.middlename }}</a></td>
        </tr>
    {% if loop.last %}
        </tbody>
    </table>
    {% endif %}
    {% else %}
        Даних немає
    {% endfor %}
</div>
