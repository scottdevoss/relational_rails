require "rails_helper"

RSpec.describe "Team Show Page", type: :feature do
  #User Story 2, Parent Show 

  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)

  describe "As a visitor" do
    describe "When I visit '/teams/:id" do
      it "I see the team with that id including the teams attributes" do
        #arrange
        team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)
        team2 = Team.create!(name: "Liverpool", year_founded: 1892, former_champion: true)

        #act
        visit "/teams/#{team1.id}"

        #assert
        #save_and_open_page
        expect(page).to have_content(team1.name)
        expect(page).to have_content(team1.year_founded)
        expect(page).to have_content(team1.former_champion)
        expect(page).to_not have_content(team2.name)

      end
    end
  end
end