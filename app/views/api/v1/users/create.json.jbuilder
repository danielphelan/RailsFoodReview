json.id @user.id.to_s
json.name @user.name
json.email @user.email
json.admin @user.admin
json.password @user.password
json.password_confirmation @user.password_confirmation
json.message 'Joined'