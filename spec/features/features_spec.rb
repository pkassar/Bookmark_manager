require './app/app.rb'
require 'database_cleaner'

feature 'Viewing links' do
  scenario 'I can see existing links on the links page' do
    Link.create(url: 'http://www.google.com', title: 'Google')
    visit '/links'
      expect(page).to have_content('Google')
  end
end

feature 'Organise links' do
  scenario 'Add tag links in my bookmark manager' do
    visit '/links'
    click_button('new link')
    fill_in('tags', with: 'makersacademy' )
    click_button('create link')
  end
end
