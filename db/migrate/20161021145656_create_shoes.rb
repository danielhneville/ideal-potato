class CreateShoes < ActiveRecord::Migration[5.0]
  def change
    create_table :shoes do |t|
      t.string :name
      t.float :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
