class AddAttachmentImageToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :image
      t.attachment :document
      t.attachment :shortcut
      t.attachment :template
      t.attachment :misc
    end
  end

  def self.down
    remove_attachment :articles, :image
    remove_attachment :articles, :document
    remove_attachment :articles, :shortcut
    remove_attachment :articles, :template
    remove_attachment :articles, :misc
  end
end
