class CreateFavoriteFarms < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_farms do |t|
      t.references :user, null: false, foreign_key: true
      t.references :farm, null: false, foreign_key: true

      t.timestamps
    end
  end
end
