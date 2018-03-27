class AddDescriptionToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :description, :string
  end
end
