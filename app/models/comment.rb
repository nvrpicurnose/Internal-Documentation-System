class Comment < ActiveRecord::Base
	has_many :commentaries
	has_many :article, :through=>:commentaries
	has_many :category, :through=>:commentaries
end
