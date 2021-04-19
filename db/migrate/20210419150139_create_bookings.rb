class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :cat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date_from
      t.date :date_to

      t.timestamps
    end
  end
end
