require 'rails_helper'

RSpec.describe 'Users Endpoints', type: :request do
  context 'HTTP Responses' do
    before(:example) { get '/' }
    it 'returns status 200 for root endpoint' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns status 200 for user endpoint' do
      get '/users/1'
      expect(response).to have_http_status(:ok)
    end
  end
  context 'Template Rendering' do
    it 'renders the index template for root endpoint' do
      get '/'
      expect(response).to render_template('index')
    end
    it 'renders the show template for user endpoint' do
      get '/users/1'
      expect(response).to render_template('show')
    end
  end
  context 'Response Content' do
    it 'includes "here are all users" for root endpoint' do
      get '/'
      expect(response.body).to include('here are all users')
    end
    it 'includes "here are individual users" for user endpoint' do
      get '/users/1'
      expect(response.body).to include('here are individual users')
    end
  end
end
