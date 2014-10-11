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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require bootsy
//= require turbolinks
//= require bootstrap-tooltip
//= require bootstrap-popover
//= require flat-ui
//= require_tree .
     
$.fn.clicktoggle = function(a, b) {
    return this.each(function() {
        var clicked = false;
        $(this).click(function() {
            if (clicked) {
                clicked = false;
                return b.apply(this, arguments);
            }
            clicked = true;
            return a.apply(this, arguments);
        });
    });
};

var ready = function(){
  //$('.post_main_container').removeClass('col-md-6');
  //$('.post_main_container').css({'margin-left':'60px','left':'0','max-width':'66.6%'});
  //$('.off_menu').css({'left':'108%','background':'white'});

  $(".comment_container").hide();
  $(".expanded_content").hide();
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
  $(".expand_content").click(function(){
    $(this).parents('.truncated_content').hide();
    $(this).parents('.truncated_content').siblings('.expanded_content').show();
  });
  $("[data-toggle='popover']").popover();
 
    if($('.post_main_container').hasClass('new_post_form'))
      {
           $('.off_menu').css({'display':'none'});
      }

  $('.off_menu').clicktoggle(function(){
       //$('.post_main_container').removeClass('col-md-8').addClass('col-md-6');
       $('.left_sidebar').addClass('off_canvas');
       //$('.post_main_container').css({'margin-left':'0px','left':'25%'});
       //$('.post_main_container').css({'margin-left':'310px'});
       $(this).css({'left':'95.5%','background':'white'});
       $(this).html('<span class="glyphicon glyphicon-chevron-left"></span>');
       $('.like_unlike_container>div').removeClass('col-md-2').addClass('col-md-3');
    },
    function(){
      //$('.post_main_container').removeClass('col-md-6').addClass('col-md-8');  
      $('.left_sidebar').removeClass('off_canvas');   
       //$('.post_main_container').css({'margin-left':'60px','left':'0','max-width':'66.6%'});
      //$('.post_main_container').css({'margin-left':'65px'}); 
      $(this).css({'left':'105%','background':'white'});
      $(this).html('<span class="fui-list"></span>');
      $('.like_unlike_container>div').removeClass('col-md-3').addClass('col-md-2');
    });

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
//like/unlike button bug
$(document).on("ready page:change",function(){
  $('.like,.unlike').click(function(){
    if($('.post_main_container').hasClass('col-md-6')){
       $('.like_unlike_container>div').removeClass('col-md-2').addClass('col-md-3');
    }else{
       $('.like_unlike_container>div').removeClass('col-md-3').addClass('col-md-2');
    }
  });
});

