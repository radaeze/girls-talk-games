class DropTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :reviews
  end
end
