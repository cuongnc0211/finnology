class Topic < ApplicationRecord
  belongs_to :topic, optional: true
  belongs_to :article, optional: true
end
