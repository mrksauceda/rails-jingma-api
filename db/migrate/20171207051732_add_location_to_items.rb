class AddLocationToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :location, :string
  end
end
