class Plan < ActiveRecord::Base
  # dont need to put plan attributes here because plan inherits from activerecord, 
  # which knows about the database from the schema file
  has_many :users
  # each user has one plan, and each plan has many users
end