class User < ActiveRecord::Base
	def self.authenticate(email, password)
		if(email != "")
			u_search = User.find_by_email(email)
			u = (u_search[:password] == password ? u_search : nil)
		else
			u = nil
		end
	end
end
