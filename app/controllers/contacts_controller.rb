class ContactsController < ApplicationController
  
  def new
   @contact = Contact.new 
   # here rails says go look at the model file because of the capital C in Contact, 
   # finds validations in model file and makes note of them 
   # then goes to 'new' view
  end
  
  def create
    # mass assignment of form fields into contact object
    @contact = Contact.new(contact_params)
    # save contact object to db
    if @contact.save
#bring them back to the blank contact page with message sent or error
        flash[:success]="Message sent"
       redirect_to new_contact_path
    else
       # if contact doesnt save, store errors in flash hash and redirect to new page
       flash[:danger] = @contact.errors.full_messages.join(", ") 
       #join omits "" and [] and delimits with ' and space
       redirect_to new_contact_path
    end
  end
  
# white list's params as a security feature using private keyword in order to mass assign
  private
    def contact_params
       params.require(:contact).permit(:name, :email, :comments) 
       #mass assign: assign multiple things at once
    end
end