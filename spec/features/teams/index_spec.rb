require "rails_helper"

RSpec.describe "Team Index", type: :feature do
  # User Story 1, Parent Index 

  # For each team table
  # As a visitor
  # When I visit '/teams'
  # Then I see the name of each team record in the system

  describe "As a visitor" do
    describe "When I visit '/teams" do
      it "I see the name of each team record in the system" do
        #arrange
        team1 = Team.create(name: "Manchester United", year_founded: 1902, former_champion: true)
        team2 = Team.create(name: "Liverpool", year_founded: 1892, former_champion: true)
        
        #act
        visit "/teams"

        #assert
        #save_and_open_page
        expect(page).to have_content("All Teams")
        expect(page).to have_content(team1.name)
        expect(page).to have_content(team2.name)
      end
    end
  end
end