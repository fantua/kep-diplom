{{ flash.output() }}

<center>
    <table class="table" style="width: 435px;">
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
                <ul class="nav nav-tabs">
                    <li class="active"><a href="/groups">Інформація</a></li>
                    <li><a href="/groups/timetable">Розклад</a></li>
                    <li><a href="/groups/lessons">Предмети</a></li>
                </ul>
            </td>
        </tr>
    </table>
</center>

{ % for model in page.items %}
{ % if loop.first %}

<table class="table table-hover">
    <thead>
    <tr>
        <th colspan="2" style="border: none;">
            <div class="alert alert-info">
                 Куратор: <a href="#" class="alert-link">ПІБ</a>
            </div>
        </th>
    </tr>
    </thead>
    <!--<tbody>
    </tbody>-->
    { % endif %}

    { % if loop.last %}

    <!--<tr>
        <td colspan="6">
            <ul class="pager" style="margin: 0px;">
                <li class="previous">{{ link_to("admin/groups/index", '&larr; Перша') }}</li>
                <li>{{ link_to("admin/groups/index?page=" ~ page.before, 'Попередня') }}</li>
                <span> {{ page.current }} / {{ page.total_pages }} </span>
                <li>{{ link_to("admin/groups/index?page=" ~ page.next, 'Наступна') }}</li>
                <li class="next">{{ link_to("admin/groups/index?page=" ~ page.last, 'Остання &rarr;') }}</li>
            </ul>
        </td>
    </tr> -->


</table>

{ % endif %}
{ % else %}
Груп немає
{ % endfor %}