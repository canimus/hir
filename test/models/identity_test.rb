require 'test_helper'

class IdentityTest < ActiveSupport::TestCase

  # Associations and Attributes
  %w[user email password password_confirmation].each do |meth|
    test "it responds to #{meth}" do    
      assert Identity.new.respond_to? meth.to_sym
    end
  end
  
end
