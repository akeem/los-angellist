require 'spec_helper'

describe Angellist::User do
  use_vcr_cassette(:record => :new_episodes)

  let(:existing_user){Angellist.users.find_by_id("671")}
  let(:reviewed_user){Angellist.users.find_by_id("155")}

  describe "#create_update" do
    it "should publish a new update"
  end

  describe "#updates" do
    let(:status_updates){existing_user.updates}
    it "should return an Array" do
      status_updates.should be_a_kind_of Array
    end
    it "should return status updates" do
      status_updates.each{|update| update.should be_a_kind_of Angellist::StatusUpdate}
    end
  end

  describe "#remove_update" do
    context "when status exists"
    context "when status does not exist"
  end


  describe "#startup_roles" do
    let(:startup_roles){existing_user.startup_roles}
    it "should return an Array" do
      startup_roles.should be_a_kind_of Array
    end

    it "should return the startup roles of the user" do
      startup_roles.each{|role| role.should be_a_kind_of Angellist::StartupRole}
    end
  end


  describe "#followers" do
    let(:followers){existing_user.followers}

    it "should return an Array" do
      followers.should be_a_kind_of Array
    end

    it "should contain Users" do
      followers.each{|follower| follower.should be_a_kind_of Angellist::User}
    end
  end

  describe "#follower_ids" do
    let(:follower_ids){existing_user.follower_ids}

    it "should return an Array of follower ids" do
      follower_ids.should be_a_kind_of Array
    end

    it "should contain Fixnums" do
      follower_ids.each{|id| id.should be_a_kind_of Fixnum}
    end
  end


  describe "#following" do
    let(:following){existing_user.following}

    it "should return an Array of users being followed" do
      following.should be_a_kind_of Array
    end

    it "should contain Users" do
      following.each{|user| user.should be_a_kind_of Angellist::User}
    end
  end


  describe "#following_ids" do
    let(:following_ids){existing_user.following_ids}

    it "should return an Array of following ids" do
      following_ids.should be_a_kind_of Array
    end
    it "should contain Fixnums" do
      following_ids.each{|id| id.should be_a_kind_of Fixnum}
    end
  end


  describe "#follow" do
  end

  describe "#unfollow" do
  end


  describe "#reviews" do
    let(:reviews){reviewed_user.reviews}

    it "should return the reviews of the user" do
      reviews.should be_a_kind_of Array
    end

    it "should return a collection of Reviews" do
      reviews.each{|review|
        review.should be_a_kind_of Angellist::Reviews
      }
    end
  end

end
