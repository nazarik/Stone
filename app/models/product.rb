class Product < ActiveRecord::Base
  RECENT_LIMIT = 12

  attr_accessible :description, :title, :category_id, :image

  belongs_to :category

  has_attached_file :image, styles: { small: '120x87#', medium: '270x180#' },
                            path: ':class/:attachment/:id/:style/:filename'

  validates :title, :description, :category, presence: true
  validates_attachment :image, presence: true,
                               content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) },
                               size: { in: 0..10.megabytes }

  scope :recent, -> { order('updated_at desc').limit(RECENT_LIMIT) }
end
