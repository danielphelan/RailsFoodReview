  user ||= @user

  json.id user['email']
  json.name user['name']
  if user.class == Hash
    json.active
  User.find(user['id'])
end
  if user.class == ActiveRecord::Base && !user.persisted? &&
  !user.valid?
    json.errors user.errors.messages
  end