json.id @resource.id.to_s
json.name @resource.name
json.email @resource.email
json.confirmed_at @resource.confirmed_at

json.message 'Logged in'