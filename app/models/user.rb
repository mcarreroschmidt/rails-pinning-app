class User < ActiveRecord::Base
	def self.authenticate(email, password)
		u_search = User.find_by_email(email)
		if u_search.present?
			u = (u_search[:password] == password ? u_search : nil)
		else
			u = nil
		end
	end
end
