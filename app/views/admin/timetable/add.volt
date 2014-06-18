{{ flash.output() }}

{{ form('admin/timetable/add', 'class': 'form-horizontal', 'role': 'form') }}

<div class="form-group">
    <label for="group" class="control-label col-xs-2">Група</label>
    <div class="col-xs-10">
        <select class="form-control" id="group" name="group">

            {% for group in model['groups'] %}

            <option value="{{ group.id }}">{{ group.name }}</option>

            {% else %}
            <option value="0">Немає данних</option>
            {% endfor %}

        </select>
    </div>
</div>
<div class="form-group">
    <label for="day" class="control-label col-xs-2">День</label>
    <div class="col-xs-10">
        <select class="form-control" id="day" name="day">

            {% for day in model['days'] %}

            <option value="{{ day.id }}">{{ day.name }}</option>

            {% else %}
            <option value="0">Немає данних</option>
            {% endfor %}

        </select>
    </div>
</div>
<div class="form-group">
    <label for="lessonNumber" class="control-label col-xs-2">Номер</label>
    <div class="col-xs-10">
        <select class="form-control" id="lessonNumber" name="lessonNumber">

            {% for number in model['numbers'] %}

            <option value="{{ number.id }}">{{ number.name }}</option>

            {% else %}
            <option value="0">Немає данних</option>
            {% endfor %}

        </select>
    </div>
</div>
<div class="form-group">
    <label for="lesson" class="control-label col-xs-2">Предмет</label>
    <div class="col-xs-10">
        <select class="form-control" id="lesson" name="lesson">

            {% for lesson in model['lessons'] %}

            <option value="{{ lesson.id }}">{{ lesson.name }}</option>

            {% else %}
            <option value="0">Немає данних</option>
            {% endfor %}

        </select>
    </div>
</div>
<div class="form-group">
    <label class="control-label col-xs-2">Викладачі</label>
    <div class="col-xs-10" id="teacherFirst" style="margin-bottom: 10px">
        <label style="width: 95%; font-weight: inherit;">
            <select class="form-control" name="teachers[]">

                {% for teacher in model['teachers'] %}

                <option value="{{ teacher.id }}">{{ teacher.lastname }} {{ teacher.firstname }} {{ teacher.middlename }}</option>

                {% else %}
                <option value="0">Немає данних</option>
                {% endfor %}

            </select>
        </label>
        <a class="btn" onclick="addTeacher()"><i class="glyphicon glyphicon-plus"></i></a>
    </div>
</div>
<div class="form-group">
    <label for="weekTypes" class="control-label col-xs-2">Тип тижня</label>
    <div class="col-xs-10">
        {% for type in model['types'] %}
        <label><input type="checkbox" class="form-control" id="weekTypes[]" name="weekTypes[]" value="{{ type.id }}">{{ type.name }} тиждень</label>
        {% else %}
        <label>Немає данних</label>
        {% endfor %}
    </div>
</div>
<div class="form-group">
    <label for="classroom" class="control-label col-xs-2">Аудиторія</label>
    <div class="col-xs-10">
        <select class="form-control" id="classroom" name="classroom">

            {% for room in model['rooms'] %}

            <option value="{{ room.id }}">{{ room.name }}</option>

            {% else %}
            <option value="0">Немає данних</option>
            {% endfor %}

        </select>
    </div>
</div>
<div class="form-group">
    <div class="col-xs-offset-2 col-xs-10">
        <button type="submit" class="btn btn-primary">Додати</button>
    </div>
</div>
</form>

<script>
function addTeacher(){
    var content = '<div class="teachers"><label class="control-label col-xs-2"></label>' +
                '<div class="col-xs-10" style="margin-bottom: 10px">' +
                    '<label style="width: 95%; font-weight: inherit;">' +
                        '<select class="form-control" name="teachers[]">' +
                        {% for teacher in model['teachers'] %}
                        '<option value="{{ teacher.id }}">{{ teacher.lastname }} {{ teacher.firstname }} {{ teacher.middlename }}</option>' +
                        {% else %}
                        '<option value="0">Немає данних</option>' +
                        {% endfor %}
                        '</select>' +
                    '</label>' +
                    '<a class="btn test" onclick="deleteTeacher(this)"><i class="glyphicon glyphicon-minus"></i></a>' +
                '</div></div>';

    if($('div').hasClass('teachers')){
        $(".teachers:last").after(content);
    }else{
        $("#teacherFirst").after(content);
    }
}

function deleteTeacher(element){
    jQuery(element).closest('.teachers').remove();
}
</script>