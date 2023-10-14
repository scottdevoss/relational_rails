require "rails_helper"

RSpec.describe "the Player Edit" do
  describe "As a visitor" do
    describe "When I visit a Players Show page" do
      it "links to the edit page to update the Player" do
        team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)
        player1 = team1.players.create!(name: "David Beckham", position: "Midfielder", age: 48, retired: true)
        
        visit "/players/#{player1.id}"

        click_on "Update #{player1.name}"

        expect(current_path).to eq("/players/#{player1.id}/edit")
      end
    end

    describe "When I click the link 'Update Player'" do
      it "takes me to the '/players/:id/edit' page where I see a form to edit the Players attributes" do
        team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)
        player1 = team1.players.create!(name: "David Beckham", position: "Midfielder", age: 48, retired: true)

        visit "/players/#{player1.id}"

        expect(page).to have_content("Midfielder")

        click_on "Update David Beckham"

        fill_in "Name", with: "David Beckham"
        fill_in "Position", with: "Right Midfielder"
        fill_in "Age", with: 48
        fill_in "Retired", with: true

        click_button "Update Player"

        expect(current_path).to eq("/players/#{player1.id}")
        expect(page).to have_content("Right Midfielder")
      end
    end
  end
end