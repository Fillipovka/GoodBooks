class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :commentable
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
end
