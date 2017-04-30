$(document).ready(function(){
  $("#comment<%= post.id%>").on("hide.bs.collapse", function(){
    $(".add_comment").html('Add comment');
  });
  $("#comment<%= post.id%>").on("show.bs.collapse", function(){
    $(".add_comment").html('Hide comment');
  });
});