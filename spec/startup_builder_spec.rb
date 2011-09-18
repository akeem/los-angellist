require 'spec_helper'

describe Angellist::StartupBuilder do
  use_vcr_cassette(:record => :new_episodes)

  let(:test_connection){Angellist.connection}

  subject{Angellist::StartupBuilder.new(test_connection)}

  describe "#find_by_id" do
    context "when domain exists" do
      it "should return a Startup" do
        subject.find_by_id("6702").should be_a_kind_of Angellist::Startup
      end
    end

    context "when domain does not exist" do
      it "should return nil" do
        subject.find_by_id("-111").should be_nil
      end
    end
  end

  describe "#find_by_slug" do
    context "when domain exists" do
      it "should be an Array" do
        subject.find_by_slug("angellist").should be_a_kind_of Angellist::Startup
      end
    end
    context "when domain does not exist" do
      it "should return nil" do
        subject.find_by_slug("something_missing").should be nil
      end
    end
  end

  describe "#find_by_domain" do

    context "when domain exists" do
      it "should return a Startup" do
        subject.find_by_domain("angel.co").should be_a_kind_of Angellist::Startup
      end

    end

    context "when domain does not exist" do
      it "should return nil" do
        subject.find_by_domain("crabjuice.cz").should be_nil
      end
    end

  end


end
