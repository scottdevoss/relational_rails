require "rails_helper"

RSpec.describe Player, type: :model do
  describe 'relationships' do
    it { should belong_to :team}
  end

  describe "class methods" do
    before :each do
      @team1 = Team.create!(name: "Manchester United", year_founded: 1902, former_champion: true)
      @team2 = Team.create!(name: "Liverpool", year_founded: 1892, former_champion: true)
      @team3 = Team.create(name: "Arsenal", year_founded: 1886, former_champion: true)

      @player1 = @team1.players.create!(name: "David Beckham", position: "Midfielder", age: 48, retired: true)
      @player2 = @team2.players.create!(name: "Virgil Van Dijk", position: "Defender", age: 32, retired: false)
      @player3 = @team1.players.create(name: "Marcus Rashford", position: "Midfielder", age: 25, retired: false)
    end

    describe "display_true" do
      it "only displays records where the retired column is true" do
        retired_players = Player.display_true

        expect(retired_players).to eq([@player1])
      end
    end

    describe "order_by_name" do
      it "displays the records in alphabetical order by name" do
        ordered_list = @team1.players.order_by_name

        expect(ordered_list).to eq([@player1, @player3])
      end
    end

    describe "display_number_of_players" do
      it "displays the Players that are older than the input age" do
        input_age = @team1.players.display_age_greater_than(40)

        expect(input_age).to eq([@player1])
      end
    end
  end
end