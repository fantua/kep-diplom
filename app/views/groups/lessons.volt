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
        <li><a href="/groups/index?id={{ model.id }}">Інформація</a></li>
        <li class="active"><a href="/groups/lessons?id={{ model.id }}">Предмети</a></li>
        <li><a href="/groups/timetable?id={{ model.id }}">Розклад</a></li>
    </ul>
    <br>

    {% for lesson in data %}
    {% if loop.first %}
    <table class="table table-striped table-hover" style="text-align: center;">
        <tbody>
    {% endif %}
        <tr >
            <td><a href="/lessons/index?id={{ lesson.id }}">{{ lesson.name }}</a></td>
        </tr>
    {% if loop.last %}
        </tbody>
    </table>
    {% endif %}
    {% else %}
        Даних немає
    {% endfor %}
</div>
