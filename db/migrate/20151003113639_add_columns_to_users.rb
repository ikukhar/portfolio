class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :phone, :string
    add_column :users, :date_of_birth, :datetime
  end
end
