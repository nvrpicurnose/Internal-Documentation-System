class CreateCommentaries < ActiveRecord::Migration
  def up
    create_table :commentaries do |t|
      t.integer :article_id
      t.integer :category_id

      t.timestamps null: false
    end
    add_index :commentaries, ['article_id', 'category_id']
  end

  def down
  	drop_table :commentaries
  end
end
