require "rails_helper"

RSpec.describe "the Team Update" do
  describe "As a visitor" do
    describe "When I visit a parent show page" do
      it "has a link to update the team 'Update Team'" do
        team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)

        visit "/teams/#{team1.id}"

        expect(current_path).to eq "/teams/#{team1.id}"

        click_on "Update #{team1.name}"

        expect(current_path).to eq("/teams/#{team1.id}/edit")
      end
    end

    describe "When I click the link 'Update Team'" do

        #       User Story 12, Parent Update 

        # As a visitor
        # When I visit a parent show page
        # Then I see a link to update the parent "Update Parent"
        # When I click the link "Update Parent"
        # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
        # When I fill out the form with updated information
        # And I click the button to submit the form
        # Then a `PATCH` request is sent to '/parents/:id',
        # the parent's info is updated,
        # and I am redirected to the Parent's Show page where I see the parent's updated info
      it "takes me to the '/teams/:id/edit' where I see a form to edit the Team's attributes" do
        team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)

        visit "/teams/#{team1.id}"

        expect(page).to have_content("Name: Manchester United")

        click_on "Update Manchester United"

        fill_in "Name", with: "Manchester United FC"
        fill_in "Year founded", with: 1902
        fill_in "Former champion", with: true
        click_button "Update Team"

        expect(current_path).to eq("/teams/#{team1.id}")
        expect(page).to have_content("Name: Manchester United FC")
      end
    end
  end
end