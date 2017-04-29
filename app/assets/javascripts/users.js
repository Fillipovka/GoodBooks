$(document).ready(function(){
  $("#comment").on("hide.bs.collapse", function(){
    $(".add_comment").html('Add comment');
  });
  $("#comment").on("show.bs.collapse", function(){
    $(".add_comment").html('Hide comment');
  });
});