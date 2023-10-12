require "rails_helper"

RSpec.describe "Team Index", type: :feature do
  
  describe "As a visitor" do
    # User Story 1, Parent Index 
  
    # For each team table
    # As a visitor
    # When I visit '/teams'
    # Then I see the name of each team record in the system
    describe "When I visit '/teams" do
      it "I see the name of each team record in the system" do
        #arrange
        team1 = Team.create(name: "Manchester United", year_founded: 1902, former_champion: true)
        team2 = Team.create(name: "Liverpool", year_founded: 1892, former_champion: true)
        
        #act
        visit "/teams"

        #assert
        # save_and_open_page
        expect(page).to have_content("All Teams")
        expect(page).to have_content(team1.name)
        expect(page).to have_content(team2.name)
      end

      # User Story 6, Parent Index sorted by Most Recently Created 

      # As a visitor
      # When I visit the parent index,
      # I see that records are ordered by most recently created first
      # And next to each of the records I see when it was created
      it "can display the name of each team in order of most recently created" do
        #arrange
        team1 = Team.create(name: "Manchester United", year_founded: 1902, former_champion: true)
        team2 = Team.create(name: "Liverpool", year_founded: 1892, former_champion: true)
        team3 = Team.create(name: "Arsenal", year_founded: 1886, former_champion: true)
        
        #act
        visit "/teams"

        #assert
        save_and_open_page
        expect(page).to have_content("All Teams")
        expect(page).to have_content("#{team1.name}")
        expect(page).to have_content("Created at: #{team1.created_at}")
        expect(page).to have_content("#{team2.name}")
        expect(page).to have_content("Created at: #{team2.created_at}")
        expect(page).to have_content("#{team3.name}")
        expect(page).to have_content("Created at: #{team3.created_at}")
      end
    end
  end
end