class CreateFarms < ActiveRecord::Migration[6.0]
  def change
    create_table :farms do |t|
      t.string :name
      t.string :farmer_name
      t.string :state
      t.string :address

      t.timestamps
    end
  end
end
