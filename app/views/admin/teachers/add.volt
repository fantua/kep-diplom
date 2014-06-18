{{ flash.output() }}

{{ form('admin/teachers/add', 'class': 'form-horizontal', 'role': 'form') }}

<div class="form-group">
    <label for="lastname" class="control-label col-xs-2">Прізвище</label>
    <div class="col-xs-10">
        <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Прізвище" required autofocus>
    </div>
</div>
<div class="form-group">
    <label for="firstname" class="control-label col-xs-2">Ім'я</label>
    <div class="col-xs-10">
        <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Ім'я" required>
    </div>
</div>
<div class="form-group">
    <label for="middlename" class="control-label col-xs-2">По батькові</label>
    <div class="col-xs-10">
        <input type="text" class="form-control" id="middlename" name="middlename" placeholder="По батькові" required>
    </div>
</div>
<div class="form-group">
    <label for="info" class="control-label col-xs-2">Інформація</label>
    <div class="col-xs-10">
        <textarea name="info" id="info" rows="10" cols="80">
            Інформація
        </textarea>

        <script>CKEDITOR.replace('info' );</script>

    </div>
</div>
<div class="form-group">
    <div class="col-xs-offset-2 col-xs-10">
        <button type="submit" class="btn btn-primary">Додати</button>
    </div>
</div>
</form>