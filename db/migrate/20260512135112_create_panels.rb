class CreatePanels < ActiveRecord::Migration[7.2]
  def change
    create_table :panels do |t|
      t.integer :month
      t.integer :year
      t.decimal :pay

      t.timestamps
    end
  end
end
