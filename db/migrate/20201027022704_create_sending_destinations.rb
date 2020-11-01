class CreateSendingDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :sending_destinations do |t|
      t.string :post_code,   default: "",    null:false
      t.integer :prefecture_code_id,     null:false
      t.string :city,   default: "",     null:false
      t.string :house_number,   default: "",     null:false
      t.string :build_number,  default: ""
      t.string :phone_number,   default: "",    null:false
      t.references :order
      t.timestamps
    end
  end
end
