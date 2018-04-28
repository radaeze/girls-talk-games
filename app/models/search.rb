# == Schema Information
#
# Table name: searches
#
#  id         :integer         not null, primary key
#  games      :text            default("--- []\n")
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Search < ApplicationRecord
    serialize :games
end
