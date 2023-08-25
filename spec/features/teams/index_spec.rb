require 'rails_helper'

RSpec.describe "Teams Index", type: :feature do
  describe "user story 1, Team Index" do
    describe "For each team table" do
      describe "as a visitor" do
        describe "when I visit /Teams" do
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
          xit "And next to each of the records I see when it was created" do
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
          #  puts team_1.created_at
          #  puts team_2.created_at
          #  puts team_3.created_at
          #  puts team_0.created_at
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
      describe "When I visit a team show page ('/Teams/:id')" do
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

  describe "User Story 11, Team Creation" do
    describe "As a visitor" do
      describe "When I visit the Team Index page" do
        describe "The I see a link to create a new Team record, New Team" do
          describe "When I click this link" do
            describe "Then I am taken to '/teams/new' where I see a form for a new team record" do
              describe "When I fill out the form with a new team's attributes:" do
                describe "And I click the button Create Team to submit the form" do
                  describe "The a 'Post' request is sent to the '/teams' route," do
                    describe "a new team is created" do
                      it "and I am redirected to the Team Index page where I see the new Team displayed" do
                        #arrange
                        
                        #act
                        visit("/teams")
                        click_link('New Team')
                        fill_in('name', with: 'John')
                        fill_in('budget', with: 100)
                        fill_in('location', with: 'Somewhere')
                        fill_in('relegated', with: 'false')
                        click_button('Create')
                        #assert
                        expect(page).to have_content("John")
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  describe "User Story 12, Team Update" do
    describe "As a visitor" do
      describe "When I visit a Team show page" do
        describe "Then I see a link to update the Team 'Update Team'" do
          describe "When I click the link 'Update Team'" do
            describe "Then I am taken to '/Teams/:id/edit' where I  see a form to edit the Team's attributes:" do
              describe "When I fill out the form with updated information" do
                describe "And I click the button to submit the form" do
                  describe "Then a `PATCH` request is sent to '/Teams/:id'," do
                    describe "the Team's info is updated," do
                      it "and I am redirected to the Team's Show page where I see the Team's updated info" do
                        #arrange
                        team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
                        #act
                        visit "/teams/#{team_1.id}"
                        click_link('Update Team')
                        fill_in('name', with: 'John')
                        fill_in('budget', with: 100)
                        fill_in('location', with: 'Somewhere')
                        fill_in('relegated', with: 'false')
                        click_button('Update')
                        # #assert
                        expect(page).to have_content("John")
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  describe "User Story 13, Team Player Creation" do
    describe "As a visitor" do
      describe "When I visit a Team Player Index page" do
        describe "Then I see a link to add a new adoptable player for that team 'Create Player'" do
          describe "When I click the link" do
            describe "I am taken to '/teams/:team_id/player_table_name/new' where I see a form to add a new adoptable player" do
              describe "When I fill in the form with the players attributes:" do
                describe "And I click the button 'create player'" do
                  describe "The a POST request is sent to '/teams/:team_id/player_table_name" do
                    describe "a new player object/row is created for that parent," do
                      it "and I am redirected to the Team Players Index page where I can see the new player listed" do
                        #arrange
                        team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
                        team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
                        team_1.players.create!(name:"Rooney", salary:15, position:"Midfield", injured:false)
                        #act
                        visit "/teams/#{team_1.id}/player_table_name"
                        click_link('Create Player')
                        fill_in('name', with: 'John')
                        fill_in('salary', with: 100)
                        fill_in('position', with: 'Somewhere')
                        fill_in('injured', with: 'false')
                        click_button('Create')
                        #assert
                        expect(page).to have_content("John")
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end