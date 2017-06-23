// $(function(){
//   $("#new_review").on('submit', function(e) {
//     e.preventDefault();
//
//     var url = this.action;
//     var data = $(this).serialize();
//     var posting = $.post(url, data);
//     var $destination = $("div.gc_reviews");
//
//     posting.done(function(response){
      // $("#review_content").val("")
      // $("#review_rating").val("")
//       $destination.append(response);
//     });
//   });
// });


// add handlebars template
$(function(){
  $("#new_review").submit(function(e) {
    e.preventDefault();

    var url = this.action;
    var data = $(this).serialize();
    var posting = $.post(url, data);
    var $destination = $("div.gc_reviews");

    posting.done(function(response){
      var review = response
      // debugger
      // $destination.append("<div class='reviewResult'><br><span id='reviewRating'></span>/5 <span id='reviewContent'></span> <br>- <span id='reviewUser'></span><br></br></div>");
      $destination.append("<div class='reviewResult'><br><span id='reviewRating'></span>/5 <span id='reviewContent'></span><br></br></div>");
      $("#reviewRating").text(review["rating"]);
      $("#reviewContent").text(review["content"]);
      // $("#reviewUser").text(review["user"]["email"]);
      $("#review_content").val("")
      $("#review_rating").val("")
      $("#new_review input[type=submit]").removeAttr("disabled");
    });
  });
});
