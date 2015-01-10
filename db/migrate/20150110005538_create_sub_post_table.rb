class CreateSubPostTable < ActiveRecord::Migration
  def change
    create_table :sub_posts do |t|
      t.integer :sub_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
