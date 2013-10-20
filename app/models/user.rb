class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :notes, inverse_of: :user
end
