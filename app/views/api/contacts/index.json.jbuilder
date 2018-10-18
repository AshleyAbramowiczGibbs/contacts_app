json.array! @contacts.each do |contact|
  json.partial! "contacts.json.jbuilder", contacts: contact
end