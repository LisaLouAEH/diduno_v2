require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    if assert @user.valid?
      puts "USER VALID !!"
    else 
      puts "USER INVALID :( "
    end
  end
end