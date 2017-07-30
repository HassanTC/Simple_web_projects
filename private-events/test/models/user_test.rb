require 'test_helper'

class UserTest < ActiveSupport::TestCase
 def setup
	@user = User.new(email: "topcoder52@outlook.com" , name: "Hassan") 	
 end
 test "email is not empty" do
	@user.email = ""
	assert_not @user.valid? 	
 end

 test "name is exist" do
 	@user.name = ""
 	assert_not @user.valid?
 end

 test "email is unique" do
 	another_user = @user.dup
 	@user.save
 	assert_not another_user.valid?
 end

 test "greater length of name" do
 	@user.name = "a" * 51
 	assert_not @user.valid?
 end

 test "greater length of email" do
 	 @user.email = "a" * 250
 	assert_not @user.valid?
 end 
 test "smaller length of email" do
 	@user.email = "aaaaaaa"
 	assert_not @user.valid?
 end
 test "smaller length of name" do
 	@user.name = "aaa"
 	assert_not @user.valid?
 end
end
