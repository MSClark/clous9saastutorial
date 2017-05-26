class Users::RegistrationsController < Devise::RegistrationsController
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
end