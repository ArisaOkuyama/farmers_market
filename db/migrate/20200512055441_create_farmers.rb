class CreateFarmers < ActiveRecord::Migration[6.0]
  def change
    create_table :farmers do |t|
      t.string :farm_name
      t.string :first_name
      t.string :last_name
      t.string :state
      t.string :address

      t.timestamps
    end
  end
end
