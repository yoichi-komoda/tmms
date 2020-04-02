class CreateLifts < ActiveRecord::Migration[5.2]
  def change
    create_table :lifts do |t|
      t.string :name
      t.integer :set_count
      t.time :interval
      t.integer :position
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
