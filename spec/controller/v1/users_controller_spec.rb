require 'rails_helper'

describe 'ユーザーcontroller test', type: :system do
  describe 'API' do
    context 'index' do
      before do
        # 事前処理
        user_a = FactoryBot.create(:user, name: 'userA')
      end

      it 'user一覧を取得する' do
        # 期待する動作
        get '/v1/users'
        # json = JSON.parse(response.body)

        expect(response.status).to eq(200)
      end

      it 'test' do
        Rails.logger.debug(response) 
        expect(200).to eq(200)
      end

      it 'test 2' do
        get '/v1/users'

        puts 'test message'
        puts response
        Rails.logger.debug(response) 
        expect(200).to eq(200)
      end
    end
  end
end
