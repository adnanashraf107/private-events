class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.references :events
      t.references :users
      t.timestamps
    end
  end
end
