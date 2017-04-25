class ContactsController < ApplicationController
  def new
   @contact = Contact.new
  end
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
#bring them back to the blank contact page with message sent or error
       redirect_to new_contact_path, notice: "Message sent."
    else
       redirect_to new_contact_path, notice: "Error occured."
    end
  end
# White list's params as a security feature using private keyword in order to mass assign
  private
    def contact_params
       params.require(:contact).permit(:name, :email, :comments) #mass assign: assign multiple things at once
    end
end