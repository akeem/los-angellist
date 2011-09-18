require "los-angellist/version"
require "los-angellist/user_builder"
require "los-angellist/user"
require "los-angellist/tag"
require "los-angellist/status_update"
require "los-angellist/startup_role"
require "los-angellist/startup"
require "los-angellist/tag_builder"
require "los-angellist/startup_builder"

require 'faraday'
require 'faraday_middleware'

module Angellist
  class << self

    @@connection = Faraday.new("https://api.angel.co") do |builder|
      builder.request  :json
      # builder.response :logger
      builder.use Faraday::Response::ParseJson
      builder.adapter  :net_http
    end

    def connection
      @@connection
    end

    def users
      UserBuilder.new(@@connection)
    end
  end

end
