module ApplicationHelper
	def full_title(base_title)
		if base_title
			base_title + ' | Ruby on Rails Tutorial Sample App'
		else
			'Ruby on Rails Tutorial Sample App'
		end
	end
end
