class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :environment
      t.string :timing
      t.string :team
      t.text :overview
      t.string :reference

      t.timestamps null: false
    end
  end
end
