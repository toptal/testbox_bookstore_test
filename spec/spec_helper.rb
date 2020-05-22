require 'active_support/core_ext/hash'
require_relative './support/testbox_helper'

require 'pry'

def feature_flags
  @feature_flags ||= TestboxHelper.new.feature_flags
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # config.define_derived_metadata do |metadata|
  #   metadata[:feature_flags] = TestboxHelper.new.feature_flags.deep_symbolize_keys
  # end
end
