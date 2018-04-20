class ChangeLimitOfUidInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :uid, :integer, limit: 8
  end
end
