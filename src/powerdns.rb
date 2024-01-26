require 'faraday'

module Powerdns
  class Client
    def initialize(url, api_key)
      @connection = Faraday.new(
        url: url,
        headers: {
          'X-API-Key' => api_key,
        }
      )
    end

    def create_zone(zone_name)
      params = {
        "kind": "Master",
        "name": zone_name,
        "rrsets": [{
          "name": zone_name,
          "ttl": 3600,
          "type": "SOA",
          "records": [{
            "content": "dns1.example.jp. admin.example.com. 2020010101 900 600 6048000 300",
            "disabled": false
          }],
        }]
      }

      response = @connection.post do |request|
        request.url("/api/v1/servers/localhost/zones")
        request.headers['Content-Type'] = 'application/json'
        request.body = params.to_json
      end

      response
    end
  end
end

client = Powerdns::Client.new(
      'http://powerdns:8081',
      'changeme',
    )
pp client.create_zone("example.com.")
