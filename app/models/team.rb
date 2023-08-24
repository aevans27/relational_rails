class Team < ApplicationRecord
  has_many :players

  def player_count
    self.players.length
  end

  # def self.order
end