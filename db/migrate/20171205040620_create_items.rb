class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :price
      t.integer :discount
      t.string :description
      t.string :image_url
      t.string :category
      t.boolean :is_private
      t.integer :user_id
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
