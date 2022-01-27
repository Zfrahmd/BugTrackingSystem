class Project < ApplicationRecord
    has_many :bugs, dependent: :destroy
    belongs_to :user

    scope :projects_created_by_manager, -> {where(user_id: current_user.id)}
    scope :projects_assigned_to_dev, -> {where(dev_id: current_user.id)}
    scope :projects_assigned_to_qa, -> {where(qa_id: current_user.id)}
    

    validates :project_name, presence: true, length: {minimum: 5, maximum: 100}
    validates :description, presence: true, length: {minimum: 10, maximum: 500}
    validates :dev_id, presence: true
    validates :qa_id, presence: true
end
