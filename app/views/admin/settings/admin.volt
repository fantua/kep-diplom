{{ flash.output() }}

<ul class="nav nav-pills" style="width: 30%; margin: auto;">
    <li><a href="/admin/settings/index">Загальні</a></li>
    <li class="active"><a href="/admin/settings/admin">Адміністратор</a></li>
</ul>

<br>

{{ form('admin/settings/admin', 'class': 'form-horizontal', 'role': 'form') }}

<div class="form-group">
    <label for="password" class="control-label col-xs-4">Новий пароль</label>
    <div class="col-xs-2">
        <input type="password" class="form-control" id="password" name="password" required autofocus>
    </div>
</div>
<div class="form-group">
    <label for="repassword" class="control-label col-xs-4">Повторіть пароль</label>
    <div class="col-xs-2">
        <input type="password" class="form-control" id="repassword" name="repassword" required>
    </div>
</div>
<div class="form-group">
    <div class="col-xs-offset-4 col-xs-2">
        <button type="submit" class="btn btn-primary">Змінити</button>
    </div>
</div>
</form>