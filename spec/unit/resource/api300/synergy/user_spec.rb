require 'spec_helper'

RSpec.describe OneviewSDK::API300::Synergy::User do
  include_context 'shared context'

  it 'inherits from api 200' do
    expect(described_class).to be < OneviewSDK::User
  end
end
