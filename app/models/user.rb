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
#  username        :string
#  bio             :string          default("No bio")
#

class User < ApplicationRecord
    has_many :likes
    has_many :reviews
    has_many :games, :through => :reviews
    

    before_save :downcase_fields
    validates :username,  presence: true,
        length: { maximum: 50 },
        uniqueness: { case_sensitive: false }
        


    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true,
        length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
    # validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    has_secure_password
    
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    # Returns the hash digest of the given string.
    def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
    end
    
      # Returns a random token.
    def User.new_token
      SecureRandom.urlsafe_base64
    end

    def admin
        has_role?(:admin)
    end

    def admin
        self.id == 1
    end
  
   #private

    def downcase_fields
        email.downcase!
        #username.downcase!
    end  
    
end
