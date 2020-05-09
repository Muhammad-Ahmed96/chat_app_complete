class AddTimestampsToChannelsUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :channels_users, :created_at, :datetime, null: false
    add_column :channels_users, :updated_at, :datetime, null: false
  end
end
