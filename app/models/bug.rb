class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_one_attached :image

  enum bug_type: [:feature, :bug]
  enum feature_status: [:feature_new, :feature_started, :feature_completed]
  enum bug_status: [:bug_new, :bug_started, :bug_resolved]
   
  validates :title, presence: true, uniqueness: { scope: :project_id }, length: {minimum: 6, maximum: 100}
  validates :bug_type, presence: true
  validates :feature_status, :bug_status, presence: true
  validates :description, presence: true, length: {minimum: 10, maximum: 500}
  validate :correct_image_type
  validate :deadline_cannot_be_in_the_past
  

  private

  def deadline_cannot_be_in_the_past
    if Date.parse(deadline.to_s).past? || deadline.strftime("%I:%M%p") < Time.now.strftime("%I:%M%p")
      errors.add(:deadline, "can't be in the past")
    end
  end

  def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/png image/gif))
      errors.add(:image, 'Must be a png or a gif file')
    end
  end
end
