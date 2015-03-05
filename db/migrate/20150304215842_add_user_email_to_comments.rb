class AddUserEmailToComments < ActiveRecord::Migration
  def up
  	add_column :comments, :user_email, :string
  end
  def down
  	remove_column :comments, :user_email
  end
end
