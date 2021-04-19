class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|

      t.references :user, presence: true, foregien_key: true
      t.references :item, presence: true, foregien_key: true
      t.timestamps
    end
  end
end
