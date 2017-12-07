class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :avatar_url, :string
    add_column :users, :gender, :string
    add_column :users, :province, :string
    add_column :users, :city, :string
  end
end
