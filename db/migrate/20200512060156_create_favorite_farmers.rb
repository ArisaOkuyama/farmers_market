class CreateFavoriteFarmers < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_farmers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :farmer, null: false, foreign_key: true

      t.timestamps
      t.index [:user_id, :farmer_id], unique: true
    end
  end
end
