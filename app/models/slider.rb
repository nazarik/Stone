class Slider < ActiveRecord::Base
  AMOUNT = 5

  attr_accessible :image

  has_attached_file :image, path: ':class/:attachment/:id/:style/:filename'

  validates_attachment :image, presence: true,
                               content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) },
                               size: { in: 0..10.megabytes }
  validate :image_dimensions


private

  def image_dimensions
    temp_file = image.queued_for_write[:original]
    unless temp_file.nil?
      dimensions = Paperclip::Geometry.from_file(temp_file)
      errors.add(:image, 'Dimension should be 770x400 px')  if dimensions.width != 770 && dimensions.height != 400
    end
  end
end
