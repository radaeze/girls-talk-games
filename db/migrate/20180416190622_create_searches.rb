class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.text :games, default: [].to_yaml

      t.timestamps
    end
  end
end
