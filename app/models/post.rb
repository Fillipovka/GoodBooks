class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
end
