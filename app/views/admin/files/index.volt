{{ flash.output() }}

<p style="float: right"><a href="/admin/files/add" class="btn btn-primary btn-sm" role="button">Завантажити файл</a></p>

{% for model in page.items %}
    {% if loop.first %}

        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>id</th>
                <th>Назва</th>
                <th>Посилання</th>
                <th>Змінити</th>
            </tr>
            </thead>
            <tbody>
    {% endif %}

            <tr>
                <td>{{ model.id }}</td>
                <td>{{ model.name }}</td>
                <td><a href="/uploads/{{ model.id }}.pdf" target="_blank">/uploads/{{ model.id }}.pdf</a></td>
                <td><a class="btn btn-toolbar" href="/admin/files/delete/{{ model.id }}" style="color: #d9534f"><i class="glyphicon glyphicon-remove"></i> Видалити</a></td>
            </tr>

    {% if loop.last %}

            <tr>
                <td colspan="4">
                    <ul class="pager" style="margin: 0px;">
                        <li class="previous">{{ link_to("admin/files/index", '&larr; Перша') }}</li>
                        <li>{{ link_to("admin/files/index?page=" ~ page.before, 'Попередня') }}</li>
                        <span> {{ page.current }} / {{ page.total_pages }} </span>
                        <li>{{ link_to("admin/files/index?page=" ~ page.next, 'Наступна') }}</li>
                        <li class="next">{{ link_to("admin/files/index?page=" ~ page.last, 'Остання &rarr;') }}</li>
                    </ul>
                </td>
            </tr>

            </tbody>
        </table>

    {% endif %}
{% else %}
    Файлів немає
{% endfor %}