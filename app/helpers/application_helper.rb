module ApplicationHelper

	def fullname(name)
		name.firstname + name.lastname
	end

	def age(dob)
		Time.now.year - dob.year
	end
end
