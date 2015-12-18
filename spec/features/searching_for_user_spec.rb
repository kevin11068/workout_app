require "rails_helper"

RSpec.feature "Search for users" do
	before do
		@john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")	
		@sara = User.create(first_name: "Sara", last_name: "Doe", email: "sara@example.com", password: "password")	
	end

    scenario "with existing name returns all the users" do
    visit "/"

    fill_in "search_name", with: "Doe"
    click_button "Search"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sara.full_name)
    expect(current_path).to eq("/dashboard/search")
	
	end

end