$(function(){
  $("#new_review").on('submit', function(e) {

    url = this.action

    data = {
      'authenticity_token' :$("input[name='authenticity_token']").val(),
      'review' : {
        'content' : $("#review_content"),
        'rating' : $("#review_rating"),
        'group_class_id' : $("#review_group_class_id"),
        'user_id' : $("#review_user_id")
      }
    }

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response){
        $("#review_content").val("")
        $("#review_rating").val("")
        var $destination = $("div.gc_reviews p")
        $destination.append(response);
      }
    });

    e.preventDefault();
  });
});
