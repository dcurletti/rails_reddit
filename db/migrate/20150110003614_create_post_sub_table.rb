class CreatePostSubTable < ActiveRecord::Migration
  def change
    create_table :post_sub_tables do |t|
      t.integer :post_id, null: false
      t.integer :sub_id, null: false

      t.timestamps
    end
  end
end
