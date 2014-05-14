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

                <option value="{{ teacher.id }}">{{ teacher.firstname }} {{ teacher.middlename }} {{ teacher.lastname }}</option>

                {% else %}
                <option value="0">Немає данних</option>
                {% endfor %}

            </select>
        </label>
        <a class="btn" onclick="addTeacher()"><i class="glyphicon glyphicon-plus"></i></a>
    </div>

</div>
<div class="form-group">
    <label for="weekType" class="control-label col-xs-2">Тип тижня</label>
    <div class="col-xs-10">
        <select class="form-control" id="weekType" name="weekType">

            {% for type in model['types'] %}

            <option value="{{ type.id }}">{{ type.name }}</option>

            {% else %}
            <option value="0">Немає данних</option>
            {% endfor %}

        </select>
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
                            '<option value="{{ teacher.id }}">{{ teacher.firstname }} {{ teacher.middlename }} {{ teacher.lastname }}</option>' +
                            {% else %}
                            '<option value="0">Немає данних</option>' +
                            {% endfor %}
                            '</select>' +
                        '</label>' +
                        '<a class="btn test" onclick="deleteTeacher(this)"><i class="glyphicon glyphicon-minus"></i></a>' +
                    '</div></div>';

        if($('div').hasClass('teachers')){
            $( ".teachers:last" ).after(content);
        }else{
            $( "#teacherFirst" ).after(content);
        }
    }

    function deleteTeacher(element){
        jQuery(element).closest('.teachers').remove();
    }

    function dump(obj) {
        var out = '';
        for (var i in obj) {
            out += i + ": " + obj[i] + "\n";
        }

        alert(out);

        // or, if you wanted to avoid alerts...

        var pre = document.createElement('pre');
        pre.innerHTML = out;
        document.body.appendChild(pre)
    }

    function addElement(){
        var last = $('#data_' + i);
        i++;

        last.after(
                '<div><label class="control-label col-xs-2" id="lab_' + i + '"></label>' +
                        '<div class="col-xs-10" id="data_' + i + '">' +
                        '<select class="form-control" id="teachers[' + i + ']" name="teachers[' + i + ']">' +

                        {% for teacher in model['teachers'] %}

                        '<option value="{{ teacher.id }}">{{ teacher.firstname }} {{ teacher.middlename }} {{ teacher.lastname }}</option>' +

                        {% else %}
                        '<option value="0">Немає данних</option>' +
                        {% endfor %}

                        '</select>' +
                        '<a class="btn" onclick="deleteElement(' + i + ')" id="test"><i class="glyphicon glyphicon-minus"></i></a>' +
                        '</div></div>'
        );
    }

    function deleteElement(n){
        $('#lab_' + n).remove();
        $('#data_' + n).remove();

        if(i == n)
            i--;
    }
</script>