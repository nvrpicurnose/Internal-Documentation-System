class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.integer :article_id
      t.integer :category_id

      t.timestamps null: false
    end
  end

  def down
  	drop_table :comments
  end
end
