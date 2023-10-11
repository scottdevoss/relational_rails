require "rails_helper"

RSpec.describe "Player Index", type: :feature do
  
  describe "As a visitor" do
    #User Story 3, Child Index 

    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes
    # (data from each column that is on the child table)
    describe "When I visit '/players" do
      it "I see each Player in the system including the Player's attributes" do
        #arrange
        team1 = Team.create(name: "Manchester United", year_founded: 1902, former_champion: true)
        team2 = Team.create(name: "Liverpool", year_founded: 1892, former_champion: true)
        player1 = team1.players.create(name: "David Beckham", position: "Midfielder", age: 48, retired: true)
        player2 = team2.players.create(name: "Virgil Van Dijk", position: "Defender", age: 32, retired: false)
        
        #act
        visit "/players"

        #assert
        # save_and_open_page
        expect(page).to have_content("All Players")
        expect(page).to have_content(player1.name)
        expect(page).to have_content(player2.name)
        expect(page).to have_content(player1.position)
        expect(page).to have_content(player2.position)
        expect(page).to have_content(player1.age)
        expect(page).to have_content(player2.age)
        expect(page).to have_content(player1.retired)
        expect(page).to have_content(player2.retired)
      end
    end
  end
end