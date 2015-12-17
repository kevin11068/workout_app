require "rails_helper"

RSpec.feature "Editing exercise" do
	before do 
		@owner = User.create(email: "John@example.com", password: "password")
		@owner_exe = @owner.exercises.create!(duration_in_min: 10, workout: "Body gogo", workout_date: "2015-12-14")
		login_as(@owner)
	end

	scenario "Editing exercise"  do
		visit "/"
		click_link "My Lounge"
		link = "a[href='/users/#{@owner.id}/exercises/#{@owner_exe.id}/edit']"
		find(link).click
		#click_link "Edit"
		fill_in "Duration", with: 200
		click_button "Update Exercise"

		expect(page).to have_content("Exercise has been updated")
		expect(page).to have_content("200")
		expect(page).not_to have_content("10")

	end
end