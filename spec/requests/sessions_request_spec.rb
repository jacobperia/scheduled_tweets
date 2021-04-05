require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  context 'send get requests to sessions path' do
    it 'sign in path returns a success response' do
      get sign_in_path
      expect(response).to have_http_status(:success)
    end
  end
end
