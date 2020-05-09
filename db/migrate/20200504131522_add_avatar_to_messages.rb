class AddAvatarToMessages < ActiveRecord::Migration[6.0]
  def up
    add_attachment :messages, :avatar
  end

  def down
    remove_attachment :messages, :avatar
  end
end
