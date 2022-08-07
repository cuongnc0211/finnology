class Article < ApplicationRecord
  has_many :article_topics
  has_many :topics, through: :article_topics

  has_rich_text :content

  STATUSES = %w[drafting publish hiden]

  enum :status, STATUSES.zip(STATUSES).to_h
end
