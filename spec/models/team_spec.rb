require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it {should have_many :players}
  end

  describe "instance methods" do
    describe "#player_count" do
      before :each do
        @liverpool = Team.create!(name:"Liverpool", budget:100, location:"England", relegated:false)
        @liverpool.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
        @liverpool.players.create!(name:"Rooney", salary:15, position:"Midfield", injured:false)
      end

      it "return player count" do
        expect(@liverpool.player_count).to eq(2)
      end
    end
  end
end