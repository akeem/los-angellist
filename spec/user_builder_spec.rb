require 'spec_helper'

describe Angellist::UserBuilder do
  use_vcr_cassette(:record => :new_episodes)


  let(:test_connection){Angellist.connection}

  subject{Angellist::UserBuilder.new(test_connection)}

  describe "#find_by_id" do
    context "when the requested user exists" do
      it "should return a User" do
        subject.find_by_id("155").should be_a_kind_of Angellist::User
      end
    end

    context "when the requested user does not exist" do
      it "should return nil" do
        subject.find_by_id("xxxxx").should be_nil
      end
    end

  end

  describe "#search" do

    context "when provided a slug" do
      it "should return a User" do
        subject.search("joshuaxls").should be_kind_of Angellist::User
      end
    end

    context "when provided an MD5 Hash" do
      it "should return a User" do
        pending
        subject.search("xxxxx").should be_kind_of Angellist::User
      end
    end
  end


end
