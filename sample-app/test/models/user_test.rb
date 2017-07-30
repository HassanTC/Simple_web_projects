require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Example Name" , email: 'user@example.com' , password: "foobar", password_confirmation: "foobar")
	end
	test "should be valid" do
		assert @user.valid?
	end
	test "name should be present" do
		@user.name = " "
		assert_not @user.valid?
	end
	test "email should be exist" do
		@user.email = "   "
		assert_not @user.valid?
	end
	test "name should not be too long" do 
		@user.name = 'a' * 51
		assert_not @user.valid?
	end
	test "email should not be long" do 
		len = 'a' * 244
		@user.email = len + '@example.com'
		assert_not @user.valid?
	end 
	test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  test "Email Should be unique" do 
  	repeated_user = @user.dup
  	repeated_user.email = @user.email.upcase
  	@user.save
  	assert_not repeated_user.valid?
  end
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
    test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(content: "Lorem ipsum")
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end
end