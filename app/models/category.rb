class Category < ActiveRecord::Base
	has_many :categorizations
	has_many :article, :through=> :categorizations

	has_ancestry
end
