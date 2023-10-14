require "rails_helper"

RSpec.describe "the Player creation" do
  describe "As a visitor" do
    describe "When I visit a Team Players Index page" do
      it "links to the new page from the teams players index page" do
        team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)

        visit "/teams/#{team1.id}/players"

        click_on "Create Player"

        expect(current_path).to eq("/teams/#{team1.id}/players/new")
      end
    end

    describe "When I click the link 'Create Player'" do
      it "takes me to '/teams/:id/players/new' where I see a form to add a new player to the team" do
        team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)

        visit "/teams/#{team1.id}/players/new"

        fill_in("Name", with: "Wayne Rooney")
        fill_in("Position", with: "Forward")
        fill_in("Age", with: 37)
        fill_in("Retired", with: true)
        click_button "Create Player"

        expect(current_path).to eq("/teams/#{team1.id}/players")
        expect(page).to have_content("Wayne Rooney")
        expect(page).to have_content("Position: Forward")
        expect(page).to have_content("Age: 37")
        expect(page).to have_content("Retired: true")
      end
    end
  end
end