  json.users @users
  json.total_count @users.respond_to?(:total_entries) ?
  @users.total_entries : @users.to_a.count