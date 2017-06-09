class UsersController < ApplicationController
  #makes sure user is logged in to view profiles
  before_action :authenticate_user!
  
  # GET to /users/:id
  def show
    @user = User.find( params[:id] )
    #capital U in User refers to model file
  end
end