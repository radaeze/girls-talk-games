# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  uid             :integer(8)
#  first_name      :string
#  last_name       :string
#  email           :string
#  password        :string(8)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string
#  username        :string
#  bio             :string          default("No bio")
#  provider        :string
#  picture         :string
#  admin           :boolean
#

class User < ApplicationRecord
    acts_as_voter
    has_many :likes
    has_many :posts, dependent: :destroy
    has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
    has_many :following, through: :active_relationships, source: :followed
    
    has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
    has_many :followers, through: :passive_relationships, source: :follower
    
    mount_uploader :picture, PictureUploader
    validate  :picture_size
    def self.from_omniauth(auth)
      require 'faker'
      where(email: auth.info.email).first_or_initialize.tap do |user|
       user.email = auth.info.email
       user.password = Faker::Name.unique.name
       user.save!
      end   
    end

    before_save :downcase_fields
     #validates :username,  presence: true,
         #length: { maximum: 50 },
        # uniqueness: { case_sensitive: false }
        


    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true,
        length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
    # validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    has_secure_password
    
    validates :password, presence: true, length: { minimum: 3 }, allow_nil: true
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

    # def admin
    #     has_role?(:admin)
    # end

    def admin
        self.email == "ramdavis@mills.edu" || "bcantwell@mills.edu " || "kxu@mills.edu" || "ramia.davis@gmail.com"
    end
    

  
   #private

    def downcase_fields
        email.downcase!
        #username.downcase!
    end 
    
         # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
    
    private
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
    
end
