def new_link_makers
  fill_in('title', with: 'MA')
  fill_in('url', with: 'makersacademy.com')
  fill_in('tag', with: 'learning')
  click_button('create link')
  click_button('new link')
end

def new_link_cola
  fill_in('title', with: 'Cola')
  fill_in('url', with: 'https://www.cola.com/')
  fill_in('tag', with: 'bubbles')
  click_button ('create link')
end
