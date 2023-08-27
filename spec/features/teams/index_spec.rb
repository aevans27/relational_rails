require 'rails_helper'

RSpec.describe "Teams Index", type: :feature do
  before(:each) do
    @team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
    @team_2 = Team.create(name:"Real Madrid", budget:1000, location:"Italy", relegated:false)
    @team_3 = Team.create(name:"Manchester United", budget:1000, location:"England", relegated:false)
  end

  describe "user story 1, Team Index" do
    describe "For each team table" do
      describe "as a visitor" do
        describe "when I visit /Teams" do
          it "then I see the name of each team record in the system" do
            #arrange
              # team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
              # team_2 = Team.create(name:"Real Madrid", budget:1000, location:"Italy", relegated:false)
              # team_3 = Team.create(name:"Manchester United", budget:1000, location:"England", relegated:false)
            #act
              visit "/teams"
            #assert
              expect(page).to have_content(@team_1.name)
              expect(page).to have_content(@team_2.name)
              expect(page).to have_content(@team_3.name)
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
          # team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
          # team_2 = Team.create(name:"Real Madrid", budget:1000, location:"Italy", relegated:false)
          # team_3 = Team.create(name:"Manchester United", budget:1000, location:"England", relegated:false)
          #act
          visit "/teams/#{@team_1.id}"
          #assert
          expect(page).to have_content(@team_1.name)
          expect(page).to have_content(@team_1.budget)
          expect(page).to have_content(@team_1.location)
          expect(page).to have_content(@team_1.relegated)
        end
      end
    end
  end

  describe "User Story 3, Player Index" do
    describe "As a visitor" do
      describe "When I visit '/player_table_name" do
        it "Then I see each player in the system including the player's attributes" do
          #arrange
          # team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
          @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
          @team_1.players.create!(name:"Rooney", salary:15, position:"Midfield", injured:false)
          #act
          visit "/player_table_name"
          #assert
          expect(page).to have_content(@team_1.players.first.name)
          expect(page).to have_content(@team_1.players.first.salary)
          expect(page).to have_content(@team_1.players.first.position)
          expect(page).to have_content(@team_1.players.first.injured)
          expect(page).to have_content(@team_1.players.last.name)
          expect(page).to have_content(@team_1.players.last.salary)
          expect(page).to have_content(@team_1.players.last.position)
          expect(page).to have_content(@team_1.players.last.injured)
        end
      end
    end
  end

  describe "User Story 4, Player Show" do
    describe "As a visitor" do
      describe "When I visit '/player_table_name/:id'" do
        it "Then I see the player with that id including the player's attributes" do
          #arrange
          # team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
           @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
          #act
          visit "/player_table_name/#{@team_1.players.first.id}"
          #assert
          expect(page).to have_content(@team_1.players.first.name)
          expect(page).to have_content(@team_1.players.first.salary)
          expect(page).to have_content(@team_1.players.first.position)
          expect(page).to have_content(@team_1.players.first.injured)
        end
      end
    end
  end

  describe "User Story 5, Team Player Index" do
    describe "As a visitor" do
      describe "When I visit '/teams/:team_id/player/child_table_name'" do
        it "Then see each Player that is associated with that Team with each Players attributes" do
          #arrange
          # team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
          # team_2 = Team.create(name:"Arsenal", budget:1000, location:"England", relegated:false)
          @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
          @team_2.players.create!(name:"Rooney", salary:15, position:"Midfield", injured:false)
          #act
          visit "/teams/#{@team_1.id}/player_table_name"
          #assert
          expect(page).to have_content(@team_1.players.first.name)
          expect(page).to have_content(@team_1.players.first.salary)
          expect(page).to have_content(@team_1.players.first.position)
          expect(page).to have_content(@team_1.players.first.injured)
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
            team_4 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
             sleep(1)
            team_5 = Team.create(name:"Real Madrid", budget:1000, location:"Italy", relegated:false)
            sleep(1)
            team_6 = Team.create(name:"Manchester United", budget:1000, location:"England", relegated:false)
             sleep(1)
            team_7 = Team.create(name:"Not a real team", budget:1000, location:"England", relegated:false)
            
          #act
            visit "/teams"
          #assert
          #  puts team_1.created_at
          #  puts team_2.created_at
          #  puts team_3.created_at
          #  puts team_0.created_at
            expect(page).to have_content(team_5.created_at)
            expect(page).to have_content(team_6.created_at)
            expect(page).to have_content(team_7.created_at)
            expect(page).to have_content(team_4.created_at)
            this = team_7.created_at.to_s
            that = team_4.created_at.to_s
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
          # team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
          @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
          @team_1.players.create!(name:"Rooney", salary:15, position:"Midfield", injured:false)
          #act
          visit "/teams/#{@team_1.id}"
          #assert
          # puts team_1.player_count
          expect(page).to have_content(@team_1.name)
          expect(page).to have_content(@team_1.budget)
          expect(page).to have_content(@team_1.location)
          expect(page).to have_content(@team_1.relegated)
          expect(page).to have_content(@team_1.player_count)
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
          # team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
          @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
          @team_1.players.create!(name:"Rooney", salary:15, position:"Midfield", injured:false)
          #act
          visit "/teams/#{@team_1.id}"
          #assert
          # puts team_1.player_count
         expect(page).to have_link('', href: "/teams/#{@team_1.id}/player_table_name")
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
                        # team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
                        #act
                        visit "/teams/#{@team_1.id}"
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
                        # team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
                        @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
                        @team_1.players.create!(name:"Rooney", salary:15, position:"Midfield", injured:false)
                        #act
                        visit "/teams/#{@team_1.id}/player_table_name"
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

  describe "User Story 14, Child Update" do
    describe "As a visitor" do
      describe "When I visit a Player Show page" do
        describe "Then I see a link to update that Update Player" do
          describe "When I click the link" do
            describe "I am taken to '/player_table_name/:id/edit' where I see a form to edit the player's attributes:" do
              describe "When I click the button to submit the form 'Update player'" do
                describe "Then a `PATCH` request is sent to '/player_table_name/:id'," do
                  describe "the player's data is updated," do
                    it "and I am redirected to the player Show page where I see the player's updated information" do
                      #arrange
                      # team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
                      @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
                
                      #act
                      puts @team_1.players
                      puts @team_1.players.last.id
                      visit "/player_table_name/#{@team_1.players.last.id}"
                      click_link('Update Player')
                      fill_in('name', with: 'John')
                      fill_in('salary', with: 100)
                      fill_in('position', with: 'Somewhere')
                      fill_in('injured', with: 'false')
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

  describe "User Story 15, Child Index only shows `false' Records " do
    describe "As a visitor" do
      describe "When I visit the Player Index" do
        it "Then I only see records where the boolean column is `true`" do
          #arrange
          @team_2.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
          @team_2.players.create!(name:"Tod", salary:11, position:"Defender", injured:true)
          #act
          visit("/player_table_name")
          #assert
          expect(page).to have_content(@team_2.players.first.name)
          expect(page).to have_content(@team_2.players.first.salary)
          expect(page).to have_content(@team_2.players.first.position)
          expect(page).to have_content(@team_2.players.first.injured)

          expect(page).to have_no_content(@team_2.players.last.name)
          expect(page).to have_no_content(@team_2.players.last.salary)
          expect(page).to have_no_content(@team_2.players.last.position)
          expect(page).to have_no_content(@team_2.players.last.injured)
        end
      end
    end
  end

  describe "User Story 16, Sort Parent's Children in Alphabetical Order by name " do
    describe "As a visitor" do
      describe "When I visit the Parent's children Index Page" do
        describe "Then I see a link to sort children in alphabetical order" do
          describe "When I click on the link" do
            describe "I'm taken back to the Parent's children Index Page where I see all of the parent's children " do
              it "in alphabetical order" do
                #arrange
                @team_3.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
                @team_3.players.create!(name:"Ajay", salary:11, position:"Defender", injured:true)
                @team_3.players.create!(name:"Zan", salary:11, position:"Goalie", injured:true)
                #act
                visit("/teams/#{@team_3.id}/player_table_name")
                #assert
                expect("Ajay").to appear_before("Owen")
              end
            end
          end
        end
      end
    end
  end

  describe "User Story 17, Team Update From Team Index Page" do
    describe "As a visitor" do
      describe "When I visit the team index page" do
        describe "Next to every team, I see a link to edit that team's info" do
          describe "When I click this link" do
            it "I should be taken to that team's edit page where I can update its information just like in User Story 12" do
              #arrange
              # team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
              #act
              visit "/teams"
              click_link('Edit Liverpool')
              fill_in('name', with: 'Chealsea')
              fill_in('budget', with: 100)
              fill_in('location', with: 'Somewhere')
              fill_in('relegated', with: 'false')
              click_button('Update')
              # #assert
              expect(page).to have_content("Chealsea")
            end
          end
        end
      end
    end
  end

  describe "User Story 18, Child Update From Childs Index Page" do
    describe "As a visitor" do
      describe "When I visit the `child_table_name` index page or a parent `child_table_name` index page" do
        describe "Next to every child, I see a link to edit that child's info" do
          describe "When I click the link" do
            it "I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14" do
              #arrange
              # team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
              @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
              @team_1.players.create!(name:"Tommy", salary:11, position:"Defender", injured:false)
        
              #act
              visit "/players"
              click_link('Edit Owen')
              fill_in('name', with: 'John')
              fill_in('salary', with: 100)
              fill_in('position', with: 'Somewhere')
              fill_in('injured', with: 'false')
              click_button('Update')
              # #assert
              expect(page).to have_content("John")
            end
          end
        end
      end
    end
  end

  describe "User Story 19, Team Delete" do
    describe "As a visitor" do
      describe "When I visit a team show page" do
        describe "Then I see a link to delete the team" do
          describe "When I click the link Delete team" do
            describe "Then a 'DELETE' request is sent to '/teams/:id'," do
              describe "the team is deleted, and all players records are deleted" do
                it "and I am redirected to the teams index page where I no longer see this teams" do
                  #arrange
                  @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
                  @team_1.players.create!(name:"Tommy", salary:11, position:"Defender", injured:false)
                  #act
                  visit "/teams/#{@team_1.players.first.id}"
                  click_button("Delete")
                  #assert
                  expect(page).to have_no_content(@team_1.name)
                  expect(page).to have_content(@team_2.name)
                  expect(page).to have_content(@team_3.name)
                end
              end
            end
          end
        end
      end
    end
  end

  describe "User Story 20, Player Delete" do
    describe "As a visitor" do
      describe "When I visit a Player show page" do
        describe "Then I see a link to delete the player 'Delete Player'" do
          describe "When I click the link" do
            describe "Then a 'DELETE' request is sent to '/player_table_name/:id'," do
              describe "the player is deleted" do
                it "and I am redirected to the player index page where I no longer see this player" do
                  #arrange
                  @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
                  @team_1.players.create!(name:"Tommy", salary:11, position:"Defender", injured:false)
                  #act
                  visit "/player_table_name/#{@team_1.players.first.id}"
                  click_button("Delete Player")
                  #assert
                  expect(page).to have_no_content("Owen")
                  expect(page).to have_content("Tommy")
                end
              end
            end
          end
        end
      end
    end
  end

  describe "User Story 21. Display Records Over a Given Threshold" do
    describe "As a visitor" do
      describe "When I visit the Teams's players Index Page" do
        describe "I see a form that allows me to input a number value" do
          describe "When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'" do
            it "Then I am brought back to the current index page with only the records that meet that threshold shown." do
              #arrange
              @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
              @team_1.players.create!(name:"Tommy", salary:11, position:"Defender", injured:false)
              @team_1.players.create!(name:"Joey", salary:11, position:"Goalie", injured:false)
              #act
              visit("/teams/#{@team_1.id}/player_table_name")
              #assert
            end
          end
        end
      end
    end
  end

  describe "User Story 22, Display Records Over a Given Threshold" do
    describe "As a visitor" do
      describe "When I visit the parent index page" do
        describe "Next to every parent, I see a link to delete that parent" do
          describe "When I click the link" do
            it "I am returned to the Parent Index Page where I no longer see that parent" do
              #arrange
              # @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
              # @team_1.players.create!(name:"Tommy", salary:11, position:"Defender", injured:false)
              #act
              visit "/teams"
              click_button("Delete #{@team_1.name}")
              #assert
              expect(page).to have_no_content(@team_1.name)
              expect(page).to have_content(@team_2.name)
              expect(page).to have_content(@team_3.name)
            end
          end
        end
      end
    end
  end

  describe "User Story 23, Player Delete from Players Index Page" do
    describe "As a visitor" do
      describe "When I visit the `player_table_name` index page or a team `player_table_name` index page" do
        describe "Next to every player, I see a link to delete that player" do
          describe "When I click the link" do
            it "I should be taken to the `player_table_name` index page where I no longer see that child" do
              #arrange
              @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
              @team_1.players.create!(name:"Tommy", salary:11, position:"Defender", injured:false)
              @team_1.players.create!(name:"Joey", salary:11, position:"Goalie", injured:false)
              #act
              visit "/teams/#{@team_1.id}/player_table_name"
              click_button("Delete #{@team_1.players.first.name}")
              #assert
              expect(page).to have_no_content("Owen")
              expect(page).to have_content("Tommy")
              #act
              visit "/player_table_name"
              click_button("Delete #{@team_1.players.first.name}")
              #assert
              expect(page).to have_no_content("Owen")
              expect(page).to have_no_content("Tommy")
            end
          end
        end
      end
    end
  end
end