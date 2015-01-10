class ChangePostSubTableName < ActiveRecord::Migration
  def change
    drop_table :post_sub_tables
  end
end
