require 'spec_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

	before(:all) do
	  @user = User.create(email: "coder@skillcrush", password: "password")
	end
 
	after(:all) do
	  if !@user.destroyed?
		@user.destroy
	  end
	end
 
	it 'authenticates and returns a user when valid email and password passed in' do
 		expect(User.authenticate("coder@skillcrush","password")).to eq(@user)
 		expect(User.authenticate("nope@skillcrush","xxx")).to be_nil
	end

end
