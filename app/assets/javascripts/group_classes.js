$(function() {
  $(".js-show").click(function(e) {
    var id = $(this).data("id");
    var studio_id = $(this).data("studio")
    var url = "/studios/" + studio_id + "/group_classes/" + id
    $.get(url, function(response){
      $("#main").empty()
      // add handlebars template
      console.log(response)
    });
    e.preventDefault()
  });
});
