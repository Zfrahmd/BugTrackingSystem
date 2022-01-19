class Bug < ApplicationRecord
  belongs_to :project
  has_one_attached :image

  # validations for model    
  validates :title, presence: true, length: {minimum: 6, maximum: 100}
  validates :description, presence: true, length: {minimum: 10, maximum: 500} 
  validate :correct_document_mime_type
  
  private
  def correct_document_mime_type
    if image.attached? && !image.content_type.in?(%w(image/png image/gif))
      errors.add(:image, 'Must be a png or a gif file')
    end
  end

end
