class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    
  end

  def create
    real_madrid = Team.create!(team_params)
    redirect_to "/teams"
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update!(team_params)
    redirect_to "/teams/#{team.id}"
  end

  private
  def team_params
    params.permit(:name, :year_founded, :former_champion)
  end
end