class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :price
      t.string :discount
      t.string :description
      t.string :image_url
      t.string :category
      t.boolean :is_private
      t.integer :user_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
