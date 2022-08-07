class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.text :status
      t.date :spotlight_until

      t.timestamps
    end
  end
end
