class AddUserToFarmers < ActiveRecord::Migration[6.0]
  def change
    add_reference :farmers, null: false :user, foreign_key: true
  end
end
