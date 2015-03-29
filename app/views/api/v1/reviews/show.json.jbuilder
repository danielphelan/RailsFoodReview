  review ||= @review

  json.title review['title']
  json.restaurant review['restaurant']
 json.date review['date']
 

  if review.class == ActiveRecord::Base && !review.persisted? &&
  !review.valid?
    json.errors review.errors.messages
  end