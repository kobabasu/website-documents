# encoding: utf-8

step 'サイトにアクセスする' do
  Capybara.app_host = "https://www.google.com/"
end

step 'トップページを表示する' do
  visit '/'
end

step '画面にGmailと表示されていること' do
  expect(page).to have_content('Gmail')
end
