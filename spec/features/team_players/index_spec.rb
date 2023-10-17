require "rails_helper"

RSpec.describe "Team Players Index", type: :feature do
  
  describe "As a visitor" do
    describe "When I visit '/teams/:team_id/players" do
      before :each do
        @team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)
        @team2 = Team.create!(name: "Liverpool", year_founded: 1892, former_champion: true)
        @team3 = Team.create(name: "Arsenal", year_founded: 1886, former_champion: true)
        @player1 = @team1.players.create!(name: "David Beckham", position: "Midfielder", age: 48, retired: true)
        @player2 = @team2.players.create!(name: "Virgil Van Dijk", position: "Defender", age: 32, retired: false)
        @player3 = @team1.players.create(name: "Marcus Rashford", position: "Midfielder", age: 25, retired: false)
      end
      # User Story 5, Parent Children Index 

      # As a visitor
      # When I visit '/parents/:parent_id/child_table_name'
      # Then I see each Child that is associated with that Parent with each Child's attributes
      # (data from each column that is on the child table)
      it "I see each Player that is associated with that Team with each Player's attributes" do
        #arrange
        
        #act
        visit "/teams/#{@team1.id}/players"

        #assert
        # save_and_open_page
        expect(page).to have_content("Teams Players")
        expect(page).to have_content(@player1.name)
        expect(page).to have_content(@player3.name)
        expect(page).to_not have_content(@player2.name)
        expect(page).to have_content(@player1.position)
        expect(page).to have_content(@player3.position)
        expect(page).to_not have_content(@player2.position)
        expect(page).to have_content(@player1.age)
        expect(page).to have_content(@player3.age)
        expect(page).to_not have_content(@player2.age)
        expect(page).to have_content(@player1.retired)
        expect(page).to have_content(@player3.retired)
      end

      it "links to the Player Index page" do
        #arrange

        #act
        visit "/teams/#{@team1.id}/players"

        #assert
        # save_and_open_page
        click_on "Player Index"

        expect(current_path).to eq("/players")
      end

      it "links to the Teams Index page" do
        #arrange

        #act
        visit "/teams/#{@team1.id}/players"

        #assert
        # save_and_open_page
        click_on "Teams Index"

        expect(current_path).to eq("/teams")
      end

      it "links to display players alphabetically by name" do
        visit "/teams/#{@team1.id}/players"

        click_on "Sort #{@team1.name}'s Players Alphabetically"

        expect(current_path).to eq("/teams/#{@team1.id}/players")

        expect(@player1.name).to have_content(@player1.name)
      end

      it "has links to update Manchester United's players" do
        visit "/teams/#{@team1.id}/players"

        expect(page).to have_content("Update #{@player1.name}")
        expect(page).to have_content("Update #{@player3.name}")

        click_on "Update #{@player1.name}"

        expect(current_path).to eq("/players/#{@player1.id}/edit")
      end


      xit "links to display players older than the number input by the user" do
        visit "/teams/#{@player1.id}/players"

        fill_in "age", with: 40

        click_on "Submit"

        expect(current_path).to eq("/teams/#{@player1.id}/players")

        expect(page).to have_content(@player1.name)
        expect(page).to_not have_content (@player2.name)
      end
    end
  end
end