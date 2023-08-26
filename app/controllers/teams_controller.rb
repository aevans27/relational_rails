class TeamsController < ApplicationController
  def index
    @teams = Team.all.order(updated_at: :desc)
  end

  def new
  end

  def show
    @team = Team.find(params[:id])
  end

  def players
    @players = Player.where(team_id: params[:id]).order(:name)
    # require 'pry';binding.pry
  end

  def create
    team = Team.new({
      id: params[:id],
      name: params[:name],
      budget: params[:budget],
      location: params[:location],
      relegated: params[:relegated]
      })
  
    team.save
  
    redirect_to '/teams'
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update(name: params[:name],
      budget: params[:budget],
      location: params[:location],
      relegated: params[:relegated])
    redirect_to "/teams/#{team.id}"
  end
end