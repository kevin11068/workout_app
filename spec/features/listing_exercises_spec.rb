require "rails_helper"

RSpec.feature "listing Exercises" do
	before do
		@john = User.create(first_name: "john", last_name: "Doe", email: "john@example.com", password: "password")
		@sara = User.create(first_name: "sara", last_name: "Doe", email: "sara@example.com", password: "password")

		login_as(@john)

		@e1 = @john.exercises.create(duration_in_min: 10, workout: "Body gogo", workout_date: "2015-12-14")
		@e2 = @john.exercises.create(duration_in_min: 20, workout: "Body run run", workout_date: "2015-12-15")

		@following = Friendship.create(user: @john, friend: @sara)
	end

	scenario "shows user's workout for last 7 days" do
		visit "/"

		click_link "My Lounge"
		expect(page).to have_content(@e1.duration_in_min)
		expect(page).to have_content(@e1.workout)
		expect(page).to have_content(@e1.workout_date)

		expect(page).to have_content(@e2.duration_in_min)
		expect(page).to have_content(@e2.workout)
		expect(page).to have_content(@e2.workout_date)
	end

	scenario "shows a list of users friends" do
		visit "/"
		click_link "My Lounge"
		expect(page).to have_content("My Friends")
		expect(page).to have_link(@sara.full_name)
		expect(page).to have_link("Unfollow")
	end

end