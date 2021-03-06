require 'spec_helper'

klass = OneviewSDK::API500::C7000::Volume
RSpec.describe klass, integration: true, type: DELETE, sequence: rseq(klass) do
  let(:current_client) { $client_500 }
  include_examples 'VolumeDeleteExample', 'integration api500 context'
  include_examples 'VolumeDeleteExample API500', 'integration api500 context'
end
