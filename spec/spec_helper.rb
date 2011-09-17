require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'vcr'

require File.expand_path("los-angellist", File.expand_path(__FILE__) +"/../../lib/")

VCR.config do |c|
  c.cassette_library_dir     = 'spec/cassettes'
  c.stub_with                :fakeweb
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
  c.mock_with :fakeweb
end
