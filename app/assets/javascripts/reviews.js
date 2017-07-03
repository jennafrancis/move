// $(function(){
//   $("#new_review").submit(function(e) {
//     e.preventDefault();
//
//     var url = this.action;
//     var data = $(this).serialize();
//     var posting = $.post(url, data);
//     var $destination = $("div.gc_reviews");
//
//     posting.done(function(response){
//       var review = response
//       $destination.append("<p><span id='reviewRating'></span>/5 <span id='reviewContent'></span> <br>- <span id='reviewUser'></span><br></br></p>");
//       $("#reviewRating").text(review["rating"]);
//       $("#reviewContent").text(review["content"]);
//       $("#reviewUser").text(review["user"]["email"]);
//       $("#review_content").val("")
//       $("#review_rating").val("")
//       $("#new_review input[type=submit]").removeAttr("disabled");
//     });
//   });
// });


// <strong>Add a review:</strong>
// <form class="new_review" id="new_review" action="/studios/1/group_classes/1" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="iVQHxS1A4KunHg9SLKaMbsDmfkyLmwA8HSA9TvVLgloNIazsmkxD/qu0yNnBZ+h/lHD1NamOVKRu4xNOWuxmIA==" />
//   <label for="review_Rate this class (1-5)">Rate this class (1-5)</label>
//   <input min="1" max="5" type="number" name="review[rating]" id="review_rating" /><br>
//   <label for="review_What did you think">What did you think?</label>
//   <textarea name="review[content]" id="review_content">
// </textarea><br>
//   <input value="1" type="hidden" name="review[group_class_id]" id="review_group_class_id" />
//   <input value="2" type="hidden" name="review[user_id]" id="review_user_id" />
//   <input type="submit" name="commit" value="Create Review" data-disable-with="Create Review" /><br>
// </form>
