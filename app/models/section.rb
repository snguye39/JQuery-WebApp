class Section < ApplicationRecord
	belongs_to :course
	has_and_belongs_to_many :students

	def info
		"#{course.name} - #{course.department} #{course.number}:#{number}"
	end
end
