require 'rails_helper'

RSpec.describe "Teams Index", type: :feature do
  before(:each) do
    @team_1 = Team.create(name:"Liverpool", budget:1000, location:"England", relegated:false)
    @team_2 = Team.create(name:"Real Madrid", budget:1000, location:"Italy", relegated:false)
    @team_3 = Team.create(name:"Manchester United", budget:1000, location:"England", relegated:false)
  end

  describe "User Story 3, Player Index" do
    describe "As a visitor" do
      describe "When I visit '/player_table_name" do
        it "Then I see each player in the system including the player's attributes" do
          #arrange
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
          @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
          #act
          visit "/player_table_name/#{@team_1.id}"
          #assert
          expect(page).to have_content(@team_1.players.first.name)
          expect(page).to have_content(@team_1.players.first.salary)
          expect(page).to have_content(@team_1.players.first.position)
          expect(page).to have_content(@team_1.players.first.injured)
        end
      end
    end
  end

  describe 'User Story 8, Player Index Link' do
    describe "As a visitor" do
      describe "When I visit any page on the site" do
        it "Then I see a link at the top of the page that takes me to the player Index" do
          #arrange
          
          #act
          visit "/players"
          #assert
          expect(page).to have_link('', href: '/players')
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
                      @team_1.players.create!(name:"Owen", salary:10, position:"Forward", injured:false)
                      #act
                      visit "/player_table_name/#{@team_1.id}"
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

  describe "User Story 15, Player Index only shows `false' Records " do
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
                  visit "/player_table_name/#{@team_1.id}"
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
end