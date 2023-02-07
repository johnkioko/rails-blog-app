require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    context 'when page is opened ' do
      it 'has to return a correct response' do
        get '/'
        expect(response).to have_http_status(200)
        expect(response).to render_template('index')
        expect(response.body).to include('here are all users')
      end
    end
  end

  describe 'GET /show' do
    context 'when page is open' do
      it 'has to return a correct response' do
        get '/users/:id'
        expect(response).to have_http_status(200)
        expect(response).to render_template(:show)
        expect(response.body).to include('here are individual users')
      end
    end
  end
end
