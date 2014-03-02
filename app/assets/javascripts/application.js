// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require move.min
//= require imagescroll.min
//= require freewall.min
//= require image_scroller
//= require animations
//= require foundation
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  var wall = new freewall('#item_box');
  wall.fitWidth();
  wall.reset({
          selector: '.item',
          animate: true,
          delay: 30,
          onResize: function() {
            wall.refresh($(window).width(), $(window).height());
          }
        });
});
$(function(){ $(document).foundation();});



