class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|

      t.string :postal_cord, presence: true
      t.integer :prefecture_id, presence: true
      t.string :city, presence: true
      t.string :address, presence: true
      t.string :building
      t.string :telephone, presence: true
      t.references :purchase, presence: true, foregien_key: true
      t.timestamps
    end
  end
end
