require 'elasticsearch/model'

class Book < ApplicationRecord
	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

	has_and_belongs_to_many :categories
	belongs_to :author

	has_attached_file :photo_book
  
  has_many :favorite_books, dependent: :destroy
  has_many :users, through: :favorite_books

  has_many :comments, as: :commentable

	validates_attachment_content_type :photo_book, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^10', 'text']
          }
        }
      }
    )
  end
end