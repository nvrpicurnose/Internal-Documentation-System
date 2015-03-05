class Timingg < ActiveRecord::Base

	 searchable do
 		text :title, :boost=>5
 		text :timing
 		text :team
 		text :reference
 		text :tag_list, :boost=>3
 	end
 	
end
