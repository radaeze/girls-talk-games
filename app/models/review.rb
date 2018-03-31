#== Schema Information
#
# Table name: reviews
#
#  id       :integer         not null, primary key
#  comments :text
#  user_id  :integer
#  game_id  :integer
#


class Review < ApplicationRecord
    belongs_to :game
    belongs_to :user
    validates :game_id, :presence => true
   
   
        
end 