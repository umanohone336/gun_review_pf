class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :user_id,          null: false, default: ""
      t.text :review_body,         null: false, default: ""
      t.timestamps
    end
  end
end
