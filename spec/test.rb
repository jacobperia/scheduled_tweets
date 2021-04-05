require 'rails_helper'

RSpec.describe 'hello spec' do
  describe 'math' do
    it 'math' do
      expect(6 * 7).to eq(42)
    end
  end
end

require 'rails_helper'

RSpec.describe 'hello spec' do
  # ...
  describe String do
    let(:string) { '' }
    it 'should provide an empty string' do
      expect(string).to eq('')
    end
  end
end
