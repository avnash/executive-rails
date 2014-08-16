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
//= require turbolinks
//= require bootstrap-tooltip
//= require bootstrap-popover
//= require_tree .

var ready = function(){
  $(".comment_container").hide();

  $(".expand_comment").click(function(){
    if($(this).html()=="View Comments"){
      $(this).parent(".comment_toggle").siblings(".comment_container").stop().slideDown();
      $(this).html("Hide Comments");
    }
    else{
      
      $(this).parent(".comment_toggle").siblings(".comment_container").stop().slideUp();
      $(this).html("View Comments");
    }
  });
  $("[data-toggle='popover']").popover();

};
$(document).ready(ready);
$(document).on('page:load', ready);

//Load More JS
var counter = 10;
function LoadMore() {
    counter = counter + 10;
}

function ShowLess() {
    counter = 10;
}
$(document).on("ready page:change", function () {
    $(".post_div:lt(10)").show();

    $(".less").click(function () {
        ShowLess();
        $('.post_div:gt(0)').hide();
        $(".post_div:lt(10)").show();
    });

    $(".load").click(function () {
        LoadMore();
        $('.post_div:lt("' + counter + '")').show();
    });
});
