require 'rails_helper'

describe 'ユーザログイン後のテスト' do
  let!(:user) { create(:user) }
  let!(:balloon) { create(:balloon, user: user) }
  
  before do
    visit new_user_session_path
    login(user)
  end

  describe '新規投稿画面のテスト' do
    before do
      visit new_balloon_path
    end

    context '投稿成功のテスト' do
      before do
        fill_in 'balloon[content]', with: Faker::Lorem.characters(number: 25)
        choose 'white'
      end

      it '自分の新しい投稿が正しく保存される' do
        expect { click_button '飛ばす' }.to change(user.balloons, :count).by(1)
      end
      it 'リダイレクト先が、保存できた投稿の詳細画面になっている' do
        click_button '飛ばす'
        expect(current_path).to eq '/balloons/' + Balloon.last.id.to_s
      end
    end
  end

  describe '自分の投稿詳細画面のテスト' do
    before do
      visit balloon_path(balloon)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/balloons/' + balloon.id.to_s
      end
      it '投稿のbodyが表示される' do
        expect(page).to have_content balloon.content
      end
      it '投稿の削除リンクが表示される' do
        within '.balloon-delete' do
          delete_link = find('a').text
          expect(page).to have_link delete_link, href: balloon_path(balloon)
        end
      end
    end

    context '削除リンクのテスト' do

      before do
        within '.balloon-delete'do
          delete_link = find('a').text
          click_link delete_link
        end
      end
      it '正しく削除される' do
        expect(Balloon.where(id: balloon.id).count).to eq 0
      end
      it 'リダイレクト先が、ホーム画面になっている' do
        expect(current_path).to eq '/'
      end
    end
  end
end