class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
  end

  def create
    player = Player.new({
      id: params[:id],
      team_id: params[:team_id],
      name: params[:name],
      salary: params[:salary],
      position: params[:position],
      injured: params[:injured]
      })
  
    player.save
  
    redirect_to '/player'
  end
end