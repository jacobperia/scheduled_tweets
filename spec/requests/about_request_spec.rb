require 'rails_helper'

RSpec.describe 'About', type: :request do
  context 'send get request to about path' do
    it 'returns a success response' do
      get about_path
      expect(response).to have_http_status(:success)
    end
  end
end
