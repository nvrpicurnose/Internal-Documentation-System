class CreateTiminggs < ActiveRecord::Migration
  def up
    create_table :timinggs do |t|

      t.timestamps null: false
    end
  end

  def down
  	drop_table :timinggs
  end
end
