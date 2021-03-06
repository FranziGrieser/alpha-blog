# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase # rubocop:disable Style/ClassAndModuleChildren
  # Setup fixtures in test/fixtures/*.yml for tests in alphabetical order.
  fixtures :all

  def sign_in_as(user, password)
    post login_path, params: {
      session: { email: user.email, password: password },
    }
  end
end
