$(function(){
  $("#new_review").on('submit', function(e) {

    var $destination = $("div.gc_reviews")

    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        $("#review_content").val("")
        $("#review_rating").val("")
        $destination.append(response);
      }
    });

    e.preventDefault();
  });
});
