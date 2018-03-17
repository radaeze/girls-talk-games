class AddBioToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bio, :string, default: "No bio"
  end
end
