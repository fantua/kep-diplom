{{ flash.output() }}

{{ form('admin/groups/add', 'class': 'form-horizontal', 'role': 'form') }}

<div class="form-group">
    <label for="name" class="control-label col-xs-2">Назва</label>
    <div class="col-xs-10">
        <input type="text" class="form-control" id="name" name="name" placeholder="Назва" required autofocus>
    </div>
</div>
<div class="form-group">
    <label for="curator" class="control-label col-xs-2">Куратор</label>
    <div class="col-xs-10">
        <select class="form-control" id="curator" name="curator">

            {% for teacher in model %}

            <option value="{{ teacher.id }}">{{ teacher.lastname }} {{ teacher.firstname }} {{ teacher.middlename }}</option>

            {% else %}
                <option value="0">Немає викладачів</option>
            {% endfor %}

        </select>
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