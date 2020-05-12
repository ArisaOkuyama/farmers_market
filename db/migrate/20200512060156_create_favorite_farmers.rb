class CreateFavoriteFarmers < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_farmers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :farmer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
