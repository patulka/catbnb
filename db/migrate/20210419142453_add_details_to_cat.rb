class AddDetailsToCat < ActiveRecord::Migration[6.0]
  def change
    add_column :cats, :name, :string
    add_column :cats, :breed, :string
    add_column :cats, :color, :string
    add_column :cats, :description, :text
    add_reference :cats, :user, null: false, foreign_key: true
  end
end
