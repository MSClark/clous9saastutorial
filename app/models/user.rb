class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         belongs_to :plan
         # each user has one plan, and each plan has many users
  attr_accessor :stripe_card_token
  # if pro user passes validation, then call stripe and tell it to setup
  # a subscription upon charging customer card.
  # stripe responds with customer data and cust ID saved as cust token.
  def save_with_subscription
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, source: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
end
