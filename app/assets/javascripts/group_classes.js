$(function(){
  $("#new_review").on('submit', function(e) {
    e.preventDefault();

    var url = this.action;
    var data = $(this).serialize();
    var posting = $.post(url, data);
    var $destination = $("div.gc_reviews");

    posting.done(function(response){
      $("#review_content").val("")
      $("#review_rating").val("")
      $destination.append(response);
    });
  });
});
