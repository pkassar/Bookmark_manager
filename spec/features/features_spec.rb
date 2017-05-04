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
    # p link
    # p link.tags.map(&:name)
    expect(link.tags.map(&:name)).to include('learning')
  end
end

feature 'Filtering by tags' do
  scenario 'I can filter links by tag' do
    new_link_cola
    visit '/tags/bubbles'
    expect(page).to_not have_content 'Youtube'
    expect(page).to have_content 'Cola'
  end
end

feature 'Adding multiple tags' do
  scenario 'I can add more than one tag at the creation of a bookmark' do
    new_link_cola_multiple_tags
    link = Link.first
    expect(link.tags.map(&:name)).to include('bubbles', 'beverage')
  end
end
