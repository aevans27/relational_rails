class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
  end

  def show
    # require 'pry';binding.pry
    @team = Team.find(params[:id])
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
  
    redirect_to '/team'
  end
end