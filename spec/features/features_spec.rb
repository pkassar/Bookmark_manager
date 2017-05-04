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
    new_link_makers
    link = Link.all.first
    expect(link.tags[0].name).to include('learning')
  end

  feature 'Filtering by tags' do
    scenario 'I can filter links by tag' do
      visit '/links/new'
      new_link_cola
      visit '/tags/bubbles'
      expect(page).to_not have_content 'Youtube'
      expect(page).to have_content 'Cola'
    end
  end

end
