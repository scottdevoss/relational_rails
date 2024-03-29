class TeamPlayersController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @players = @team.players
    
    if params[:sort] == "alpha"
      @players = @team.players.order_by_name
    end
  end

  def new
    @team = Team.find(params[:id])
  end

  def create
    team = Team.find(params[:id])
    create_player = team.players.create!(team_player_params)
    redirect_to "/teams/#{team.id}/players"
  end

  private
  def team_player_params
    params.permit(:name, :position, :age, :retired)
  end
end