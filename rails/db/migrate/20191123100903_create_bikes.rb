class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.string :description
      t.integer :price_per_hour
      t.boolean :available
      t.references :user, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
