{{ content() }}

<form class="form-horizontal" role="form" method="post" action="/admin/lessons/edit/{{ model.id }}">

    <div class="form-group">
        <label for="name" class="control-label col-xs-2">Назва</label>
        <div class="col-xs-10">
            <input type="text" class="form-control" id="name" name="name" placeholder="Назва" value="{{ model.name }}" required autofocus>
        </div>
    </div>
    <div class="form-group">
        <label for="info" class="control-label col-xs-2">Інформація</label>
        <div class="col-xs-10">
            <textarea name="info" id="info" rows="10" cols="80">
                {{ model.info }}
            </textarea>

            <script>CKEDITOR.replace('info');</script>

        </div>
    </div>
    <div class="form-group">
        <div class="col-xs-offset-2 col-xs-10">
            <button type="submit" class="btn btn-primary">Редагувати</button>
        </div>
    </div>
</form>