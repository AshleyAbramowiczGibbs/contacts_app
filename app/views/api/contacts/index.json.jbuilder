json.array! @contacts.each do |contact|
  json.id contact.id
  json.first contact.first_name
  json.last contact.last_name
  json.phone contact.phone_number
  json.email contact.email
end