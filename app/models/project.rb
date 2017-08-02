class Project < ActiveRecord::Base
	belongs_to :student

	def self.search(search)
		where("name LIKE ?", "%#{search}%")
	end

end
