/**
 * Created by Equality on 09.05.14.
 */

$(document).ready(function(){
    $('#up').css( "cursor", "pointer" );
    $('#up').click(function(){
        $('html, body').animate({scrollTop: $('#top_menu').offset().top -100 }, 1000);
    });
});
