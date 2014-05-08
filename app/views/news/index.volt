{% for model in page.items %}
    <div class="blog-post">
        <h2 class="blog-post-title">{{ model.name }}</h2>
        <p class="blog-post-meta">{{ model.date }}</p>
        {{ model.preview_content }}
        <br>
        <p><a class="btn btn-default" href="/news/view/{{ model.id }}" role="button">Читати »</a></p>
    </div>
    <hr>

    {% if loop.last %}

        <ul class="pager">
            <li>{{ link_to("news/index?page=" ~ page.before, 'Попередня') }}</li>
            <li>{{ link_to("news/index?page=" ~ page.next, 'Наступна') }}</li>
        </ul>

    {% endif %}

{% else %}
Новин немає
{% endfor %}
