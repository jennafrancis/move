module ReviewAnalytics
  def review_count
    reviews.count
  end

  def average_rating
    sum = reviews.map{|r| r.rating}.reduce(:+)
    sum/self.review_count.to_f
  end
end
