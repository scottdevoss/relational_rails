require "rails_helper"

RSpec.describe "the Team Creation" do
  describe "As a visitor" do
    describe "When I visit the Team Index page" do
      it "links to the new page from the Team Index" do
        visit "/teams"

        click_on "New Team"

        expect(current_path).to eq("/teams/new")
      end
    end

    describe "When I click this link" do
      it "takes me to the New Team page where I see a form for a new Team record" do
        visit "/teams/new"

        fill_in("Name", with: "Real Madrid")
        fill_in("Year founded", with: 1902)
        fill_in("Former champion", with: true)
        click_button("Create Team")

        expect(current_path).to eq("/teams")
        expect(page).to have_content("Real Madrid")
      end
    end
  end
end