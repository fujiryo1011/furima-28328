class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postalcoad, null:false
      t.integer :prefecture_id, null:false
      t.string :city, null:false
      t.string :house_number, null:false
      t.string :building
      t.string :phone, null:false
      t.references :buyer, null:false

      t.timestamps
    end
  end
end
