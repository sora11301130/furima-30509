class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,           null:false
      t.references :user
      t.integer :status_id,      null:false
      t.integer :category_id,   null:false
      t.integer :cost_id,        null:false
      t.integer :prefecture_code_id,          null:false
      t.integer :plan_id,        null:false
      t.integer :price,          null:false
      t.text :description,       null:false

      t.timestamps
    end


  end
end
