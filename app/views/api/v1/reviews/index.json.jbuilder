  json.reviews @reviews
  json.total_count @reviews.respond_to?(:total_entries) ?
  @reviews.total_entries : @reviews.to_a.count