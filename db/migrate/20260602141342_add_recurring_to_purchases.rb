class AddRecurringToPurchases < ActiveRecord::Migration[7.2]
  def change
    add_column :purchases, :recurring, :boolean, default: true, null: false
  end
end
