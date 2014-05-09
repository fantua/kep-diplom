$(document).ready(function(){
    $('#num').keyup(function(){
        convert();
    });
    $('#num_sys').change(function(){
        convert();
    });

    function convert(){
            var num_sys = $("#num_sys").val();
            var num = $('#num').val();
            var sys_index = 0;
            switch (num_sys) {
                case 'zero':
                    alert('Обрано не вірну систему числення!');
                    break;
                case 'bin':
                    sys_index = 2;
                    break;
                case 'oct':
                    sys_index = 8;
                    break;
                case 'hex':
                    sys_index = 16;
                    break;
                default:
                    alert('Я таких значень не знаю!');
            };
            num = parseInt(num);
            var result = num.toString(sys_index);
            $("#result").val(result);
   }
});