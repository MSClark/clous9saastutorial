class ContactMailer < ActionMailer::Base
  default to:'msclark3@asu.edu'
  
  def contact_email(name, email, body)
    @name=name
    @email=email
    @body=body
    
    mail(from: email, subject: 'Contact form submission')
  end
end