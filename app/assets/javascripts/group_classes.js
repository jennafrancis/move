$(function() {
  $(".js-show").click(function(e) {
    var id = $(this).data("id");
    var studio_id = $(this).data("studio")
    var url = "/studios/" + studio_id + "/group_classes/" + id

    var source = document.getElementById("gc-show-template").innerHTML
    var template = Handlebars.compile(source);


    $.get(url, function(response){
      var result = template(response)
      var $destination = $("#main")
      $destination.empty()
      $destination.append(result)

      // console.log(response)
    });
    e.preventDefault()
  });
});
