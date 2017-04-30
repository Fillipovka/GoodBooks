class User < ApplicationRecord
  attr_accessor :remember_token

  before_save { email.downcase! }
  before_save   :downcase_email

  has_and_belongs_to_many :categories
  
  has_many :posts, dependent: :destroy

  has_many :likes
  has_many :liked_posts, :through => :likes, :source => :post

  has_many :comments

  has_many :active_friends, class_name: "Friend", 
                            foreign_key: "follower_id", 
                            dependent: :destroy
  has_many :following, through: :active_friends, source: :followed
  

  has_many :passive_friends, class_name:  "Friend",
                             foreign_key: "followed_id",
                             dependent: :destroy
  has_many :followers, through: :passive_friends, source: :follower

  
  has_many :favorite_books, dependent: :destroy
  has_many :books, through: :favorite_books

	validates :name, presence: true, length: { maximum: 40 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
  validates :email, presence: true, length: { maximum: 100 }, format: {with: VALID_EMAIL_REGEX}, 
	          uniqueness: { case_sensitive: false }
  
  has_secure_password

  validates :password, presence: true, length: { minimum: 8 }

  has_attached_file :photo_user, 
    :default_url => "avatar2.jpg"

  validates_attachment_content_type :photo_user, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost    	
    BCrypt::Password.create(string, cost: cost)
  end

  def remember
    self.remember_token = SecureRandom.urlsafe_base64
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token) 
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def feed
    following_ids = "SELECT followed_id FROM friends WHERE follower_id = :user_id"
    Post.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end

  def favorite_book?(book)
    books.include?(book)
  end

  def favorite(book)
    books << book
  end

  def unfavorite(book)
    books.delete(book)
  end

  def liking_post?(post)
    liked_posts.include?(post)
  end

  def like(post)
    liked_posts << post
  end

  def dislike(post)
    liked_posts.delete(post)
  end
  
  private    
    def downcase_email
      self.email = email.downcase
    end
end