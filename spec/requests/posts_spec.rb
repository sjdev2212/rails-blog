require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  it 'renders the main users page' do
    get '/users'
    expect(response).to have_http_status(:ok)
    expect(response.body).to render_template(:index)
  end
end
