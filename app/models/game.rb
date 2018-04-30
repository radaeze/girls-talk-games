# == Schema Information
#
# Table name: games
#
#  id          :integer         not null, primary key
#  name        :string
#  description :string
#  image       :string
#

class Game < ApplicationRecord
     acts_as_votable
     validates :name,  presence: true,
        uniqueness: { case_sensitive: false }
        
     def score
        self.get_upvotes.size - self.get_downvotes.size
     end
  
end
