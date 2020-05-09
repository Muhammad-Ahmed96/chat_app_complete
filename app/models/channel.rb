class Channel < ApplicationRecord

  validates :name, uniqueness: true
  has_many :messages, dependent: :destroy
  has_and_belongs_to_many :users

end
