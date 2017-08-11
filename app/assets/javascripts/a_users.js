$(function(){
  $("a.load_reviews").click(function(e) {
    e.preventDefault();

    $.get(this.href).done(function(json){
      var $list = $("div.reviews")
      $list.html("")

      json.forEach(function(review){
        $list.append(review.group_class.name + ' at <a href="/studios/' + review.group_class.studio.id + '">'+ review.group_class.studio.name + '</a><br>' + review.rating + '/5 "' + review.content + '"<br></br>')
      });
    });
  });
});
