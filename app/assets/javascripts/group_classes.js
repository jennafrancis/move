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

      attachNext()
      console.log(response)
    });
    e.preventDefault()
  });
});

function attachNext() {
  alert("attached")
  $(".js-next").click(function(e) {
    e.preventDefault();
    var studio_id = $(this).data("studio")
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;

    var url = "/studios/" + studio_id + "/group_classes/" + nextId


    var source = document.getElementById("gc-show-template").innerHTML
    var template = Handlebars.compile(source);

    $.get(url, function(response){
      var result = template(response)
      var $destination = $("#main")
      $destination.empty()
      $destination.append(result)
      // re-set the id to current on the link
      $(".js-next").attr("data-id", response["id"]);
      attachNext()
    });
  });
};
