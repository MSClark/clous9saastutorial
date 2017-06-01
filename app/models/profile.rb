#model file names are always singluar
class Profile < ActiveRecord::Base
  belongs_to :user
end