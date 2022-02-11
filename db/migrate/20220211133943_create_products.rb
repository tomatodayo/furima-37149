class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_title,         null: false
      t.text :product_concept,         null: false
      t.integer :product_category_id,  null: false
      t.integer :product_situation_id, null: false
      t.integer :send_load_id,         null: false
      t.integer :send_source_area_id,  null: false
      t.integer :send_day_id,          null: false
      t.integer :product_price,        null: false
      t.references :user,              null: false, foreign_key: true

      t.timestamps
    end
  end
end
