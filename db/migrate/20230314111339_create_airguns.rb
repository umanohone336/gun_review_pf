class CreateAirguns < ActiveRecord::Migration[6.1]
  def change
    create_table :airguns do |t|

      t.integer :category_id,     null: false
      t.integer :user_id,          null: false
      t.string :gun_name,          null: false
      t.text :gun_caption,         null: false
      t.timestamps
    end
  end
end
