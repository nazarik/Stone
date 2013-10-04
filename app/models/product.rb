class Product < ActiveRecord::Base
  RECENT_LIMIT = 12

  attr_accessible :description, :title, :category_id, :image

  belongs_to :category

  delegate :name, to: :category, prefix: true, allow_nil: true

  has_attached_file :image, styles: { small: '120x87#', medium: '270x180#' },
                            url: '/images/:class/:attachment/:id/:style/:filename',
                            path: ':rails_root/public/images/:class/:attachment/:id/:style/:filename'

  validates :category, presence: true
  validates_attachment :image, presence: true,
                               content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) },
                               size: { in: 0..10.megabytes }

  scope :recent, -> { order('updated_at desc').limit(RECENT_LIMIT) }

  def self.filter_by_category(category_id)
    return all if category_id.blank?
    joins(:category).where(categories: { id: category_id })
  end
end
