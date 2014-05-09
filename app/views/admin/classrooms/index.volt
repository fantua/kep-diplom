{{ content() }}

<p style="float: right"><a href="/admin/classrooms/add" class="btn btn-primary btn-sm" role="button">Додати аудиторію</a></p>

{% for model in page.items %}
{% if loop.first %}

<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th>id</th>
        <th>Назва</th>
        <th colspan="2">Змінити</th>
    </tr>
    </thead>
    <tbody>
    {% endif %}

    <tr>
        <td>{{ model.id }}</td>
        <td>{{ model.name }}</td>
        <td><a class="btn btn-toolbar" href="/admin/classrooms/edit/{{ model.id }}"><i class="glyphicon glyphicon-pencil"></i> Редагувати</a></td>
        <td><a class="btn btn-toolbar" href="/admin/classrooms/delete/{{ model.id }}" style="color: #d9534f"><i class="glyphicon glyphicon-remove"></i> Видалити</a></td>
    </tr>

    {% if loop.last %}

    <tr>
        <td colspan="6">
            <ul class="pager" style="margin: 0px;">
                <li class="previous">{{ link_to("admin/classrooms/index", '&larr; Перша') }}</li>
                <li>{{ link_to("admin/classrooms/index?page=" ~ page.before, 'Попередня') }}</li>
                <span> {{ page.current }} / {{ page.total_pages }} </span>
                <li>{{ link_to("admin/classrooms/index?page=" ~ page.next, 'Наступна') }}</li>
                <li class="next">{{ link_to("admin/classrooms/index?page=" ~ page.last, 'Остання &rarr;') }}</li>
            </ul>
        </td>
    </tr>

    </tbody>
</table>

{% endif %}
{% else %}
Аудиторій немає
{% endfor %}