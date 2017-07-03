function GroupClass(attributes) {
  this.id = attributes.id
  this.name = attributes.name
  this.duration = attributes.duration
}

GroupClass.prototype.format = function() {

}

$(function() {
  $("form#new_group_class").submit(function(e) {
    e.preventDefault()
    var $form = $(this);
    var url = $form.attr("action")
    var data = $form.serialize()

    $.post(url, data)
      .success(function(json){
        var groupClass = new GroupClass(json);

        var formattedGC = groupClass.format()

        $("div#group_class_list").append(formattedGC)
      })
      .error(function(response){
        console.log("oh no i broke!", response)
      })
  })
})

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
  $(".js-next").click(function(e) {
    e.preventDefault();
    var studio_id = $(this).data("studio")
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;

    var url = "/studios/" + studio_id + "/group_classes/" + nextId
    console.log(url)

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
