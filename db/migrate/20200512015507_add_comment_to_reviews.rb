class AddCommentToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :farm, null: false, foreign_key: true
    add_reference :reviews, :user, null: false, foreign_key: true
    add_column :reviews, :comment, :string
    add_column :reviews, :rating, :string
  end
end
