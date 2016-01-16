require('Capybara/rspec')
require('./app')
require('launchy')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

  describe("the word addition patch", {:type => :feature}) do
    it('adds a word to the dictionary list') do
      visit('/words/new')
      fill_in "word_name", :with => "Sherman"
      click_button("Add")
      expect(page). to have_content("Sherman")
    end
  end

describe('the new word list post path', {:type => :feature}) do
    it('adds a new word and shows the list') do
       visit('/words/new')
       fill_in "word_name", :with => "Sherman"
       click_button("Add")
       expect(page). to have_content("Sherman")
      #  click_link('See your Dictionary!')
      #  expect(page).to(have_content("Sherman"))
     end
   end

   describe('the view a word entry path', {:type => :feature}) do
     it("shows the word entry of the user's choice") do
       visit('/words/new')
       fill_in "word_name", :with => "Sherman"
       click_button("Add")
       expect(page). to have_content("Sherman")
      #  click_link('See your Dictionary!')
      #  expect(page).to(have_content("Sherman"))
       click_link('Sherman', match: :first)
       expect(page).to(have_content("Sherman"))
     end
   end

   describe('the path to add a new definition', {:type => :feature}) do
     it("will add the definition of a user's choice to selected word") do
       visit('/words/1')
       click_link("Add Definition")
       expect(page).to(have_content("definition"))
       fill_in "word_definition", :with => "a dog"
       click_button("Add")
       expect(page). to have_content("a dog")
     end
   end
