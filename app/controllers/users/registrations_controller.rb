class Users::RegistrationsController < Devise::RegistrationsController
  before_action :select_plan, only: :new
  # run this code ^ only with new action, function below
  
  # extend default devise gem so that users signing up with pro account
  # so that pro users save with special subscription function
  # otherwise devise signs up user for basic plan
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
  
  private
  # makes sure user is signing up for only plan 1 or 2, no others
  def select_plan
    unless (params[:plan] == '1' || params[:plan] == '2')
      flash[:notice] = "Please select a membership plan to sign up."
      redirect_to root_url
    end
  end
end