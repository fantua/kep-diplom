{{ flash.output() }}

<ul class="nav nav-pills" style="width: 30%; margin: auto;">
    <li class="active"><a href="/admin/settings/index">Загальні</a></li>
    <li><a href="/admin/settings/admin">Адміністратор</a></li>
</ul>

<br>

{{ form('admin/settings/index', 'class': 'form-horizontal', 'role': 'form') }}

<div class="form-group">
    <label for="weekMark" class="control-label col-xs-4">Початок відліку тижнів (1-й тиждень)</label>
    <div class="col-xs-2">
        <input type="date" class="form-control" id="weekMark" name="weekMark" value="{{ model.week_mark }}" required autofocus>
    </div>
</div>
<div class="form-group">
    <div class="col-xs-offset-4 col-xs-2">
        <button type="submit" class="btn btn-primary">Змінити</button>
    </div>
</div>
</form>