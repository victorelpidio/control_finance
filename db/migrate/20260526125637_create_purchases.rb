class CreatePurchases < ActiveRecord::Migration[7.2]
  def change
    create_table :purchases do |t|
      t.string :description
      t.decimal :value
      t.date :date
      t.references :bank, null: false, foreign_key: true
      t.references :panel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
