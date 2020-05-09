class AddTypeToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :msg_type, :integer, default: 0
    add_column :messages, :url, :string
  end
end
