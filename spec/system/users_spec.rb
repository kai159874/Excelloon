require 'rails_helper'

describe 'ユーザログイン後のテスト' do
  let!(:user) { create(:user) }

  before do
    visit new_user_session_path
    login(user)
  end

  describe 'プロフィール編集画面のテスト' do
    before do
      visit mypage_edit_path
    end

    context 'プロフィール編集成功のテスト' do
      before do
        @user_old_name = user.name
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 8)
        click_button '更新'
      end

      it '自分のプロフィールが正しく編集される' do
        expect(user.reload.name).not_to eq @user_old_name
      end
      it 'リダイレクト先が、マイページ画面になっている' do
        expect(current_path).to eq '/mypage'
      end
    end
  end
end