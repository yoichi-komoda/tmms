class AddIntervalToLifts < ActiveRecord::Migration[5.2]
  def change
    add_column :lifts, :interval, :integer
  end
end
