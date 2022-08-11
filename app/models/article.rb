class Article < ApplicationRecord
  has_rich_text :content
  has_one_attached :cover

  acts_as_taggable_on :tags

  has_many :article_topics
  has_many :topics, through: :article_topics

  STATUSES = %w[drafting publish hiden]

  enum :status, STATUSES.zip(STATUSES).to_h

  def tag_list_value
    tag_list&.join(', ')
  end
end
