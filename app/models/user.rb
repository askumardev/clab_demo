class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :messages

  def full_name
    "#{first_name} #{last_name}"
  end
end
