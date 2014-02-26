$(document).ready(function(){

        setInterval(function(){
            move('#main_logo').y(-10).duration('1s').end();
            setTimeout(function(){move('#main_logo').y(5).duration('1s').end();},1000)
        },1500)

});
