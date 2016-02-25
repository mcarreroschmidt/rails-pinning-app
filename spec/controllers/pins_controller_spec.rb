require 'spec_helper'
RSpec.describe PinsController do

#	it "displays a link to a person's show page on the index view" do
#		get("/people")
#		expect(last_response.body.include?("/people/#{@person.id}")).to be(true)
#	end

	describe "GET index" do

		it 'GET index renders the INDEX template' do
			get :index
			expect(response).to render_template("index")
		end

		it 'GET index returns @pins with all PINS from the DB' do
			get :index
			expect(assigns[:pins]).to eq(Pin.all)
		end

	end

end