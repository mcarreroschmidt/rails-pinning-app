require 'spec_helper'
RSpec.describe PinsController do

#	it "displays a link to a person's show page on the index view" do
#		get("/people")
#		expect(last_response.body.include?("/people/#{@person.id}")).to be(true)
#	end

	describe "GET index" do

		it 'renders the INDEX template' do
			get :index
			expect(response).to render_template("index")
		end

		it 'returns @pins with all PINS from the DB' do
			get :index
			expect(assigns[:pins]).to eq(Pin.all)
		end

	end

	describe "GET new" do
		it 'responds with successfully' do
			get :new
			expect(response.success?).to be(true)
		end

		it 'renders the new view' do
			get :new      
			expect(response).to render_template(:new)
		end

		it 'assigns an instance variable to a new pin' do
			get :new
			expect(assigns(:pin)).to be_a_new(Pin)
		end
	end

	describe "POST create" do
		before(:each) do
			@pin_hash = { 
				title: "Rails Wizard", 
				url: "http://railswizard.org", 
				slug: "rails-wizard", 
				text: "A fun and helpful Rails Resource",
				category_id: "1"
			}
		end

		after(:each) do
			pin = Pin.find_by_slug("rails-wizard")
			if !pin.nil?
				pin.destroy
			end
		end

		it 'responds with a redirect' do
			post :create, pin: @pin_hash
			expect(response.redirect?).to be(true)
		end

		it 'creates a pin' do
			post :create, pin: @pin_hash  
			expect(Pin.find_by_slug("rails-wizard").present?).to be(true)
		end

		it 'redirects to the show view' do
			post :create, pin: @pin_hash
			expect(response).to redirect_to(pin_url(assigns(:pin)))
		end

		it 'redisplays new form on error' do
			# The title is required in the Pin model, so we'll
			# delete the title from the @pin_hash in order
			# to test what happens with invalid parameters
			@pin_hash.delete(:title)
			post :create, pin: @pin_hash
			expect(response).to render_template(:new)
		end

		it 'assigns the @errors instance variable on error' do
			# The title is required in the Pin model, so we'll
			# delete the title from the @pin_hash in order
			# to test what happens with invalid parameters
			@pin_hash.delete(:title)
			post :create, pin: @pin_hash
			expect(assigns[:errors].present?).to be(true)
		end    

	end
	
	describe "GET edit" do
		before(:each) do
			@pin_hash = { 
				title: "Rails Wizard", 
				url: "http://railswizard.org", 
				slug: "rails-wizard", 
				text: "A fun and helpful Rails Resource",
				category_id: "1"
			}
			@pin = Pin.create(@pin_hash)
		end

		after(:each) do
			@pin = Pin.find_by_slug("rails-wizard")
			if !@pin.nil?
				@pin.destroy
			end
		end

		it 'responds with successfully' do
			get :edit, id: @pin.id
			expect(response.success?).to be(true)
		end

		it 'renders the EDIT template' do
			get :edit, id: @pin.id
			expect(response).to render_template(:edit)
		end
		
		it 'assigns the @pin instance variable to the Pin with the appropriate id' do
			get :edit, id: @pin.id
			expect(assigns[:pin].id).to eq(@pin.id)
		end
		
	end
	

end