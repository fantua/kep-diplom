{{ flash.output() }}

<p style="float: right"><a href="/admin/news/add" class="btn btn-primary btn-sm" role="button">Додати новину</a></p>

{% for model in page.items %}
    {% if loop.first %}

        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>id</th>
                <th>Назва</th>
                <th>Дата</th>
                <th colspan="3">Змінити</th>
            </tr>
            </thead>
            <tbody>
    {% endif %}

            <tr>
                <td>{{ model.id }}</td>
                <td>{{ model.name }}</td>
                <td>{{ model.date }}</td>
                <td><a class="btn btn-toolbar" href="/admin/news/edit/{{ model.id }}"><i class="glyphicon glyphicon-pencil"></i> Редагувати</a></td>
                <td><a class="btn btn-toolbar" href="/admin/news/delete/{{ model.id }}" style="color: #d9534f"><i class="glyphicon glyphicon-remove"></i> Видалити</a></td>
                <td><a class="btn btn-toolbar" href="/news/view/{{ model.id }}" target="_blank"><i class="glyphicon glyphicon-eye-open"></i> Переглянути</a></td>
            </tr>

    {% if loop.last %}

            <tr>
                <td colspan="6">
                    <ul class="pager" style="margin: 0px;">
                        <li class="previous">{{ link_to("admin/news/index", '&larr; Перша') }}</li>
                        <li>{{ link_to("admin/news/index?page=" ~ page.before, 'Попередня') }}</li>
                        <span> {{ page.current }} / {{ page.total_pages }} </span>
                        <li>{{ link_to("admin/news/index?page=" ~ page.next, 'Наступна') }}</li>
                        <li class="next">{{ link_to("admin/news/index?page=" ~ page.last, 'Остання &rarr;') }}</li>
                    </ul>
                </td>
            </tr>

            </tbody>
        </table>

    {% endif %}
{% else %}
    Новин немає
{% endfor %}