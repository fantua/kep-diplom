{{ flash.output() }}

<p style="float: right"><a href="/admin/timetable/add" class="btn btn-primary btn-sm" role="button">Створити запис</a></p>

<center>
    <table class="table" style="width: 475px;">
        <tr>
            <td style="border: none; text-align: right;">
                <form method="get">
                    <div class="input-group" style="width: 435px;">
                        <span class="input-group-addon">Група</span>
                        {{ elements.getGroupsOptions() }}
                    </div>
                </form>
            </td>
        </tr>
        <tr>
            <td style="border: none;">
                {{ elements.getDaysPills() }}
            </td>
        </tr>
    </table>
</center>

{% for model in models %}
{% if loop.first %}

<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th>Номер</th>
        <th>Група</th>
        <th>Предмет</th>
        <th>Викладач</th>
        <th>Тиждень</th>
        <th>Аудиторія</th>
        <th colspan="2">Змінити</th>
    </tr>
    </thead>
    <tbody>
    {% endif %}

    <tr>
        <td style="vertical-align: middle;">{{ model.lessonNumbers.name }}.</td>
        <td style="vertical-align: middle;">{{ model.groups.name }}</td>
        <td style="vertical-align: middle;">{{ model.lessons.name }}</td>
        <td style="vertical-align: middle;">
            {% for teacher in model.timetableTeachers %}
            {{ teacher.teachers.lastname }} {{ teacher.teachers.firstname }} {{ teacher.teachers.middlename }}{% if !loop.last %}<br>{% endif %}
            {% else %}
            Даних немає
            {% endfor %}
        </td>
        <td style="vertical-align: middle;">{{ model.weekTypes.name }}</td>
        <td style="vertical-align: middle;">{{ model.classrooms.name }}</td>
        <td style="vertical-align: middle;"><a class="btn btn-toolbar" href="/admin/timetable/edit/{{ model.id }}"><i class="glyphicon glyphicon-pencil"></i> Редагувати</a></td>
        <td style="vertical-align: middle;"><a class="btn btn-toolbar" href="/admin/timetable/delete/{{ model.id }}" style="color: #d9534f"><i class="glyphicon glyphicon-remove"></i> Видалити</a></td>
    </tr>

    {% if loop.last %}
    </tbody>
</table>

{% endif %}
{% else %}
Даних немає
{% endfor %}