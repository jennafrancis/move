$(function(){
  $("a.load_reviews").on('click', function(e) {

    $.get(this.href).done(function(json){
      var $list = $("div.reviews")
      $list.html("")

      json.forEach(function(review){
        $list.append(review.rating + '/5 "' + review.content + '"<br></br>')
      });
    });

    e.preventDefault();
  });
});
