class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable,
         :validatable
  #Delete user and user associated data in all associated models
  has_many :projects, dependent: :destroy
  has_many :bugs, dependent: :destroy

  #scope :with_developer_assigned_projects, -> {joins(:projects).merge(Project.developer_assigned_projects)}

  enum user_type: [:qa, :developer, :manager]

  after_initialize :set_default_user_type, if: :new_record?
  validates :username, presence: true, length: {minimum: 5, maximum: 30}

  # set the default usertype to user/QA
  def set_default_user_type
    self.user_type ||= :developer
  end

end
 