function GroupClass(attributes) {
  this.id = attributes.id
  this.name = attributes.name
  this.duration = attributes.duration
}

$(function(){
  GroupClass.templateSource = $("#new-gc-template").html()
  GroupClass.template = Handlebars.compile(GroupClass.templateSource);
})

GroupClass.prototype.format = function() {
 return GroupClass.template(this)
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
    var studioId = $(this).data("studio")
    var url = "/studios/" + studioId + "/group_classes/" + id

    var source = document.getElementById("gc-show-template").innerHTML
    var template = Handlebars.compile(source);

    $.get(url, function(response){
      var result = template(response)
      var $destination = $("#main")
      $destination.empty()
      $destination.append(result)

      attachNext()
    });
    e.preventDefault()
  });
});

function attachNext() {
  $(".js-next").click(function(e) {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    var studioId = $(this).data("studio")
    var url = "/studios/" + studioId + "/group_classes/" + nextId

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
    e.preventDefault();
  });
};
