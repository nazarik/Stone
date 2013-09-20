class User < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :validatable, :rememberable

  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name

  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
