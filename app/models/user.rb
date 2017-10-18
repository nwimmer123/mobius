class User < ApplicationRecord
  has_secure_password
  has_many :historys

  def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end
  
  def is_authorized?
    current_user == @user  
  end

  def set_credit_default
    
  end

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email
  validates :email, format: {with: /@/}
  
end
