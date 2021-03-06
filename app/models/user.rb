class User < ActiveRecord::Base
  has_many :activities
  has_many :comments
  has_many :commented_posts, :class_name => "Micropost" ,
               :through => :comments, :source => :micropost
  has_and_belongs_to_many :interest_tags 
  has_many :microposts, dependent: :destroy

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy


   has_many :following, through: :active_relationships, source: :followed
   has_many :followers, through: :passive_relationships, source: :follower
  
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { in: 9..30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
    has_secure_password      # A magic method!!
     validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  # Returns the hash digest of a string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

 def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

 def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

   def following?(other_user)
    following.include?(other_user)
  end


  def feed
                Micropost.where("user_id = ?", id)
            end
end