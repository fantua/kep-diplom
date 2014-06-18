{{ flash.output() }}

{{ form('admin/files/add', 'class': 'form-horizontal', 'role': 'form', 'enctype': 'multipart/form-data') }}

    <div class="form-group">
        <label for="name" class="control-label col-xs-2">Назва</label>
        <div class="col-xs-10">
            <input type="text" class="form-control" id="name" name="name" placeholder="Назва" required autofocus>
        </div>
    </div>
    <div class="form-group">
        <label for="file" class="control-label col-xs-2">Файл</label>
        <div class="col-xs-10">
            <input type="file" class="form-control" id="file" name="file" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-xs-offset-2 col-xs-10">
            <button type="submit" class="btn btn-primary">Додати</button>
        </div>
    </div>
</form>