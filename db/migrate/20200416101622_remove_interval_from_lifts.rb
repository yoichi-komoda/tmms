class RemoveIntervalFromLifts < ActiveRecord::Migration[5.2]
  def change
    remove_column :lifts, :interval, :time
  end
end
