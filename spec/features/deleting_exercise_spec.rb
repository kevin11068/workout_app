require "rails_helper"

RSpec.feature "Editing exercise" do
	before do 
		@owner = User.create(first_name: "john", last_name: "Doe", email: "John@example.com", password: "password")
		@owner_exe = @owner.exercises.create!(duration_in_min: 33, workout: "Body gogo", workout_date: "2015-12-14")
		login_as(@owner)
	end

	scenario "Editing exercise"  do
		visit "/"
		click_link "My Lounge"
		link = "//a[contains(@href, '/users/#{@owner.id}/exercises/#{@owner_exe.id}') and .//text()='Destroy']"
		# link = "//a[text()='destroy']/@href='/users/#{@owner.id}/exercises/#{@owner_exe.id}'"
		find(:xpath, link).click

		expect(page).to have_content("Exercise has been deleted")
		expect(page).not_to have_content("33")

	end
end