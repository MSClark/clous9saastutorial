class Contact < ActiveRecord::Base
   # sort of blueprint for the class, but doesnt have anything yet because ruby goes the the DB and sees the object attributes for a contact  
    validates :name, presence: true
    validates :email, presence:true
    validates :comments, presence:true
end