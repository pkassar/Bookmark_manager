require './app/app.rb'

feature 'List of web sites'do
scenario 'A list of links on my homepage' do
  visit('/')
    expect(Link.where(title: "Google")).to be_present
  end
end

feature 'List of web sites'do
scenario 'An empty list of links on my homepage' do
  visit('/')
    expect(Link.where(title: "Google")).to be_present
  end
end
