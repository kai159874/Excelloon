require 'rails_helper'

RSpec.describe 'Balloonモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { balloon.valid? }

    let(:user) { create(:user) }
    let(:balloon) { build(:balloon, user_id: user.id) }

    context 'contentカラム' do
      it "空欄でないこと", spec_catagory: "バリデーションとメッセージ表示" do
        balloon.content = ''
        is_expected.to eq false
      end
      it '200文字以下であること: 200文字はOK', spec_catagory: "バリデーションとメッセージ表示" do
        balloon.content = Faker::Lorem.characters(number:200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字はNG', spec_catagory: "バリデーションとメッセージ表示" do
        balloon.content = Faker::Lorem.characters(number:201)
        is_expected.to eq false
      end
    end

    context 'color_statusカラム' do
      it '未選択でないこと', spec_catagory: "バリデーションとメッセージ表示" do
        balloon.color_status = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1になっている', spec_category: "アソシエーション設定" do
        expect(Balloon.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
