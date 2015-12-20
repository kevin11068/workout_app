require "rails_helper"

RSpec.feature "Following Friends" do
	
	before do
		@john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")	
		@sara = User.create(first_name: "Sara", last_name: "Doe", email: "sara@example.com", password: "password")	
	
		login_as(@john)
	end
	
	scenario "if signed in succeeds" do
		visit "/"
		expect(page).to have_content(@john.full_name)
		expect(page).to have_content(@sara.full_name)
		expect(page).not_to have_link("Follow", :href => "/friendships?/friend_id=#{@john.id}")

		link = "a[href='/friendships?friend_id=#{@sara.id}']"
		find(link).click

		expect(page).not_to have_link("Follow", :href => "/friendships?/friend_id=#{@sara.id}")
	end
end