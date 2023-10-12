require "rails_helper"

RSpec.describe "Team Show Page", type: :feature do
  
  describe "As a visitor" do
    #User Story 2, Parent Show 
  
    # As a visitor
    # When I visit '/parents/:id'
    # Then I see the parent with that id including the parent's attributes
    # (data from each column that is on the parent table)
    describe "When I visit '/teams/:id" do
      it "I see the team with that id including the teams attributes" do
        #arrange
        team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)
        team2 = Team.create!(name: "Liverpool", year_founded: 1892, former_champion: true)

        #act
        visit "/teams/#{team1.id}"

        #assert
        # save_and_open_page
        expect(page).to have_content(team1.name)
        expect(page).to have_content(team1.year_founded)
        expect(page).to have_content(team1.former_champion)

        expect(page).to_not have_content(team2.name)
      end


      # User Story 7, Parent Child Count

      # As a visitor
      # When I visit a parent's show page
      # I see a count of the number of children associated with this parent
      it "can display the number of players that are associated with that team" do
        #arrange
        team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)
        team2 = Team.create!(name: "Liverpool", year_founded: 1892, former_champion: true)
        team3 = Team.create(name: "Arsenal", year_founded: 1886, former_champion: true)
        player1 = team1.players.create!(name: "David Beckham", position: "Midfielder", age: 48, retired: true)
        player2 = team2.players.create!(name: "Virgil Van Dijk", position: "Defender", age: 32, retired: false)
        player3 = team1.players.create(name: "Marcus Rashford", position: "Midfielder", age: 25, retired: false)

        #act
        visit "/teams/#{team1.id}"

        #assert
        #save_and_open_page
        expect(page).to have_content("Associated Players: #{team1.players.count}")

        visit "/teams/#{team2.id}"
        expect(page).to have_content("Associated Players: #{team2.players.count}")
      end
    end
  end
end