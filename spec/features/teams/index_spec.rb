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

  describe "User Story 2, Team Show" do
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

  describe "User Story 5, Team Player Index" do
    describe "As a visitor" do
      describe "When I visit '/teams/:team_id/player/child_table_name'" do
        it "Then see each Player that is associated with that Team with each Players attributes" do
          #arrange
          team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
          team_2 = Team.create(name:"Arsenal", budget:1000, location:"England", relegated:false)
          team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
          team_2.players.create!(name:"Rooney", salary:15, position:"Midfield", injured:false)
          #act
          visit "/teams/#{team_1.id}/player_table_name"
          #assert
          expect(page).to have_content(team_1.players.first.name)
          expect(page).to have_content(team_1.players.first.salary)
          expect(page).to have_content(team_1.players.first.position)
          expect(page).to have_content(team_1.players.first.injured)
        end
      end
    end
  end

  describe "User Story 6, Team Index sorted by most recent created" do
    describe "As a visitor" do
      describe "When I visit the Team index" do
        describe "I see that records are ordered by most recently created first" do
          it "And next to each of the records I see when it was created" do
            #arrange
            team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
             sleep(1)
            team_2 = Team.create(name:"Real Madrid", budget:1000, location:"Italy", relegated:false)
            sleep(1)
            team_3 = Team.create(name:"Manchester United", budget:1000, location:"England", relegated:false)
             sleep(1)
            team_0 = Team.create(name:"Not a real team", budget:1000, location:"England", relegated:false)
            
          #act
            visit "/teams"
          #assert
           puts team_1.created_at
           puts team_2.created_at
           puts team_3.created_at
           puts team_0.created_at
            expect(page).to have_content(team_1.created_at)
            expect(page).to have_content(team_2.created_at)
            expect(page).to have_content(team_3.created_at)
            expect(page).to have_content(team_0.created_at)
            this = team_0.created_at.to_s
            that = team_3.created_at.to_s
            expect(this).to appear_before(that)
          end
        end
      end
    end
  end
  describe "User Story 7, Team Player count" do
    describe "As a visitor" do
      describe "When I visit a team's show page" do
        it "I see a count of the number of players associated with this team" do
          #arrange
          team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
          team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
          team_1.players.create!(name:"Rooney", salary:15, position:"Midfield", injured:false)
          #act
          visit "/teams/#{team_1.id}"
          #assert
          # puts team_1.player_count
          expect(page).to have_content(team_1.name)
          expect(page).to have_content(team_1.budget)
          expect(page).to have_content(team_1.location)
          expect(page).to have_content(team_1.relegated)
          expect(page).to have_content(team_1.player_count)
        end
      end
    end
  end

  describe 'User Story 8, Player Index Link' do
    describe "As a visitor" do
      describe "When I visit any page on the site" do
        it "Then I see a link at the top of the page that takes me to the player Index" do
          #arrange
          # team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
          # team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
          # team_1.players.create!(name:"Rooney", salary:15, position:"Midfield", injured:false)
          #act
          visit "/players"
          #assert
          expect(page).to have_link('', href: '/players')
        end
      end
    end
  end
  describe "User Story 9, Team Index Link" do
    describe "As a visitor" do
      describe "When I visit any page on the site" do
        it "Then I see a link at the top of the page that takes me to the Team Index" do
        #arrange
          # team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
          # team_2 = Team.create(name:"Real Madrid", budget:1000, location:"Italy", relegated:false)
          # team_3 = Team.create(name:"Manchester United", budget:1000, location:"England", relegated:false)
        #act
          visit "/teams"
        #assert
        expect(page).to have_link('', href: '/teams')
        end
      end
    end
  end

  describe "User story 10, Team Player Index Link" do
    describe "As a visitor" do
      describe "When I visit a team show page ('/parents/:id')" do
        it "Then I see a link to take me to that team's 'child_table_name' page" do
          #arrange
          team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
          team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
          team_1.players.create!(name:"Rooney", salary:15, position:"Midfield", injured:false)
          #act
          visit "/teams/#{team_1.id}"
          #assert
          # puts team_1.player_count
         expect(page).to have_link('', href: "/teams/#{team_1.id}/player_table_name")
        end
      end
    end
  end
end