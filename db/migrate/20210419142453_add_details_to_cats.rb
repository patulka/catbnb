class AddDetailsToCats < ActiveRecord::Migration[6.0]
  def change
    add_column :cats, :name, :string
    add_column :cats, :breed, :string
    add_column :cats, :color, :string
    add_column :cats, :description, :text
  end
end
