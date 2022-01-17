class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable
  
  enum user_type: [:user, :developer, :manager]
  after_initialize :set_default_user_type, if: :new_record?

  # set the default usertype to user/QA
  def set_default_user_type
    self.user_type ||= :user
  end

  
end
