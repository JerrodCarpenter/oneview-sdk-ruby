# (C) Copyright 2017 Hewlett Packard Enterprise Development LP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

require_relative '../c7000/interconnect'
require_relative '../../api500/synergy/interconnect'

module OneviewSDK
  module API600
    module Synergy
      # Interconnect resource implementation on API600 Synergy
      class Interconnect < OneviewSDK::API600::C7000::Interconnect
      end
    end
  end
end
