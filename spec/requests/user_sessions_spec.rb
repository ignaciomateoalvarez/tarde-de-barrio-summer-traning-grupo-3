require 'rails_helper'

RSpec.describe 'UserSessions', type: :request do
  let(:params) { { email: 'admin2@gmail.com', password: 'admin' } }

  describe 'GET /new' do
    it 'returns http success' do
      get '/user_sessions/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /login' do
    before do
      create(
        :user,
        email: 'admin2@gmail.com',
        password: 'admin'
      )
    end
    it 'returns http success' do
      post('/login', params: {})
      expect(response).to have_http_status(422)
    end
  end

  describe 'POST /logout' do
    it 'returns http success' do
      post('/login', params: {})
      post '/logout'
      expect(response).to have_http_status(302)
    end
  end
end
