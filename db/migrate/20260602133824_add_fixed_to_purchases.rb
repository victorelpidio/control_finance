class AddFixedToPurchases < ActiveRecord::Migration[7.2]
  def change
    add_column :purchases, :fixed, :boolean, default: false, null: false
  end
end
