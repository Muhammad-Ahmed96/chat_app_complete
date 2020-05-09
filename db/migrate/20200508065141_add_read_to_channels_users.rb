class AddReadToChannelsUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :channels_users, :read, :boolean
  end
end
