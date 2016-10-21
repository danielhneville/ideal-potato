class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.references :shoe, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
