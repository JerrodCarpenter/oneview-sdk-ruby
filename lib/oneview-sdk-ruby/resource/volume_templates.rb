module OneviewSDK
  # Resource for ethernet networks
  # Common Data Attributes:
  #   category
  #   created
  #   description
  #   eTag
  #   modified
  #   name
  #   provisioning
  #     capacity
  #     provisionType
  #     shareable
  #     storagePoolUri
  #   refreshState
  #   state
  #   stateReason
  #   status
  #   storageSystemUri
  #   type
  #   uri
  class VolumeTemplate < Resource
    BASE_URI = '/rest/storage-volume-templates'.freeze

    def initialize(client, params = {}, api_ver = nil)
      super
      # Default values:
      @data['provisioning'] ||= {}
      case @api_version
      when 120 then @data['type'] ||= 'StorageVolumeTemplate'
      when 200 then @data['type'] ||= 'StorageVolumeTemplateV3'
      end
    end

    # Create the resource on OneView using the current data
    # @note Calls refresh method to set additional data
    # @raise [RuntimeError] if the client is not set
    # @raise [RuntimeError] if the resource creation fails
    # @return [Resource] self
    def create
      ensure_client
      response = @client.rest_post(self.class::BASE_URI, { 'Accept-Language' => 'en_US', 'body' => @data }, @api_version)
      body = @client.response_handler(response)
      set_all(body)
      self
    end

    # Delete volume template from OneView
    # @return [true] if volume template was deleted successfully
    def delete
      ensure_client && ensure_uri
      response = @client.rest_delete(@data['uri'], { 'Accept-Language' => 'en_US' }, @api_version)
      @client.response_handler(response)
      true
    end

    # Set storage pool
    # @param [Boolean] shareable
    # @param [String] provisionType. Options: ['Thin', 'Full']
    # @param [String] capacity (in bytes)
    # @param [OneviewSDK::StoragePool] storage_pool
    def set_provisioning(shareable, provisionType, capacity, storage_pool)
      @data['provisioning']['shareable'] = shareable
      @data['provisioning']['provisionType'] = provisionType
      @data['provisioning']['capacity'] = capacity
      @data['provisioning']['storagePoolUri'] = storage_pool[:uri]
    end

    # Set storage system
    # @param [OneviewSDK::StorageSystem]
    def set_storage_system(storage_system)
      @data['storageSystemUri'] = storage_system[:uri]
    end

    # Set snapshot pool
    # @param [OneviewSDK::StoragePool]
    def set_snapshot_pool(storage_pool)
      @data['snapshotPoolUri'] = storage_pool[:uri]
    end


    # Validate refreshState
    # @param [String] value NotRefreshing, RefreshFailed, RefreshPending, Refreshing
    def validate_refreshState(value)
      fail 'Invalid refresh state' unless %w(NotRefreshing RefreshFailed RefreshPending Refreshing).include?(value)
    end

    # Validate status
    # @param [String] value OK, Disabled, Warning, Critical, Unknown
    def validate_status(value)
      fail 'Invalid status' unless %w(OK Disabled Warning Critical Unknown).include?(value)
    end

  end
end