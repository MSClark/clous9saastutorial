class UsersController < ApplicationController
  #makes sure user is logged in to view profiles
  before_action :authenticate_user!
  
  def index
    @users=User.includes(:profile) #includes, sql joins items so there arent as many db queries
  end
  
  # GET to /users/:id
  def show
    @user = User.find( params[:id] )
    #capital U in User refers to model file
  end
end