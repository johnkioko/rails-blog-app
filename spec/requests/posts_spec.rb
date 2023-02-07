require 'rails_helper'

RSpec.describe 'Posts Endpoint', type: :request do
  describe 'GET /index' do
    before { get '/users/1/posts' }

    it 'has a 200 OK status' do
      expect(response).to have_http_status(200)
    end
    it "renders the 'index' view" do
      expect(response).to render_template('index')
    end
  end

  context 'GET /show' do
    before { get '/users/1/posts/1' }

    it 'has a 200 OK status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the :show view' do
      expect(response).to render_template(:show)
    end

    it 'assigns the post to @post' do
      expect(assigns(:posts)).to eq(@posts)
    end

    it 'contains the post title in the response body' do
      expect(response.body).to match('This is the first post')
    end
  end
end
