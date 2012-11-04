require 'test/unit'
require './app/user'
require './app/item'

class UserTest < Test::Unit::TestCase

  def test_add_items_to_user
    user = User.new
    user.user_type = 'N'

    assert_equal 'N', user.user_type

    user = User.new
    assert_equal 'N', user.user_type

  end


end