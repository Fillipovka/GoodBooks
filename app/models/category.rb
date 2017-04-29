class Category < ApplicationRecord
	has_and_belongs_to_many :books
	has_and_belongs_to_many :authors

	validates :genre, presence: true, uniqueness: true
end
