class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    #search for contact with specific first name
    search = params[:name]
    if search
      @contacts = @contacts.where("name ILIKE ?", "%" + search + "%")
    end
    #expand your search to make all other attributes searchable
    render "index.json.jbuilder"
  end

  def create
    @contacts = Contact.new(
      first_name: params["first"],
      last_name: params["last"],
      phone_number: params["phone"],
      email: params["email"],
      middle_name: params["middle_name"],
      Bio: params["bio"]
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
    @contacts.middle_name = params["middle_name"] || @contacts.middle_name
    @contacts.Bio = params["bio"] || @contacts.bio
    @contacts.save
    render "show.json.jbuilder"
  end

  def destroy
    @contacts = Contact.find_by(id: params[:id]) 
    @contacts.delete  
    render json: {message: "I've destroyed the contact!"}
  end  
end
