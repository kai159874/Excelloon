module LoginSupport
  def login(user)
    visit root_path
    click_link 'ログイン'
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: 'password'
    within '.login' do
      click_on 'ログイン'
    end
  end
end