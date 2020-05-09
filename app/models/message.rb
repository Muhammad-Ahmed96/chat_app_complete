class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  enum msg_type: {"text"=>0, "image"=>1}

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
