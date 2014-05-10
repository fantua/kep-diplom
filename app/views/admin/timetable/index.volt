{{ content() }}

<p style="float: right"><a href="/admin/timetable/add" class="btn btn-primary btn-sm" role="button">Створити запис</a></p>

{ % for model in page.items %}
{ % if loop.first %}
<center><table class="table" style="width: 475px;">
<tr>
    <td style="border: none; text-align: right;">
        <div class="input-group" style="width: 435px;">
            <span class="input-group-addon">Група</span>
            <select class="form-control" id="" name="">
                <option selected value="0">Група</option>
            </select>
        </div>
    </td>

</tr>
    <tr>
        <td style="border: none;">
            <ul class="nav nav-pills">
                <li class="active"><a href="#">Понеділок</a></li>
                <li><a href="#">Вівторок</a></li>
                <li><a href="#">Середа</a></li>
                <li><a href="#">Четвер</a></li>
                <li><a href="#">П'ятниця</a></li>
            </ul>
        </td>
    </tr>
</table></center>



<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th>Номер</th>
        <th>Предмет</th>
        <th>Викладач</th>
        <th>Тиждень</th>
        <th>Аудиторія</th>
        <th colspan="2">Змінити</th>
    </tr>
    </thead>
    <tbody>
    { % endif %}

    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td><a class="btn btn-toolbar" href="/admin/timetable/edit/"><i class="glyphicon glyphicon-pencil"></i> Редагувати</a></td>
        <td><a class="btn btn-toolbar" href="/admin/timetable/delete/" style="color: #d9534f"><i class="glyphicon glyphicon-remove"></i> Видалити</a></td>
    </tr>
<!--
    { % if loop.last %}

    <tr>
        <td colspan="6">
            <ul class="pager" style="margin: 0px;">
                <li class="previous">{{ link_to("admin/timetable/index", '&larr; Перша') }}</li>
                <li>{{ link_to("admin/timetable/index?page=" ~ page.before, 'Попередня') }}</li>
                <span> {{ page.current }} / {{ page.total_pages }} </span>
                <li>{{ link_to("admin/timetable/index?page=" ~ page.next, 'Наступна') }}</li>
                <li class="next">{{ link_to("admin/timetable/index?page=" ~ page.last, 'Остання &rarr;') }}</li>
            </ul>
        </td>
    </tr>
-->
    </tbody>
</table>

{ % endif %}
{ % else %}
Даних немає
{ % endfor %}