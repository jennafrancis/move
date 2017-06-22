$(function(){
  $("#new_review").on('submit', function(e) {
    var url = this.action
    var data = $(this).serialize()
    var $destination = $("div.gc_reviews")

    $.post(url, data, function(response){
      $("#review_content").val("")
      $("#review_rating").val("")
      $destination.append(response);
    })

    e.preventDefault();
  });
});
