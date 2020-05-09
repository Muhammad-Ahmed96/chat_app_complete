class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :channels
  has_many :messages, dependent: :destroy


  def notification_channels
    ChannelsUsers.where(read: false, user_id: self.id, channel_id: self.channels)
  end
end
