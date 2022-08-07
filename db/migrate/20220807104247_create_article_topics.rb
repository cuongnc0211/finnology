class CreateArticleTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :article_topics do |t|
      t.references :topic
      t.references :article

      t.timestamps
    end
  end
end
