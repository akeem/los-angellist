require 'spec_helper'


describe Angellist::TagBuilder do
  use_vcr_cassette(:record => :new_episodes)

  let(:test_connection){Angellist.connection}
  subject{Angellist::TagBuilder.new(test_connection)}

  describe "#find_by_id" do
    context "when tag exists" do
      it "should return an Angellist::Tag" do
        subject.find_by_id("1654").should be_a_kind_of Angellist::Tag
      end
    end

    context "when the tag does not exist" do
      it "should be nil" do
        subject.find_by_id("-555").should be_nil
      end
    end

  end

end
