{{ flash.output() }}

{{ form('admin/lessons/add', 'class': 'form-horizontal', 'role': 'form') }}

<div class="form-group">
    <label for="name" class="control-label col-xs-2">Назва</label>
    <div class="col-xs-10">
        <input type="text" class="form-control" id="name" name="name" placeholder="Назва" required autofocus>
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
    <label class="control-label col-xs-2">Файли</label>
    <div class="col-xs-10" id="fileFirst" style="margin-bottom: 10px">
        <label style="width: 95%; font-weight: inherit;">
            <select class="form-control" name="files[]">

                {% for file in files %}

                    <option value="{{ file.id }}">{{ file.name }}</option>

                {% else %}
                    <option value="0">Немає данних</option>
                {% endfor %}

            </select>
        </label>
        <a class="btn" onclick="addFile()"><i class="glyphicon glyphicon-plus"></i></a>
    </div>
</div>
<div class="form-group">
    <div class="col-xs-offset-2 col-xs-10">
        <button type="submit" class="btn btn-primary">Додати</button>
    </div>
</div>
</form>

<script>
    function addFile(){
        var content = '<div class="files"><label class="control-label col-xs-2"></label>' +
                '<div class="col-xs-10" style="margin-bottom: 10px">' +
                '<label style="width: 95%; font-weight: inherit;">' +
                '<select class="form-control" name="files[]">' +
                {% for file in files %}
                '<option value="{{ file.id }}">{{ file.name }}</option>' +
                {% else %}
                '<option value="0">Немає данних</option>' +
                {% endfor %}
                '</select>' +
                '</label>' +
                '<a class="btn test" onclick="deleteFile(this)"><i class="glyphicon glyphicon-minus"></i></a>' +
                '</div></div>';

        if($('div').hasClass('files')){
            $(".files:last").after(content);
        }else{
            $("#fileFirst").after(content);
        }
    }

    function deleteFile(element){
        jQuery(element).closest('.files').remove();
    }
</script>