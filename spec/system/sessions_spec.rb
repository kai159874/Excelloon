require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  let(:user) { create(:user) }

  describe 'ログイン' do
    context '認証情報が正しい場合' do
      it 'ログインできること' do
        visit '/users/sign_in'
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'password'
        within '.login' do
          click_on 'ログイン'
        end
        expect(current_path).to eq mypage_path
        expect(page).to have_content 'ログインしました'
      end
    end

    context '認証情報が誤りがある場合' do
      it 'ログインできないこと' do
        visit '/users/sign_in'
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'misspassword'
        within '.login' do
          click_on 'ログイン'
        end
        expect(current_path).to eq '/users/sign_in'
        expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
      end
    end
  end

  describe 'ログアウト' do
    it 'ユーザーがログアウト後ログイン画面にリダイレクトされること' do
      login(user)
      click_on 'ログアウト'
      expect(current_path).to eq '/about'
      expect(page).to have_content 'ログアウトしました'
    end
  end
end