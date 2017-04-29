class Article < ApplicationRecord
	has_and_belongs_to_many :books

	has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :comments, as: :commentable

	has_attached_file :photo_article
	validates_attachment_content_type :photo_article, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def self.tagged_with(name)
    Tag.find_by!(tag_name: name).articles
  end

  def self.tag_counts
    Tag.joins(:taggings).select('tags.id, tags.tag_name, count(taggings.tag_id) as count').
    		group('taggings.tag_id, tags.id, tags.tag_name ')
  end

  def tag_list
    tags.map(&:tag_name).join(' ')
  end

  def tag_list=(names)
    self.tags = names.split(' ').map do |n|
      Tag.where(tag_name: n.strip).first_or_create!
    end
  end

end