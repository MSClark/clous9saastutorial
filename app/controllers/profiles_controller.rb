class ProfilesController < ApplicationController
  #makes sure user is logged in to view profiles
  before_action :authenticate_user! #can limit filters ex. only: [:new, edit] right after :authenticate_user!
  before_action :only_current_user
  
  # GET to /users/:user_id/profile/new
  def new
    # need to define profile instance var so new.html knows it exists
    @profile = Profile.new
  end
  
  # POST to /users/:user_id/profile
  def create
  # Ensure that we have the user who is filling out form
    @user = User.find( params[:user_id] )
    #capital U in User refers to model file
  # Create profile linked to this specific user
    @profile = @user.build_profile( profile_params )
    #build is a rails def, creates association in db... 
    #...w/ foreign key for you so you dont have to do it manually vs using profile.new
    #if it profile were plural it would be profiles.build
    
    if @profile.save
      flash[:success] = "Profile updated!"
      redirect_to user_path(params[:user_id]) #takes id from url
    else
#Todo: insert error message here      
      render action: :new
    end
  end
  
  #Get to /users/:user_id/profile/edit
  def edit 
    @user=User.find(params[:user_id])
    @profile=@user.profile 
  end
  
  #PUT to  /users/:user_id/profile
  def update
    #retrieve user from db, User.find goes into db
    @user=User.find(params[:user_id])
    @profile=@user.profile 
    #update_attributes is a rails function, profile_params does mass assignment
    if @profile.update_attributes(profile_params)
      flash[:success]="Profile Updated"
      #redirect user to profile page
      redirect_to user_path(params[:user_id])
    else 
      render action :edit
      flash[:error]="Error occured, unable to update profile"
    end
  end
  
private
  #whitelisting form params for security
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
  end
  #keep people from performing actions on other profiles
  def only_current_user
    @user=User.find(params[:user_id])
    redirect_to(root_url) unless @user == current_user #current user is from devise
  end
end