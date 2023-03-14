class CreateAirguns < ActiveRecord::Migration[6.1]
  def change
    create_table :airguns do |t|

      t.integer :category_id,          null: false, default: ""
      t.integer :user_id,          null: false, default: ""
      t.string :gun_name,          null: false, default: ""
      t.text :gun_caption,         null: false, default: ""
      t.timestamps
    end
  end
end
