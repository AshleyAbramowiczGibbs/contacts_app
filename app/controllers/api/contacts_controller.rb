class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render "index.json.jbuilder"
  end

  def create
    @contacts = Contact.new(
      first_name: params["first"],
      last_name: params["last"],
      phone_number: params["phone"],
      email: params["email"],
      )
       @contacts.save
       render "show.json.jbuilder"
  end

  def show
    @contacts = Contact.find_by(id: params[:id])
    render "show.json.jbuilder"
  end 

  def update
    @contacts = Contact.find_by(id: params[:id])
    @contacts.first_name = params["first"] || @contacts.first_name
    @contacts.last_name = params["last"] || @contacts.last_name
    @contacts.email = params["email"] || @contacts.email
    @contacts.phone_number = params["phone"] || @contacts.phone_number
    @contacts.save
    render "show.json.jbuilder"
  end

  def destroy
    @contacts = Contact.find_by(id: params[:id]) 
    @contacts.delete  
    render json: {message: "I've destroyed the contact!"}
  end  
end
