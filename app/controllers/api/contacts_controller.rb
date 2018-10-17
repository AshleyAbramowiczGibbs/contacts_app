class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render "index.json.jbuilder"
  end

  def create
    @contact = Contact.new(
      first_name: params["first"],
      last_name: params["last"],
      phone_number: params["phone"],
      email: params["email"],
      )
       contact.save
       render "index.json.jbuilder"
  end
end
