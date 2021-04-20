class AddAgeAndPictureToCat < ActiveRecord::Migration[6.0]
  def change
    add_column :cats, :age, :integer
    add_column :cats, :picture_url, :string
  end
end
