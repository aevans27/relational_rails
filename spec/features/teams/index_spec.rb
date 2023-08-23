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

  describe "User Story 3, Player Index" do
    describe "As a visitor" do
      describe "When I visit '/player_table_name" do
        it "Then I see each player in the system including the player's attributes" do
          #arrange
          team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
          team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
          team_1.players.create!(name:"Rooney", salary:15, position:"Midfield", injured:false)
          #act
          visit "/player_table_name"
          #assert
          expect(page).to have_content(team_1.players.first.name)
          expect(page).to have_content(team_1.players.first.salary)
          expect(page).to have_content(team_1.players.first.position)
          expect(page).to have_content(team_1.players.first.injured)
          expect(page).to have_content(team_1.players.last.name)
          expect(page).to have_content(team_1.players.last.salary)
          expect(page).to have_content(team_1.players.last.position)
          expect(page).to have_content(team_1.players.last.injured)
        end
      end
    end
  end

  describe "User Story 4, Player Show" do
    describe "As a visitor" do
      describe "When I visit '/player_table_name/:id'" do
        it "Then I see the player with that id including the player's attributes" do
          #arrange
          team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
          team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
          #act
          visit "/player_table_name/#{team_1.players.first.id}"
          #assert
          expect(page).to have_content(team_1.players.first.name)
          expect(page).to have_content(team_1.players.first.salary)
          expect(page).to have_content(team_1.players.first.position)
          expect(page).to have_content(team_1.players.first.injured)
        end
      end
    end
  end
end