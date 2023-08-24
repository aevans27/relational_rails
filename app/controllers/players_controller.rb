class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  # def player_count
  #   index.length
  # end

  def new
  end

  def show
    # require 'pry';binding.pry
    @player = Player.find(params[:id])
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
  
    redirect_to '/players'
  end
end