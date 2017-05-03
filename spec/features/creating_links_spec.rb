feature 'Form for new links' do
  scenario 'click button to start creating a new link' do
    visit '/links/new'
    fill_in('title', with: 'makers' )
    fill_in('url', with: 'makersacademy.com' )
    click_button('create link')
  end
end
