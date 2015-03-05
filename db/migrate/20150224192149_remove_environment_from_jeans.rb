class RemoveEnvironmentFromJeans < ActiveRecord::Migration
  def up
  	remove_column :articles, :environment
  end

  def down
  	add_column :articles, :environment, :string
  end
end
