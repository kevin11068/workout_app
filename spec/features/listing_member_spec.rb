require "rails_helper"

RSpec.feature "Listing Member" do
	before do
		@john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")	
		@sara = User.create(first_name: "Sara", last_name: "Jo", email: "sara@example.com", password: "password")	
	end

	scenario "shows a list of registered member" do
		visit "/"
		expect(page).to have_content("List of Members")
		expect(page).to have_content(@john.full_name)
		expect(page).to have_content(@sara.full_name)

	end
end