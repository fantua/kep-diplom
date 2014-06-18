{{ flash.output() }}

<form method="get">
    <div class="input-group" style="width: 155px; float: right">
        <span class="input-group-addon">Тип тижня</span>
        {{ elements.getWeekTypes() }}
    </div>
</form>
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
        <li><a href="/teachers/index?id={{ model.id }}">Інформація</a></li>
        <li><a href="/teachers/lessons?id={{ model.id }}">Предмети</a></li>
        <li class="active"><a href="/teachers/timetable?id={{ model.id }}">Розклад</a></li>
    </ul>
    <br>
    {% for i in lessons %}
    {% if loop.first %}
    <table class="table table-bordered" id="timetable" style="text-align: center;">
        <thead>
        <tr>
            <th style="text-align: center;">Понеділок</th>
            <th style="text-align: center;">Вівторок</th>
            <th style="text-align: center;">Середа</th>
            <th style="text-align: center;">Четвер</th>
            <th style="text-align: center;">П'ятниця</th>
        </tr>
        </thead>
        <tbody>
    {% endif %}
        <tr>
            {% for day in ['1': 'monday', '2': 'tuesday', '3': 'wednesday', '4': 'thursday', '5': "friday"] %}
                {% if data[day][i] is defined %}
                    <td style="border-bottom: none; border-top: none;">
                        <ul class="list-group" style="margin: 0px;">
                            <li class="list-group-item" style="text-align: left">
                                <table>
                                    <tr>
                                        <td style="vertical-align: top;"><?=$data[$day][$i]->lessonNumbers->name?>.&nbsp;</td>
                                        <td><?=$data[$day][$i]->lessons->name?> <br>
                                            <? foreach($data[$day][$i]->timetableTeachers as $timetableTeacher){ ?>
                                            <a href="/teachers/index?id={{ timetableTeacher.teachers.id }}"><span style="padding-left: 5px;">{{ timetableTeacher.teachers.lastname }} {{ helper.cutName(timetableTeacher.teachers.firstname) }}. {{ helper.cutName(timetableTeacher.teachers.middlename) }}.</span></a> <br>
                                            <? } ?>
                                        </td>
                                    </tr>
                                </table>
                                <div>
                                    <p style="float: left; text-align: center; margin: 0px;font-size: 12px; width: 80%;"><?=$data[$day][$i]->groups->name?></p>
                                    <p style="text-align: right; margin: 0px;font-size: 12px;"><?=$data[$day][$i]->classrooms->name?></p>
                                </div>
                            </li>
                        </ul>
                    </td>
                {% else %}
                    <td style="border-bottom: none; border-top: none; height: 115px;"></td>
                {% endif %}
            {% endfor %}
        </tr>
    <!--{ % if loop.last %}
        </tbody>
    </table>
    { % endif %}-->
    {% else %}
        Даних немає
    {% endfor %}
        </tbody>
    </table>
</div>