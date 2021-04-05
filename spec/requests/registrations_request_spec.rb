require 'rails_helper'

RSpec.describe 'registrations', type: :request do
  context 'send get requests to registrations path' do
    it 'sign up path returns a success response' do
      get sign_up_path
      expect(response).to have_http_status(:success)
    end
  end
end
