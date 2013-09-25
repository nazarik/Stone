class Category < ActiveRecord::Base
  attr_accessible :description, :name, :image, :title

  has_many :products

  has_attached_file :image, styles: { small: '270x146#' },
                            path: ':class/:attachment/:id/:style/:filename'


  validates :name, :description, :title, presence: true
  validates_attachment :image, presence: true,
                               content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) },
                               size: { in: 0..10.megabytes }
  validate :image_dimensions

  scope :with_products, -> { joins(:products).where('products.id IS NOT NULL') }

private

  def image_dimensions
    temp_file = image.queued_for_write[:original]
    unless temp_file.nil?
      dimensions = Paperclip::Geometry.from_file(temp_file)
      errors.add(:image, 'Dimension should be 350x350 px')  if dimensions.width != 350 && dimensions.height != 350
    end
  end
end
