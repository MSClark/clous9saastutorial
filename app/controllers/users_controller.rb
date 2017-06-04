class UsersController < ApplicationController
  # GET to /users/:id
  def show
    @user = User.find( params[:id] )
    #capital U in User refers to model file
  end
end