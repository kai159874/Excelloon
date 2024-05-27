require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let(:user) { create(:user) }

    context 'nameカラム' do
      it '空欄でないこと', spec_category: "バリデーションとメッセージ表示" do
        user.name = ''
        is_expected.to eq false
      end
      it '1文字以上であること: 1文字は〇', spec_category: "バリデーションとメッセージ表示" do
        user.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq true
      end
      it '10文字以下であること: 10文字は〇', spec_category: "バリデーションとメッセージ表示" do
        user.name = Faker::Lorem.characters(number: 10)
        is_expected.to eq true
      end
      it '10文字以下であること: 11文字は×', spec_category: "バリデーションとメッセージ表示" do
        user.name = Faker::Lorem.characters(number: 11)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Balloonモデルとの関係' do
      it '1:Nとなっている', spec_category: "アソシエーション設定" do
        expect(User.reflect_on_association(:balloons).macro).to eq :has_many
      end
    end
  end
end
