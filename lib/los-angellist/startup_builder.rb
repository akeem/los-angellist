module Angellist 
  class StartupBuilder

    def initialize(connection)
      @connection = connection
    end

    def find_by_id(id)
     response =  @connection.get "/1/startups/#{id}"

     if response.status != 200
       return nil
     else
       Angellist::Startup.new(response.body)
     end
    end

    def find_by_slug(slug)
      response = @connection.get do |req|
       req.url  "/1/startups/search"
       req.params["slug"] = slug
      end 

      if response.status != 200
        nil
      else
        Angellist::Startup.new(response.body)
      end
    end


    def find_by_domain(domain)
      response = @connection.get do |req|
       req.url  "/1/startups/search"
       req.params["domain"] = domain
      end

      if response.status != 200
        nil
      else
        Angellist::Startup.new(response.body)
      end
    end


    def tagged(tag, options = {})
      response = @connection.get "/1/tags/#{tag}/startups",options

      startups = []

      response.body["startups"].each{|startup|
        startups << Angellist::Startup.new(startup)
      }

      startups
    end

  end
end
