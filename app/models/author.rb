class Author < ApplicationRecord
	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

	has_many :books
	has_and_belongs_to_many :categories

	has_attached_file :photo_author
	validates_attachment_content_type :photo_author, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :fName, length: {in: 2..40}
  validates :lName, length: {in: 2..50}
  validates :biography, length: { in: 200..10000 }, uniqueness: true
  validates :birthplace, length: {in: 10..300}

	def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['fName^10', 'lName^10', 'text'],
            operator: 'AND'
          }
        }
      }
    )
  end
end