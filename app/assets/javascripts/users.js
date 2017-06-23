$(function(){
  $("a.load_reviews").on('click', function(e) {

    $.get(this.href).done(function(json){
      var $list = $("div.reviews")
      $list.html("")

      json.forEach(function(review){
        // want this one to work
        // $list.append(review.group_class.name + ' at ' + review.group_class.studio.name + '<br>' + review.rating + '/5 "' + review.content + '"<br></br>')
        $list.append(review.group_class.name + '<br>' + review.rating + '/5 "' + review.content + '"<br></br>')
      });
    });

    e.preventDefault();
  });
});
