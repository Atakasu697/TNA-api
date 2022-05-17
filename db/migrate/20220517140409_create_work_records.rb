class CreateWorkRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :work_records do |t|
      t.integer :category_id
      t.integer :user_id
      t.time :date_time

      t.timestamps
    end
  end
end
