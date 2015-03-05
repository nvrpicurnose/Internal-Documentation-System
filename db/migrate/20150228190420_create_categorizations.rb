class CreateCategorizations < ActiveRecord::Migration
  def up
    create_table :categorizations do |t|
      t.integer :article_id
      t.integer :category_id

      t.timestamps null: false
    end
    add_index :categorizations, ['article_id', 'category_id']
  end

  def down
  	drop_table :categorizations
  end
end
