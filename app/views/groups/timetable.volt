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
                    <li><a href="/groups">Інформація</a></li>
                    <li class="active"><a href="/groups/timetable">Розклад</a></li>
                    <li><a href="/groups/lessons">Предмети</a></li>
                </ul>
            </td>
        </tr>
    </table>
</center>

{ % for model in page.items %}
{ % if loop.first %}

    <table class="table table-bordered table-striped table-hover" style="text-align: center;">
        <thead>
        <tr>
            <th style="text-align: center;" colspan="5">Чисельник</th>
        </tr>
        <tr>
            <th style="text-align: center;">Понеділок</th>
            <th style="text-align: center;">Вівторок</th>
            <th style="text-align: center;">Середа</th>
            <th style="text-align: center;">Четвер</th>
            <th style="text-align: center;">П'ятниця</th>
        </tr>
        </thead>
        <tbody>
        { % endif %}
        <tr>
            <td>
                <ul class="list-group">
                    <li class="list-group-item">1. Схемотехніка (ПІБ), 301</li>
                    <li class="list-group-item">2. Схемотехніка (ПІБ), 301</li>
                    <li class="list-group-item">3. Схемотехніка (ПІБ), 301</li>
                    <li class="list-group-item">4. Схемотехніка (ПІБ), 301</li>
                </ul>
            </td>
            <td>
                <ul class="list-group">
                    <li class="list-group-item"></li>
                    <li class="list-group-item"></li>
                    <li class="list-group-item">1. Схемотехніка (ПІБ), 301</li>
                    <li class="list-group-item"></li>
                </ul>
            </td>
            <td>
                <ul class="list-group">
                    <li class="list-group-item">1. Схемотехніка (ПІБ), 301</li>
                    <li class="list-group-item">2. Схемотехніка (ПІБ), 301</li>
                    <li class="list-group-item"></li>
                    <li class="list-group-item">4. Схемотехніка (ПІБ), 301</li>
                </ul>
            </td>
            <td>
                <ul class="list-group">
                    <li class="list-group-item">1. Схемотехніка (ПІБ), 301</li>
                    <li class="list-group-item">2. Схемотехніка (ПІБ), 301</li>
                    <li class="list-group-item">3. Схемотехніка (ПІБ), 301</li>
                    <li class="list-group-item">4. Схемотехніка (ПІБ), 301</li>
                </ul>
            </td>
            <td>
                <ul class="list-group">
                    <li class="list-group-item"></li>
                    <li class="list-group-item"></li>
                    <li class="list-group-item">3. Схемотехніка (ПІБ), 301</li>
                    <li class="list-group-item">4. Схемотехніка (ПІБ), 301</li>
                </ul>
            </td>
        </tr>


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

        </tbody>
    </table>

{ % for model in page.items %}
{ % if loop.first %}

<table class="table table-bordered table-striped table-hover" style="text-align: center;">
    <thead>
    <tr>
        <th style="text-align: center;" colspan="5">Знаменник</th>
    </tr>
    <tr>
        <th style="text-align: center;">Понеділок</th>
        <th style="text-align: center;">Вівторок</th>
        <th style="text-align: center;">Середа</th>
        <th style="text-align: center;">Четвер</th>
        <th style="text-align: center;">П'ятниця</th>
    </tr>
    </thead>
    <tbody>
    { % endif %}
    <tr>
        <td>
            <ul class="list-group">
                <li class="list-group-item">1. Схемотехніка (ПІБ), 301</li>
                <li class="list-group-item">2. Схемотехніка (ПІБ), 301</li>
                <li class="list-group-item">3. Схемотехніка (ПІБ), 301</li>
                <li class="list-group-item">4. Схемотехніка (ПІБ), 301</li>
            </ul>
        </td>
        <td>
            <ul class="list-group">
                <li class="list-group-item"></li>
                <li class="list-group-item"></li>
                <li class="list-group-item">1. Схемотехніка (ПІБ), 301</li>
                <li class="list-group-item"></li>
            </ul>
        </td>
        <td>
            <ul class="list-group">
                <li class="list-group-item">1. Схемотехніка (ПІБ), 301</li>
                <li class="list-group-item">2. Схемотехніка (ПІБ), 301</li>
                <li class="list-group-item"></li>
                <li class="list-group-item">4. Схемотехніка (ПІБ), 301</li>
            </ul>
        </td>
        <td>
            <ul class="list-group">
                <li class="list-group-item">1. Схемотехніка (ПІБ), 301</li>
                <li class="list-group-item">2. Схемотехніка (ПІБ), 301</li>
                <li class="list-group-item">3. Схемотехніка (ПІБ), 301</li>
                <li class="list-group-item">4. Схемотехніка (ПІБ), 301</li>
            </ul>
        </td>
        <td>
            <ul class="list-group">
                <li class="list-group-item"></li>
                <li class="list-group-item"></li>
                <li class="list-group-item">3. Схемотехніка (ПІБ), 301</li>
                <li class="list-group-item">4. Схемотехніка (ПІБ), 301</li>
            </ul>
        </td>
    </tr>

    { % if loop.last %}

    </tbody>
    </table>

{ % endif %}
{ % else %}
Предметів немає
{ % endfor %}