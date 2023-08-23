require 'rails_helper'

RSpec.describe "Teams Index", type: :feature do
  describe "user story 1, Team Index" do
    describe "For each team table" do
      describe "as a visitor" do
        describe "when I visit /parents" do
          it "then I see the name of each team record in the system" do
            #arrange
              team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
              team_2 = Team.create(name:"Real Madrid", budget:1000, location:"Italy", relegated:false)
              team_3 = Team.create(name:"Manchester United", budget:1000, location:"England", relegated:false)
            #act
              visit "/teams"
            #assert
              expect(page).to have_content(team_1.name)
              expect(page).to have_content(team_2.name)
              expect(page).to have_content(team_3.name)
          end
        end
      end
    end
  end

  describe "User Story 2, Parent Show" do
    describe "As a visitor" do
      describe "When I visit '/teams/:id" do
        it "The I see the team with that id including the team's attributes" do
          #arrange
          team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
          team_2 = Team.create(name:"Real Madrid", budget:1000, location:"Italy", relegated:false)
          team_3 = Team.create(name:"Manchester United", budget:1000, location:"England", relegated:false)
        #act
          visit "/teams/#{team_1.id}"
        #assert
        expect(page).to have_content(team_1.name)
        expect(page).to have_content(team_1.budget)
        expect(page).to have_content(team_1.location)
        expect(page).to have_content(team_1.relegated)
        end
      end
    end
  end
end