class TeamPlayersController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @players = @team.players
  end

  def new
    @team = Team.find(params[:id])
  end

  def create
    team = Team.find(params[:id])
    wayne_rooney = team.players.create!(team_player_params)
    redirect_to "/teams/#{team.id}/players"
  end

  private
  def team_player_params
    params.permit(:name, :position, :age, :retired)
  end
end