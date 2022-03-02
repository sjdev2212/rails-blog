RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'renders the main posts page for a specific user' do
      get '/users/10/posts'
      expect(response).to have_http_status(:ok)
      expect(response.body).to render_template(:index)
      expect(response.body).to include('User ID: 10')
    end

    it 'renders the post page' do
      get '/users/10/posts/5'
      expect(response).to have_http_status(:ok)
      expect(response.body).to render_template(:show)
      expect(response.body).to include('User ID: 10')
      expect(response.body).to include('Post ID: 5')
    end
  end
end
