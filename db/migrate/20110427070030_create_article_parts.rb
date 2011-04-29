class CreateArticleParts < ActiveRecord::Migration
  def self.up
    create_table :article_parts do |t|
      t.integer :user_id
      t.integer :article_id
      t.string :title
      t.text :content
      t.integer :number

      t.timestamps
    end
  end

  def self.down
    drop_table :article_parts
  end
end
