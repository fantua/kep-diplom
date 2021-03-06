{{ flash.output() }}

<p style="float: right"><a href="/admin/pages/add" class="btn btn-primary btn-sm" role="button">Додати сторінку</a></p>

{% for model in page.items %}
{% if loop.first %}

<table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th>id</th>
        <th>Назва</th>
        <th>Посилання</th>
        <th colspan="3">Змінити</th>
    </tr>
    </thead>
    <tbody>
    {% endif %}

    <tr>
        <td>{{ model.id }}</td>
        <td>{{ model.name }}</td>
        <td>/page/{{ model.link }}</td>
        <td><a class="btn btn-toolbar" href="/admin/pages/edit/{{ model.id }}"><i class="glyphicon glyphicon-pencil"></i> Редагувати</a></td>
        <td><a class="btn btn-toolbar" href="/admin/pages/delete/{{ model.id }}" style="color: #d9534f"><i class="glyphicon glyphicon-remove"></i> Видалити</a></td>
        <td><a class="btn btn-toolbar" href="/page/{{ model.link }}" target="_blank"><i class="glyphicon glyphicon-eye-open"></i> Переглянути</a></td>
    </tr>

    {% if loop.last %}

    <tr>
        <td colspan="6">
            <ul class="pager" style="margin: 0px;">
                <li class="previous">{{ link_to("admin/pages/index", '&larr; Перша') }}</li>
                <li>{{ link_to("admin/pages/index?page=" ~ page.before, 'Попередня') }}</li>
                <span> {{ page.current }} / {{ page.total_pages }} </span>
                <li>{{ link_to("admin/pages/index?page=" ~ page.next, 'Наступна') }}</li>
                <li class="next">{{ link_to("admin/pages/index?page=" ~ page.last, 'Остання &rarr;') }}</li>
            </ul>
        </td>
    </tr>

    </tbody>
</table>

{% endif %}
{% else %}
Сторінок немає
{% endfor %}