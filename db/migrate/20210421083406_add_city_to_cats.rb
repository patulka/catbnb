class AddCityToCats < ActiveRecord::Migration[6.0]
  def change
    add_column :cats, :city, :string
  end
end
