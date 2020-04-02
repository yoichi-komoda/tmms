class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.integer :part_number
      t.integer :reps
      t.integer :weight
      t.references :lift, foreign_key: true

      t.timestamps
    end
  end
end
