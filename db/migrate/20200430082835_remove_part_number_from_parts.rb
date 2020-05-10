class RemovePartNumberFromParts < ActiveRecord::Migration[5.2]
  def change
    remove_column :parts, :part_number, :integer
  end
end
