require 'rails_helper'

# RSpec.describe Player do
#   describe 'relationships' do
#     it {should belong_to :team}
#   end

#   describe 'class methods' do
#     it '.player_count' do
#       liverpool = Team.create!(name:"Liverpool", budget:100, location:"England", relegated:false)
#       chelsea = Team.create!(name:"Chelsea", budget:120, location:"England", relegated:false)
#       owen = liverpool.players.create!(name:"Michael Owen", salary:1, position:"forward", injured:false)
#       rooney = chelsea.players.create!(name:"Dave Rooney", salary:1, position:"forward", injured:false)

#       expect(Player.player_count).to eq(2)
#     end
#   end
# end