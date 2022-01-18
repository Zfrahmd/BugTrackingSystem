class Project < ApplicationRecord
    # validations for model    
    validates :project_name, presence: true, length: {minimum: 6, maximum: 100} # for project_name attribute
    validates :description, presence: true, length: {minimum: 10, maximum: 500} # for description attribute

end