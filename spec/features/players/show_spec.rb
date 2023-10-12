require "rails_helper"

RSpec.describe "Player Show Page", type: :feature do
  
  describe "As a visitor" do
    describe "When I visit '/players/:id" do
      before :each do
        @team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)
        @team2 = Team.create!(name: "Liverpool", year_founded: 1892, former_champion: true)
        @team3 = Team.create(name: "Arsenal", year_founded: 1886, former_champion: true)
        @player1 = @team1.players.create!(name: "David Beckham", position: "Midfielder", age: 48, retired: true)
        @player2 = @team2.players.create!(name: "Virgil Van Dijk", position: "Defender", age: 32, retired: false)
        @player3 = @team1.players.create(name: "Marcus Rashford", position: "Midfielder", age: 25, retired: false)
      end
      #User Story 4, Child Show 

      #As a visitor
      #When I visit '/child_table_name/:id'
      #Then I see the child with that id including the child's attributes
      #(data from each column that is on the child table)
      it "I see the players with that id including the players attributes" do
        #arrange

        #act
        visit "/players/#{@player1.id}"

        #assert
        # save_and_open_page
        expect(page).to have_content(@player1.name)
        expect(page).to have_content(@player1.position)
        expect(page).to have_content(@player1.age)
        expect(page).to have_content(@player1.retired)
        expect(page).to_not have_content(@player2.name)
        
      end

      it "links to the Player Index page" do
        #arrange

        #act
        visit "/players/#{@player1.id}"

        #assert
        # save_and_open_page
        click_on "Player Index"

        expect(current_path).to eq("/players")
      end
    end
  end
end