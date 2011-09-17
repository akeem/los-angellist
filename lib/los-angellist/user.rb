require File.expand_path("api_object", File.dirname(__FILE__))

module Angellist
  class User < APIObject
    def create_update

    end

    def updates
      response = Angellist.connection.get do |req|
        req.url "/1/status_updates"
        req.params['user_id'] = self.id.to_s
      end

      updates = []
      response.body['status_updates'].each{|update|
        updates << Angellist::StatusUpdate.new(update)
      }
      updates
    end

    def remove_update

    end


    def startup_roles
      response = Angellist.connection.get do |req|
        req.url "/1/startup_roles"
        req.params['user_id'] = self.id.to_s
      end

      roles = []
      response.body['startup_roles'].each{|role|
        roles << Angellist::StartupRole.new(role)
      }
      roles
    end

    def followers(options = {})
      response = Angellist.connection.get("/1/users/#{self.id}/followers", options)
      users = []

      response.body['users'].each{ |user|
        users << Angellist::User.new(user)
      }
      users
    end

    def follower_ids(options = {})
      response = Angellist.connection.get("/1/users/#{self.id}/followers/ids", options)
      response.body['ids']
    end

    def following(options = {})
      response = Angellist.connection.get("/1/users/#{self.id}/following", options)
      users = []

      response.body['users'].each{|user|
        users << Angellist::User.new(user)
      }
      users
    end

    def following_ids(options ={})
      response = Angellist.connection.get("/1/users/#{self.id}/following/ids",options)
      response.body['ids']
    end

    def reviews(options= {})
      response = Angellist.connection.get do |req|
        req.url  "/1/reviews"
        req.params["user_id"] = self.id.to_s
      end

      response.body['reviews']
    end

  end
end
