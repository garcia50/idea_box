class RemovePartNumberFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :part_number, :string
  end
end
