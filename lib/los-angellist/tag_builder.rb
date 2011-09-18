module Angellist
  class TagBuilder

    def initialize(connection)
      @connection = connection
    end

    def find_by_id(id)
      response = @connection.get("1/tags/#{id}")

      if response.status != 200
        return nil
      else
        return Angellist::Tag.new(response.body)
      end
    end

  end
end
