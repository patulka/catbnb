class AddUserToCats < ActiveRecord::Migration[6.0]
  def change
    add_reference :cats, :user, null: false, foreign_key: true
  end
end
