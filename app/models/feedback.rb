class Feedback < ActiveRecord::Base
  attr_accessible :email, :message, :name, :phone

  validates :message, :name, :phone, :email, presence: true
  validates :email, format: { with: Devise.email_regexp }, if: -> { email.present? }

  scope :already_seen, ->(boolean=false) { where(watched: boolean) }
end
