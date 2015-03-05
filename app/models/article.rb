class Article < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  	has_attached_file :document, :default_url => "/images/:style/missing.png"
  	has_attached_file :shortcut, :default_url => "/images/:style/missing.png"
	has_attached_file :template, :default_url => "/images/:style/missing.png"
	has_attached_file :misc, :default_url => "/images/:style/missing.png"

	validates_presence_of	:title
	validates_presence_of	:timing
	validates_presence_of	:document
	validates_presence_of	:overview
	validates_presence_of	:reference
	validates_presence_of	:tag_list

 	acts_as_taggable

 	searchable do
 		text :title, :boost=>5
 		text :timing
 		text :team
 		text :reference
 		text :tag_list, :boost=>3
 	end

 	has_many :categorizations
 	has_many :category, :through=>:categorizations
end
