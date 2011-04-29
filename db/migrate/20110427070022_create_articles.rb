class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.string :mode
      t.string :category
      t.string :sub_category
      t.string :show_key

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
