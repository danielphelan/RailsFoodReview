  review ||= @review

  json.id review['id']
  json.name review['name']
  json.source_name review['source_name']
  json.source_identifier review['source_identifier']
  json.task_count review['task_count']
  if review.class == Hash
    json.active
  Review.find(review['id']).active_for_user?(@api_key.user)
  else
    json.active review.active_for_user?(@api_key.user)
  end

  if review.class == ActiveRecord::Base && !review.persisted? &&
  !review.valid?
    json.errors review.errors.messages
  end