# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  uid             :integer
#  first_name      :string
#  last_name       :string
#  email           :string
#  password        :string
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string
#

class User < ApplicationRecord
    has_many :likes
   

    before_save :downcase_fields


    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true,
        length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
    # validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    has_secure_password
    
    validates :password, presence: true, length: { minimum: 6 }    
    
   private

    def downcase_fields
        email.downcase!
        #username.downcase!
    end    
end
