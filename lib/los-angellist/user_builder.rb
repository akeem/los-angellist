require 'faraday'
require 'json'

module Angellist
  class UserBuilder

    def initialize(connection)
      @connection = connection
    end

    def find_by_id(id)
      response = @connection.get("/1/users/#{id}")

      if response.status != 200
        return nil
      else
        # parsed_response = JSON.parse(response.body)
        # return User.new(parsed_response)
        return User.new(response.body)
      end
    end


    def search(identifier)
      response = @connection.get do |req|
        req.url "/1/users/search"
        req.params["slug"] =  identifier
      end
      User.new(response.body)
    end

  end
end
