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
     validates :name,  presence: true,
        uniqueness: { case_sensitive: false }
  
end
