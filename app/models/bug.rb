class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_one_attached :image


  enum bug_type: [:feature, :bug]
  enum feature_status: [:feature_new, :feature_started, :feature_completed]
  enum bug_status: [:bug_new, :bug_started, :bug_resolved]

  # validations for model    
  validates :title, presence: true, length: {minimum: 6, maximum: 100}
  validates :description, presence: true, length: {minimum: 10, maximum: 500} 
  validate :correct_image_type

  private
  def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/png image/gif))
      errors.add(:image, 'Must be a png or a gif file')
    end
  end
end
