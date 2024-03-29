require "rails_helper"

RSpec.describe "Team Index", type: :feature do
  
  describe "As a visitor" do
    describe "When I visit '/teams" do
      before :each do
        @team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)
        @team2 = Team.create!(name: "Liverpool", year_founded: 1892, former_champion: true)
        @team3 = Team.create(name: "Arsenal", year_founded: 1886, former_champion: true)
        @player1 = @team1.players.create!(name: "David Beckham", position: "Midfielder", age: 48, retired: true)
        @player2 = @team2.players.create!(name: "Virgil Van Dijk", position: "Defender", age: 32, retired: false)
        @player3 = @team1.players.create(name: "Marcus Rashford", position: "Midfielder", age: 25, retired: false)
      end
      # User Story 1, Parent Index 
    
      # For each team table
      # As a visitor
      # When I visit '/teams'
      # Then I see the name of each team record in the system
      it "I see the name of each team record in the system" do
        #arrange
        
        #act
        visit "/teams"

        #assert
        # save_and_open_page
        expect(page).to have_content("All Teams")
        expect(page).to have_content(@team1.name)
        expect(page).to have_content(@team2.name)
      end

      # User Story 6, Parent Index sorted by Most Recently Created 

      # As a visitor
      # When I visit the parent index,
      # I see that records are ordered by most recently created first
      # And next to each of the records I see when it was created
      it "can display the name of each team in order of most recently created" do
        #arrange
        
        #act
        visit "/teams"

        #assert
        # save_and_open_page
        expect(page).to have_content("All Teams")
        expect(page).to have_content("#{@team1.name}")
        expect(page).to have_content("Created at: #{@team1.created_at}")
        expect(page).to have_content("#{@team2.name}")
        expect(page).to have_content("Created at: #{@team2.created_at}")
        expect(page).to have_content("#{@team3.name}")
        expect(page).to have_content("Created at: #{@team3.created_at}")
      end

      it "links to the Player Index page" do
        #arrange

        #act
        visit "/teams"

        #assert
        # save_and_open_page
        click_on "Player Index"

        expect(current_path).to eq("/players")
      end

      it "links to the Teams Index page" do
        #arrange

        #act
        visit "/teams"

        #assert
        # save_and_open_page
        click_on "Teams Index"

        expect(current_path).to eq("/teams")
      end

      it "has links to update each team" do
        visit "/teams"

        expect(page).to have_content("Update #{@team1.name}")
        expect(page).to have_content("Update #{@team2.name}")
        expect(page).to have_content("Update #{@team3.name}")

        click_on "Update #{@team1.name}"

        expect(current_path).to eq("/teams/#{@team1.id}/edit")
      end

      it "has links to delete each Team" do
        visit "/teams"
        
        expect(page).to have_content("Delete #{@team1.name}")
        expect(page).to have_content("Delete #{@team2.name}")
        expect(page).to have_content("Delete #{@team3.name}")

        click_on "Delete #{@team3.name}"

        expect(current_path).to eq("/teams")
        expect(page).to_not have_content("#{@team3.name}")
      end
    end
  end
end