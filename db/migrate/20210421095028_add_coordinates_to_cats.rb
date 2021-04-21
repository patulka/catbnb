class AddCoordinatesToCats < ActiveRecord::Migration[6.0]
  def change
    add_column :cats, :latitude, :float
    add_column :cats, :longitude, :float
  end
end
