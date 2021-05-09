class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,           null: false
      t.references :user,       null: false, foreign_key: true
      t.text :product_detail,   null: false
      t.integer :price,         null: false
      t.integer :category_id,   null: false
      t.integer :status_id,     null: false
      t.integer :postage_id,    null: false
      t.integer :prefecture_id, null: false
      t.integer :shipment_id,   null: false

      t.timestamps
    end
  end
end