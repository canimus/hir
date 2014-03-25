require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "it has an identity" do
    assert User.new.respond_to? :identity
  end
end
