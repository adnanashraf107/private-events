class AddCreatorToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :user_id, :integer
    add_foreign_key :events, :users
  end
end
