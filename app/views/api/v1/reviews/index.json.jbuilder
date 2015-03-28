  json.reviews @reviews, partial: 'api/v1/reviews/show', as: :review
  json.total_count @reviews.respond_to?(:total_entries) ?
  @reviews.total_entries : @reviews.to_a.count