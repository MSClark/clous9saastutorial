class ProfilesController < ApplicationController
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
      redirect_to user_path( params[:user_id] ) #takes id from url
    else
#Todo: insert error message here      
      render action: :new
    end
  end
  
private
  #whitelisting form params for security
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
  end
end