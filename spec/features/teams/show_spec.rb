require "rails_helper"

RSpec.describe "Team Show Page", type: :feature do
  
  describe "As a visitor" do
    describe "When I visit '/teams/:id" do
      before :each do
        @team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)
        @team2 = Team.create!(name: "Liverpool", year_founded: 1892, former_champion: true)
        @team3 = Team.create(name: "Arsenal", year_founded: 1886, former_champion: true)
        @player1 = @team1.players.create!(name: "David Beckham", position: "Midfielder", age: 48, retired: true)
        @player2 = @team2.players.create!(name: "Virgil Van Dijk", position: "Defender", age: 32, retired: false)
        @player3 = @team1.players.create(name: "Marcus Rashford", position: "Midfielder", age: 25, retired: false)
      end
      #User Story 2, Parent Show 
    
      # As a visitor
      # When I visit '/parents/:id'
      # Then I see the parent with that id including the parent's attributes
      # (data from each column that is on the parent table)
      it "I see the team with that id including the teams attributes" do
        #arrange

        #act
        visit "/teams/#{@team1.id}"

        #assert
        # save_and_open_page
        expect(page).to have_content(@team1.name)
        expect(page).to have_content(@team1.year_founded)
        expect(page).to have_content(@team1.former_champion)

        expect(page).to_not have_content(@team2.name)
      end


      # User Story 7, Parent Child Count

      # As a visitor
      # When I visit a parent's show page
      # I see a count of the number of children associated with this parent
      it "can display the number of players that are associated with that team" do
        #arrange

        #act
        visit "/teams/#{@team1.id}"

        #assert
        #save_and_open_page
        expect(page).to have_content("Associated Players: #{@team1.players.count}")

        visit "/teams/#{@team2.id}"
        expect(page).to have_content("Associated Players: #{@team2.players.count}")
      end

      it "links to the Player Index page" do
        #arrange

        #act
        visit "/teams/#{@team1.id}"

        #assert
        # save_and_open_page
        click_on "Player Index"

        expect(current_path).to eq("/players")
      end

      it "links to the Teams Index page" do
        #arrange

        #act
        visit "/teams/#{@team1.id}"

        #assert
        # save_and_open_page
        click_on "Teams Index"

        expect(current_path).to eq("/teams")
      end

      it "links to that Teams Players page" do
        #arrange

        #act
        visit "/teams/#{@team1.id}"

        #assert
        # save_and_open_page
        click_on "#{@team1.name}'s Players Index"

        expect(current_path).to eq("/teams/#{@team1.id}/players")
      end
    end
  end
end