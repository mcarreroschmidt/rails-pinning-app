class User < ActiveRecord::Base

	has_many :pins
	has_secure_password

	def self.authenticate(email, password)
		@u_search = User.find_by_email(email)
		if !@u_search.nil?
			@u = (@u_search.authenticate(password) ? @u_search : nil)
		else
			@u = nil
		end
		return @u
	end
end
