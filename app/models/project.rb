class Project < ApplicationRecord
    # associations
    has_many :bugs, dependent: :destroy
    belongs_to :user

    # validations for model    
    validates :project_name, presence: true, length: {minimum: 5, maximum: 100} # for project_name attribute
    validates :description, presence: true, length: {minimum: 10, maximum: 500} # for description attribute
    
end
