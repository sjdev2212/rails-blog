require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'renders the main users page' do
      get '/users'
      expect(response).to have_http_status(:ok)
      expect(response.body).to render_template(:index)
    end
  end
end
