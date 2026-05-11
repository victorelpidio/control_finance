class DropBanks < ActiveRecord::Migration[7.2]
  def change
    drop_table :banks
  end
end
